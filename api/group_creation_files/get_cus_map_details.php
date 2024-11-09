<?php
require "../../ajaxconfig.php";

$cus_map_arr = array();
$group_id = $_POST['group_id'];
$qry = $pdo->query("SELECT gcm.id, cc.cus_id,CONCAT(cc.first_name,' ', cc.last_name) AS name, pl.place, (SELECT GROUP_CONCAT(occupation SEPARATOR ', ') FROM source WHERE cus_id = cc.cus_id) AS occ,gcm.joining_month FROM `group_cus_mapping` gcm JOIN customer_creation cc ON gcm.cus_id = cc.id  JOIN place pl ON cc.place = pl.id  WHERE gcm.grp_creation_id = '$group_id' ");
if ($qry->rowCount() > 0) {
    while ($gcm_info = $qry->fetch(PDO::FETCH_ASSOC)) {
        $gcm_info['action'] = "<span class='icon-trash-2 cusMapDeleteBtn' value='" . $gcm_info['id'] . "'></span>";
        $cus_map_arr[] = $gcm_info;
    }
}
$pdo = null; //Connection Close.
echo json_encode($cus_map_arr);