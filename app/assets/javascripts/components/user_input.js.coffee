@UserInput = React.createClass
  render: ->
    React.DOM.div
      className: 'center overlay'
      React.DOM.h2
        id: 'title'
        'Please enter a username'
      React.DOM.input
        id: 'user'
        type: 'text'
      React.DOM.img
        className: 'enter'
        src: '/assets/enter-96ecc5f20d636c1746936ea7adc9a0271c538484b847366759bf6ba5c4052b45.png'
