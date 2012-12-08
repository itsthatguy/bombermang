$.fn.extend
  slide: (opts) ->
    self = $.fn.slide
    options = $.extend {}, self.defaults, opts
    $(this).each (i, el) ->
      self.init el, options

$.extend $.fn.slide,
  dataStructure: [
    0,
    1]

  defaults:
    color: '#efefef',
    increments: 10

  init: (el, options) ->
    @this = $(el)
    @blockMarkup = '<div class="block"></div>'

    @updateMeasurements(options.increments)
    @drawIncrements()
    @createEvents(@this)

  createEvents: (el) ->
    _self = @
    _obj = $(el)

    @this.find('.block').live 'mouseover', (e) ->
      if not _self.isDragging
        $(this).addClass('hover')
      else
        _self.handleDrag($(this).index())

    @this.find('.block').live 'mouseleave', (e) ->
      $(this).removeClass('hover') if not _self.isDragging

    @this.live 'mousedown', (e) ->
      _this = $(e.target)
      _self.isDragging = true
      _self.dragStartIndex = _this.index()

    $('html').live 'mouseup', (e) ->
      _self.isDragging = false
      _obj.find('.block').removeClass('hover')

    @this.live 'mousemove', (e) ->
      if _self.isDragging
        $('body').addClass('dragging')
      else
        $('body').removeClass('dragging')

  handleDrag: (index) ->
    @this.find('.block').removeClass('hover')
    for i in [@dragStartIndex..index]
      block = @this.find('.block')
      $(block.get(i)).addClass('hover')


  updateMeasurements: (increments) ->
    @totalWidth = @this.width()
    @incrementWidth = @totalWidth/increments


  drawIncrements: ->
    for i in [1..@defaults.increments]
      @this.prepend(@blockMarkup)

    margins = [@this.find('.block').css('margin-left'),
               @this.find('.block').css('margin-right')]
    margins = @getInts(margins)
    margins = margins.reduce (t, s) -> t + s

    @this.find('.block').css({'width': @incrementWidth - margins})


  # Helpers & Testing
  thing: (el, options) ->
    $('body').css('background', options.color)

  getInts: (array) ->
    return array.map (t, s) -> parseInt(t.replace(/px/,""))
