@Convo = React.createClass
  getInitialState: ->
    messages: @props.data
    user: 'Hubert'
  getDefaultProps: ->
    messages: []
    user: 'Hubert'
  addMessage: (message) ->
    messages = React.addons.update(@state.messages, { $push: [message] })
    @setState messages: messages
  addUser: (username) ->
    @setState user: username
  render: ->
    React.DOM.div
      className: ''
      React.createElement UserInput, handleNewUser: @addUser
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
