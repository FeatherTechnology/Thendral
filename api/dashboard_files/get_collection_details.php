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
$tot_paid = "SELECT COALESCE(SUM(collection_amount),0) AS total_paid FROM `collection` c JOIN group_creation gc ON c.group_id = gc.grp_id WHERE MONTH(c.collection_date) = MONTH(CURDATE()) 
AND YEAR(c.collection_date) = YEAR(CURDATE())  ";

//Today Paid
$today_paid = "SELECT COALESCE(SUM(collection_amount),0) AS today_paid FROM `collection` c JOIN group_creation gc ON c.group_id = gc.grp_id WHERE DATE(c.created_on) = CURDATE() ";

if ($branchId != '' && $branchId != '0') {
    $tot_paid .= " AND gc.branch = $branchId ";
    $today_paid .= " AND gc.branch = $branchId";
} else  if ($branchId != '0') {
    // ✅ Decide user_id priority (POST > SESSION)
    $tot_paid .= " AND FIND_IN_SET(gc.branch, '$user_branches')";
    $today_paid .= " AND FIND_IN_SET(gc.branch, '$user_branches')";
}

$qry = $pdo->query($tot_paid);
$response['total_paid'] = $qry->fetch()['total_paid'];
$qry = $pdo->query($today_paid);
$response['today_paid'] = $qry->fetch()['today_paid'];

echo json_encode($response);
