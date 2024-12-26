<?php
require "../../../ajaxconfig.php";

$qry = $pdo->query("SELECT id, grp_id,grp_name FROM group_creation where status BETWEEN 3 AND 4"); //Need to show closed group also becuz after closed the settlement may happen for some customer, becuz some month auction close by company.
if ($qry->rowCount() > 0) {
    $response = $qry->fetchAll(PDO::FETCH_ASSOC);
}
$pdo = null; //Close Connection

echo json_encode($response);