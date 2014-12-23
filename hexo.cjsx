React = require 'react'
HexoBoard = require './components/board'

Hexo = React.createClass
  render: ->
    <div className="hexo">
      <HexoBoard/>
    </div>

React.render(<Hexo/>, document.getElementById 'hexo')
