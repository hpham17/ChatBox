@MessageForm = React.createClass
    getInitialState: ->
      text: ''
    handleSubmit: (e) ->
      e.preventDefault()
      $.post '', { message: @state }, (data) =>
        @props.handleNewMessage data
        @setState @getInitialState()
      , 'JSON'
    render: ->
      React.DOM.form
        className: 'form-inline'
        onSubmit: @handleSubmit
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'text'
            className: 'form-control custom'
            placeholder: ''
            name: 'text'
            value: @state.text
            onChange: @handleChange
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          'Send'
    handleChange: (e) ->
      name = e.target.name
      @setState "#{ name }": e.target.value
