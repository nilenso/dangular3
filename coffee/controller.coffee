window.app = angular.module('App', []);
angular.module('App').controller 'DemoController', ($scope) ->
  $scope.multilineGraphData = [
                                    {date: "2012-04-19", line1: 587.44, line2: 527.44}
                                    {date: "2012-04-20", line1: 572.98, line2: 522.98},
                                    {date: "2012-04-23", line1: 571.70, line2: 521.70},
                                    {date: "2012-04-24", line1: 560.28, line2: 520.28},
                                    {date: "2012-04-25", line1: 610.00, line2: 620.00},
                                    {date: "2012-04-26", line1: 607.70, line2: 627.70},
                                    {date: "2012-04-27", line1: 603.00, line2: 623.00},
                                    {date: "2012-04-30", line1: 583.98, line2: 523.98},
                                    {date: "2012-05-01", line1: 800.13, line2: 522.13},
                                  ]
  $scope.lineGraphData = [
                          {date: "2012-04-19", myData: 87.44}
                          {date: "2012-04-20", myData: 72.98},
                          {date: "2012-04-23", myData: 71.70},
                          {date: "2012-04-24", myData: 60.28},
                          {date: "2012-04-25", myData: 10.00},
                          {date: "2012-04-26", myData: 7.70},
                          {date: "2012-04-27", myData: 3.00},
                          {date: "2012-04-30", myData: 83.98},
                          {date: "2012-05-01", myData: 82.13},
                        ]

  $scope.barGraphData = [
                          {date: "2012-04-19", value: 10}
                          {date: "2012-04-20", value: 8},
                          {date: "2012-04-23", value: 2},
                          {date: "2012-04-24", value: 1},
                          {date: "2012-04-25", value: -2},
                          {date: "2012-04-26", value: 1},
                          {date: "2012-04-27", value: -4},
                          {date: "2012-04-30", value: 1},
                          {date: "2012-05-01", value: 4},
                        ]

  $scope.bulletGraphData = [{"ranges":[30, 70, 100],"measures":[40, 80],"markers":[90]}]
