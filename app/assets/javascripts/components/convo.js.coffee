@Convo = React.createClass
  getInitialState: ->
    messages: @props.data
    user: ''
  getDefaultProps: ->
    messages: []
    user: ''
  addMessage: (message) ->
    messages = React.addons.update(@state.messages, { $push: [message] })
    @setState messages: messages
  addUser() ->
    @setState user: $('#user').val()
  render: ->
    this.addUser()
    React.DOM.div
      className: ''
      React.DOM.h2
        className: 'title'
        'ChatBox'
      React.DOM.div
        className: 'messages'
        for message in @state.messages
          React.createElement Message, key: message.id, message: message, user: @state.user
      React.DOM.div
        className: 'message-box'
        React.createElement MessageForm, handleNewMessage: @addMessage
