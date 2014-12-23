React = require 'react'
Hex = require './hex'

_flatten = require 'lodash-node/modern/arrays/flatten'
_random = require 'lodash-node/modern/utilities/random'
_range = require 'lodash-node/modern/arrays/range'
_map = require 'lodash-node/modern/collections/map'

###
  Should result in a nested array of the form (n == null):
  n n 1 1 1
  n 1 1 1 1
  1 1 1 1 1
  1 1 1 1 n
  1 1 1 n n
###
boardPattern = (radius = 3)->
  tiles = _map _range(radius*2 + 1), ()-> 1
  nulls = _map _range(radius), ()-> null

  _map _range(radius*2 + 1), (row)->
    nulls.concat(tiles).concat(nulls).slice(row, row + radius*2 + 1)


module.exports = React.createClass
  getDefaultProps: ()->
    board: boardPattern()
    hexRadius: 50
    hexGutter: 2
    hexWidth: 100
    hexHeight: 100 * Math.sqrt(3) / 2

  render: ()->
    props = @props
    hexes = _map props.board, (row, q)->
      _map row, (tile, r)->
        if tile?
          <Hex
            q={q}
            r={r}
            x={(props.hexRadius + props.hexGutter) * q * 3/2 + props.hexWidth/2 + props.hexGutter}
            y={(props.hexRadius + props.hexGutter) * Math.sqrt(3) * (r + q/2) - props.hexHeight}
            color={_random(1,8)}
          />

    <div>
      {hexes}
    </div>
