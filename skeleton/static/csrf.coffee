#source is legit: https://docs.djangoproject.com/en/dev/ref/contrib/csrf/#ajax
getCookie = (name) ->
  cookieValue = null
  if document.cookie and document.cookie isnt ""
    cookies = document.cookie.split(";")
    i = 0
 
    while i < cookies.length
      cookie = jQuery.trim(cookies[i])
 
      # Does this cookie string begin with the name we want?
      if cookie.substring(0, name.length + 1) is (name + "=")
        cookieValue = decodeURIComponent(cookie.substring(name.length + 1))
        break
      i++
  cookieValue
 
 
# source is legit: http://stackoverflow.com/questions/12333853/django-rest-framework-authentication-error-with-put-requests
# alias away the sync method
Backbone._sync = Backbone.sync
 
# define a new sync method
Backbone.sync = (method, model, options) ->
 
  # only need a token for non-get requests
  if method is "create" or method is "update" or method is "delete"
 
    # CSRF token value is in an embedded meta tag
    #csrfToken = $("meta[name='csrf_token']").attr("content")
    csrfToken = getCookie("csrftoken")
    options.beforeSend = (xhr) ->
      xhr.setRequestHeader "X-CSRFToken", csrfToken
 
  # proxy the call to the old sync method
  Backbone._sync method, model, options