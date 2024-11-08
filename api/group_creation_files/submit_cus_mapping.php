<?php
require "../../ajaxconfig.php";
@session_start();
$user_id = $_SESSION['user_id'];
$total_members = intval($_POST['total_members']);
$group_id = $pdo->quote($_POST['group_id']); // Properly quote to prevent SQL injection
$cus_id = intval($_POST['cus_name']); // Assuming cus_name is actually cus_id
$chit_value = intval($_POST['chit_value']); // Chit value of the new group
$joining_month=intval($_POST['joining_month']);

// Initialize response
$response = ['result' => 2]; // Default to failure

// Get the customer's chit limit
$cusStmt = $pdo->query("SELECT chit_limit FROM customer_creation WHERE id = $cus_id");
$cusChitLimit = $cusStmt->fetchColumn();

// Check how many times the customer is added to the same group
$existingGroupsStmt = $pdo->query("SELECT COUNT(*) FROM group_cus_mapping WHERE cus_id = $cus_id AND grp_creation_id = $group_id");
$existingGroupsCount = $existingGroupsStmt->fetchColumn();

// Calculate the total chit value of all groups the customer is currently in
$chitValueSum = 0;
$existingGroupsStmt = $pdo->query("SELECT grp_creation_id FROM group_cus_mapping WHERE cus_id = $cus_id");
$existingGroups = $existingGroupsStmt->fetchAll(PDO::FETCH_COLUMN);

foreach ($existingGroups as $grp_id) {
    $groupChitStmt = $pdo->query("SELECT chit_value FROM group_creation WHERE grp_id = '$grp_id'");
    $grpChitValue = $groupChitStmt->fetchColumn();
    $chitValueSum += $grpChitValue;
}

// Add the chit value of the new group, adjusted if the customer is already in the same group
$chitValueSum += ($existingGroupsCount + 1) * $chit_value; // +1 because we're adding this new instance

// Check if adding the new group will exceed the customer's chit limit
if ($chitValueSum > $cusChitLimit) {
    $response = ['result' => 3, 'message' => 'Adding this group would exceed the customer\'s chit limit.'];
    echo json_encode($response);
    exit();
}

// Check the current count of customer mappings for the group
$stmt = $pdo->query("SELECT COUNT(*) FROM group_cus_mapping WHERE grp_creation_id = $group_id");
$current_count = $stmt->fetchColumn();

// Add the new group to the mapping
if ($current_count < $total_members) {
    $qry = $pdo->query("INSERT INTO group_cus_mapping (grp_creation_id, cus_id,joining_month, insert_login_id, created_on) VALUES ($group_id, $cus_id,'$joining_month','$user_id', NOW())");
    
    if ($qry) {
        // Check if count now equals total members
        $stmt = $pdo->query("SELECT COUNT(*) FROM group_cus_mapping WHERE grp_creation_id = $group_id");
        $current_count = $stmt->fetchColumn();

        if ($current_count == $total_members) {
            // Update the status in the group_creation table
            $update_stmt = $pdo->query("UPDATE group_creation SET status = '2' WHERE grp_id = $group_id");
            if ($update_stmt) {
                $response['result'] = 1; // Success
            } else {
                $response['result'] = 2; // Failure
            }
        } else {
            $response['result'] = 1; // Success, but not yet full
        }
    } else {
        // Failure during insertion
        $response['result'] = 2;
    }
} else {
    // Customer mapping limit exceeded
    $response = ['result' => 3, 'message' => 'Customer Mapping Limit is Exceeded'];
}

echo json_encode($response);
?>
