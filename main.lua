require "functions"

-- Loaded in the first exec
function love.load()
    -- Sprites
    sprites = {}
    sprites.player     = love.graphics.newImage("sprites/player.png")
    sprites.bullet     = love.graphics.newImage("sprites/bullet.png")
    sprites.zombie     = love.graphics.newImage("sprites/zombie.png")
    sprites.background = love.graphics.newImage("sprites/background.png")

    -- Player
    player       = {}
    player.x     = 200
    player.y     = 200
    player.speed = 180

    -- Enemies
    zombies = {}
    bullets = {}
end

-- Everytime that update
function love.update(dt)
    -- UP
    if love.keyboard.isDown("w", "up") then
        player.y = player.y - (player.speed * dt)
    end

    -- DOWN
    if love.keyboard.isDown("s", "down") then
        player.y = player.y + (player.speed * dt)
    end

    -- LEFT
    if love.keyboard.isDown("a", "left") then
        player.x = player.x - (player.speed * dt)
    end

    -- RIGHT
    if love.keyboard.isDown("d", "right") then
        player.x = player.x + (player.speed * dt)
    end

    for i,z in ipairs(zombies) do
        z.x = z.x + math.cos(zombie_player_angle(z)) * z.speed * dt
        z.y = z.y + math.sin(zombie_player_angle(z)) * z.speed * dt

        if distanceBetween(z.x, z.y, player.x, player.y) < 35 then
            for i,z in ipairs(zombies) do 
                zombies[i] = nil
            end
            for i,b in ipairs(bullets) do
            	bullets[i] =  nil
            end
        end
    end

    for i,b in ipairs(bullets) do
        b.x = b.x + math.cos(b.direction) * b.speed * dt
        b.y = b.y + math.sin(b.direction) * b.speed * dt
    end

    for i=#bullets, 1, -1 do
    	local b = bullets[i]
    	if b.x < 0 or b.y < 0 or b.x > love.graphics.getWidth() or b.y > love.graphics.getHeight() then
    		table.remove(bullets, i)
    	end
    end

    for i,z in ipairs(zombies) do
    	for j,b in ipairs(bullets) do
    		if distanceBetween(z.x, z.y, b.x, b.y) < 20 then
    			z.dead = true
    			b.dead = true
    		end
    	end
    end

	for i=#zombies, 1, -1 do
		local z = zombies[i]
		if z.dead == true then
			table.remove(zombies, i)
		end
	end

	for i=#bullets, 1, -1 do
		local b = bullets[i]
		if b.dead == true then
			table.remove(bullets, i)
		end
	end
end

-- Only when the press
function love.keypressed(key, scancode, isrepeat)
    if key == "space" then
        spawnZombie()
    end
end

-- Only in the mouse/touch press
function love.mousepressed(x, y, button, istouch)
    if button == 1 then
        spawnBullet()
    end
end

-- Draw in the screen
function love.draw()
    love.graphics.draw(sprites.background, 0, 0)
    love.graphics.draw(sprites.player, player.x, player.y, player_mouse_angle(), nil, nil, sprites.player:getWidth()/2, sprites.player:getHeight()/2)
    
    for i,z in ipairs(zombies) do
        love.graphics.draw(sprites.zombie, z.x, z.y, zombie_player_angle(z), nil, nil, sprites.zombie:getWidth()/2, sprites.zombie:getHeight()/2)
    end

    for i,b in ipairs(bullets) do
        love.graphics.draw(sprites.bullet, b.x, b.y, nil , 0.5, 0.5, sprites.bullet:getWidth()/2, sprites.bullet:getHeight()/2)
    end
end
