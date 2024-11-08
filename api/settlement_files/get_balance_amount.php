<?php
require '../../ajaxconfig.php';

$auction_id = $_POST['auction_id'];

$qry = $pdo->query("
    SELECT balance_amount,settle_amount
    FROM settlement_info
    WHERE auction_id = '$auction_id'
    ORDER BY id DESC
    LIMIT 1
");

if ($qry->rowCount() > 0) {
    $result = $qry->fetch(PDO::FETCH_ASSOC);
} else {
    $result = ['balance_amount' => 0]; // Default to 0 if no records found
}

$pdo = null; // Close connection
echo json_encode($result);
?>
