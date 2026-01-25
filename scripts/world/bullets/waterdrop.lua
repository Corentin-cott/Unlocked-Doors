local Waterdrop, super = Class(WorldBullet)

function Waterdrop:init(x, y, direction, waterfall_bottom, fade_speed)
    super.init(self, x, y, "bullets/waterdrop_bullet")

    self.damage = 15

    self.alpha = 1

    self.physics.speed = 5
    self.physics.direction = direction

    self.timer = 0
    self.collidable = false

    self.battle_fade = false

    self.waterfall_bottom = waterfall_bottom or 600
    self.fade_speed = fade_speed or 0.05
end

function Waterdrop:update()
    local screen_x, screen_y = self:getScreenPos()

    if self.y >= self.waterfall_bottom then
        self.alpha = self.alpha - self.fade_speed
        self.sprite.alpha = self.alpha

        if self.alpha <= 0 then
            self:remove()
        end
    end
    
    super.update(self)
end

function Waterdrop:draw()
    love.graphics.setColor(1, 1, 1, self.alpha)
    super.draw(self)
    love.graphics.setColor(1, 1, 1, 1)
end

return Waterdrop