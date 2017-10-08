--     maid64 made by adekto     --
--          version 1.6          --
--          MIT license          --
-- Copyright (c)2016-2017 adekto --

local maid64 = {mouse = {}}

function maid64.setup(x,y,overscan)
    maid64.overscan = overscan or false
    maid64.sizeX = x or 64
    maid64.sizeY = y or maid64.sizeX
    if x < (y or 0) then
        maid64.scaler = love.graphics.getHeight() / maid64.sizeY
    else
        maid64.scaler = love.graphics.getWidth() / maid64.sizeX
    end
    maid64.x = love.graphics.getWidth()/2 - (maid64.scaler * (maid64.sizeX/2))
    maid64.y = love.graphics.getHeight()/2 - (maid64.scaler * (maid64.sizeY/2))
    maid64.canvas = love.graphics.newCanvas(maid64.sizeX, maid64.sizeY)
    maid64.canvas:setFilter("nearest")

    -- run resize so the sceen is reset corectly
    maid64.resize(love.graphics.getDimensions())
end

function maid64.start()
    love.graphics.setCanvas(maid64.canvas)
    love.graphics.clear()
end

function maid64.finish()
    love.graphics.setCanvas()
    --love.graphics.setShader() --used only for special shaders
    love.graphics.draw(maid64.canvas, maid64.x, maid64.y, 0, maid64.scaler)
end

function maid64.resize(w, h)
    if maid64.overscan then
        maid64.scaler = h / maid64.sizeY
        -- minimum size will be halve the buffer width
        if w/maid64.scaler < maid64.sizeX/2 then
            maid64.scaler = w / maid64.sizeX*2
        end
        -- overscan scaler
        maid64.x = (w - (maid64.scaler * maid64.sizeX))/2

        if w/maid64.scaler > maid64.sizeX then
            maid64.right = maid64.sizeX
            maid64.left = 0
        else
            maid64.right = ((w - (maid64.x))/maid64.scaler)
            maid64.left = -(maid64.x/maid64.scaler)
        end
    else
        if h/maid64.sizeY < w/maid64.sizeX then
            maid64.scaler = h / maid64.sizeY
        else
            maid64.scaler = w / maid64.sizeX
        end
        maid64.right = maid64.sizeX
        maid64.left = 0
        maid64.x = w/2 - (maid64.scaler * (maid64.sizeX/2))
    end
    maid64.y = h/2 - (maid64.scaler * (maid64.sizeY/2))
end

function maid64.mouse.getPosition()
    local mx = math.floor((love.mouse.getX() - maid64.x) /
        (maid64.scaler * maid64.sizeY) * maid64.sizeY)
    local my = math.floor((love.mouse.getY() - maid64.y) /
        (maid64.scaler * maid64.sizeX) * maid64.sizeX)
    return mx, my
end

function maid64.mouse.getX()
    return math.floor((love.mouse.getX() - maid64.x) /
        (maid64.scaler * maid64.sizeX) * maid64.sizeX)
end

function maid64.mouse.getY()
    return math.floor((love.mouse.getY() - maid64.y) /
        (maid64.scaler * maid64.sizeY) * maid64.sizeY)
end

function maid64.newImage(source)
    local image = love.graphics.newImage(source)
    image:setFilter("nearest")
    return image
end

function maid64.newTileSet(image, x, y)
    local quad = {x = x, y = y}
    for i=0, (image:getWidth()/x) * (image:getHeight()/y) - 1 do
        quad[i] = love.graphics.newQuad(
            (i % (image:getWidth()/x)) * x,
            math.floor(i/(image:getWidth()/x))*y,
            x, y, image:getDimensions())
    end
    return quad
end

return maid64
