$(document).ready(function () {
    //Add Group creation & Back.
    $(document).on('click', '#back_btn', function () {
        $('.group_table_content').show();
        $('#back_btn').hide();
        $('#curr_closed').show();
        $('.auction_detail_content').hide();
    });

    $('input[name=customer_data_type]').click(function () {
        let customerType = $(this).val();
        if (customerType == 'cus_profile') {
            $('.group_table_content').show();

        } else if (customerType == 'cus_summary') {
            $('.group_table_content').show();
        }
    })

    $(document).on('click', '#group_current', function () {
          $('.group_table_content').show(); 
          $('.auction_detail_content').hide();
          getGroupCreationTable();
    })
    $(document).on('click', '#group_closed', function () {
        $('.group_table_content').show();
        $('.auction_detail_content').hide();
        getGroupClosedCreationTable();
    })
/////////////////////////////////////////////////Auction List/////////////////////////////////
$(document).on('click', '.customerActionBtn', function (event) {
    event.preventDefault();
    $('.auction_detail_content').show();
    $('#back_btn').show();
    $('.group_table_content').hide();
    $('#curr_closed').hide();
    let group_id = $(this).attr('value');
    auctionList(group_id)

});
///////////////////////////////////////////////////////////////////////////Auction list End//////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////Auction Chart Start////////////////////////////////////////////////////////////
$(document).on('click', '.auction_chart', function (event) {
    event.preventDefault();
    $('#auction_chart_model').modal('show');
    let dataValue = $(this).data('value');
    let dataParts = dataValue.split('_');
    let groupId = dataParts[0];
    getAuctionChart(groupId)
});
//////////////////////////////////////////////////////////////////////Auction chart End/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////settlement chart Start////////////////////////////////
$(document).on('click', '.settle_chart', function (event) {
    event.preventDefault();
    $('#settlement_chart_model').modal('show');
    let dataValue = $(this).data('value');
    let dataParts = dataValue.split('_');
    let groupId = dataParts[0];
    let auction_id = dataParts[1];
    getSettleChart(groupId,auction_id)

});
//////////////////////////////////////////////////////////////////////////////settlement Chart End//////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////Chit Advance Chart///////////////////////////////////
$(document).on('click', '.advance_chart', function (event) {
    event.preventDefault();
    $('#advance_chart_model').modal('show');
    let dataValue = $(this).data('value');
    let dataParts = dataValue.split('_');
    let groupId = dataParts[0];
    let auction_month = dataParts[1];
    getAdvanceChart(groupId,auction_month)

});
////////////////////////////////////////////////////////////Chit advance Chart End////////////////////////////////
////////////////////////////////////////////////////////////////////////////Collection Chart Start//////////////////////////////////////////////////
$(document).on('click', '.collectionActionBtn', function (event) {
    event.preventDefault();
    $('#collection_chart_model').modal('show');
    let value = $(this).data('value'); 
    let values = value.split('_'); 
    let group_id = values[0]; 
    let auction_month = values[1]; 

    collectionList(group_id, auction_month);
    getCollection(group_id,auction_month) ;
});

////////////////////////////////////////////////////////////////////////Collection Chart End/////////////////////////////////////////////////////////////
});
function closeChartsModal() {
    $('#auction_chart_model').modal('hide');
    $('#settlement_chart_model').modal('hide');
    $('#collection_chart_model').modal('hide');
    $('#advance_chart_model').modal('hide');
}
$(function () {
    getGroupCreationTable();
});

function getGroupCreationTable() {
    serverSideTable('#group_creation_table', '', 'api/group_summary_files/group_summary_list.php');
}
function getGroupClosedCreationTable() {
    serverSideTable('#group_creation_table', '', 'api/group_summary_files/group_closed_summary_list.php');
}
function getAuctionChart(groupId) {
    $.ajax({
        url: 'api/group_summary_files/auction_chart_data.php',
        type: 'POST',
        dataType: 'json',
        data: {
            group_id: groupId,
        },
        success: function (response) {
            var tbody = $('#auction_chart_table tbody');
            tbody.empty(); // Clear existing rows

            var hasRows = false;

            $.each(response, function (index, item) {
                var auctionMonth = item.auction_month;
                var auctionDate = item.auction_date;

                // Format the values using moneyFormatIndia
                var chitAmount = item.chit_amount ? moneyFormatIndia(Math.round(item.chit_amount)) : '';
                var auction_value = item.auction_value ? moneyFormatIndia(item.auction_value) : '';
                var commission = item.commission ? moneyFormatIndia(Math.round(item.commission)): ''; // Corrected typo
                var total_value = item.total_value ? moneyFormatIndia(item.total_value) : '';
                
                var row = '<tr>' +
                    '<td>' + auctionMonth + '</td>' +
                    '<td>' + auctionDate + '</td>' +
                    '<td>' + auction_value + '</td>' +
                    '<td>' + commission + '</td>' +
                    '<td>' + total_value + '</td>' +
                    '<td>' + chitAmount + '</td>' +
                    '</tr>';

                tbody.append(row);
                hasRows = true;
            });

            if (!hasRows) {
                tbody.append('<tr><td colspan="7">No data available</td></tr>');
            }
        },
        error: function (xhr, status, error) {
            console.error('AJAX Error: ' + status + error);
        }
    });
}
function getSettleChart(groupId, auction_id) {
    $.ajax({
        url: 'api/group_summary_files/settlement_chart_data.php',
        type: 'POST',
        dataType: 'json',
        data: {
            group_id: groupId,
            auction_id: auction_id,
        },
        success: function (response) {
            var tbody = $('#settle_chart_table tbody');
            tbody.empty(); // Clear existing rows

            var hasRows = false;

            $.each(response, function (index, item) {
                var auctionMonth = item.auction_month || '';
                var group_id = item.group_id || '';
                var group_name = item.grp_name || '';
                var cus_id = item.cus_id || '';
                var cus_name = item.guarantor_name === 'Customer' ? (item.cus_name || '') : (item.guarantor_name || '');
                var settle_date = item.settle_date || '';
                var total_amount = item.balance_amount ? moneyFormatIndia(item.balance_amount) : '';

                var row = '<tr>' +
                    '<td>' + auctionMonth + '</td>' +
                    '<td>' + group_id + '</td>' +
                    '<td>' + group_name + '</td>' +
                    '<td>' + cus_id + '</td>' +
                    '<td>' + cus_name + '</td>' +
                    '<td>' + settle_date + '</td>' +
                    '<td>' + total_amount + '</td>' +
                    '</tr>';

                tbody.append(row);
                hasRows = true;
            });

            if (!hasRows) {
                tbody.append('<tr><td colspan="7">No data available</td></tr>');
            }
        },
        error: function (xhr, status, error) {
            console.error('AJAX Error: ' + status + error);
        }
    });
}
function getAdvanceChart(groupId, auction_month) {
    $.ajax({
        url: 'api/group_summary_files/advance_chart_data.php',
        type: 'POST',
        dataType: 'json',
        data: {
            group_id: groupId,
            auction_id: auction_month,
        },
        success: function (response) {
            var tbody = $('#advance_chart_table tbody');
            tbody.empty(); // Clear existing rows

            var hasRows = false;
            var serialNo = 1; // Initialize serial number

            $.each(response, function (index, item) {
                var auctionMonth = item.auction_month || '';
                var trans_cat = item.trans_cat || '';
                var group_id = item.group_id || '';
                var cus_name = item.cus_name || '';
                var type = item.type || '';
                var bank_namecash = item.bank_namecash || '';
                var ref_id = item.ref_id || '';
                var trans_id = item.trans_id || '';
                var amount = item.amount ? moneyFormatIndia(item.amount) : '';
                var remark = item.remark || '';

                // Create table row with serial number
                var row = '<tr>' +
                    '<td>' + serialNo + '</td>' + // Add serial number
                    '<td>' + trans_cat + '</td>' +
                    '<td>' + group_id + '</td>' +
                    '<td>' + cus_name + '</td>' +
                    '<td>' + type + '</td>' +
                    '<td>' + bank_namecash + '</td>' +
                    '<td>' + ref_id + '</td>' +
                    '<td>' + trans_id + '</td>' +
                    '<td>' + auctionMonth + '</td>' +
                    '<td>' + amount + '</td>' +
                    '<td>' + remark + '</td>' +
                    '</tr>';

                tbody.append(row);
                serialNo++; // Increment serial number for the next row
                hasRows = true;
            });

            if (!hasRows) {
                tbody.append('<tr><td colspan="11">No data available</td></tr>'); // Adjust colspan to match total columns
            }
        },
        error: function (xhr, status, error) {
            console.error('AJAX Error: ' + status + error);
        }
    });
}


function auctionList(group_id) {
    $.ajax({
        url: 'api/group_summary_files/auction_detail_data.php',
        type: 'POST',
        dataType: 'json',
        data: {
            group_id: group_id,
        },
        success: function (response) {
            var tbody = $('#auction_table tbody');
            tbody.empty(); // Clear existing rows

            var hasRows = false;

            $.each(response, function (index, item) {
                var auctionMonth = item.auction_month;
                var auctionDate = item.auction_date;

                // Format the values using moneyFormatIndia
                var cus_name = item.cus_name;
                var auction_status = item.auction_status;
                var grp_status = item.grp_status;
                var collection_status = item.collection_status;
                var action = item.action; // Action button HTML from PHP

                var auction_value = item.auction_value ? moneyFormatIndia(item.auction_value) : '';
                var row = '<tr>' +
                    '<td>' + auctionMonth + '</td>' +
                    '<td>' + auctionDate + '</td>' +
                    '<td>' + auction_value + '</td>' +
                    '<td>' + cus_name + '</td>' +
                    '<td>' + auction_status + '</td>' +
                    '<td>' + grp_status + '</td>' +
                    '<td>' + collection_status + '</td>' +
                    '<td>' + action + '</td>' + // Use the action HTML here
                    '</tr>';

                tbody.append(row);
                hasRows = true;
            });

            if (!hasRows) {
                tbody.append('<tr><td colspan="8">No data available</td></tr>'); // Update colspan to 8
            }
        },
        error: function (xhr, status, error) {
            console.error('AJAX Error: ' + status + error);
        }
    });
}
function collectionList(group_id,auction_month) {
    $.ajax({
        url: 'api/group_summary_files/collection_detail_data.php',
        type: 'POST',
        dataType: 'json',
        data: {
            group_id: group_id,
            auction_month:auction_month,
        },
        success: function (response) {
            var tbody = $('#collect_chart_table tbody');
            tbody.empty(); // Clear existing rows

            var hasRows = false;
            var serialNo = 1; // Initialize the serial number

            $.each(response, function (index, item) {
                var cus_id = item.cus_id;
              
                // Extract the values
                var cus_name = item.cus_name;
                var place = item.place;
                var occupations = item.occupations;
                var mobile1 = item.mobile1;
                var action = item.action; // Action button HTML from PHP
                var settle_status = item.settle_status;
                // Create the row HTML
                var row = '<tr>' +
                    '<td>' + serialNo + '</td>' +  // Use serialNo instead of index
                    '<td>' + cus_id + '</td>' +
                    '<td>' + cus_name + '</td>' +
                    '<td>' + place + '</td>' +
                    '<td>' + occupations + '</td>' +
                    '<td>' + mobile1 + '</td>' +
                    '<td>' + action + '</td>' + 
                    '<td>' + settle_status + '</td>' + 
                    '</tr>';

                tbody.append(row);
                hasRows = true;
                serialNo++; // Increment the serial number
            });

            if (!hasRows) {
                tbody.append('<tr><td colspan="8">No data available</td></tr>'); // Update colspan to 8
            }
        },
        error: function (xhr, status, error) {
            console.error('AJAX Error: ' + status + error);
        }
    });
}
function getCollection(group_id, auction_month) {
    $.post('api/group_summary_files/calculate_balance_data.php', 
        { 
            group_id: group_id, 
            auction_month: auction_month 
        }, 
        function (response) {
            // Ensure response is a valid object
            if (response && response.month_paid !== undefined) {
                // Format the amounts for paid, unpaid, and pending
                let formattedAmount = moneyFormatIndia(response.month_paid); 
                let formattedUnpaid = moneyFormatIndia(response.month_unpaid); 
                let formattedPending = moneyFormatIndia(response.month_pending); 

                // Set formatted values to hidden inputs and displayed text
                $('#month_paid').val(formattedAmount); 
                $('#paidValue').text(formattedAmount); 

                $('#month_unpaid').val(formattedUnpaid); 
                $('#unpaidValue').text(formattedUnpaid); 

                $('#month_pending').val(formattedPending); 
                $('#pendingValue').text(formattedPending); 
            } else {
                // Set default values to 0 if response is not valid
                $('#month_paid').val(0);
                $('#paidValue').text('0'); 

                $('#month_unpaid').val(0);
                $('#unpaidValue').text('0'); 

                $('#month_pending').val(0);
                $('#pendingValue').text('0'); 
            }
        }, 
        'json'
    );
}