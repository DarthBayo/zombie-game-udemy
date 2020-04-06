-- Get Mouse position
function player_mouse_angle()
    return math.atan2(player.y - love.mouse.getY(), player.x - love.mouse.getX()) + math.pi
end

-- Get mouse position to zombie walk
function zombie_player_angle(enemy)
    return math.atan2(enemy.y - player.y, enemy.x - player.x) + math.pi
end

-- Get the distance between to points
function distanceBetween(x1, y1, x2, y2)
    return math.sqrt( (x1 - x2)^2 + (y1 - y2)^2 )
end
