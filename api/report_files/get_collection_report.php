<?php
include '../../ajaxconfig.php';
@session_start();
$user_id = $_SESSION['user_id'];

$from_date = $_POST['from_date'];
$to_date = $_POST['to_date'];

$column = array(
    'c.id',
    'cc.cus_id',
    'cc.first_name',
    'pl.place',
    'cc.mobile1',
    'gc.grp_id',
    'gc.grp_name',
    'c.auction_month',
    'c.collection_date',
    'c.collection_amount'
);

$query = "SELECT
    c.id,
    cc.cus_id,
    CONCAT(cc.first_name, ' ', cc.last_name) AS first_name,
    pl.place,
    cc.mobile1,
    gc.grp_id,
    gc.grp_name,
    c.auction_month,
    c.collection_date,
    c.collection_amount
FROM
    collection c
LEFT JOIN group_share gs ON
    c.share_id = gs.id
LEFT JOIN customer_creation cc ON
    gs.cus_id = cc.id
LEFT JOIN group_creation gc ON
    c.group_id = gc.grp_id
LEFT JOIN place pl ON
    cc.place = pl.id
JOIN users u ON
    u.id = c.insert_login_id
WHERE
    u.id = '1' AND DATE(c.collection_date) BETWEEN '$from_date' AND '$to_date'";

if (isset($_POST['search'])) {
    if ($_POST['search'] != "") {
        $query .= " and (cc.cus_id LIKE '%" . $_POST['search'] . "%'
                    OR  CONCAT(cc.first_name, ' ', cc.last_name) LIKE '%" . $_POST['search'] . "%'
                    OR pl.place LIKE '%" . $_POST['search'] . "%'
                    OR gc.grp_id LIKE '%" . $_POST['search'] . "%'
                    OR gc.grp_name LIKE '%" . $_POST['search'] . "%'
                    OR c.auction_month LIKE '%" . $_POST['search'] . "%'
                    OR c.collection_date LIKE '%" . $_POST['search'] . "%'
                   OR c.collection_amount LIKE '%" . $_POST['search'] . "%') ";
    }
}

if (isset($_POST['order'])) {
    $query .= " ORDER BY " . $column[$_POST['order']['0']['column']] . ' ' . $_POST['order']['0']['dir'];
} else {
    $query .= ' ';
}

$query1 = "";
if ($_POST['length'] != -1) {
    $query1 = " LIMIT " . $_POST['start'] . ", " . $_POST['length'];
}

$statement = $pdo->prepare($query);

$statement->execute();

$number_filter_row = $statement->rowCount();

$statement = $pdo->prepare($query . $query1);

$statement->execute();

$result = $statement->fetchAll();

$data = array();
$sno = 1;
foreach ($result as $row) {
    $sub_array   = array();
    $sub_array[] = $sno;
    $sub_array[] = isset($row['cus_id']) ? $row['cus_id'] : '';
    $sub_array[] = isset($row['first_name']) ? $row['first_name'] : '';
    $sub_array[] = isset($row['place']) ? $row['place'] : '';
    $sub_array[] = isset($row['mobile1']) ? $row['mobile1'] : '';
    $sub_array[] = isset($row['grp_id']) ? $row['grp_id'] : '';
    $sub_array[] = isset($row['grp_name']) ? $row['grp_name'] : '';
    $sub_array[] = isset($row['auction_month']) ? $row['auction_month'] : '';
    $sub_array[] = isset($row['collection_date']) ? date('d-m-Y', strtotime($row['collection_date'])) : '';
    $sub_array[] = isset($row['collection_amount']) ? moneyFormatIndia($row['collection_amount'] ): '';
    $data[]      = $sub_array;
    $sno = $sno + 1;
}
function count_all_data($pdo)
{
    $query = "SELECT id FROM collection c  ";
    $statement = $pdo->prepare($query);
    $statement->execute();
    return $statement->rowCount();
}

$output = array(
    'draw' => intval($_POST['draw']),
    'recordsTotal' => count_all_data($pdo),
    'recordsFiltered' => $number_filter_row,
    'data' => $data
);

echo json_encode($output);

function moneyFormatIndia($num)
{
    $isNegative = false;
    if ($num < 0) {
        $isNegative = true;
        $num = abs($num);
    }

    $explrestunits = "";
    if (strlen((string)$num) > 3) {
        $lastthree = substr((string)$num, -3);
        $restunits = substr((string)$num, 0, -3);
        $restunits = (strlen($restunits) % 2 == 1) ? "0" . $restunits : $restunits;
        $expunit = str_split($restunits, 2);
        foreach ($expunit as $index => $value) {
            if ($index == 0) {
                $explrestunits .= (int)$value . ",";
            } else {
                $explrestunits .= $value . ",";
            }
        }
        $thecash = $explrestunits . $lastthree;
    } else {
        $thecash = $num;
    }

    $thecash = $isNegative ? "-" . $thecash : $thecash;
    $thecash = $thecash == 0 ? "" : $thecash;
    return $thecash;
}

