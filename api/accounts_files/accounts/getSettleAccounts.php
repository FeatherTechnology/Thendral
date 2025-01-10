<?php
require "../../../ajaxconfig.php";

// Fetch the group ID and customer ID from POST data
$group_id = $_POST['group_id'] ?? '';
$cus_id = $_POST['cus_id'] ?? '';

// First query to fetch details for the current month
$qry = $pdo->query("SELECT 
            ad.id,
            gc.chit_value,
            ad.auction_value,
            (gc.chit_value - ad.auction_value) AS settle_amount,
            gs.share_percent,
            (gc.chit_value - ad.auction_value) * (gs.share_percent / 100) AS settlement_amount
        FROM 
            auction_details ad
        LEFT JOIN 
            group_creation gc ON ad.group_id = gc.grp_id
        LEFT JOIN 
            group_share gs ON ad.group_id = gs.grp_creation_id
        LEFT JOIN 
            customer_creation cc ON gs.cus_id = cc.id
        WHERE 
            cc.id = '$cus_id' 
            AND ad.group_id = '$group_id' 
            AND MONTH(ad.date) = MONTH(CURDATE()) 
            AND YEAR(ad.date) = YEAR(CURDATE()) 
            AND ad.status IN (2, 3)");

if ($qry->rowCount() > 0) {
    // If data is found for the current month
    $result = $qry->fetchAll(PDO::FETCH_ASSOC);
} else {
    // If no data is found for the current month, fetch the data from the maximum auction month for the group
    $qry_max_month = $pdo->query("SELECT 
                ad.id,
                gc.chit_value,
                ad.auction_value,
                (gc.chit_value - ad.auction_value) AS settle_amount,
                gs.share_percent,
                (gc.chit_value - ad.auction_value) * (gs.share_percent / 100) AS settlement_amount
            FROM 
                auction_details ad
            LEFT JOIN 
                group_creation gc ON ad.group_id = gc.grp_id
            LEFT JOIN 
                group_share gs ON ad.group_id = gs.grp_creation_id
            LEFT JOIN 
                customer_creation cc ON gs.cus_id = cc.id
            WHERE 
                cc.id = '$cus_id' 
                AND ad.group_id = '$group_id' 
                AND ad.auction_month = (SELECT MAX(ad2.auction_month) FROM auction_details ad2 WHERE ad2.group_id = '$group_id') 
                AND ad.status IN (2, 3)");
    
    if ($qry_max_month->rowCount() > 0) {
        // If data is found for the maximum auction month
        $result = $qry_max_month->fetchAll(PDO::FETCH_ASSOC);
    } else {
        // If no data found for either the current month or the maximum auction month
        $result = [];
    }
}

// Close connection
$pdo = null;

// Return the result as JSON
echo json_encode($result);
?>
