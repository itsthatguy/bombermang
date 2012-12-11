class Bomb
  constructor: (_x, _y) ->
    @sprite = $('<div class="gamebomb"></div>')
    @x = _x
    @y = _y
    @drawSprite()

  drawSprite: ->
    console.log(@sprite)
    $('.table').append(@sprite)
    @sprite.css({'top': @y, 'left': @x})
    console.log @x, @y

window.Bomb = Bomb
