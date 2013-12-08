# Dangular3

Angular directives for d3. [Demo](http://nilenso.github.io/dangular3).

## Installation

Consider using the asset pipeline gem – [dangular3-rails](https://github.com/nilenso/dangular3-rails) if you want out of the box graphs in your rails app.

Download the coffee/js file and add them in `application.js` after requiring `angular.js` and `d3.js`

    //= require line_graph_directive
    //= require bar_graph_directive
    //= require bullet
    //= require bullet_graph_directive

Download the scss/css files and add them in `application.css`

    *= graph

OR in `application.scss`

    @import "graph";

## Usage

###Multiline Graph
    multilineGraphData = [{date: "2012-04-19", line1: 587.44, line2: 527.44}, {date: "2012-04-20", line1: 572.98, line2: 522.98}]
    <d3_line_graph width="500" height="300" data="multilineGraphData"></d3_line_graph>

###Line Graph
    lineGraphData = [{date: "2012-04-19", myData: 87.44}, {date: "2012-04-20", myData: 72.98}]
    <d3_line_graph width="500" height="200" data="lineGraphData"></d3_line_graph>

###Bullet Graph
    bulletGraphData = [{"ranges":[30, 70, 100],"measures":[40, 80],"markers":[90]}]
    <d3_bullet_graph width="300" height="40" data="bulletGraphData"></d3_bullet_graph>

###Bar Graph
    barGraphData = [{date: "2012-04-19", value: 10}, {date: "2012-04-20", value: 8}]
    <d3_bar_graph width="300" height="200" data="barGraphData"></d3_bar_graph>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
