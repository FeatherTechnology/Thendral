<?php
require "../../../ajaxconfig.php";
@session_start();

$user_id = $_SESSION['user_id'];
$coll_mode = $_POST['coll_mode'];
$bank_id = $_POST['bank_id'];
$trans_category = $_POST['trans_category'];
$group_id = $_POST['group_id'];
$other_trans_name = $_POST['other_trans_name'];
$group_mem = $_POST['group_mem'];
$cat_type = $_POST['cat_type'];
$other_ref_id = $_POST['other_ref_id'];
$other_trans_id = $_POST['other_trans_id'];
$other_amnt = $_POST['other_amnt'];
$auction_month = $_POST['auction_month'];
$other_remark = $_POST['other_remark'];
$settle_date_formatted = date('Y-m-d'); // Correct the date formatting

// Insert into `other_transaction`
$qry = $pdo->query("INSERT INTO `other_transaction`( `coll_mode`, `bank_id`, `trans_cat`, `group_id`, `name`, `group_mem`, `type`, `ref_id`, `trans_id`, `amount`, `auction_month`, `remark`, `insert_login_id`, `created_on`) 
VALUES ('$coll_mode', '$bank_id', '$trans_category', '$group_id', '$other_trans_name', '$group_mem', '$cat_type', '$other_ref_id', '$other_trans_id', '$other_amnt', '$auction_month', '$other_remark', '$user_id', NOW())");


// Check if both queries were successful
if ($qry) {
    $result = 1;
} else {
    $result = 2;
}

// Return the result as JSON
echo json_encode($result);
