angular.module("App").directive "d3LineGraph", ->
  restrict: "E"
  scope:
    data: "="

  link: (scope, element, attrs) ->
    margin = {top: 2, right: 2, bottom: 2, left: 0}
    width = (parseInt(attrs.width) || 960) - margin.left - margin.right
    height = (parseInt(attrs.height) || 500) - margin.top - margin.bottom

    parseDate = d3.time.format("%Y-%m-%d").parse
    scope.data.forEach (d) -> d.date = parseDate(d.date)

    bisectDate = d3.bisector((d) -> d.date).left
    yValue = (x0) ->
      i = bisectDate(scope.data, x0, 1)
      d0 = scope.data[i - 1]
      d1 = scope.data[i]
      if (x0 - d0.date > d1.date - x0) then d1 else d0

    x = d3.time.scale().range([0, width])
    y = d3.scale.linear().range([height, 0])
    color = d3.scale.category10()

    line = d3.svg.line().interpolate("basis")
          .x((d) -> x d.date)
          .y((d) -> y d.metricValue)

    svg = d3.select(element[0]).append("svg")
          .attr("width", width + margin.left + margin.right)
          .attr("height", height + margin.top + margin.bottom).append("g")
          .attr("transform", "translate(" + margin.left + "," + margin.top + ")")

    color.domain d3.keys(scope.data[0]).filter((key) -> key isnt "date")


    metrics = color.domain().map((name) ->
      name: name
      values: scope.data.map((d) ->
        date: d.date
        metricValue: +d[name]
      )
    )

    x.domain d3.extent(scope.data, (d) -> d.date )

    y.domain [d3.min(metrics, (c) ->
      d3.min c.values, (v) -> v.metricValue
    ), d3.max(metrics, (c) ->
      d3.max c.values, (v) -> v.metricValue
    )]

    tooltip = d3.select("body").append("span").attr("class", "graph-tooltip").style("opacity", 0)

    metric = svg.selectAll(".metric").data(metrics).enter().append("g").attr("class", "metric")
    metric.append("path")
          .attr("d", (d) -> line d.values )
          .attr("class", (d) -> "line #{d.name}")
          .on("mouseover", (d) ->
            x0 = x.invert(d3.mouse(this)[0])
            tooltip
            tooltip.html(yValue(x0)[d.name])
                   .style("left", (d3.event.pageX) + "px")
                   .style("top", (d3.event.pageY - 28) + "px")
                   .style("opacity", .8))
          .on("mouseout", (d) -> tooltip.style "opacity", 0)
