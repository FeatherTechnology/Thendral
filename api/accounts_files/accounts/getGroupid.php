<?php
require "../../../ajaxconfig.php";

$qry = $pdo->query("SELECT id, grp_id,grp_name FROM group_creation where status = 3 ");
if ($qry->rowCount() > 0) {
    $response = $qry->fetchAll(PDO::FETCH_ASSOC);
}
$pdo = null; //Close Connection

echo json_encode($response);