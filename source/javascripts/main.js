$(function() {

  pos = [1,1]

  blockWidth = 25;
  blockHeight = 20;

  myMap = []
  myMap[0] = []
  myMap[1] = []

  myMap[0][0]= [[1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
                [1, 0, 0, 0, 2, 0, 2, 2, 0, 0],
                [1, 0, 1, 0, 1, 0, 1, 0, 1, 0],
                [1, 0, 2, 0, 0, 0, 0, 2, 0, 0],
                [1, 0, 1, 0, 1, 2, 1, 0, 1, 0],
                [1, 0, 0, 0, 0, 0, 0, 2, 0, 0],
                [1, 0, 1, 0, 1, 0, 1, 2, 1, 0],
                [1, 0, 2, 0, 0, 2, 2, 2, 2, 0],
                [1, 0, 1, 0, 1, 0, 1, 0, 1, 0],
                [1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                [1, 2, 1, 0, 1, 0, 1, 0, 1, 0],
                [1, 0, 0, 0, 0, 0, 0, 0, 0, 0]];

  myMap[0][1]= [[1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
                [0, 2, 0, 2, 0, 0, 2, 2, 0, 1],
                [0, 1, 0, 1, 0, 1, 0, 1, 0, 1],
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
                [0, 1, 2, 1, 0, 1, 0, 1, 0, 1],
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
                [0, 1, 0, 1, 0, 1, 0, 1, 0, 1],
                [0, 0, 2, 2, 0, 2, 0, 0, 0, 1],
                [0, 1, 0, 1, 0, 1, 0, 1, 0, 1],
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
                [0, 1, 0, 1, 0, 1, 0, 1, 0, 1],
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 1]];

  myMap[1][0]= [[1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                [1, 0, 1, 0, 1, 0, 1, 0, 1, 0],
                [1, 0, 2, 0, 0, 0, 0, 2, 0, 0],
                [1, 0, 1, 0, 1, 2, 1, 0, 1, 0],
                [1, 0, 0, 0, 0, 0, 0, 2, 0, 0],
                [1, 0, 1, 0, 1, 0, 1, 2, 1, 0],
                [1, 0, 2, 0, 0, 2, 2, 2, 2, 0],
                [1, 0, 1, 0, 1, 0, 1, 0, 1, 0],
                [1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                [1, 2, 1, 0, 1, 0, 1, 0, 1, 0],
                [1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]];

  myMap[1][1]= [[0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
                [0, 1, 0, 1, 0, 1, 0, 1, 0, 1],
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
                [0, 1, 2, 1, 0, 1, 0, 1, 0, 1],
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
                [0, 1, 0, 1, 0, 1, 0, 1, 0, 1],
                [0, 0, 2, 2, 0, 2, 0, 0, 0, 1],
                [0, 1, 0, 1, 0, 1, 0, 1, 0, 1],
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
                [0, 1, 0, 1, 0, 1, 0, 1, 0, 1],
                [0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
                [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]];

  currentMapIndex = [0, 0];

  $('body').prepend('<div class="gamescreen"></div>')
  $('.gamescreen').prepend('<div class="table"></div>')
  $('.gamescreen').append('<div class="instructions">Use the arrow keys to navigate</div>')

  drawMap(myMap[currentMapIndex[0]][currentMapIndex[1]]);

  $('.table').append('<img src="/images/bomberman.png" class="sprite">')
  myChar = $('.sprite');
  myChar.css({position: 'absolute'})
  moveChar();

  $('body').keydown(function(e) {
    // 38 up
    // 39 right
    // 40 down
    // 37 left

    keyMap = {
      38: [-1, 0],
      39: [0, 1],
      40: [1, 0],
      37: [0, -1]
    }

    if (checkMove(keyMap[e.keyCode])) moveChar()
  })

  function drawMap(gameMap) {

    $('.table').find('.gamerow').remove();

    for (var i = 0; i < gameMap.length; i++) {
      $('.table').append('<div class="gamerow row-'+i+'"></div>')
      for (var k = 0; k < gameMap[i].length; k++) {
        $('.row-'+i).append('<div class="gameblock block-'+gameMap[i][k]+'"></div>')
      }
    }
  }

  function checkMove(offset) {
    currentMap = myMap[currentMapIndex[0]][currentMapIndex[1]];
    newPos = addArray(offset, pos);
    _x = newPos[1];
    _y = newPos[0];

    // If moving up/down to new screen
    if (currentMap[_y] == undefined){
      currentMapIndex = addArray(offset, currentMapIndex);
      newMap = getMap(currentMapIndex);

      drawMap(newMap);

      if (offset[0] > 0) { pos[0] = 0 }
      else { pos[0] = newMap.length-1 }
      return true;
    }

    // If moving left/right to new screen
    if (currentMap[_y][_x] == undefined) {
      currentMapIndex = addArray(offset, currentMapIndex);
      newMap = getMap(currentMapIndex);

      drawMap(newMap)

      if (offset[1] > 0) { pos[1] = 0 }
      else { pos[1] = newMap[0].length-1 }
      return true;
    }

    // If the next block has no collision
    if (currentMap[_y][_x] < 1) {
      pos = newPos;
      return true;
    }
  }

  function getMap(index) { return myMap[index[0]][index[1]]; }

  function moveChar() {
    myChar.css({top: pos[0]*blockHeight, left: pos[1]*blockWidth})
  }

  function addArray(arr1, arr2) {
    return arr1.map(function(i,n) { return arr1[n] + arr2[n] });
  }

  document.onkeydown = function(e) {
      e = e || window.event;
      var keyCode = e.keyCode;
      if (keyCode >= 37 && keyCode <= 40) {
          return false;
      }
  };

});
