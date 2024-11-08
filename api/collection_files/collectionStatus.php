<?php
require '../../ajaxconfig.php';
@session_start();

class CollectionStsClass
{
    private $pdo;

    public function __construct($pdo)
    {
        $this->pdo = $pdo;
    }

    public function updateCollectionStatus($cus_mapping_id, $auction_id, $group_id, $cus_id, $auction_month, $chit_amount)
    {
        $coll_status = 'Payable';

        // Query to fetch the latest collection record for the same cus_mapping_id
        $query = "SELECT collection_amount, collection_date, payable, 
                         IFNULL(collection_amount, 0) AS amount_collected,
                         IFNULL(payable, 0) AS amount_payable
                  FROM collection 
                  WHERE cus_mapping_id = :cus_mapping_id 
                  AND auction_id = :auction_id 
                  AND group_id = :group_id 
                  AND cus_id = :cus_id 
                  AND auction_month = :auction_month
                  ORDER BY created_on DESC
                  LIMIT 1";
        $stmt = $this->pdo->prepare($query);
        $stmt->execute([
            ':cus_mapping_id' => $cus_mapping_id,
            ':auction_id' => $auction_id,
            ':group_id' => $group_id,
            ':cus_id' => $cus_id,
            ':auction_month' => $auction_month
        ]);

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($row) {
            $collection_amount = $row['collection_amount'];
            $collection_date = $row['collection_date'];
            $payable = $row['amount_payable'];
            $amount_collected = $row['amount_collected'];

            if ($amount_collected >= $payable) {
                $coll_status = 'Paid';
            } else {
                $due_date = date('Y-m-t', strtotime($auction_month . '-01'));
                $current_date = date('Y-m-d');
                if ($current_date > $due_date) {
                    $coll_status = 'Payable';
                } else {
                    $coll_status = 'Payable';
                }
            }
        } else {
            $due_date = date('Y-m-t', strtotime($auction_month . '-01'));
            $current_date = date('Y-m-d');

            if ($current_date > $due_date) {
                $coll_status = 'Payable';
            } else {
                $coll_status = 'Payable';
            }
        }

        

        return $coll_status; // Return the status for use in your table
    }
}
?>
