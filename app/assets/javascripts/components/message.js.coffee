@Message = React.createClass
    render: ->
      React.DOM.p
        className: 'message-text'
        (@props.user).concat(": ").concat(@props.message.text)
