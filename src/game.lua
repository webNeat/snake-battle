local x = 100
local y = 100
local direction = 'right'
local speed = 1.85

local size = 20

local food_x = math.random(1, 800 - size)
local food_y = math.random(1, 600 - size)


local function ranges_collide(a1, b1, a2, b2)
  return (a1 <= a2 and a2 <= b1) or (a1 <= b2 and b2 <= b1)
end

local function rectangles_collide(x1, y1, w1, h1, x2, y2, w2, h2)
  local x_collision = ranges_collide(x1, x1 + w1, x2, x2 + w2)
  local y_collision = ranges_collide(y1, y1 + h1, y2, y2 + h2)
  return x_collision and y_collision
end

love.window.setMode(800, 600)

function love.draw()
  love.graphics.rectangle('line', x, y, size, size)
  if direction == 'right' then
    x = x + speed
  elseif direction == 'left' then
    x = x - speed
  elseif direction == 'up' then
    y = y - speed
  elseif direction == 'down' then
    y = y + speed
  end

  if rectangles_collide(x, y, size, size, food_x, food_y, size, size) then
    food_x = math.random(1, 800 - size)
    food_y = math.random(1, 600 - size)
  end

  love.graphics.rectangle('fill', food_x, food_y, size, size)
end

function love.keypressed(key)
  if key == 'right' or key == 'left' or key == 'up' or key == 'down' then
    direction = key
  end
end
