-- maid64 made by adekto 2016
-- version 1.1 
-- thanks to surfacetoairmissiles for fixing up the library
maid64 = {}
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
end

maid64.start = function ()
      love.graphics.setCanvas(maid64.canvas)
      love.graphics.clear()
    end
maid64.finish = function ()
       love.graphics.setCanvas()
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

function maid64.newImage(source)
  image = love.graphics.newImage(source)
  image:setFilter("nearest","nearest")
  return image
end
