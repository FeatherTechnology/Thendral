<?php
require '../../../ajaxconfig.php';

$id = isset($_POST['id']) ? $_POST['id'] : null;
$result = 2; // Default failure response

    // Proceed with the deletion only if all required values are provided
    $qry = $pdo->query("DELETE FROM `other_transaction` WHERE id='$id'");
    
    if ($qry) {
        $result = 1; // Success response
    }

$pdo = null; // Close connection.

echo json_encode($result);
