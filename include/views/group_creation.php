<div class="row gutters">
    <div class="col-12">
        <div class="col-12 mt-3 text-right">
            <button class="btn btn-primary" id="add_group"><span class="icon-add"></span> Add Group Creation</button>
            <button class="btn btn-primary" id="back_btn" style="display: none;"><span class="icon-arrow-left"></span> Back</button>
        </div></br>
        <!----------------------------- CARD START GROUP CREATION TABLE------------------------------>
        <div class="card wow group_table_content">
            <div class="card-body">
                <div class="row">
                    <div class="col-12">
                        <table id="group_creation_table" class="table custom-table">
                            <thead>
                                <tr>
                                    <th width="50">S.No.</th>
                                    <th>Group ID</th>
                                    <th>Group Name</th>
                                    <th>Chit Value</th>
                                    <th>Total Month</th>
                                    <th>Date</th>
                                    <th>Start Month</th>
                                    <th>End Month</th>
                                    <th>Commission(%)</th>
                                    <th>Branch</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody> </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!----------------------------- CARD END  group CREATION TABLE------------------------------>


        <!----------------------------- CARD START  group CREATION FORM------------------------------>
        <div id="group_creation_content" style="display: none;">
            <form id="group_creation" name="group_creation" method="post" enctype="multipart/form-data">
                <input type="hidden" id="groupid">
                <!-- Row start -->
                <div class="row gutters">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                            <div class="card-title">Group Info <span class="text-danger">(If any of these values-Date, Total Month, or Start Month have changed, please fill in the Auction Details.)</span></div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <!-- Fields -->
                                    <div class="col-4 col-sm-4 col-md-4	col-lg-4 col-xl-4">
                                        <div class="form-group">
                                            <label for="group_id">Group ID</label><span class="text-danger">*</span>
                                            <input type="text" class="form-control" id="group_id" name="group_id" readonly placeholder="Enter Group ID" tabindex="1">
                                        </div>
                                    </div>
                                    <div class="col-4 col-sm-4 col-md-4	col-lg-4 col-xl-4">
                                        <div class="form-group">
                                            <label for="chit_value">Chit Value</label><span class="text-danger">*</span>
                                            <input type="text" class="form-control" id="chit_value" name="chit_value" placeholder="Enter Chit Value" tabindex="2">
                                        </div>
                                    </div>
                                    <div class="col-4 col-sm-4 col-md-4	col-lg-4 col-xl-4">
                                        <div class="form-group">
                                            <label for="grp_date">Date</label><span class="text-danger">*</span>
                                            <input type="hidden" id="date_name_edit">
                                            <select class="form-control" id="grp_date" name="grp_date" tabindex="3">
                                                <option value="">Select Date</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-4 col-sm-4 col-md-4	col-lg-4 col-xl-4">
                                        <div class="form-group">
                                            <label for="group_name">Group Name</label><span class="text-danger">*</span>
                                            <input type="text" class="form-control" id="group_name" name="group_name" placeholder="Enter Group Name" tabindex="4">
                                        </div>
                                    </div>
                                    <div class="col-4 col-sm-4 col-md-4	col-lg-4 col-xl-4">
                                        <div class="form-group">
                                            <label for="commission">Commission(%)</label><span class="text-danger">*</span>
                                            <input type="number" class="form-control" id="commission" name="commission" placeholder="Enter Commission" tabindex="5">
                                        </div>
                                    </div>
                                    <div class="col-4 col-sm-4 col-md-4 col-lg-4 col-xl-4">
                                        <div class="form-group">
                                            <label for="hours">Time</label><span class="text-danger">*</span>
                                            <div class="form-row">
                                                <div class="col">
                                                    <input type="number" class="form-control" id="hours" name="hours" min="1" max="12" placeholder="HH" tabindex="6">
                                                </div>
                                                <div class="col-auto">
                                                    <span>:</span>
                                                </div>
                                                <div class="col">
                                                    <input type="number" class="form-control" id="minutes" name="minutes" min="0" max="59" placeholder="MM" tabindex="7">
                                                </div>
                                                <div class="col">
                                                    <select class="form-control" id="ampm" name="ampm" tabindex="8">
                                                        <option value="AM">AM</option>
                                                        <option value="PM">PM</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-4 col-sm-4 col-md-4	col-lg-4 col-xl-4">
                                        <div class="form-group">
                                            <label for="total_members">Total Members</label><span class="text-danger">*</span>
                                            <input type="number" class="form-control" id="total_members" name="total_members" placeholder="Enter Total Members" tabindex="9">
                                        </div>
                                    </div>
                                    <div class="col-4 col-sm-4 col-md-4	col-lg-4 col-xl-4">
                                        <div class="form-group">
                                            <label for="total_month">Total Month</label><span class="text-danger">*</span>
                                            <input type="number" class="form-control" id="total_month" name="total_month" placeholder="Enter Total Month" tabindex="10">
                                        </div>
                                    </div>
                                    <div class="col-4 col-sm-4 col-md-4	col-lg-4 col-xl-4">
                                        <div class="form-group">
                                            <label for="start_month">Start Month</label><span class="text-danger">*</span>
                                            <input type="month" class="form-control" id="start_month" name="start_month" placeholder="Enter Start Month" tabindex="11">
                                        </div>
                                    </div>
                                    <div class="col-4 col-sm-4 col-md-4	col-lg-4 col-xl-4">
                                        <div class="form-group">
                                            <label for="end_month">End Month</label><span class="text-danger">*</span>
                                            <input type="month" class="form-control" id="end_month" name="end_month" placeholder="Enter End Month" tabindex="12" readonly>
                                        </div>
                                    </div>
                                    <div class="col-4 col-sm-4 col-md-4	col-lg-4 col-xl-4">
                                        <div class="form-group">
                                            <label for="branch">Branch</label><span class="text-danger">*</span> 
                                             <input type="hidden" id="branch_name_edit">
                                            <select class="form-control" id="branch" name="branch" tabindex="13">   
                                                <option value="">Select Branch</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-4 col-sm-4 col-md-4	col-lg-4 col-xl-4">
                                        <div class="form-group">
                                            <label for="grace_period">Grace Period(Days)</label><span class="text-danger">*</span>
                                            <input type="text" class="form-control" id="grace_period" name="grace_period" placeholder="Enter Grace Period" tabindex="14">
                                        </div>
                                    </div>
                                    <div class="col-4 col-sm-4 col-md-4	col-lg-2 col-xl-2">
                                        <div class="form-group">
                                            <button type="button" class="btn btn-primary" id="auction_modal_btn" onclick="updateEndMonth()"><span class="icon-add" tabindex="15"></span>&nbsp;Add Auction Details</button>
                                        </div>
                                    </div>
                                    <div class="col-4 col-sm-4 col-md-4	col-lg-2 col-xl-2">
                                        <div class="form-group">
                                            <button type="button" class="btn btn-primary" id="add_cus_map" name="add_cus_map" onclick="getCusMapTable();getJoiningMonth()" tabindex='16'><span class="icon-add"></span>&nbsp;Add Customer Mapping</button>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 mt-3 text-right">
                    <button name="submit_group_info" id="submit_group_info" class="btn btn-primary" tabindex="19"><span class="icon-check"></span>&nbsp;Submit</button>
                    <button type="reset"id="reset_clear" class="btn btn-outline-secondary" tabindex="20">Clear</button>
                </div>
            </form>
        </div>
        <!----------------------------- CARD END  group CREATION FORM------------------------------>

    </div>
</div>
<!--- -------------------------------------- Group Details START ------------------------------- -->
<div class="modal fade" id="add_auction_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-lg " role="document">
        <div class="modal-content" style="background-color: white">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Add Auction Details</h5>
                <button type="button" class="close" data-dismiss="modal" tabindex="1" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <table id="grp_details_table" class="table custom-table">
                                <thead>
                                    <tr>
                                        <th>S.No.</th>
                                        <th>Month</th>
                                        <th>Low Value</th>
                                        <th>High Value</th>
                                    </tr>
                                </thead>
                                <tbody> </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-12 mt-3 text-right">
                        <button name="submit_group_details" id="submit_group_details" class="btn btn-primary" tabindex="19"><span class="icon-check"></span>&nbsp;Submit</button>
                        <button type="reset" id="group_clear"class="btn btn-outline-secondary" tabindex="20">Clear</button>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" data-dismiss="modal" tabindex="5">Close</button>
            </div>
        </div>
    </div>
</div>
<!--- -------------------------------------- Group Details END ------------------------------- -->
<!--- -------------------------------------- Customer Mapping START ------------------------------- -->
<div class="modal fade" id="add_cus_map_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-lg " role="document">
        <div class="modal-content" style="background-color: white">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Add Customer Mapping</h5>
                <button type="button" class="close" data-dismiss="modal" tabindex="1" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form id="mapping_form">
                        <div class="row justify-content-center">
                            <input type="hidden" name="mapping_id" id="mapping_id">
                            <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-12">
                                <div class="form-group">
                                    <label for="cus_name">Customer Name<span class="text-danger">*</span></label>
                                    <select class="form-control" id="cus_name" name="cus_name" tabindex="17">
                                        <option value="">Select Customer</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-12">
                                <div class="form-group">
                                    <label for="joining_month">Auction Start From<span class="text-danger">*</span></label>
                                    <select class="form-control" id="joining_month" name="joining_month" tabindex="18">
                                        <option value="">Select Auction Start From</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xl-2 col-lg-2 col-md-2 col-sm-2 col-12 align-self-end">
                                <div class="form-group">
                                    <input type="button" class="btn btn-primary modalBtnCss" id="submit_cus_map" name="submit_cus_map" value="Add" tabindex="19">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="row">
                    <div class="col-12">
                        <table id="cus_mapping_table" class="table custom-table">
                            <thead>
                                <tr>
                                    <th width="20">S.No.</th>
                                    <th>Customer ID</th>
                                    <th>Name</th>
                                    <th>Place</th>
                                    <th>Occupation</th>
                                    <th>Auction Start</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" data-dismiss="modal" tabindex="5">Close</button>
            </div>
        </div>
    </div>
</div>
<!--- -------------------------------------- Customer Mapping END ------------------------------- -->