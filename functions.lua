-- Get Mouse position
function player_mouse_angle()
    return math.atan2(player.y - love.mouse.getY(), player.x - love.mouse.getX()) + math.pi
end

-- Get mouse position to zombie walk
function zombie_player_angle(enemy)
    return math.atan2(enemy.y - player.y, enemy.x - player.x) + math.pi
end

-- Spawn the zombies sprites
function spawnZombie()
    zombie = {}
    zombie.x = math.random(0, love.graphics.getWidth())
    zombie.y = math.random(0, love.graphics.getHeight())
    zombie.speed = 100
	zombie.dead = false

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

-- Get the distance between to points
function distanceBetween(x1, y1, x2, y2)
    return math.sqrt( (x1 - x2)^2 + (y1 - y2)^2 )
end
