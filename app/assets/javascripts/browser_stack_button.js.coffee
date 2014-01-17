#= require jquery

$ ->
  $(document).click (evt) ->
    return if $(evt.target).hasClass('browser-stack-button-button')
    $('.browser-stack-button-list').hide()

  $('.browser-stack-button-button').click ->
    $('.browser-stack-button-list').show()

  $('.browser-stack-button-close').click ->
    $('.browser-stack-button-list').hide()

  $('.browser-stack-button-link').click (evt) ->
    evt.preventDefault()
    $(this).addClass('browser-stack-button-done')
    $('.browser-stack-button-list').hide()

    $('.browser-stack-button-button').addClass('browser-stack-button-loading')
    $stopImg = $('<img>')
    $stopImg.error ->
      $('.browser-stack-button-button').removeClass('browser-stack-button-loading')
      window.open evt.target.href

    $stopImg.attr 'src', 'http://www.browserstack.com/terminal/stop'

