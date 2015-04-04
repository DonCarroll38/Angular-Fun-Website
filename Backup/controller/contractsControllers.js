//Option 1
/*app.controller('CustomersController', function ($scope) {
$scope.sortBy = 'name';
$scope.reverse = false;

$scope.customers = [
{ id: 1, name: 'John Smith', city: 'Phoenix' },
{ id: 2, name: 'John Doe', city: 'New York' },
{ id: 3, name: 'Jane Doe', city: 'San Francisco' },
{ id: 4, name: 'Dave Jones', city: 'Phoenix' },
{ id: 5, name: 'Jamie Riley', city: 'Atlanta' },
{ id: 6, name: 'Heedy Wahlin', city: 'Chandler' },
{ id: 7, name: 'Thomas Winter', city: 'Seattle' },
{ id: 8, name: 'Don Carroll', city: 'Houston' },
{ id: 9, name: 'Israr Ahmad', city: 'Houston' },
{ id: 10, name: 'Jessmon', city: 'Houston' },
{ id: 11, name: 'Ying', city: 'Houston' },
{ id: 12, name: 'Kai Inthapanya', city: 'Houston' },
{ id: 13, name: 'Michael Smith', city: 'San Francisco' },
{ id: 14, name: 'Akash Parajuli', city: 'Houston' }
];

$scope.doSort = function (propName) {
$scope.sortBy = propName;
$scope.reverse = !$scope.reverse;
};
}); */

//Option 2
/*(function() {
angular.module('customersApp')
.controller('CustomersController', function ($scope) {
$scope.sortBy = 'name';
$scope.reverse = false;

$scope.customers = [
{ id: 1, name: 'John Smith', city: 'Phoenix' },
{ id: 2, name: 'John Doe', city: 'New York' },
{ id: 3, name: 'Jane Doe', city: 'San Francisco' },
{ id: 4, name: 'Dave Jones', city: 'Phoenix' },
{ id: 5, name: 'Jamie Riley', city: 'Atlanta' },
{ id: 6, name: 'Heedy Wahlin', city: 'Chandler' },
{ id: 7, name: 'Thomas Winter', city: 'Seattle' },
{ id: 8, name: 'Don Carroll', city: 'Houston' },
{ id: 9, name: 'Israr Ahmad', city: 'Houston' },
{ id: 10, name: 'Jessmon', city: 'Houston' },
{ id: 11, name: 'Ying', city: 'Houston' },

{ id: 12, name: 'Kai Inthapanya', city: 'Houston' },
{ id: 13, name: 'Michael Smith', city: 'San Francisco' },
{ id: 14, name: 'Akash Parajuli', city: 'Houston' }
];

$scope.doSort = function (propName) {
$scope.sortBy = propName;
$scope.reverse = !$scope.reverse;
};
});
}()); */



//Option 3
(function () {
    var contractsController = function ($scope, contractFactory) {
        //        $scope.sortBy = 'name';
        //        $scope.reverse = false;

        $scope.contracts = [];

        function init() {
            $scope.contracts = contractFactory.getContracts();
            //$scope.contracts = SearchContractsAndGetJSONData2();
            //SearchContractsAndGetJSONData();
            console.log("Contracts Controller Object: " + $scope.contracts)
        }

        init();

        $scope.current = {
            getCurrentContract: getCurrentContract,
            contract: null,
            lines: null,
            childplans: null,
            contractreview: null,
            Attachments: null
        }

        $scope.contract = {
            sortBy: 'Contract',
            reverse: false,
            data: $scope.contracts,
            doSort: doSort
        };

        function doSort(propName) {
            $scope.sortBy = propName;
            $scope.reverse = !$scope.reverse;
        }

        function getCurrentContract(id) {
            for (var i = 0; i < $scope.contract.data.length; i++) {
                if ($scope.contract.data[i].InternalContract === id) {
                    $scope.current.contract = $scope.contract.data[i];
                    $scope.current.lines = $scope.contract.data[i].LineData;
                    $scope.current.childplans = $scope.contract.data[i].LineData;
                    $scope.current.contractreview = $scope.contract.data[i].ContractReviewData;
                    $scope.current.Attachments = $scope.contract.data[i].SearchResultAttachments;
                    return;
                }
            }
        }
    };

    //ContractsController.$inject = ['$scope', 'contractFactory'];

    angular.module('contractsApp')
        .controller('contractsController', contractsController);

} ());

