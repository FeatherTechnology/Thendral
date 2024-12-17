<?php
require "../../ajaxconfig.php";
@session_start();
$user_id = $_SESSION['user_id'];
$current_date = date('Y-m-d');

// Use a default value for $branchId if it's not set
$branchId = isset($_POST['branchId']) ? $_POST['branchId'] : null;
$response = array();

// Initialize the SQL for total paid
$month_paid = "SELECT COALESCE(SUM(c.collection_amount), 0) AS month_paid 
                FROM collection c 
                JOIN group_creation gc ON c.group_id = gc.grp_id 
                WHERE MONTH(c.collection_date) = MONTH('$current_date') AND YEAR(c.collection_date) = YEAR('$current_date') ";

// Add conditions based on branchId
if ($branchId !== null && $branchId !== '' && $branchId !== '0') {
    $month_paid .= " AND gc.branch = '$branchId' AND  gc.insert_login_id = '$user_id' ";
} else {
    $month_paid .= " AND gc.insert_login_id = '$user_id' ";
}
$month_paid .= "GROUP BY gc.grp_id";

// Initialize the SQL for unpaid amount calculation
$month_unpaid = "SELECT ((ad.chit_amount * gc.total_members) - COALESCE(SUM(LEAST((ad.chit_amount * gs.share_percent / 100), c.collection_amount)),0)) AS unpaid_amount
                FROM group_share gs 
                JOIN auction_details ad ON gs.grp_creation_id = ad.group_id 
                JOIN group_creation gc ON gs.grp_creation_id = gc.grp_id
                LEFT JOIN collection c ON ad.id = c.auction_id AND gs.id = c.share_id
                WHERE MONTH(ad.date) = MONTH('$current_date') AND YEAR(ad.date) = YEAR('$current_date') AND ad.status IN (2, 3) AND ";

// Add conditions based on branchId for unpaid amount
if ($branchId !== null && $branchId !== '' && $branchId !== '0') {
    $month_unpaid .= " gc.branch = '$branchId' AND  gc.insert_login_id = '$user_id' ";
} else {
    $month_unpaid .= " gc.insert_login_id = '$user_id' ";
}
$month_unpaid .= " GROUP BY gs.grp_creation_id";

$prev_pen_amount  = "SELECT (
                        (SELECT SUM(COALESCE(ad.chit_amount, 0) * gc_sub.total_members)
                        FROM auction_details ad
                        JOIN group_creation gc_sub ON ad.group_id = gc_sub.grp_id
                        WHERE ad.group_id = gc.grp_id
                        AND (YEAR(ad.date) < YEAR('$current_date') 
                            OR (YEAR(ad.date) = YEAR('$current_date') 
                                AND MONTH(ad.date) < MONTH('$current_date')))
                        AND ad.status IN (2, 3)
                        ) - 
                        (SELECT COALESCE(SUM(c.collection_amount), 0)
                        FROM collection c
                        LEFT JOIN auction_details ad ON c.auction_id = ad.id
                        WHERE c.group_id = gc.grp_id
                        AND (YEAR(ad.date) < YEAR('$current_date') 
                            OR (YEAR(ad.date) = YEAR('$current_date') 
                                AND MONTH(ad.date) < MONTH('$current_date')))
                            AND ad.status IN (2, 3)
                        )
                    ) AS pending_amount
                    FROM group_creation gc WHERE  ";

// Add conditions based on branchId for unpaid amount
if ($branchId !== null && $branchId !== '' && $branchId !== '0') {
    $prev_pen_amount .= " gc.branch = '$branchId' AND gc.insert_login_id = '$user_id' ";
} else {
    $prev_pen_amount .= " gc.insert_login_id = '$user_id' ";
}

try {

    // Query for total paid
    $qry = $pdo->query($month_paid);
    $paid_results = $qry->fetchAll(PDO::FETCH_ASSOC);
    $total_paid_amount = 0; // Initialize total paid amount
    foreach ($paid_results as $result) {
        $total_paid_amount += $result['month_paid']; // Sum paid amounts
    }
    // Add total paid amount to the response
    $response['month_paid'] = $total_paid_amount;

    // Query for unpaid groups
    $qry = $pdo->query($month_unpaid);
    $unpaid_results = $qry->fetchAll(PDO::FETCH_ASSOC);
    $total_unpaid_amount = 0; // Initialize total unpaid amount
    foreach ($unpaid_results as $result) {
        $total_unpaid_amount += $result['unpaid_amount']; // Sum unpaid amounts
    }
    // Add total unpaid amount to the response
    $response['month_unpaid'] = $total_unpaid_amount;

    // Query for unpaid groups
    $qry = $pdo->query($prev_pen_amount);
    $pending_results = $qry->fetchAll(PDO::FETCH_ASSOC);
    $total_pending_amount = 0; // Initialize total unpaid amount
    foreach ($pending_results as $result) {
        $total_pending_amount += $result['pending_amount']; // Sum unpaid amounts
    }
    // Add total unpaid amount to the response
    $response['prev_pen_amount'] = $total_pending_amount;

    $total_outstanding = $total_unpaid_amount + $total_pending_amount;
    $response['total_outstanding'] = $total_outstanding;

    // Return response as JSON
    echo json_encode($response);
} catch (PDOException $e) {
    // Handle any errors
    echo json_encode(array('error' => $e->getMessage()));
}
