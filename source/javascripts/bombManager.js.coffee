class BombManager

  constructor: ->
    @bombMap = []
    @bombMap[0] = []
    @bombMap[1] = []
    @bombMap[0][0] = []
    @bombMap[0][1] = []
    @bombMap[1][0] = []
    @bombMap[1][1] = []
    @bombKey = {}

  setBomb: (x, y, mapCol, mapRow) ->
    bomb = new Bomb(x, y)
    map = @getMap(mapCol, mapRow)
    @bombKey[bomb] = map
    bomb.bind(this)
    map.push( bomb )

  bombExploded: (bomb) ->
    console.debug('exploded')
    console.log @currentBombMap
    map = @bombKey[bomb]
    bombIndex = map.indexOf(bomb)
    console.log map
    map.splice bombIndex, 1

  hideBombs: (mapCol, mapRow) ->
    bomb.sprite.hide() for bomb in @getMap(mapCol, mapRow)

  showBombs: (mapCol, mapRow) ->
    bomb.sprite.show() for bomb in @getMap(mapCol, mapRow)

  setCurrentMap: (map) -> @currentBombMap = map

  getMap: (mapCol, mapRow) -> return @bombMap[mapCol][mapRow]

window.BombManager = BombManager
