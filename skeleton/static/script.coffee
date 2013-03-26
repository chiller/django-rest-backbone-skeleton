class TodoView extends Backbone.View
  events:
    "click .delete": "removeItem"
    "click .text": "modifyItem"
  initialize: ->
    @model.bind 'change', @render
    @model.bind 'destroy', @unrender
  removeItem: =>
    @model.destroy()
  modifyItem: =>
    new_value = window.prompt "sometext","defaultvalue"
    @model.set 'description', new_value
    @model.save()
  render: =>
    $(@el).html "<p><span class='text'>#{@model.get 'id'}:#{@model.get 'description'}</span><span class='delete'>x</span></p>"
    @
  unrender: =>
    @el.remove()

class TodoModel extends Backbone.Model
  render: =>
    myview = new TodoView model: @
    $(".contents").append  myview.render().el

class TodoList extends Backbone.Collection
  model: TodoModel
  url: "/todos/"
  initialize: =>
    @bind 'add', (item) -> item.render()
    @bind 'reset', (item) ->
      todo.render() for todo in item.models
    @fetch()
$ ->
  window.todolist = new TodoList()
  $("button").click ->
    window.todolist.create new TodoModel description: $("input").val()