<?php
require '../../ajaxconfig.php';

$property_list_arr = array();
$id = $_POST['id']; 
$i = 0;
$qry = $pdo->query("SELECT 
    cc.id,
    gc.grp_id, 
    gc.grp_name, 
    gc.chit_value, 
    cc.cus_id, 
    COUNT(di.id) AS document_count
FROM 
    auction_details ad 
LEFT JOIN 
    group_creation gc ON ad.group_id = gc.grp_id 
JOIN 
    document_info di ON ad.id = di.auction_id 
LEFT JOIN 
    customer_creation cc ON di.cus_id = cc.cus_id 

WHERE 
    gc.status BETWEEN 4 AND 5
    AND cc.id = '$id'
GROUP BY 
    gc.grp_id, gc.grp_name, gc.chit_value, cc.cus_id
ORDER BY 
    gc.grp_id;");

if ($qry->rowCount() > 0) {
    while ($row = $qry->fetch(PDO::FETCH_ASSOC)) {

        $row['action'] = "<button class='btn btn-primary documentActionBtn' value='" . $row['cus_id'] . "_" . $row['grp_id'] ."'>&nbsp;NOC Summary</button>";

        $property_list_arr[$i] = $row; // Append to the array
        $i++;
    }
}

echo json_encode($property_list_arr);
$pdo = null; // Close Connection