angular.module("App").directive "d3BarGraph", ->
  restrict: "E"
  scope:
    data: "="

  link: (scope, element, attrs) ->
    margin = {top: 2, right: 2, bottom: 2, left: 2}
    width = (parseInt(attrs.width) || 960) - margin.left - margin.right
    height = (parseInt(attrs.height) || 500) - margin.top - margin.bottom

    x = d3.scale.ordinal().rangeRoundBands([0, width], .1)
    y = d3.scale.linear().range([height, 0])

    svg = d3.select(element[0]).append("svg")
          .attr("width", width + margin.left + margin.right)
          .attr("height", height + margin.top + margin.bottom).append("g")
          .attr("transform", "translate(" + margin.left + "," + margin.top + ")")

    x.domain scope.data.map((d) -> d.date)
    y.domain [d3.min(scope.data, (d) -> d.value), d3.max(scope.data, (d) -> d.value )]

    svg.selectAll(".bar").data(scope.data).enter().append("rect")
      .attr("class", (d) -> (if d.value < 0 then "bar negative" else "bar positive") )
      .attr("x", (d) -> x d.date)
      .attr("y", (d) -> y Math.max(1, d.value))
      .attr("width", x.rangeBand())
      .attr("height", (d) -> Math.abs y(d.value) - y(0))
