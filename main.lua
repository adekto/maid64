local maid64 = require "maid64"

function love.load()
    --optional settings for window
    love.window.setMode(640, 640, {resizable=true, vsync=false, minwidth=200, minheight=200})
    
    --initilizing maid64 for use and set to 64x64 mode 
    --can take 2 parameters x and y if needed for example maid64.setup(64,32)
    maid64.setup(64)

    
    -- create test sprite
    maid = maid64.newImage("maid64.png")
    
    rotate = 0
   
end
function love.update(dt)
    rotate = rotate + dt
end
function love.draw()
    maid64.start()--starts the maid64 process

    --draw images here
    love.graphics.draw(maid,32,32,rotate,1,1,32,32)
    
    --can also draw shapes and get mouse position
    love.graphics.circle("fill", maid64.mouse.getX(),  maid64.mouse.getY(), 2)
    
    maid64.finish()--finishes the maid64 process
end

function love.resize(w, h)
    -- this is used to resize the screen correctly
    maid64.resize(w, h)
end
