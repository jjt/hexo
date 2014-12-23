React = require 'react'

module.exports = React.createClass
  render: ->
    styles =
      left: @props.x + 'px'
      top: @props.y + 'px'

    <div className="hex c#{@props.color}" style={styles}>
      {@props.r},{@props.q}
    </div>
