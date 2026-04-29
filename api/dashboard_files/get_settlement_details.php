<?php
require "../../ajaxconfig.php";
@session_start();
$user_id = $_SESSION['user_id'];
$branchId = $_POST['branchId'];
$response = array();
$userQry = $pdo->query("SELECT branch FROM users WHERE id = '$user_id'");
$userData = $userQry->fetch();
$user_branches = $userData['branch']; // e.g. "1,2,3"
//Total Paid
$tot_paid = "SELECT COALESCE(SUM(si.settle_cash) + SUM(si.cheque_val) + SUM(si.transaction_val),0) AS total_settle FROM `settlement_info` si JOIN auction_details ad ON si.auction_id = ad.id JOIN group_creation gc ON ad.group_id = gc.grp_id WHERE   MONTH(si.settle_date) = MONTH(CURDATE()) AND YEAR(si.settle_date) = YEAR(CURDATE()) ";

//Today Paid
$today_paid = "SELECT COALESCE(SUM(si.settle_cash) + SUM(si.cheque_val) + SUM(si.transaction_val),0) AS today_settle FROM `settlement_info` si JOIN auction_details ad ON si.auction_id = ad.id JOIN group_creation gc ON ad.group_id = gc.grp_id WHERE DATE(si.settle_date) = CURDATE()  ";

if ($branchId != '' && $branchId != '0') {
    $tot_paid .= " AND gc.branch = $branchId ";
    $today_paid .= " AND gc.branch = $branchId ";
}  else  if ($branchId != '0') {
    // ✅ Decide user_id priority (POST > SESSION)
    $tot_paid .= " AND FIND_IN_SET(gc.branch, '$user_branches')";
    $today_paid .= " AND FIND_IN_SET(gc.branch, '$user_branches')";
}
$qry = $pdo->query($tot_paid);
$response['total_settle'] = $qry->fetch()['total_settle'];
$qry = $pdo->query($today_paid);
$response['today_settle'] = $qry->fetch()['today_settle'];

echo json_encode($response);
