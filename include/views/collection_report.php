<div class="row gutters">
    <div class="col-12">
        <div class="toggle-container col-12">
            <input type="date" id='from_date' name='from_date' class="toggle-button" value=''>
            <input type="date" id='to_date' name='to_date' class="toggle-button" value=''>
            <input type="button" id='collection_report_btn' name='collection_report_btn' class="toggle-button" style="background-color: #536589;color:white" value='Search'>
        </div> <br />
        <!-- Collection report Start -->
        <div class="card">
            <div class="card-body overflow-x-cls">
                <div class="col-12">
                    <table id="collection_report_table" class="table custom-table">
                        <thead>
                            <tr>
                                <th>S.NO</th>
                                <th>Customer ID</th>
                                <th>Customer Name</th>
                                <th>Place</th>
                                <th>Mobile</th>
                                <th>Group ID</th>
                                <th>Group Name</th>
                                <th>Auction Month</th>
                                <th>Collection Date</th>
                                <th>Collection Amount</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                        <tfoot>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
        <!--Collection report End-->
    </div>
</div>