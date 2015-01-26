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
boardPattern = (radius = 6)->
  tiles = _map _range(radius*2 + 1), ()-> 1
  nulls = _map _range(radius), ()-> null

  _map _range(radius*2 + 1), (row)->
    nulls.concat(tiles).concat(nulls).slice(row, row + radius*2 + 1)


module.exports = React.createClass
  getDefaultProps: ()->
    boardRadius: 4
    hexRadius: 50
    hexGutter: 2
    hexHeight: 100
    hexWidth: 100 * Math.sqrt(3) / 2

  getInitialState: ->
    board: boardPattern @props.boardRadius

  render: ()->
    props = @props
    hexes = _map @state.board, (row, q)->
      _map row, (tile, r)->
        return if not tile?
        hexRadGutter = props.hexRadius + props.hexGutter
        x = hexRadGutter * Math.sqrt(3) * (r + (q-props.boardRadius + 3) / 2) - props.hexWidth
        y = hexRadGutter * q * 3/2 + props.hexHeight/2 + props.hexGutter
        <Hex q={q} r={r} x={x} y={y} key={"hex#{q}-#{r}"} />

    <div className="board">
      {hexes}
    </div>
