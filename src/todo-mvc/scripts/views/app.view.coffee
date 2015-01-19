ToDoListView = require './todo-list.view.coffee'

AppView = (app) ->
	nxt.Element 'section',
		nxt.Attr 'id', 'todoapp'
		nxt.Element 'header',
			nxt.Attr 'id', 'header'
			nxt.Element 'h1',
				nxt.Text 'todos'

			nxt.Binding app.new_item, (item) ->
				nxt.Element 'input',
					nxt.Attr 'type', 'text'
					nxt.Attr 'id', 'new-todo'
					nxt.Attr 'placeholder', 'Whats need to be done?'
					nxt.ValueBinding item.content
					nxt.Event 'keypress', ({keyCode}) ->
						if keyCode is 13
							app.add_todo()

		nxt.Binding app.items.length, (length) ->
			if length > 0
				ToDoListView app, app.items


module.exports = AppView
