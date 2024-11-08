<?php
require '../../ajaxconfig.php';

$id = $_POST['id'];
$reference_type = [1 => "Promotion", 2 => "Customer", 3 => "Well Known Person"];

$qry = $pdo->query("SELECT 
            ad.id,
            cc.cus_id,
            CONCAT(cc.first_name, ' ', cc.last_name) AS cus_name,
            pl.place,
            cc.mobile1,
            (SELECT GROUP_CONCAT(sc.occupation SEPARATOR ', ') 
                FROM source sc 
                WHERE sc.cus_id = cc.cus_id
            ) AS occupations,
            cc.reference_type,
            cc.pic
        FROM 
            auction_details ad
        JOIN 
            customer_creation cc ON ad.cus_name = cc.id 
        JOIN 
            place pl ON cc.place = pl.id
        WHERE 
            ad.id = '$id'");

if ($qry->rowCount() > 0) {
    $result = $qry->fetchAll(PDO::FETCH_ASSOC);
    foreach ($result as &$row) {
        // Handle undefined or null reference_type
        if (!empty($row['reference_type']) && isset($reference_type[$row['reference_type']])) {
            $row['reference_type'] = $reference_type[$row['reference_type']];
        } else {
            $row['reference_type'] = ''; // Default value if reference_type is not valid
        }
    }
}

$pdo = null; // Close connection.
echo json_encode($result);
?>
