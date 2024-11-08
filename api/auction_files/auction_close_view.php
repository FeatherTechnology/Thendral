<?php
require '../../ajaxconfig.php';
@session_start();

$group_id = $_POST['group_id']; // Get group_id from POST request
$date = $_POST['date']; // Get date from POST request

$response = array();

try {
    // Format the date into 'Y-m-d'
    $date = date('Y-m-d', strtotime($date));

    // Prepare the SQL statement with FIND_IN_SET and handling cus_name = -1 (Company)
  
    $qry = "
        SELECT 
            cc.first_name, 
            cc.last_name, 
            al.value,
            CASE 
                WHEN al.cus_name = '-1' THEN 'Company' 
                ELSE CONCAT(cc.first_name, ' ', cc.last_name) 
            END AS customer_name
        FROM 
            auction_modal al
        LEFT JOIN 
            customer_creation cc 
        ON 
            FIND_IN_SET(cc.id, al.cus_name) > 0
        WHERE 
            al.group_id = :group_id
            AND al.date = :date
        ORDER BY 
            al.id ,al.value ASC;";
    
    $stmt = $pdo->prepare($qry);
    
    // Bind and execute the SQL statement
    $stmt->execute([
        ':group_id' => $group_id,
        ':date' => $date
    ]);
    
    // Fetch all results
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Check if results are found
    if ($result) {
        $response['status'] = 'success';
        $response['data'] = $result;
    } else {
        $response['status'] = 'error';
        $response['message'] = 'No data found for the specified group ID and date.';
    }
} catch (PDOException $e) {
    $response['status'] = 'error';
    $response['message'] = 'Database error: ' . $e->getMessage();
}

$pdo = null; // Close the database connection
echo json_encode($response);
?>
