$ ->
  # Configure infinite table
  $('.infinite-table').infinitePages
    # debug: true
    loading: ->
      $(this).text('Loading next page...')
    success: ->
      $(this).text('Success')
    error: ->
      $(this).button('There was an error, please try again')