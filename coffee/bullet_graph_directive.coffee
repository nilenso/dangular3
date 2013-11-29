angular.module("App").directive "d3BulletGraph", ->
  restrict: "E"
  scope:
    data: "="

  link: (scope, element, attrs) ->
    margin = {top: 2, right: 10, bottom: 20, left: 5}

    width = (parseInt(attrs.width) || 960) - margin.left - margin.right
    height = (parseInt(attrs.height) || 500)

    chart = d3.bullet().width(width).height(height)

    svg = d3.select(element[0]).selectAll("svg").data(scope.data).enter().append("svg")
          .attr("class", "bullet").attr("width", width + margin.left + margin.right)
          .attr("height", height + margin.top + margin.bottom).append("g")
          .attr("transform", "translate(" + margin.left + "," + margin.top + ")").call(chart)
