seq=[]

directions=[[30,0],[0,30],[-30,0],[0,-30]]
direction = 0

deltaX = 30
deltaY = 0

run = ->
  setTimeout ->
    step = seq.shift()
    runStep step
    run() if step
  , 1000

runStep = (step)->
  bot = document.getElementsByTagName('svg')[0]
  servo = bot.getElementById 'servo'
  if step is "F"
    bot.style.left = bot.offsetLeft + directions[direction][0] + 'px'
    bot.style.top = bot.offsetTop + directions[direction][1] + 'px'
  else if step is "B"
    bot.style.left = bot.offsetLeft - directions[direction][0] + 'px'
    bot.style.top = bot.offsetTop - directions[direction][1] + 'px'
  else if step is "L"
    direction = direction is 0 and 3 or direction-1
    servo.setAttribute 'class', "d#{direction}"
  else if step is "R"
    direction = direction is 3 and 0 or direction+1
    servo.setAttribute 'class', "d#{direction}"

document.addEventListener 'DOMContentLoaded', ->
  btnStart = document.getElementById 'start'
  btnStart.addEventListener 'click', ->
    seq = document.getElementById('sequence').value.split("")
    run()
