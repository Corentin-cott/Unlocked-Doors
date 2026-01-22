function Mod:init()
    print("Loaded "..self.info.name.."!")
    if new_file then
        self.save_name = "Chara"
    end
end

function Mod:postUpdate()
    --if Input.down("up") and Input.down("down") and Game.world:checkCollision(Game.world.player.interact_collider["up"]) and Game.world.player.facing == "up" then
    --    Game.world.player:move(0, Game.world.player.height)
    --    Game.world.player:setFacing("down")
    --end
end
