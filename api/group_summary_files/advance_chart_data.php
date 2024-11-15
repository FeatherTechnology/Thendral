<?php
require '../../ajaxconfig.php';

$response = array();

if (isset($_POST['group_id'])) {
    $group_id = $_POST['group_id'];
    $currentMonth = date('m'); // Get the current month
    $currentYear = date('Y'); // Get the current year

    // Transaction category, cash type, and credit/debit mappings
    $trans_cat = ["1" => 'Deposit', "2" => 'Investment', "3" => 'EL', "4" => 'Exchange', "5" => 'Bank Deposit', "6" => 'Bank Withdrawal', "7" => 'Chit Advance', "8" => 'Other Income', "9" => 'Bank Unbilled'];
    $cash_type = ["1" => 'Hand Cash', "2" => 'Bank Cash'];
    $crdr = ["1" => 'Credit', "2" => 'Debit'];

    try {
        // Query to fetch transaction details
        $qry = "
            SELECT 
                a.*, 
                CONCAT(gc.grp_id, '-', gc.grp_name) AS group_id, 
                d.name AS username,  
                CONCAT(cc.first_name, ' ', cc.last_name) AS cus_name,
                e.bank_name AS bank_namecash,
                a.auction_month 
            FROM `other_transaction` a 
            LEFT JOIN other_trans_name b ON a.name = b.id 
            LEFT JOIN group_creation gc ON a.group_id = gc.grp_id 
            LEFT JOIN users d ON a.user_name = d.id 
            LEFT JOIN bank_creation e ON a.bank_id = e.id 
            LEFT JOIN customer_creation cc ON a.group_mem = cc.id 
            WHERE gc.grp_id = '$group_id'
            AND (
                YEAR(a.created_on) < $currentYear
                OR (YEAR(a.created_on) = $currentYear AND MONTH(a.created_on) <= $currentMonth)
            )
            ORDER BY a.id ASC
        ";

        // Execute the query
        $stmt = $pdo->query($qry);

        // Fetch and process the result
        if ($stmt->rowCount() > 0) {
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

            foreach ($data as &$row) {
                $row['trans_cat'] = isset($trans_cat[$row['trans_cat']]) ? $trans_cat[$row['trans_cat']] : '';
                $row['type'] = isset($crdr[$row['type']]) ? $crdr[$row['type']] : '';
            }

            echo json_encode($data);
        } else {
            echo json_encode([]);
        }
    } catch (PDOException $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }

    // Close the PDO connection
    $pdo = null;
}
