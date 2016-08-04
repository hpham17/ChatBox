@Records = React.createClass
  getInitialState: ->
    records: @props.data
  getDefaultProps: ->
    records: []
  credits: ->
    credits = @state.records.filter (val) -> val.amount >= 0
    credits.reduce ((prev, curr) ->
      prev + parseFloat(curr.amount)
    ), 0
  debits: ->
    debits = @state.records.filter (val) -> val.amount < 0
    debits.reduce ((prev, curr) ->
      prev + parseFloat(curr.amount)
    ), 0
  balance: ->
    @debits() + @credits()
  addRecord: (record) ->
    records = React.addons.update(@state.records, { $push: [record] })
    @setState records: records
  updateRecord: (record, data) ->
    index = @state.records.indexOf record
    records = React.addons.update(@state.records, { $splice: [[index, 1, data]] })
    @replaceState records: records
  render: ->
    React.DOM.div
        className: 'records'
        React.DOM.h2
          className: 'title'
          'Records'
          React.DOM.div
            className: 'row'
            React.createElement AmountBox, type: 'success', amount: @credits(), text: 'Credit'
            React.createElement AmountBox, type: 'danger', amount: @debits(), text: 'Debit'
            React.createElement AmountBox, type: 'info', amount: @balance(), text: 'Balance'
          React.createElement RecordForm, handleNewRecord: @addRecord
          React.DOM.hr null
        React.DOM.table
          className: 'forms table table-bordered'
          React.DOM.thead null,
            React.DOM.tr null,
              React.DOM.th null, 'Date'
              React.DOM.th null, 'Title'
              React.DOM.th null, 'Amount'
              React.DOM.th null, 'Tag'
          React.DOM.tbody null,
            for record in @state.records.reverse()
              React.createElement Record, key: record.id, record: record, handleEditRecord: @updateRecord
