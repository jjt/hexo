React = require 'react'
HexoBoard = require './components/board'

Hexo = React.createClass
  render: ->
    <div className="hexo">
      <h1>HEXO FRIENDS</h1>
      <HexoBoard/>
    </div>

React.render(<Hexo/>, document.getElementById 'hexo')
