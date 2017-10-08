# maid64
easy low resolution scaler for love2D

current version 1.6

---

##functions
* **maid64.setup(x,y)** initilize maid64 has optional parameters for the pixel width and height
* **maid64.start()** use in draw to start scaled rendering
* **maid64.finish()** use in draw to end scaled rendering
* **maid64.resize(w, h)** use in function love.resize(w, h)
* **maid64.newImage(source)** use like love.graphics.newImage()
* **maid64.newTileSet(image, x, y)** use this for creating a tilemap x y are for the size of tiles
* **maid64.mouse.getPosition()** gets the mouse position inside maid64
* **maid64.mouse.getX()** gets the mouse x position inside maid64
* **maid64.mouse.getY()** gets the mouse y position inside maid64

---
* **maid64.left** the left most pixel location
* **maid64.right** the right most pixel location


