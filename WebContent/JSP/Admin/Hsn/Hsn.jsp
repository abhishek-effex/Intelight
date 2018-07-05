<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>HSN</title>
    <link rel="shortcut icon" href="../../../img/TitleImage.png">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="../../../css/bootstrap.min.css">
    <!-- Material Design Bootstrap -->
    <link rel="stylesheet" href="../../../css/mdb.css">
    <!-- DataTables.net -->
    <link rel="stylesheet" type="text/css" href="../../../js/vendor/datatables/css/dataTables.bootstrap4.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.4.0/css/buttons.dataTables.min.css" />
    <link rel="stylesheet" href="../../../css/style.css">
    
 
    <!-- Your custom styles (optional) -->
    <style>
		.companyLogo{
			width: 100pt;
			margin-left:5px;
			}
		td input {
			width: 80%;
		}
		#headerrow th, #filterrow th{
		text-align: center;
		}
		*{
			font-family: 'Montserrat', sans-serif;
		}
		.dataTables_filter {
		display: none; 
		}
		.delete{
            width: 80pt;
        }
        .HideThisElement{
  			display: none
		}
        $('.datepicker').pickadate({
  			editable: true
		})
    </style>
    
    <style type="text/css">
    	.form-simple .font-small {
		  font-size: 0.8rem; }
		
		.form-simple .header {
		  border-top-left-radius: .3rem;
		  border-top-right-radius: .3rem; }
		
		.form-simple input[type=text]:focus:not([readonly]) {
		  border-bottom: 1px solid #ff3547;
		  -webkit-box-shadow: 0 1px 0 0 #ff3547;
		  box-shadow: 0 1px 0 0 #ff3547; }
		
		.form-simple input[type=text]:focus:not([readonly]) + label {
		  color: #4f4f4f; }
		
		.form-simple input[type=password]:focus:not([readonly]) {
		  border-bottom: 1px solid #ff3547;
		  -webkit-box-shadow: 0 1px 0 0 #ff3547;
		  box-shadow: 0 1px 0 0 #ff3547; }
		
		.form-simple input[type=password]:focus:not([readonly]) + label {
		  color: #4f4f4f; }
		 
		.col-centered{
		    float: none;
		    margin: 0 auto;
		}
    </style>
</head>
<body class="fixed-sn white-skin">
<%@ include file="../../../Header.jsp" %>
    <main>
        <div class="container-fluid mb-5">
            <section>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                            <div class="DataTable" >
                                <table id="datatables" class="table table-striped table-bordered nowrap" cellspacing="0" width="100%">
                                    <thead>
                                        <tr id="headerrow">
                                            <th>Action</th>
	  										<th>HSN ID</th>
	  										<th>SGST</th>
	  										<th>CGST</th>
	  										<th>IGST</th>
                                        </tr>
                                        <tr id="filterrow">
	  										<td></td>
										  	<th>HSN ID</th>
										  	<th>SGST</th>
										  	<th>CGST</th>
										  	<th>IGST</th>
										</tr>
                                    </thead>
                                </table>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </main>
    
<div class="modal fade" id="RegisterNewClient" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg cascading-modal" role="document" style="margin-top: 35px;">
                        <div class="modal-content">
                            <div class="modal-header light-blue darken-3 white-text">
                                <h5 class="" id="NewElement-modal-title">Register Client</h5>
                                <button type="button" class="close waves-effect waves-light" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body mb-0">
                               <form action="" id="newClientForm" name="newClientForm">
                               <div class="alert alert-warning HideThisElement" id="alertMessage" style="background-color: #ffbb33"></div>
							   <div class="alert alert-danger HideThisElement" id="errorMessage"></div>
                               <input type="hidden" name="selectedHsnRowId" id="selectedHsnRowId" >
                                <div class="row">
                                    <div class="col-md-6 col-centered">
                                        <div class="md-form">
                                            <input type="text" class="form-control" id="hsnId" name="hsnId" style="text-transform: uppercase">
                                            <label id="hsnIdLbl" for="hsnId" class="">HSN ID</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="md-form">
                                            <input type="number" step="0.01" class="form-control" id="sgst" name="sgst">
                                            <label id="sgstLbl" for="sgst" class="">SGST (In %)</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="md-form">
                                            <input type="number" step="0.01" class="form-control" id="cgst" name="cgst">
                                            <label id="cgstLbl" for="cgst" class="">CGST (In %)</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                	<div class="col-md-6 col-centered">
                                        <div class="md-form">
                                            <input type="number" step="0.01" class="form-control" id="igst" name="igst">
                                            <label id="igstLbl" for="igst" class="">IGST (In %)</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6 HideThisElement">
                                        <div class="md-form">
                                            <input type="number" step="0.01" class="form-control" id="ugst" name="ugst">
                                            <label id="ugstLbl" for="ugst" class="">UGST (In %)</label>
                                        </div>
                                    </div>
                                </div>
                                
		                        <div class="row">
	                                <div class="text-center mt-1-half">
	                                    <button id="SubmitButtonRegister" class="btn btn-info waves-effect" data-dismiss="modal">Submit</button>
	                                    <button id="SubmitButtonUpdate" class="btn btn-info waves-effect HideThisElement" data-dismiss="modal">Update</button>
	                                    <button class="btn btn-outline-info waves-effect" data-dismiss="modal">Close</button>
	                                </div>
                                </div>
                            </form>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="centralModalDangerDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-notify modal-danger" role="document">
                        <!--Content-->
                        <div class="modal-content">
                            <!--Header-->
                            <div class="modal-header" style="background:#cc4141;">
                                <p class="heading">Delete HSN</p>

                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true" class="white-text">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
								<input type="hidden" id="DeleteEmpId" name="DeleteEmpId">
                                <div class="row">
                                    <div class="col-3">
                                        <p></p>
                                        <p class="text-center"><img class="delete" src="../../../Images/deleteModel.png"></p>
                                    </div>
                                    <div class="col-9">
                                        <br>
                                        <p>HSN details will be deleted from system.</p>
        								<p>Click 'Confirm' to proceed, and 'Close' to cancel.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer justify-content-center">
                                <a type="button" class="btn btn-primary-modal" id="DeleteEmployeeConfirmed" style="background:#cc4141;">Confirm</a>
                                <a type="button" class="btn btn-outline-secondary-modal waves-effect" data-dismiss="modal">Close</a>
                            </div>
                        </div>
                    </div>
                </div>
                
    <script type="text/javascript" src="../../../js/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../../../js/vendor/datatables/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.4.0/js/dataTables.buttons.min.js"></script>
    
    <!-- datatable data javascript -->
    <script type="text/javascript" src="../../../JavaScripts/Hsn/hsn.js"></script>
    <!--Custom scripts-->
    <script>

        $(document).ready(function() {
            $('#datatables').DataTable();
        });

        // Material Select Initialization
        $(document).ready(function () {
            $('select[name="datatables_length"]').material_select();
        });
		
        $(document).ready(function () {
            $('.mdb-select').material_select();
        });
    </script>
</body>
</html>