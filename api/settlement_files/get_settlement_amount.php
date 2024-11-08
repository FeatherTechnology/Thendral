<?php
require '../../ajaxconfig.php';

$id = $_POST['id'];
$qry = $pdo->query("SELECT 
            ad.id,
            gc.chit_value,
            ad.auction_value,
            (gc.chit_value - ad.auction_value) AS settlement_amount
        FROM 
            auction_details ad
        LEFT JOIN 
            group_creation gc ON ad.group_id = gc.grp_id 
        WHERE ad.id='$id'");

if ($qry->rowCount() > 0) {
    $result = $qry->fetchAll(PDO::FETCH_ASSOC);
} else {
    $result = []; // Return empty array if no data found
}

$pdo = null; // Close connection
echo json_encode($result);
?>
