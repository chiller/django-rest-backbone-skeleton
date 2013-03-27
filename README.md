django-rest-backbone-skeleton
=============================

Skeleton for a hooked-up django + backbone.js app, with django rest framework

Starting from `min` branch

`https://github.com/chiller/django-rest-backbone-skeleton.git`

`pip install -r skeleton/requirements.pip`

This going to take a little while.

`python manage.py syncdb`

Add a simple model:

    from django.db import models   
    class Todo(models.Model):    
       description = models.TextField()
        
Add a serializer:

    class TodoSerializer(serializers.ModelSerializer):
        class Meta:
            model = Todo

Add a View Class:

    class TodoView(generics.ListCreateAPIView):
        model = Todo
        serializer_class = TodoSerializer

Add an url:

    url(r'^todos/$', TodoView.as_view(), name='todo-view'),
    
And if you run your server and go to `/todos/`. Try creating a few todo items.

Let's move on to the client side.

Set up your CoffeeScript compiler:

`coffee -cwb script.coffee`

We have already have some empty Backbone classes:

    class TodoView extends Backbone.View
    
    class TodoModel extends Backbone.Model
    
    class TodoList extends Backbone.Collection
    
    $ ->
    
Notice the last line is our jquery onload handler.
    class TodoList extends Backbone.Collection
      model: TodoModel
      url: "/todos/"
      initialize: =>
        @fetch()
        
And we instantiate our collection in onload:

    $ ->
        window.todolist = new Todolist()
        
And we have our most primitive example, try running it in your browser. Open up your console

try : `window.todolist.models` expand those, and check out the `attributes` attribute.

Next we want to display this data.

Add this to the collection initialize

    @bind 'reset', (item) ->
          todo.render() for todo in item.models
          
We have to implement this method in models:

    class TodoModel extends Backbone.Model
      render: =>
        myview = new TodoView model: @
        $(".contents").append  myview.render().el

and in the view:
     render: =>
         $(@el).html "<p><span class='text'>#{@model.get 'id'}:#{@model.get 'description'}</span><span class='delete'>x</span></p>"
         @
         
Now our data is loaded and displayed, now we want to be able to add new todo items.

    $("button").click ->
        window.todolist.create new TodoModel description: $("input").val()
        
We also need them to render on add. Add this to the collection initialize:

    @bind 'add', (item) -> item.render()
        
This will create the items in the backend. Try adding one and reloading.

Notice the undefined. Let's bind render to the model change:

    initialize: ->
        @model.bind 'change', @render
        



TO BE CONTINUED ....

   
        




    

   
   
