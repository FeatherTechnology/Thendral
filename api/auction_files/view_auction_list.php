<?php
require '../../ajaxconfig.php';
@session_start();
$user_id = $_SESSION['user_id'];
$group_id = $_POST['group_id'];
$group_list_arr = array();

$currentYear = date('Y'); // Format 'Y' gives the year as a four-digit number (e.g., 2024)
$currentMonth = date('m'); // Format 'm' gives the month as a two-digit number (01-12)

// Prepare SQL query to fetch data for the current year and month, and past months and years
$sql = "SELECT 
    ad.id,
    ad.group_id, 
    ad.auction_month, 
    DATE_FORMAT(ad.date, '%d-%m-%Y') AS date, -- Format date as DD-MM-YYYY
    ad.low_value,
    ad.high_value,
    ad.status,
    CASE 
        WHEN ad.cus_name = '-1' THEN 'Company' -- Handle the case where cus_name is -1 (Company)
        ELSE COALESCE(CONCAT(cc.first_name, ' ', cc.last_name), '') -- Concatenate first and last name
    END AS cus_name,
    ad.auction_value
FROM auction_details ad
LEFT JOIN customer_creation cc ON ad.cus_name = cc.id
WHERE ad.group_id = :group_id 
AND (
    YEAR(ad.date) < :currentYear
    OR (YEAR(ad.date) = :currentYear AND MONTH(ad.date) <= :currentMonth)
)
ORDER BY ad.auction_month DESC";
try {
    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        ':group_id' => $group_id,
        ':currentYear' => $currentYear,
        ':currentMonth' => $currentMonth
    ]);

    if ($stmt->rowCount() > 0) {
        while ($auctionInfo = $stmt->fetch(PDO::FETCH_ASSOC)) {
            // Concatenate group_id, date, and id to form uniqueDetail
            $uniqueDetail = $auctionInfo['group_id'] . '_' . $auctionInfo['date'] . '_' . $auctionInfo['id']. '_' . $auctionInfo['low_value']. '_' . $auctionInfo['high_value'].'_' . $auctionInfo['auction_month'];
            $uniqueValue = $auctionInfo['group_id'] . '_' . $auctionInfo['date'];
            $uniqueMonth = $auctionInfo['group_id'] . '_' . $auctionInfo['auction_month'];

            // Initialize 'action' key with an empty string
            $auctionInfo['action'] = '';

            if ($auctionInfo['status'] == '1') {
                $auctionInfo['action'] .= "<button class='btn btn-primary auctionBtn' data-value='" . $uniqueMonth . "' >&nbsp;Auction</button>
                                <button class='btn btn-primary postponeBtn' data-value='" . $uniqueMonth . "'>&nbsp;Reschedule</button>";
            }
            if ($auctionInfo['status'] >= '2') {
                $auctionInfo['action'] .= "<button class='btn btn-primary viewBtn' data-value='" . $uniqueValue . "'>&nbsp;View</button>
                                            <button class='btn btn-primary calculateBtn' data-value='" . $uniqueValue . "'>&nbsp;Calculation</button>";
            }

            $group_list_arr[] = $auctionInfo;
        }
    }

    echo json_encode($group_list_arr);
} catch (PDOException $e) {
    echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
}

$pdo = null; // Close Connection.
?>
