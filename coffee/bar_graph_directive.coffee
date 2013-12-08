angular.module("App").directive "d3BarGraph", ->
  restrict: "E"
  scope:
    data: "="

  link: (scope, element, attrs) ->
    direction = attrs.direction || "vertical"
    margin = {top: 20, right: 20, bottom: 20, left: 20}
    width = (parseInt(attrs.width) || 960) - margin.left - margin.right
    height = (parseInt(attrs.height) || 500) - margin.top - margin.bottom

    svg = d3.select(element[0]).append("svg")
          .attr("width", width + margin.left + margin.right)
          .attr("height", height + margin.top + margin.bottom).append("g")
          .attr("transform", "translate(" + margin.left + "," + margin.top + ")")

    if direction == "horizontal"
      x = d3.scale.linear().range([0, width])
      y = d3.scale.ordinal().rangeRoundBands([0, height], .2)

      x.domain(d3.extent(scope.data, (d) -> d.value)).nice()
      y.domain scope.data.map((d) -> d.key)

      svg.selectAll(".bar").data(scope.data).enter().append("rect")
        .attr("class", (d) -> (if d.value < 0 then "bar negative" else "bar positive"))
        .attr("x", (d) -> x Math.min(0, d.value))
        .attr("y", (d) -> y d.key)
        .attr("width", (d) -> Math.abs x(d.value) - x(0))
        .attr("height", y.rangeBand())

    else if direction == "vertical"
      x = d3.scale.ordinal().rangeRoundBands([0, width], .1)
      y = d3.scale.linear().range([height, 0])

      x.domain scope.data.map((d) -> d.key)
      y.domain [d3.min(scope.data, (d) -> d.value), d3.max(scope.data, (d) -> d.value)]

      svg.selectAll(".bar").data(scope.data).enter().append("rect")
        .attr("class", (d) -> (if d.value < 0 then "bar negative" else "bar positive"))
        .attr("x", (d) -> x d.key)
        .attr("y", (d) -> y Math.max(1, d.value))
        .attr("width", x.rangeBand())
        .attr("height", (d) -> Math.abs y(d.value) - y(0))
