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
    player.speed = 3
end

-- Everytime that update
function love.update(dt)
    -- UP
    if love.keyboard.isDown("w", "up") then
        player.y = player.y - (player.speed)
    end

    -- DOWN
    if love.keyboard.isDown("s", "down") then
        player.y = player.y + (player.speed)
    end

    -- LEFT
    if love.keyboard.isDown("a", "left") then
        player.x = player.x - (player.speed)
    end

    -- RIGHT
    if love.keyboard.isDown("d", "right") then
        player.x = player.x + (player.speed)
    end
end

-- Draw in the screen
function love.draw()
    love.graphics.draw(sprites.background, 0, 0)
    love.graphics.draw(sprites.player, player.x, player.y)
end