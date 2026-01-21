local Map, super = Class(Map)

function Map:load()
    super:load(self)

    -- Background layers
    self.fluffball = Game.world:addChild(Game.world:spawnObject(SBackground("tilesets/background/snowrock/background_fluffball")))
    self.clouds = Game.world:addChild(Game.world:spawnObject(SBackground("tilesets/background/snowrock/clouds", -0.3)))
    self.b_background = Game.world:addChild(Game.world:spawnObject(SBackground("tilesets/background/snowrock/background_back_layer")))
    self.b_background.sprite.wrap_texture_x = true
    self.m_background = Game.world:addChild(Game.world:spawnObject(SBackground("tilesets/background/snowrock/background_middle_layer")))
    self.m_background.sprite.wrap_texture_x = true
    self.f_background = Game.world:addChild(Game.world:spawnObject(SBackground("tilesets/background/snowrock/background_front_layer")))
    self.f_background.sprite.wrap_texture_x = true

    -- Parallax settings
    self.clouds.parallax_x = 0.05
    self.b_background.parallax_x = 0.4
    self.m_background.parallax_x = 0.2
    self.fluffball.parallax_x = 0.003

    -- Layer positions
    self.f_background.y = -1
    self.m_background.y = -2
    self.fluffball.y = -3
    self.b_background.y = -4
    self.clouds.y = -5
end

function Map:onExit()
    -- Remove background sprites
    self.clouds.sprite:remove()
    self.f_background.sprite:remove()
    self.m_background.sprite:remove()
    self.b_background.sprite:remove()
    self.fluffball.sprite:remove()

    -- Remove background objects
    self.clouds:remove()
    self.f_background:remove()
    self.m_background:remove()
    self.b_background:remove()
    self.fluffball:remove()
end

function Mod:onFootstep(chara, num)
    if chara:includes(Player) then
        if love.math.random(1, 2) == 1 then
            Assets.stopAndPlaySound("step1")
        else
            Assets.stopAndPlaySound("step2")
        end
    end
end

return Map