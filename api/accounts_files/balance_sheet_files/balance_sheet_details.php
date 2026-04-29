<?php
require "../../../ajaxconfig.php";
$type = $_POST['type'];
@session_start();

// ✅ Decide user_id priority (POST > SESSION)
$user_id = !empty($_POST['user_id']) ? $_POST['user_id'] : $_SESSION['user_id'];
$userQry = $pdo->query("SELECT branch FROM users WHERE id = '$user_id'");
$userData = $userQry->fetch();
$user_branches = $userData['branch']; // e.g. "1,2,3"
$branch_condition = " AND FIND_IN_SET(branch, '$user_branches')";

if ($type == 'today') {
    $where = " DATE(created_on) = CURRENT_DATE ";
    $swhere = " DATE(si.created_on) = CURRENT_DATE ";

} else if ($type == 'day') {
    $from_date = $_POST['from_date'];
    $to_date = $_POST['to_date'];
    $where = " (DATE(created_on) >= '$from_date' && DATE(created_on) <= '$to_date' )  ";
    $swhere = " (DATE(si.created_on) >= '$from_date' && DATE(si.created_on) <= '$to_date' )";

} else if ($type == 'month') {
    $month = date('m', strtotime($_POST['month']));
    $year = date('Y', strtotime($_POST['month']));
    $where = " (MONTH(created_on) = '$month' AND YEAR(created_on) = $year) ";
    $swhere = " (MONTH(si.created_on) = '$month' AND YEAR(si.created_on) = $year)";

}


$result = array();

//Credit
$qry = $pdo->query("SELECT COALESCE(SUM(amount),0) AS dep_cr FROM `other_transaction` WHERE trans_cat ='1' AND type = '1' $branch_condition AND $where "); //Deposit 
if ($qry->rowCount() > 0) {
    $depcr = $qry->fetch(PDO::FETCH_ASSOC)['dep_cr'];
}

$qry2 = $pdo->query("SELECT COALESCE(SUM(amount),0) AS inv_cr FROM `other_transaction` WHERE trans_cat ='2' AND type = '1' $branch_condition AND $where "); //Investment
if ($qry2->rowCount() > 0) {
    $invcr = $qry2->fetch(PDO::FETCH_ASSOC)['inv_cr'];
} 

$qry3 = $pdo->query("SELECT COALESCE(SUM(amount),0) AS el_cr FROM `other_transaction` WHERE trans_cat ='3' AND type = '1' $branch_condition AND $where "); //EL
if ($qry3->rowCount() > 0) {
    $elcr = $qry3->fetch(PDO::FETCH_ASSOC)['el_cr'];
} 

$qry4 = $pdo->query("SELECT COALESCE(SUM(amount),0) AS exc_cr FROM `other_transaction` WHERE trans_cat ='4' AND type = '1' $branch_condition AND $where "); //Exchange
if ($qry4->rowCount() > 0) {
    $exccr = $qry4->fetch(PDO::FETCH_ASSOC)['exc_cr'];
} 
$qry = $pdo->query("SELECT COALESCE(SUM(amount),0) AS chitc_adv FROM `other_transaction` WHERE trans_cat ='7' AND type = '1' $branch_condition AND $where "); //Chit advance
if ($qry->rowCount() > 0) {
    $chitadcr = $qry->fetch(PDO::FETCH_ASSOC)['chitc_adv'];
}
$qry5 = $pdo->query("SELECT COALESCE(SUM(contra),0) AS contra_cr FROM
(
    SELECT SUM(amount) AS contra FROM `other_transaction` WHERE trans_cat ='5' AND type = '1' $branch_condition AND $where
	UNION ALL
	SELECT SUM(amount) AS contra FROM `other_transaction` WHERE trans_cat ='6' AND type = '1' $branch_condition AND $where 
)AS subquery ");  //Bank Deposit //Bank Withdrawal
if ($qry5->rowCount() > 0) {
    $contracr = $qry5->fetch(PDO::FETCH_ASSOC)['contra_cr'];
} 

$qry6 = $pdo->query("SELECT COALESCE(SUM(amount),0) AS oi_dr FROM `other_transaction` WHERE trans_cat ='8' AND type = '1' $branch_condition AND $where "); //Other Income 
if ($qry6->rowCount() > 0) {
    $oicr = $qry6->fetch(PDO::FETCH_ASSOC)['oi_dr'];
}

//Debit
$qry = $pdo->query("SELECT COALESCE(SUM(amount),0) AS dep_dr FROM `other_transaction` WHERE trans_cat ='1' AND type = '2' $branch_condition AND $where "); //Deposit 
if ($qry->rowCount() > 0) {
    $depdr = $qry->fetch(PDO::FETCH_ASSOC)['dep_dr'];
}

$qry2 = $pdo->query("SELECT COALESCE(SUM(amount),0) AS inv_dr FROM `other_transaction` WHERE trans_cat ='2' AND type = '2' $branch_condition AND $where "); //Investment
if ($qry2->rowCount() > 0) {
    $invdr = $qry2->fetch(PDO::FETCH_ASSOC)['inv_dr'];
}

$qry3 = $pdo->query("SELECT COALESCE(SUM(amount),0) AS el_dr FROM `other_transaction` WHERE trans_cat ='3' AND type = '2' $branch_condition AND $where "); //EL
if ($qry3->rowCount() > 0) {
    $eldr = $qry3->fetch(PDO::FETCH_ASSOC)['el_dr'];
}

$qry4 = $pdo->query("SELECT COALESCE(SUM(amount),0) AS exc_dr FROM `other_transaction` WHERE trans_cat ='4' AND type = '2' $branch_condition AND $where "); //Exchange
if ($qry4->rowCount() > 0) {
    $excdr = $qry4->fetch(PDO::FETCH_ASSOC)['exc_dr'];
}


$qry5 = $pdo->query("SELECT COALESCE(SUM(contra),0) AS contra_dr FROM
(
    SELECT SUM(amount) AS contra FROM `other_transaction` WHERE trans_cat ='5' AND type = '2' $branch_condition AND $where
	UNION ALL
	SELECT SUM(amount) AS contra FROM `other_transaction` WHERE trans_cat ='6' AND type = '2' $branch_condition AND $where 
)AS subquery ");  //Bank Deposit //Bank Withdrawal
if ($qry5->rowCount() > 0) {
    $contradr = $qry5->fetch(PDO::FETCH_ASSOC)['contra_dr'];
} 

$qry6 = $pdo->query("SELECT COALESCE(SUM(settle_cash) + SUM(cheque_val) + SUM(transaction_val),0) AS sttle_dr FROM `settlement_info`si LEFT JOIN group_creation gc ON si.group_id = gc.grp_id WHERE FIND_IN_SET(gc.branch, '$user_branches') AND $swhere "); //Loan Advance 
if ($qry6->rowCount() > 0) {
    $sttledr = $qry6->fetch(PDO::FETCH_ASSOC)['sttle_dr'];
}

$qry7 = $pdo->query("SELECT COALESCE(SUM(amount),0) AS exp_dr FROM `expenses` WHERE $where $branch_condition "); //Expenses 
if ($qry7->rowCount() > 0) {
    $expdr = $qry7->fetch(PDO::FETCH_ASSOC)['exp_dr'];
}

$qry8 = $pdo->query("SELECT COALESCE(SUM(collection_amount),0) AS due FROM `collection`si LEFT JOIN group_creation gc ON si.group_id = gc.grp_id WHERE FIND_IN_SET(gc.branch, '$user_branches') AND $swhere "); //Collection 
if ($qry8->rowCount() > 0) {
    $row = $qry8->fetch(PDO::FETCH_ASSOC);
    $due = $row['due'];
}

$result[0]['depcr'] = $depcr;
$result[0]['invcr'] = $invcr;
$result[0]['elcr']  = $elcr;
$result[0]['exccr'] = $exccr;
$result[0]['contracr'] = $contracr;
$result[0]['oicr'] = $oicr;
$result[0]['chitadcr'] = $chitadcr;

$result[0]['depdr'] = $depdr;
$result[0]['invdr'] = $invdr;
$result[0]['eldr']  = $eldr;
$result[0]['excdr'] = $excdr;
$result[0]['contradr'] = $contradr;
$result[0]['sttledr'] = $sttledr;
$result[0]['expdr'] = $expdr;

$result[0]['due'] = $due;

echo json_encode($result);