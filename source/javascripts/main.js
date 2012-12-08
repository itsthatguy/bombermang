$(function() {

  pos = [1,1]

  blockWidth = 25;
  blockHeight = 20;

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

  function checkMove(offset) {
    newPos = addArray(offset, pos);
    _x = newPos[1];
    _y = newPos[0];
    if (myMap[_y] != undefined && myMap[_y][_x] != undefined && myMap[_y][_x] < 1) {
      pos = newPos;
      return true;
    }
  }

  function moveChar() {
    myChar.css({top: pos[0]*blockHeight, left: pos[1]*blockWidth})
  }

  function addArray(arr1, arr2) {
    return arr1.map(function(i,n) { return arr1[n] + arr2[n] });
  }

  document.onkeydown = function(e) {
      e = e || window.event;
      var keyCode = evt.keyCode;
      if (keyCode >= 37 && keyCode <= 40) {
          return false;
      }
  };

});
