
  pos = [1,1]

  blockWidth = 16
  blockHeight = 16

  myMap = []
  myMap[0] = []
  myMap[1] = []

  bombMap = []
  bombManager = new BombManager()

  myMap[0][0]= [[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
                [1, 0, 0, 0, 2, 0, 2, 2, 0, 0, 0, 0],
                [1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0],
                [1, 0, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0],
                [1, 0, 1, 0, 1, 2, 1, 0, 1, 0, 1, 0],
                [1, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0],
                [1, 0, 1, 0, 1, 0, 1, 2, 1, 0, 1, 0],
                [1, 0, 2, 0, 0, 2, 2, 2, 2, 0, 2, 0],
                [1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0],
                [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                [1, 2, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0],
                [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]

  myMap[0][1]= [[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
                [0, 0, 0, 2, 0, 2, 0, 0, 2, 2, 0, 1],
                [0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1],
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
                [0, 1, 0, 1, 2, 1, 0, 1, 0, 1, 0, 1],
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
                [0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1],
                [0, 2, 0, 0, 2, 2, 0, 2, 0, 0, 0, 1],
                [0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1],
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
                [0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1],
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]]

  myMap[1][0]= [[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                [1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0],
                [1, 0, 2, 0, 0, 0, 0, 2, 0, 0, 1, 0],
                [1, 0, 1, 0, 1, 2, 1, 0, 1, 0, 0, 0],
                [1, 0, 0, 0, 0, 0, 0, 2, 0, 0, 1, 0],
                [1, 0, 1, 0, 1, 0, 1, 2, 1, 0, 0, 0],
                [1, 0, 2, 0, 0, 2, 2, 2, 2, 0, 1, 0],
                [1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 2, 0],
                [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
                [1, 2, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0],
                [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
                [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]]

  myMap[1][1]= [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
                [0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1],
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
                [0, 1, 2, 1, 0, 1, 0, 1, 0, 0, 0, 1],
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
                [0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1],
                [0, 0, 2, 2, 0, 2, 0, 0, 0, 0, 0, 1],
                [0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1],
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
                [0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1],
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
                [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]]

  currentMapIndex = [0, 0]

  init = ->
    $('body').prepend('<div class="gamescreen"></div>')
    $('.gamescreen').prepend('<div class="table"></div>')
    $('.gamescreen').append('<div class="instructions">Use the arrow keys to navigate</div>')

    drawMap(myMap[currentMapIndex[0]][currentMapIndex[1]])

    $('.table').append('<div class="character sprite"></div>')
    @myChar = $('.sprite')
    myChar.css({position: 'absolute'})
    moveChar()

  $('body').keydown (e) ->
    # 38 up
    # 39 right
    # 40 down
    # 37 left

    moveKeys = [38,39,40,37]
    actionKeys = [32]
    moveKeyMap =
      38: [-1, 0]
      39: [0, 1]
      40: [1, 0]
      37: [0, -1]

    moveChar() if e.keyCode in moveKeys && checkMove(moveKeyMap[e.keyCode])
    doCharAction(e.keyCode) if e.keyCode in actionKeys

  drawMap = (gameMap) ->
    $('.table').find('.gamerow').remove()
    for i in [0..gameMap.length-1] by 1
      $('.table').append('<div class="gamerow row-'+i+'"></div>')
      for k in [0..gameMap[i].length-1] by 1
        $('.row-'+i).append('<div class="gameblock block-'+gameMap[i][k]+'"></div>')

  doCharAction = (actionIndex) ->
    switch (actionIndex)
      when 32
        # Bomb
        _x = blockWidth*pos[1]
        _y = blockHeight*pos[0]
        _mapCol = currentMapIndex[0]
        _mapRow = currentMapIndex[1]
        bombManager.setBomb( _x, _y, _mapCol, _mapRow)


  checkMove = (offset) ->
    currentMap = myMap[currentMapIndex[0]][currentMapIndex[1]]
    newPos = addArray(offset, pos)

    console.log newPos

    _x = newPos[1]
    _y = newPos[0]

    # If moving up/down to new screen
    if (currentMap[_y] == undefined)
      bombManager.hideBombs(currentMapIndex[0], currentMapIndex[1])

      currentMapIndex = addArray(offset, currentMapIndex)
      bombManager.setCurrentMap(currentMapIndex[0], currentMapIndex[1])
      newMap = getMap(currentMapIndex)
      drawMap(newMap)

      bombManager.showBombs(currentMapIndex[0], currentMapIndex[1])

      pos[0] = if (offset[0] > 0) then 0 else newMap.length-1
      return true

    # If moving left/right to new screen
    if (currentMap[_y][_x] == undefined)
      bombManager.hideBombs(currentMapIndex[0], currentMapIndex[1])

      currentMapIndex = addArray(offset, currentMapIndex)
      bombManager.setCurrentMap(currentMapIndex[0], currentMapIndex[1])
      newMap = getMap(currentMapIndex)
      drawMap(newMap)

      bombManager.showBombs(currentMapIndex[0], currentMapIndex[1])

      pos[1] = if (offset[1] > 0) then 0 else newMap[0].length-1
      return true

    # If the next block has no collision
    if (currentMap[_y][_x] < 1)
      pos = newPos
      return true

  moveChar = () ->
    myChar.css({top: pos[0]*blockHeight, left: pos[1]*blockWidth})

  getMap = (index) -> return myMap[index[0]][index[1]]

  addArray = (arr1, arr2) ->
    return arr1.map (i,n) -> return arr1[n] + arr2[n]

  document.onkeydown = (e) ->
      e = e || window.event
      keyCode = e.keyCode
      return false if (keyCode >= 37 && keyCode <= 40)

  init()
