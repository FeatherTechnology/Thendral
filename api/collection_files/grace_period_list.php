<?php
require '../../ajaxconfig.php';
@session_start();

class GraceperiodClass
{
    private $pdo;

    public function __construct($pdo)
    {
        $this->pdo = $pdo;
    }

    public function updateGraceStatus($cus_id, $id)
    {
        $currentMonth = date('m');
        $currentYear = date('Y');
        $current_date = date('Y-m-d');
        
        $status_color = 'orange'; // Default to orange unless a red status is found

        // Fetch all groups for the customer, excluding those with status 'Paid'
       
        
      $qry1 = " SELECT DISTINCT
    ad.group_id
FROM
    auction_details ad
LEFT JOIN group_cus_mapping gcm ON ad.group_id = gcm.grp_creation_id
LEFT JOIN customer_creation cc ON gcm.cus_id = cc.id
LEFT JOIN (
    SELECT group_id,
           cus_mapping_id,
           MAX(created_on) AS latest_created_on
    FROM collection
    WHERE cus_id = '$cus_id'
      AND MONTH(collection_date) = '$currentMonth'
      AND YEAR(collection_date) = '$currentYear'
    GROUP BY group_id, cus_mapping_id  -- Group by both group_id and cus_mapping_id
) col_max ON ad.group_id = col_max.group_id
LEFT JOIN collection col ON ad.group_id = col.group_id
    AND col.cus_mapping_id = col_max.cus_mapping_id
    AND col.created_on = col_max.latest_created_on
WHERE cc.cus_id = '$cus_id'
  AND YEAR(ad.date) = '$currentYear'
  AND MONTH(ad.date) = '$currentMonth'
  AND ad.status IN (2, 3)
  AND gcm.id IS NOT NULL
  AND (
    col.cus_mapping_id IS NULL
    OR NOT EXISTS (
        SELECT 1
        FROM collection c
        WHERE c.group_id = ad.group_id
          AND c.cus_mapping_id = gcm.id
          AND c.coll_status = 'Paid'
    )
)"; // Exclude groups with 'Paid' status

        $statement = $this->pdo->query($qry1);
        $groups = $statement->fetchAll(PDO::FETCH_ASSOC);

        if (!$groups) {
            return $status_color; // Return orange if no groups are found
        }

        foreach ($groups as $group) {
            $group_id = $group['group_id'];

            // Fetch grace period and date for the group
            $qryCount = "SELECT gc.grace_period, ad.date 
                         FROM auction_details ad 
                         LEFT JOIN group_creation gc ON ad.group_id = gc.grp_id
                         WHERE ad.group_id = '$group_id'AND YEAR(ad.date) = '$currentYear'
                   AND MONTH(ad.date) = '$currentMonth'";

            $stmtCount = $this->pdo->query($qryCount);
            $mappings = $stmtCount->fetchAll(PDO::FETCH_ASSOC);

            foreach ($mappings as $row) {
                $grace_period = isset($row['grace_period']) ? $row['grace_period'] : 0;
                $date = isset($row['date']) ? $row['date'] : '';
                
                if (!empty($date)) {
                    $grace_end_date = date('Y-m-d', strtotime($date . ' + ' . $grace_period . ' days'));

                    if ($grace_end_date < $current_date) {
                        // If any group has missed the payment after the grace period, return 'red'
                        return 'red';
                    } elseif ($grace_end_date >= $current_date) {
                        // If the payment is still within the grace period, continue checking other groups
                        $status_color = 'orange';
                    }
                }
            }
        }

        // If no group is in a red state, return orange (default)
        return $status_color;
    }
}
