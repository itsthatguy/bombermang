$(function() {

  positionX = 1;
  positionY = 1;

  blockX = 25;
  blockY = 20;

  myMap = [[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
           [1, 0, 0, 0, 2, 0, 2, 2, 0, 2, 2],
           [1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1],
           [1, 0, 2, 0, 0, 0, 0, 2, 0, 0, 0],
           [1, 0, 1, 0, 1, 2, 1, 0, 1, 0, 1],
           [1, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0],
           [1, 0, 1, 0, 1, 0, 1, 2, 1, 0, 1],
           [1, 0, 2, 0, 0, 2, 2, 2, 2, 0, 0],
           [1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1],
           [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
           [1, 2, 1, 0, 1, 0, 1, 0, 1, 0, 1]]

  $('body').prepend('<div class="gamescreen"></div>')
  $('.gamescreen').prepend('<div class="table"></div>')
  $('.gamescreen').append('<div class="instructions">Use the arrow keys to navigate</div>')

  for (var i = 0; i < myMap.length; i++) {
    $('.table').append('<div class="gamerow row-'+i+'"></div>')
    for (var k = 0; k < myMap[i].length; k++) {
      $('.row-'+i).append('<div class="gameblock block-'+myMap[i][k]+'"></div>')
    }
  }

  $('.table').append('<img src="/images/bomberman.png" class="sprite">')
  myChar = $('.sprite');
  myChar.css({position: 'absolute'})
  moveChar(1,1);

  $('body').keydown(function(e) {
    // 39 right
    // 37 left
    // 38 up
    // 40 down
    newX = positionX
    newY = positionY

    switch (e.keyCode) {
      case 38:
        // up
        newY = positionY-1
        break;
      case 39:
        // right
        newX = positionX+1
        break;
      case 40:
        // down
        newY = positionY+1
        break;
      case 37:
        // left
        newX = positionX-1
        break;
    }
    if (checkMove(newX, newY) == true) moveChar()
  })

  function checkMove(_x, _y) {
    if (myMap[_y] != undefined && myMap[_y][_x] != undefined && myMap[_y][_x] < 1) {
      positionX = _x
      positionY = _y
      return true
    }
  }

  function moveChar() {
    myChar.css({top: positionY*blockY, left: positionX*blockX})
  }

  document.onkeydown = function(evt) {
      evt = evt || window.event;
      var keyCode = evt.keyCode;
      if (keyCode >= 37 && keyCode <= 40) {
          return false;
      }
  };

});
