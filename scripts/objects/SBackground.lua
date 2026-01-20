local SBackground, super = Class(Object)

function SBackground:init(texture, wrap_texture_x, wrap_texture_y)
    super:init(self)

    self.sprite = Sprite(texture, 0, 0)
    self:addChild(self.sprite)
    self.sprite:setScale(1)
    self.layer = WORLD_LAYERS["bottom"]

    if wrap_texture_x ~= nil then
        self.sprite.wrap_texture_x = true
        self.sprite.physics.speed_x = wrap_texture_x
    end
    if wrap_texture_y ~= nil then
        self.sprite.wrap_texture_y = true
        self.sprite.physics.speed_y = wrap_texture_y
    end
end

return SBackground