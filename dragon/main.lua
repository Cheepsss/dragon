function love.load ()
    images = {}
    images.dragon1 = love.graphics.newImage("dragon1.png")
    images.dragon2 = love.graphics.newImage("dragon2.png")
    coord = {}
    coord.x = 0
    coord.y = 0
    coord.w = 0
    coord.h = 0

    corp = {}

    ajt = {}
    ajt.bool1 = 1
    ajt.a = 0
    ajt.i = 1
    ajt.m = 5

    ok=0
end

function love.update(dt)
  coord.x = love.mouse.getX( )
  coord.y = love.mouse.getY( )
  coord.w = images.dragon2:getWidth()/2
  coord.h = images.dragon2:getHeight()/2
  ajt.a = ajt.a + 1
  if ok == 0  then
    ajt.m=10
  end
  if ajt.a == 2 then
    ajt.a=0
    if ajt.bool1 ==  1 then
      for i=0, ajt.m do
        local coord2 = {}
        coord2.x = love.mouse.getX( )
        coord2.y = love.mouse.getY( )
        coord2.w = images.dragon2:getWidth()/2
        coord2.h = images.dragon2:getHeight()/2
        table.insert(corp, coord2 )
        ajt.bool1 = 0
      end
    else
        local coord2 = {}
        coord2.x = love.mouse.getX( )
        coord2.y = love.mouse.getY( )
        coord2.w = images.dragon2:getWidth()/2
        coord2.h = images.dragon2:getHeight()/2
        corp[ajt.i] = coord2
        ajt.i= ajt.i + 1
        if ajt.i == ajt.m + 1 then
          ajt.i=1
        end
      end
  end

end

function love.draw()
  for i=1 , #corp do
    local coord2 = corp[i]
    love.graphics.draw (images.dragon1, coord2.x, coord2.y, 0 , 1 , 1, coord2.w , coord2.h )
  end
    love.graphics.draw (images.dragon2 , coord.x , coord.y , 0 , 1 , 1 , coord.w , coord.h)
end
