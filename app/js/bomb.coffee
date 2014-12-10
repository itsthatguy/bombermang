class Bomb
  constructor: (_x, _y) ->
    @sprite = $('<div class="gamebomb"></div>')
    @x = _x
    @y = _y
    @drawSprite()
    @listeners = []

  drawSprite: ->
    console.log(@sprite)
    $('.table').prepend(@sprite)
    @sprite.css({'top': @y, 'left': @x})
    console.log @x, @y
    setTimeout(@explode, 1000)

  bind: (listener) ->
    @listeners.push listener

  explode: =>
    @sprite.remove()
    for listener in @listeners
      listener.bombExploded(this)


module.exports = Bomb
