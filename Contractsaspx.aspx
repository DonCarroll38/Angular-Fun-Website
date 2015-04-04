<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contractsaspx.aspx.cs" Inherits="SMPlusTestSite.Contractsaspx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contracts</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.28/angular.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.28/angular-route.min.js"></script>
    <script src="scripts/ui-bootstrap-tpls-0.12.1.min.js" type="text/javascript"></script>
    
    <style type="text/css">
        input
        {
             padding-right:2px;
             padding-left:5px;   
        }
        .SectCor
        {
            border-radius:14px;
            background-color:rgb(244,244,242);
            border:1px solid rgb(204,204,204);
        }
        .SectCor_Square_Box
        {
            border-radius:14px;
            background-color:rgb(219, 227, 219);
            border:1px solid rgb(204,204,204);
            box-shadow: 0px 5px 10px 1px rgb(50,50,50);
            color: rgb(75,75,75);
        }
        .ShorterTextBox
        {
            padding-top:0px;
            height:30px;
            background-color:rgb(255, 255, 192);
        }
        .DisabledYellowTextBox
        {
            background-color:RGB(255, 255, 192);
            border-radius:5px;
            left:10px;
            height:30px;
        }
        .LabelPadding
        {
            padding-bottom:0px;
            padding-top:0px;
        }
        .DisaledSpanInsideTextBox
        {
            position:relative;
            top:5px;
        }
        tr
        {
            background-color:rgb(244,247,244);
        }
        td, th
        {
            text-align:center;
        }
        .tabheading
        {
             color:black;
             font-weight: bold;
        }
        .tabSelected
        {
             background-color:rgb(219, 227, 219);
        }
        .GroupBox_Header_Format
        {
            font-size:larger;
            top:-10px;
            position:relative;
            background-color:rgb(219, 227, 219);
        }
        .DisabledData
        {
            background-color:rgb(244,247,244);
            height:50px;
            box-shadow: 0px 1px 2px 1px rgb(213,212,208);
        }
        .GroupBox_Body
        {
            background-color:rgb(219, 227, 219);
            box-shadow: 0px 1px 2px 1px rgb(219, 227, 219);
        }
        body
        {
            background-color:rgb(75,75,75);
        }
        
        .table-hover tbody tr:hover {
        background-color:rgb(255, 255, 192);
        font-weight:700;
        box-shadow: 0px 2px 5px 1px gray;
        }
        
        .table-hover tbody tr:hover {
        background-color:rgb(255, 255, 192);
        font-weight:700;
        color:White;
        }
        
        .table-hover tbody tr:hover > td,
        .table-hover tbody tr:hover > th 
        {
          background-color: rgb(66,139,202);
        }
        .table-hover tbody tr:hover.Secondary
        {
            background-color:red;
            font-weight:normal;
            color:White;
        }
        .tableHeaderRowColor { background-color:rgb(219, 227, 219); }
    </style>
    <script type="text/javascript">

        function TestAlert(ContractDate) {
            alert(ContractDate);
        }
    </script>
</head>
<body data-ng-app="contractsApp">
    <h1 style="color:white;text-align:center;padding-bottom:0px;padding-top:0px;">Contracts</h1>
    <form id="form1" runat="server"  ng-cloak>
        <div data-ng-controller="contractsController">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
                    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                    <div class="SectCor_Square_Box col-lg-3 col-md-3 col-sm-3 col-xs-3" >
                        <table class="table table-condensed table-hover table-responsive">
                            <thead>
                                <tr class="tableHeaderRowColor">
                                    <th data-ng-click="contract.doSort('Contract')">Goodman Contract</th>
                                    <th data-ng-click="contract.doSort('ContractDate')">Contract Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!--<tr data-ng-repeat="cont in contract.data | filter:people:strict | orderBy:sortBy:reverse">-->
                                <tr data-ng-repeat="cont in contract.data | orderBy: contract.sortBy: reverse"                                  
                                    ng-click="current.getCurrentContract(cont.InternalContract)">
                                    <td> {{ cont.Contract }} </td>
                                    <td> {{ cont.ContractDateString }} </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9" style="padding-left:50px;padding-right:0px;"><br />
                        <div class="container-fluid">
                            <div class="row">
                                <div class="SectCor_Square_Box col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label style="font-size:small;">&nbsp;</label>
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <label for="GoodmanContract" class="LabelPadding">Contract:</label>
                                                    <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="GoodmanContract" value="{{current.contract.Contract}}" disabled>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <label for="InternalContract" class="LabelPadding">Internal Contract:</label>
                                                    <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="InternalContract" value="{{current.contract.InternalContract}}" disabled>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <label for="RefNum" class="LabelPadding">Reference #:</label>
                                                    <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="RefNum" value="{{current.contract.RefNum}}" disabled>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <label for="ContractDateString" class="LabelPadding">Contract Date:</label>                                                                        
                                                    <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="ContractDateString" value="{{current.contract.ContractDateString}}" disabled>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <label for="PONum" class="LabelPadding">Customer PO:</label>
                                                    <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="PONum" value="{{current.contract.PONum}}" disabled>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <label for="Status" class="LabelPadding">Status:</label>
                                                    <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="Status" value="{{current.contract.Status}}" disabled>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-5 col-md-5 col-sm-4 col-xs-12">
                                                    <label for="PartnerName" class="LabelPadding">Purchased By:</label>
                                                    <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;padding-top:0px;" id="PartnerName" value="{{current.contract.PartnerName}}" disabled>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-0 col-xs-0"></div>
                                                <div class="col-lg-4 col-md-4 col-sm-8 col-xs-12">
                                                    <label for="BillStatus" class="LabelPadding">Bill Status:</label>
                                                    <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;padding-top:0px;" id="BillStatus" value="{{current.contract.BillStatus}}" disabled>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <label for="DealerName" class="LabelPadding">Dealer Name:</label>
                                                    <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="DealerName" value="{{current.contract.DealerName}}" disabled>
                                                </div>
                                                <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">
                                                    <label for="DealerNum" class="LabelPadding">Dealer CustNum:</label>
                                                    <input type="text" class="form-control text-right" style="background-color:RGB(255, 255, 192);height:30px;" id="DealerNum" value="{{current.contract.DealerNum}}" disabled>
                                                </div>
                                                <div class="col-lg-2 col-md-2 col-sm-0 col-xs-0"></div>
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <label for="DealerSeq" class="LabelPadding">Dealer CustSeq:</label>
                                                    <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="DealerSeq" value="{{current.contract.DealerSeq}}" disabled>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <label for="DistributorName" class="LabelPadding">Dist Name:</label>
                                                    <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="DistributorName" value="{{current.contract.DistributorName}}" disabled>
                                                </div>
                                                <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">
                                                    <label for="DistNum" class="LabelPadding">Dist CustNum:</label>
                                                    <input type="text" class="form-control text-right" style="background-color:RGB(255, 255, 192);height:30px;" id="DistNum" value="{{current.contract.DistNum}}" disabled>
                                                </div>
                                                <div class="col-lg-2 col-md-2 col-sm-0 col-xs-0"></div>
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <label for="DistSeq" class="LabelPadding">Dist CustSeq:</label>
                                                    <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="DistSeq" value="{{current.contract.DistSeq}}" disabled>
                                                </div>
                                            </div>
                                            <!-- -->
                                            <div class="row" style="height:17px;"></div>
                                            <div class="row">
                                                <div class="SectCor GroupBox_Body col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <label class="GroupBox_Header_Format">&nbsp;Contract Printing&nbsp;</label>
                                                    <div class="container-fluid">
                                                        <div class="row">
                                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                                <label for="Manufacturer" class="LabelPadding">Mfg For Contract:</label>
                                                            </div>
                                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                                                <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="Manufacturer" value="{{current.contract.Manufacturer}}" disabled>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <label class="checkbox-inline input-lg"><input type="checkbox" data-size="mini" data-ng-model="current.contract.AsurecareCorp" checked data-on-text="Yes" data-off-text="No" data-switch-value="primary" />&nbsp;&nbsp;Asurecare Corp</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                                                    <div class="SectCor GroupBox_Body col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <label class="GroupBox_Header_Format">&nbsp;Pricing&nbsp;</label>
                                                        <div class="container-fluid">
                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                                    <label for="DerTotalDistributorCost">Total Dist Cost:</label>
                                                                </div>
                                                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                                    <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;padding-right:2px;padding-left:5px;" id="DerTotalDistributorCost" value="{{current.contract.DerTotalDistributorCost | currency}}" disabled>
                                                                </div>
                                                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                                    <label for="DerTotalDealerCost">Total Dealer Cost:</label>
                                                                </div>
                                                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                                    <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;padding-right:2px;padding-left:5px;" id="DerTotalDealerCost" value="{{current.contract.DerTotalDealerCost | currency}}" disabled>
                                                                </div>
                                                            </div>
                                                            <!-- -->
                                                            <div class="row" style="height:7px;"></div>
                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
                                                                    <label for="DerTotalManufacturerCost">Total Mfg Cost:</label>
                                                                </div>
                                                                <div class="col-lg-3 col-md-3 col-sm-8 col-xs-12">
                                                                    <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;padding-right:2px;padding-left:5px;" id="DerTotalManufacturerCost" value="{{current.contract.DerTotalManufacturerCost | currency}}" disabled>
                                                                </div>
                                                                <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
                                                                    <label for="DerTotalHomeownerCost">Total Homeowner Cost:</label>
                                                                </div>
                                                                <div class="col-lg-3 col-md-3 col-sm-8 col-xs-12">
                                                                    <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;padding-right:2px;padding-left:5px;" id="DerTotalHomeownerCost" value="{{current.contract.DerTotalHomeownerCost | currency}}" disabled>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--Button Div-->
                                            <br />
                                            <div class="row" style="height:20px;border-top: 1px solid rgb(204,204,204);"></div>
                                            <div class="row">
                                                <div class="col-lg-8 col-md-7 col-sm-0 col-xs-0"></div>
                                                <div class="col-lg-3 col-md-4 col-sm-12 col-xs-12">
                                                    <div style="background-color:rgb(66,139,202);height:37px;padding:0px 0px 0px 0px;border-radius:5px;color:White;text-align:center;">
                                                        <label style="font-weight:bold;top:7px;position:relative;text-align:center;" class="checkbox-inline"><div><input id="switch-size" type="checkbox" name="my-checkbox" data-size="mini" data-on-text="Yes" data-off-text="No" data-switch-value="primary" data-ng-model="current.contract.Reviewed" />&nbsp;&nbsp;Reviewed</div></label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-1 col-md-1 col-sm-0 col-xs-0"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br /><br />
                            <div class="row">
                                <div class="SectCor_Square_Box col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <tabset style="border-bottom:black;" type="pills">
                                        <tab class="tabheading" heading="Lines">
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="row" style="height:7px;"></div>
                                                        <table class="table table-condensed table-hover table-responsive">
                                                            <thead>
                                                                <tr class="tableHeaderRowColor">
                                                                    <!--
                                                                    <th data-ng-click="lines.doSort('HistInstallDate')">Install Date</th>
                                                                    <th data-ng-click="lines.doSort('SerNum')">Serial</th>
                                                                    <th data-ng-click="lines.doSort('Item')">Model</th>
                                                                    <th data-ng-click="lines.doSort('PlanNum')">Plan Number</th>
                                                                    <th data-ng-click="lines.doSort('PlanDescription')">Plan Desc</th>
                                                                    <th data-ng-click="lines.doSort('PlanTransferable')">Plan Transferable</th>
                                                                    <th data-ng-click="lines.doSort('DistPrice')">Distributor Price</th>
                                                                    <th data-ng-click="lines.doSort('CustPrice')">Dealer/Co-Dist Price</th>
                                                                    <th data-ng-click="lines.doSort('HomeownerPrice')">Homeowner Price</th>
                                                                    <th data-ng-click="lines.doSort('MfgCost')">Manufacturer Cost</th>
                                                                    -->
                                                                    <th>Install Date</th>
                                                                    <th>Serial</th>
                                                                    <th>Model</th>
                                                                    <th>Plan Number</th>
                                                                    <th>Plan Desc</th>
                                                                    <th>Plan Transferable</th>
                                                                    <th>Distributor Price</th>
                                                                    <th>Dealer/Co-Dist Price</th>
                                                                    <th>Homeowner Price</th>
                                                                    <th>Manufacturer Cost</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr data-ng-repeat="cont in current.lines | filter: $cont.ParentPlanNum:"": strict | orderBy: contract.sortBy: reverse" class="Secondary">
                                                                    <td id="">&nbsp{{cont.HistInstallDateString}}&nbsp;</td>
                                                                    <td id="">&nbsp{{cont.SerNum}}&nbsp;</td>
                                                                    <td id="">&nbsp{{cont.Item}}&nbsp;</td>
                                                                    <td id="">&nbsp{{cont.PlanNum}}&nbsp;</td>
                                                                    <td id="">&nbsp{{cont.PlanDescription}}&nbsp;</td>
                                                                    <td id="">&nbsp{{cont.PlanTransferable}}&nbsp;</td>
                                                                    <td id="">&nbsp{{cont.DistPrice | currency}}&nbsp;</td>
                                                                    <td id="">&nbsp{{cont.CustPrice | currency}}&nbsp;</td>
                                                                    <td id="">&nbsp{{cont.HomeownerPrice | currency}}&nbsp;</td>
                                                                    <td id="">&nbsp{{cont.MfgCost | currency}}&nbsp;</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </tab>
                                        <tab class="tabheading" heading="Consumer">
                                            <br />
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
                                                    <div class="SectCor GroupBox_Body col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                                        <div class="container-fluid">
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                    <label class="GroupBox_Header_Format">&nbsp;Homeowner&nbsp;</label>
                                                                    <br />
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                                    <label style="font-size:larger;" for="DerHistHomeownerFirstName" class="LabelPadding">First Name:</label>
                                                                    <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="DerHistHomeownerFirstName" value="{{current.contract.DerHistHomeownerFirstName}}" disabled>
                                                                </div>
                                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                                    <label style="font-size:larger;" for="DerHistHomeownerLastName" class="LabelPadding">Last Name:</label>
                                                                    <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="DerHistHomeownerLastName" value="{{current.contract.DerHistHomeownerLastName}}" disabled>
                                                                </div>
                                                            </div>
                                                            <div class="row" style="height:7px;"></div>
                                                            <div class="row">
                                                                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                                                    <label style="font-size:larger;" for="DerHistHomeownerName" class="LabelPadding">Name:</label>
                                                                </div>
                                                                <div class="col-lg-11 col-md-11 col-sm-11 col-xs-11" style="padding-left:20px;">
                                                                    <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="DerHistHomeownerName" value="{{current.contract.DerHistHomeownerName}}" disabled>
                                                                </div>
                                                            </div>
                                                            <div class="row" style="height:7px;"></div>
                                                            <div class="row">
                                                                <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12" style="padding-right:0px;">
                                                                    <label style="font-size:larger;" for="DerHistHomeownerAddr1" class="LabelPadding">Address:</label>
                                                                </div>
                                                                <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12" style="padding-left:0px;">
                                                                    <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="DerHistHomeownerAddr1" value="{{current.contract.DerHistHomeownerAddr1}}" disabled>
                                                                </div>
                                                            </div>
                                                            <div class="row" style="height:7px;"></div>
                                                            <div class="row">
                                                                <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                                                    &nbsp;
                                                                </div>
                                                                <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12" style="padding-left:0px;">
                                                                    <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="DerHistHomeownerAddr2" value="{{current.contract.DerHistHomeownerAddr2}}" disabled><!--This is for Address2 -->
                                                                </div>
                                                            </div>
                                                            <div class="row" style="height:7px;"></div>
                                                            <div class="row">
                                                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                                    <label style="font-size:larger;" for="DerHistHomeownerCity" class="LabelPadding">City:</label>
                                                                    <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="DerHistHomeownerCity" value="{{current.contract.DerHistHomeownerCity}}" disabled>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                                    <label style="font-size:larger;" for="DerHistHomeownerState" class="LabelPadding">State:</label>
                                                                    <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="DerHistHomeownerState" value="{{current.contract.DerHistHomeownerState}}" disabled>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                                    <label style="font-size:larger;" for="DerHistHomeownerZip" class="LabelPadding">Zip:</label>
                                                                    <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="DerHistHomeownerZip" value="{{current.contract.DerHistHomeownerZip}}" disabled>
                                                                </div>
                                                            </div>
                                                            <div class="row" style="height:7px;"></div>
                                                            <div class="row">
                                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                                    <label style="font-size:larger;" for="DerHistHomeownerPhone">Phone:</label>
                                                                    <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="DerHistHomeownerPhone" value="{{current.contract.DerHistHomeownerPhone}}" disabled>
                                                                </div>
                                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                                    <label style="font-size:larger;" for="DerHistHomeownerCountry">Country:</label>
                                                                    <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="DerHistHomeownerCountry" value="{{current.contract.DerHistHomeownerCountry}}" disabled>
                                                                </div>
                                                            </div>
                                                            <br />
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
                                                </div>
                                                <div class="row">&nbsp;</div>
                                            </div>
                                        </tab>
                                        <tab class="tabheading" heading="Distributor/Dealer">
                                            <br />
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
                                                    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                                        <div class="SectCor GroupBox_Body col-lg-5 col-md-5 col-sm-10 col-xs-10">
                                                            <div class="container-fluid">
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                        <label class="GroupBox_Header_Format">&nbsp;Dealer&nbsp;</label>
                                                                        <br />
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                        <label for="DealName" style="font-size:larger;" for="DealerName" class="LabelPadding">Name:</label>
                                                                        <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="DealerName" value="{{current.contract.DealerName}}" disabled>
                                                                    </div>
                                                                </div>
                                                                <div class="row" style="height:7px;"></div>
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                        <label for="DealerAddr1" style="font-size:larger;" class="LabelPadding">Address:</label>
                                                                        <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="DealerAddr1" value="{{current.contract.DealerAddr1}}" disabled>
                                                                    </div>
                                                                </div>
                                                                <div class="row" style="height:7px;"></div>
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                        <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="DealerAddr2" value="{{current.contract.DealerAddr2}}" disabled><!--Address2-->
                                                                    </div>
                                                                </div>
                                                                <div class="row" style="height:7px;"></div>
                                                                <div class="row">
                                                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" style="padding-right:2px;">
                                                                        <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="DealerCity" value="{{current.contract.DealerCity}}" disabled>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" style="padding-left:2px;padding-right:2px;">
                                                                        <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="DealerState" value="{{current.contract.DealerState}}" disabled>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" style="padding-left:2px;">
                                                                        <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="DealerZip" value="{{current.contract.DealerZip}}" disabled>
                                                                    </div>
                                                                </div>
                                                                <div class="row" style="height:7px;"></div>
                                                                <div class="row">
                                                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12" style="padding-right:0px;">
                                                                        <label style="font-size:larger;" for="DealerTelexNum">Phone:</label>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" style="padding-right:3px;">
                                                                        <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="DealerTelexNum" value="{{current.contract.DealerTelexNum}}" disabled>
                                                                    </div>
                                                                    <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12" style="padding-left:3px;">
                                                                        <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="DealerCountry" value="{{current.contract.DealerCountry}}" disabled>
                                                                    </div>
                                                                </div>
                                                                <br />
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
                                                        <div class="SectCor GroupBox_Body col-lg-5 col-md-5 col-sm-10 col-xs-10">
                                                            <div class="container-fluid">
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                        <label class="GroupBox_Header_Format">&nbsp;Distributor&nbsp;</label>
                                                                        <br />
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                        <label for="DistributorName" style="font-size:larger;" class="LabelPadding">Name:</label>
                                                                        <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="DistributorName" value="{{current.contract.DistributorName}}" disabled>
                                                                    </div>
                                                                </div>
                                                                <div class="row" style="height:7px;"></div>
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                        <label for="DistributorAddr1" style="font-size:larger;" class="LabelPadding">Address:</label>
                                                                        <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="DistributorAddr1" value="{{current.contract.DistributorAddr1}}" disabled>
                                                                    </div>
                                                                </div>
                                                                <div class="row" style="height:7px;"></div>
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" class="LabelPadding">
                                                                        <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="DistributorAddr2" value="{{current.contract.DistributorAddr2}}" disabled><!--Address2-->
                                                                    </div>
                                                                </div>
                                                                <div class="row" style="height:7px;"></div>
                                                                <div class="row">
                                                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" style="padding-right:2px;">
                                                                        <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="DistributorCity" value="{{current.contract.DistributorCity}}" disabled>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" style="padding-left:2px;padding-right:2px;">
                                                                        <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="DistributorState" value="{{current.contract.DistributorState}}" disabled>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" style="padding-left:2px;">
                                                                        <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="DistributorZip" value="{{current.contract.DistributorZip}}" disabled>
                                                                    </div>
                                                                </div>
                                                                <div class="row" style="height:7px;"></div>
                                                                <div class="row">
                                                                    <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12" style="padding-right:0px;">
                                                                        <label style="font-size:larger;" for="DistributorTelexNum">Phone:</label>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" style="padding-right:3px;">
                                                                        <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="DistributorTelexNum" value="{{current.contract.DistributorTelexNum}}" disabled>
                                                                    </div>
                                                                    <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12" style="padding-left:3px;">
                                                                        <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="DistributorCountry" value="{{current.contract.DistributorCountry}}" disabled>
                                                                    </div>
                                                                </div>
                                                                <br />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
                                                    <br />
                                                </div>
                                                <div class="row">&nbsp;</div>
                                            </div>
                                        </tab>
                                        <tab class="tabheading" heading="Child Plans">
                                            <div></div>
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <table class="table table-condensed table-hover table-responsive">
                                                            <thead>
                                                                <tr class="tableHeaderRowColor">
                                                                    <th>Install Date</th>
                                                                    <th>Serial</th>
                                                                    <th>Model</th>
                                                                    <th>Parent Plan</th>
                                                                    <th>Child Plan</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                        <!--<tr data-ng-repeat="cont in contract.data | filter:people:strict | orderBy:sortBy:reverse">-->
                                                                <tr data-ng-repeat="cont in current.childplans | filter: $cont.ParentPlanNum:'': strict | orderBy: contract.sortBy: reverse" class="Secondary">
                                                                    <td id="Td1">&nbsp{{cont.HistInstallDateString}}&nbsp;</td>
                                                                    <td id="Td2">&nbsp{{cont.SerNum}}&nbsp;</td>
                                                                    <td id="Td3">&nbsp{{cont.Item}}&nbsp;</td>
                                                                    <td id="Td5">&nbsp{{cont.ParentPlanNum}}&nbsp;</td>
                                                                    <td id="Td4">&nbsp{{cont.PlanNum}}&nbsp;</td>   
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </tab>
                                        <tab class="tabheading" heading="Billing">
                                            <br />
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
                                                    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                                        <div class="container-fluid">
                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                                                    <label style="font-size:larger;" for="InvoiceDate">Invoice Date:</label>
                                                                </div>
                                                                <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                                                    <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="InvoiceDate" value="{{current.contract.InvoiceDateString}}" disabled>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></div>
                                                            </div>
                                                            <div class="row" style="height:7px;"></div>
                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                                                    <label style="font-size:larger;" for="InvoiceNum">Invoice Num:</label>
                                                                </div>
                                                                <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                                                    <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="InvoiceNum" value="{{current.contract.InvoiceNum}}" disabled>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></div>
                                                            </div>
                                                            <div class="row" style="height:7px;"></div>
                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                                                    <label style="font-size:larger;" for="InvoiceSeq">Invoice Sequence:</label>
                                                                </div>
                                                                <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                                                    <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="InvoiceSeq" value="{{current.contract.InvoiceSeq}}" disabled>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></div>
                                                            </div>
                                                            <div class="row" style="height:7px;"></div>
                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                                                    <label style="font-size:larger;" for="InvoiceCo">Invoice Company:</label>
                                                                </div>
                                                                <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                                                                    <input type="text" class="form-control" style="background-color:RGB(255, 255, 192);height:30px;" id="InvoiceCo" value="{{current.contract.InvoiceCo}}" disabled>
                                                                </div>
                                                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
                                                    <br />
                                                </div>
                                                <div class="row">&nbsp;</div>
                                            </div>
                                        </tab>
                                        <tab class="tabheading" heading="Attachments">
                                            <div></div>
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <table class="table table-condensed table-hover table-responsive">
                                                            <thead>
                                                                <tr class="tableHeaderRowColor">
                                                                    <th>Contract</th>
                                                                    <th>File ID</th>
                                                                    <th>File Name</th>
                                                                    <th>File Extension</th>
                                                                    <th>Record Date</th>
                                                                    <th>Created By</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                        <!--<tr data-ng-repeat="cont in contract.data | filter:people:strict | orderBy:sortBy:reverse">-->
                                                                <tr data-ng-repeat="cont in current.Attachments | orderBy: cont.RecordDateString: reverse" class="Secondary">
                                                                    <td id="Td10">&nbsp{{cont.Contract}}&nbsp;</td>
                                                                    <td id="Td11">&nbsp{{cont.FileID}}&nbsp;</td>
                                                                    <td id="Td12">&nbsp{{cont.FileName}}&nbsp;</td>
                                                                    <td id="Td13">&nbsp{{cont.FileExtension}}&nbsp;</td>
                                                                    <td id="Td14">&nbsp{{cont.RecordDateString}}&nbsp;</td>
                                                                    <td id="Td15">&nbsp{{cont.CreatedBy}}&nbsp;</td>   
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </tab>
                                    </tabset>
                                </div>
                            </div>
                            <br /><br />
                            <div class="row">
                                <div class="SectCor_Square_Box col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <table class="table table-condensed table-hover table-responsive">
                                        <thead>
                                            <tr class="tableHeaderRowColor">
                                                <th>Contract</th>
                                                <th>Contract Review ID</th>
                                                <th>Description</th>
                                                <th>Reviewed</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                    <!--<tr data-ng-repeat="cont in ContractReviewData.data | filter:people:strict | orderBy:sortBy:reverse">-->
                                            <tr data-ng-repeat="cont in current.contractreview | orderBy: contract.sortBy: reverse" class="Secondary">
                                                <td id="Td6">&nbsp{{cont.Contract}}&nbsp;</td>
                                                <td id="Td7">&nbsp{{cont.ContractReviewId}}&nbsp;</td>
                                                <td id="Td9">&nbsp{{cont.Description}}&nbsp;</td>
                                                <td id="Td8"><div><input  type="checkbox" name="my-checkbox" ng-model="cont.Reviewed" checked data-size="mini" data-on-text="Yes" data-off-text="No" data-switch-value="primary" /></div></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <br /><br />
                        </div>
			        </div>
                    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
                    </div>
                </div>
            </div>
        </div>
        <br >/
        <br /><br />
        <script src="scripts/app.js" type="text/javascript"></script>
        <script src="controller/contractsControllers.js" type="text/javascript"></script>
        <script src="AngularServices/Contracts.js" type="text/javascript"></script>
        <script src="scripts/War_Contracts_WCF_Services.js" type="text/javascript"></script>
    </form>
</body>
</html>

