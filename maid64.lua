--   maid64 made by adekto   --
--        version 1.5        --
--        MIT license        --
-- Copyright (c) 2016 adekto --
maid64 = {mouse = {}}
function maid64.setup(x,y)
    maid64.sizeX = x or 64
    maid64.sizeY = y or maid64.sizeX
    if x < (y or 0) then
      maid64.scaler = love.graphics.getHeight() / maid64.sizeY
    else
      maid64.scaler = love.graphics.getWidth() / maid64.sizeX
    end
    maid64.x = love.graphics.getWidth()/2-(maid64.scaler*(maid64.sizeX/2))
    maid64.y = love.graphics.getHeight()/2-(maid64.scaler*(maid64.sizeY/2))
    maid64.canvas = love.graphics.newCanvas(maid64.sizeX, maid64.sizeY)
    maid64.canvas:setFilter("nearest","nearest")

    maid64.resize(love.graphics.getDimensions()) -- run resize so the sceen is reset corectly
end

maid64.start = function ()

      love.graphics.setCanvas(maid64.canvas)
      love.graphics.clear()
    end
maid64.finish = function ()
       love.graphics.setCanvas()
       --love.graphics.setShader() --used only for special shaders
       love.graphics.draw(maid64.canvas, maid64.x,maid64.y,0,maid64.scaler,maid64.scaler)
end

function maid64.resize(w, h)
    if h/maid64.sizeY < w/maid64.sizeX then
        maid64.scaler = h / maid64.sizeY
    else
        maid64.scaler = w / maid64.sizeX
    end
    maid64.x = w/2-(maid64.scaler*(maid64.sizeX/2))
    maid64.y = h/2-(maid64.scaler*(maid64.sizeY/2))
end

function maid64.mouse.getPosition()
  local my = math.floor( (love.mouse.getY()-maid64.y)/(maid64.scaler *maid64.sizeX)*maid64.sizeX)
  local mx = math.floor( (love.mouse.getX()-maid64.x)/(maid64.scaler *maid64.sizeY)*maid64.sizeY)
  return mx,my
end
function maid64.mouse.getX()
  return math.floor( (love.mouse.getX()-maid64.x)/(maid64.scaler *maid64.sizeX)*maid64.sizeX)
end
function maid64.mouse.getY()
  return math.floor( (love.mouse.getY()-maid64.y)/(maid64.scaler *maid64.sizeY)*maid64.sizeY)
end

function maid64.newImage(source)
  image = love.graphics.newImage(source)
  image:setFilter("nearest","nearest")
  return image
end

function maid64.newTileSet(image, x, y)
  quad = {x = x, y = y}
  for i=0,(image:getWidth()/x)*(image:getHeight()/y)-1 do
    quad[i] = love.graphics.newQuad((i%(image:getWidth()/x))*x, math.floor(i/(image:getWidth()/x))*y, x, y, image:getDimensions())
  end
  return quad
end
