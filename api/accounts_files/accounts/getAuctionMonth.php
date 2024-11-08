<?php
require "../../../ajaxconfig.php";

// Fetch the group ID from POST data
$group_id = $_POST['group_id'] ?? '';

if (!empty($group_id)) {
    // Prepare the SQL query using prepared statements for security
    $taken_auction_qry = "
        SELECT
            ad.auction_month
        FROM
            auction_details ad
        WHERE
            ad.group_id = :group_id
            AND MONTH(ad.date) = MONTH(CURDATE())
            AND YEAR(ad.date) = YEAR(CURDATE())
    ";
    
    // Use prepared statements to execute the query
    $stmt = $pdo->prepare($taken_auction_qry);
    $stmt->execute([':group_id' => $group_id]);

    // Fetch the result
    $taken_customers = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Return the result as JSON
    echo json_encode($taken_customers);
} else {
    // If group_id is not provided, return an empty array
    echo json_encode([]);
}
?>
