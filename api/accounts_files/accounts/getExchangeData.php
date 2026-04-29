<?php
require "../../../ajaxconfig.php";

$current_date = date('Y-m-d');

// 🔹 Get inputs
$bankCondition = '';
$type        = $_POST['type'] ?? '';
$other_name  = $_POST['other_name'] ?? '';
$branch_id   = $_POST['branch_id'] ?? '';
$branch_id   = $_POST['branch_id'] ?? '';
$othertransaction_cash_type = $_POST['othertransaction_cash_type'] ?? '';
if($othertransaction_cash_type == '2'){
    $selectedBankId = $_POST['selectedBankId'] ?? '';
    $bankCondition = 'AND to_bank = '.$selectedBankId;

}



$result = [];

// 🔹 Main Query (Calculate Total Debit & Credit)
$qry = $pdo->query("
    SELECT 
        COALESCE(SUM(CASE WHEN type = '2' THEN amount END),0) AS total_debit,
        COALESCE(SUM(CASE WHEN type = '1' THEN amount END),0) AS total_credit
    FROM other_transaction
    WHERE branch = '$branch_id'
    AND trans_cat = '4' -- ✅ Only Exchange
    AND name = '$other_name' AND coll_mode = '$othertransaction_cash_type' $bankCondition

");

if ($qry->rowCount() > 0) {

    $data = $qry->fetch(PDO::FETCH_ASSOC);

    $total_debit  = $data['total_debit'];
    $total_credit = $data['total_credit'];

    // 🔥 Remaining calculation
    $remaining = $total_debit - $total_credit;

    // ✅ Safety (avoid negative)
    if ($remaining < 0) {
        $remaining = 0;
    }

    $result = [
        'total_debit'  => $total_debit,
        'total_credit' => $total_credit,
        'remaining_amount' => $remaining
    ];
}

// Close connection
$pdo = null;

// Return JSON
echo json_encode($result);
?>
