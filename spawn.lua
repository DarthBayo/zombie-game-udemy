-- Spawn the zombies sprites
function spawnZombie()
    zombie = {}
    zombie.x = 0
    zombie.y = 0
    zombie.speed = 100
	zombie.dead = false

    local size = math.random(1, 4)

    if size == 1 then
        zombie.x = -30
        zombie.y = math.random(0, love.graphics.getHeight())
    elseif size == 2 then
        zombie.x = math.random(0, love.graphics.getHeight())
        zombie.y = -30
    elseif size == 3 then
        zombie.x = love.graphics.getWidth() + 30
        zombie.y = math.random(0, love.graphics.getHeight())
    elseif size == 4 then
        zombie.x = math.random(0, love.graphics.getHeight())
        zombie.y = love.graphics.getHeight() + 30
    end

    table.insert( zombies, zombie )
end

-- Spawn the bullet shooted
function spawnBullet()
    bullet = {}
    bullet.x = player.x
    bullet.y = player.y
    bullet.speed = 500
    bullet.direction = player_mouse_angle()
	bullet.dead = false

    table.insert(bullets, bullet)
end