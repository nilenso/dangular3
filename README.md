# Dangular3

Angular directives for d3

## Installation

Consider using the asset pipeline gem – [dangular3-rails](https://github.com/nilenso/dangular3-rails) if you want out of the box graphs.

## Usage

Download the coffee/js file and add them in `application.js` after requiring `angular.js` and `d3.js`

    //= require line_graph_directive
    //= require bar_graph_directive
    //= require bullet
    //= require bullet_graph_directive

Download the scss/css files and add them in `application.css`
    *= graphs

OR in `application.scss`
    @import "graphs";

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
