<?php
require "../../ajaxconfig.php";
@session_start();
$user_id = $_SESSION['user_id'];
$total_members = intval($_POST['total_members']);
$group_id = $pdo->quote($_POST['group_id']);
$map_id = $pdo->quote($_POST['map_id']);
$cus_name = isset($_POST['cus_name']) ? $_POST['cus_name'] : [];
$chit_value = intval($_POST['chit_value']);
$joining_month = intval($_POST['joining_month']);
$share_value = isset($_POST['share_value']) ? $_POST['share_value'] : [];
$share_percent = isset($_POST['share_percent']) ? $_POST['share_percent'] : [];

$response = ['result' => 2]; // Default to failure


    for ($i = 0; $i < count($cus_name); $i++) {
        $cus_id = intval($cus_name[$i]);
        $share_value_item = floatval($share_value[$i]);
        $share_percent_item = floatval($share_percent[$i]);

        // Insert into group_cus_mapping
        $pdo->query("INSERT INTO group_cus_mapping (map_id, grp_creation_id, joining_month, insert_login_id, created_on) 
                     VALUES ($map_id, $group_id, $joining_month, $user_id, NOW())");

        $cus_mapping_id = $pdo->lastInsertId(); // Get the last inserted ID

        if ($cus_mapping_id) {
            // Insert into group_share table
            $pdo->query("INSERT INTO group_share (cus_mapping_id, cus_id, grp_creation_id, share_value, share_percent, created_on, insert_login_id) 
                         VALUES ($cus_mapping_id, $cus_id, $group_id, $share_value_item, $share_percent_item, NOW(), $user_id)");

            $response['result'] = 1; // Success
        } else {
            $response = ['result' => 3, 'message' => 'Customer Mapping Limit is Exceeded'];
            break; // Exit loop if insertion fails
        }
    }

echo json_encode($response);
?>
