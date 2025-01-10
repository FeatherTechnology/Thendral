<?php
require "../../../ajaxconfig.php";

// Fetch the group ID from POST data
$group_id = $_POST['group_id'] ?? '';

if (!empty($group_id)) {
    // First query to fetch auction month for the current month
    $taken_auction_qry = "
        SELECT
            ad.auction_month
        FROM
            auction_details ad
        WHERE
            ad.group_id = '$group_id'
            AND MONTH(ad.date) = MONTH(CURDATE())
            AND YEAR(ad.date) = YEAR(CURDATE())
    ";

    // Execute the query directly
    $stmt = $pdo->query($taken_auction_qry);
    $taken_customers = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // If no results for the current month, fetch the max auction month for that group
    if (empty($taken_customers)) {
        $max_auction_qry = "
            SELECT
                MAX(ad.auction_month) AS auction_month
            FROM
                auction_details ad
            WHERE
                ad.group_id = '$group_id'
        ";

        $stmt_max = $pdo->query($max_auction_qry);
        $max_auction_month = $stmt_max->fetch(PDO::FETCH_ASSOC);

        // Return the max auction month if no data for the current month
        echo json_encode([$max_auction_month]);
    } else {
        // Return the result for the current month
        echo json_encode($taken_customers);
    }
} else {
    // If group_id is not provided, return an empty array
    echo json_encode([]);
}
?>
