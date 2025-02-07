<?php
include '../../ajaxconfig.php';
@session_start();
$user_id = $_SESSION['user_id'];
$from_date = $_POST['from_date'];
$current_time = date('H:i:s');
$dateTime = $from_date . ' ' . $current_time;
$query2 = "SELECT gs.id, gc.grp_id, COALESCE((la.chit_amount * gs.share_percent / 100), 0) AS total_chit_amount 
            FROM group_share gs 
            JOIN ( 
                SELECT ad.group_id, COALESCE(SUM(ad.chit_amount), 0) AS chit_amount, 
                MAX(ad.auction_month) AS last_auction_month, MAX(ad.id) AS auction_id 
                FROM auction_details ad 
                WHERE ( YEAR(ad.date) < YEAR('$from_date') OR ( YEAR(ad.date) = YEAR('$from_date') AND MONTH(ad.date) < MONTH('$from_date') ) 
                and ad.status in (2,3) ) 
                GROUP BY ad.group_id 
            ) la ON gs.grp_creation_id = la.group_id 
            LEFT JOIN collection c ON gs.id = c.share_id AND c.auction_month = la.last_auction_month 
            AND c.created_on = ( 
                SELECT MAX(created_on) FROM collection WHERE share_id = gs.id AND auction_month = la.last_auction_month
            ) 
            JOIN group_creation gc ON gs.grp_creation_id = gc.grp_id 
            WHERE c.share_id IS NULL OR (c.payable != c.collection_amount) 
            GROUP BY gs.id";

$stmt3 = $pdo->query($query2);
$ids = array();
$previous_amounts = array();
$payables = array(); // Store payable amounts for each share ID
foreach ($stmt3 as $row1) {
    $map_id = $row1['id'];
    $group_id = $row1['grp_id'];
    $total_chit_amount = $row1['total_chit_amount'];

    $qry1 = "SELECT COALESCE(SUM(c.collection_amount), 0) AS total_collection_amount 
              FROM collection c 
              WHERE c.share_id = '$map_id' AND c.collection_date <= '$dateTime';";

    $stmt1 = $pdo->query($qry1);
    $res = $stmt1->fetch(PDO::FETCH_ASSOC);
    $total_collection_amount = $res['total_collection_amount'];

    $previous_amount = max($total_chit_amount - $total_collection_amount, 0);
    $set_date = "1"; 
    $month = date('m', strtotime($from_date)); 
    $year = date('Y', strtotime($from_date)); 
    $join_date = "$year-$month-$set_date"; 

    $qry2 = " SELECT COALESCE((ad.chit_amount * gs.share_percent / 100), 0) AS current_chit_share 
               FROM auction_details ad 
               LEFT JOIN group_share gs ON ad.group_id = gs.grp_creation_id 
               WHERE ad.group_id = '$group_id' and ad.date BETWEEN '$join_date' AND '$from_date' 
               AND ad.status IN (2, 3) GROUP BY ad.group_id; ";

    $stmt2 = $pdo->query($qry2);
    $result5 = $stmt2->fetch(PDO::FETCH_ASSOC);
    $current_chit_share = isset($result5['current_chit_share']) ? $result5['current_chit_share'] : 0;

    $payable = $previous_amount + $current_chit_share; // Calculate payable
    if ($previous_amount > 0) {
        $ids[] = $map_id;
        $previous_amounts[$map_id] = $previous_amount; // Store previous amount
        $payables[$map_id] = $payable; // Store payable amount
    }
}

$query = "SELECT gs.id, cc.cus_id, CONCAT(cc.first_name, ' ', cc.last_name) AS first_name, pl.place, cc.mobile1, 
           gc.grp_id, gc.grp_name, gc.chit_value, la.last_auction_month, 
           COALESCE((a.chit_amount * gs.share_percent / 100), 0) AS current_chit, 
           COALESCE((la.chit_amount * gs.share_percent / 100), 0) AS total_chit_amount 
           FROM group_share gs 
           JOIN ( 
               SELECT ad.group_id, COALESCE(SUM(ad.chit_amount), 0) AS chit_amount, 
               MAX(ad.auction_month) AS last_auction_month, MAX(ad.id) AS auction_id 
               FROM auction_details ad 
               WHERE ( YEAR(ad.date) < YEAR('$from_date') OR ( YEAR(ad.date) = YEAR('$from_date') AND MONTH(ad.date) < MONTH('$from_date') ) 
               and ad.status in (2,3) ) 
               GROUP BY ad.group_id 
           ) la ON gs.grp_creation_id = la.group_id 
           LEFT JOIN auction_details a ON la.auction_id = a.id 
           JOIN group_creation gc ON gs.grp_creation_id = gc.grp_id 
           JOIN customer_creation cc ON gs.cus_id = cc.id 
           LEFT JOIN place pl ON cc.place = pl.id 
           WHERE gs.id IN (" . implode(',', $ids) . ") 
           GROUP BY gs.id";

$column = array('gs.id', 'cc.cus_id', 'cc.first_name', 'pl.place', 'cc.mobile1', 'gc.grp_id', 'gc.grp_name', 'gc.chit_value', 'last_auction_month', 'gs.id', 'gs.id','gs.id');

if (isset($_POST['search']) && $_POST['search'] != "") {
    $query .= " and (cc.cus_id LIKE '%" . $_POST['search'] . "%' OR CONCAT(cc.first_name, ' ', cc.last_name) LIKE '%" . $_POST['search'] . "%' OR pl.place LIKE '%" . $_POST['search'] . "%' OR gc.grp_id LIKE '%" . $_POST['search'] . "%' OR gc.grp_name LIKE '%" . $_POST['search'] . "%' OR gc.chit_value LIKE '%" . $_POST['search'] . "%') ";
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
    $sub_array = array();
    $sub_array[] = $sno;
    $sub_array[] = isset($row['cus_id']) ? $row['cus_id'] : '';
    $sub_array[] = isset($row['first_name']) ? $row['first_name'] : '';
    $sub_array[] = isset($row['place']) ? $row['place'] : '';
    $sub_array[] = isset($row['mobile1']) ? $row['mobile1'] : '';
    $sub_array[] = isset($row['grp_id']) ? $row['grp_id'] : '';
    $sub_array[] = isset($row['grp_name']) ? $row['grp_name'] : '';
    $sub_array[] = isset($row['chit_value']) ? moneyFormatIndia($row['chit_value']) : '';
    $sub_array[] = isset($row['last_auction_month']) ? $row['last_auction_month'] : '';
    $sub_array[] = isset($row['current_chit']) ? moneyFormatIndia($row['current_chit']) : '';
    $sub_array[] = isset($previous_amounts[$row['id']]) ? moneyFormatIndia($previous_amounts[$row['id']]) : ''; // Previous amount
    $sub_array[] = isset($payables[$row['id']]) ? moneyFormatIndia($payables[$row['id']]) : ''; // Payable amount

    $data[] = $sub_array;
    $sno = $sno + 1;
}

function count_all_data($pdo) {
    $query = "SELECT id FROM group_share gs";
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
