<?php 
require "../../ajaxconfig.php";
@session_start();
$user_id = $_SESSION['user_id'];

// Use a default value for $branchId if it's not set
$branchId = isset($_POST['branchId']) ? $_POST['branchId'] : null;
$response = array();

// Initialize the SQL for total paid
$month_paid = "
SELECT COALESCE(SUM(c.collection_amount), 0) AS month_paid 
FROM collection c 
JOIN group_creation gc ON c.group_id = gc.grp_id 
WHERE MONTH(c.collection_date) = MONTH(CURDATE()) 
AND YEAR(c.collection_date) = YEAR(CURDATE()) 
";

// Add conditions based on branchId
if ($branchId !== null && $branchId !== '' && $branchId !== '0') {
    $month_paid .= " AND gc.branch = '$branchId' AND  gc.insert_login_id = '$user_id' ";
} else {
    $month_paid .= " AND gc.insert_login_id = '$user_id' ";
}
$month_paid .= "GROUP BY gc.grp_id";

// Initialize the SQL for unpaid amount calculation
$month_unpaid = "
SELECT
    ((ad.chit_amount * gc.total_members) - COALESCE(SUM(LEAST(c.collection_amount, ad.chit_amount)), 0)) AS unpaid_amount
FROM
    group_creation gc
    JOIN auction_details ad ON
    gc.grp_id = ad.group_id
 LEFT JOIN collection c ON
    ad.id = c.auction_id 
WHERE
  MONTH(ad.date) = MONTH(CURDATE()) 
    AND YEAR(ad.date) = YEAR(CURDATE()) AND ad.status IN (2, 3) AND
";

// Add conditions based on branchId for unpaid amount
if ($branchId !== null && $branchId !== '' && $branchId !== '0') {
    $month_unpaid .= " gc.branch = '$branchId' AND  gc.insert_login_id = '$user_id' ";
} else {
    $month_unpaid .= " gc.insert_login_id = '$user_id' ";
}

$month_unpaid .= "
GROUP BY 
    gc.grp_id";
    
    $prev_pen_amount  = "
    SELECT  
    (
        (SELECT SUM(COALESCE(ad.chit_amount, 0) * gc_sub.total_members)
         FROM auction_details ad
         JOIN group_creation gc_sub ON ad.group_id = gc_sub.grp_id
         WHERE ad.group_id = gc.grp_id
           AND (YEAR(ad.date) < YEAR(CURRENT_DATE) 
            OR (YEAR(ad.date) = YEAR(CURRENT_DATE) 
                AND MONTH(ad.date) < MONTH(CURRENT_DATE)))
           AND ad.status IN (2, 3)
        ) - 
        (SELECT COALESCE(SUM(c.collection_amount), 0)
         FROM collection c
         LEFT JOIN auction_details ad ON c.auction_id = ad.id
         WHERE c.group_id = gc.grp_id
           AND c.auction_month = ad.auction_month AND ad.status IN (2, 3)
        )
    ) AS pending_amount
FROM 
    group_creation gc
    WHERE  
    ";
    
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
    $response['paid_groups'] = array();
    $total_paid_amount = 0; // Initialize total paid amount

    foreach ($paid_results as $result) {
        $month_paid = $result['month_paid'];

        $total_paid_amount += $month_paid; // Sum paid amounts

        $response['paid_groups'][] = array(
            'month_paid' => $month_paid
        );
    }
    $response['month_paid'] = $total_paid_amount;

    // Query for unpaid groups
    $qry = $pdo->query($month_unpaid);
    $unpaid_results = $qry->fetchAll(PDO::FETCH_ASSOC);
    $response['unpaid_groups'] = array();
    $total_unpaid_amount = 0; // Initialize total unpaid amount
    foreach ($unpaid_results as $result) {
        $unpaid_amount = $result['unpaid_amount'];
        $total_unpaid_amount += $unpaid_amount; // Sum unpaid amounts

        $response['unpaid_groups'][] = array(
            'unpaid_amount' => $unpaid_amount
        );
    }

    // Add total unpaid amount to the response
    $response['month_unpaid'] = $total_unpaid_amount;
// Query for unpaid groups
// Query for unpaid groups
$qry = $pdo->query($prev_pen_amount);
$pending_results = $qry->fetchAll(PDO::FETCH_ASSOC);
$response['pending_groups'] = array();
$total_pending_amount = 0; // Initialize total unpaid amount

foreach ($pending_results as $result) { // Change unpaid_results to pending_results
    $pending_amount = $result['pending_amount'];
    $total_pending_amount += $pending_amount; // Sum unpaid amounts

    $response['pending_groups'][] = array(
        'pending_amount' => $pending_amount
    );
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
?>

