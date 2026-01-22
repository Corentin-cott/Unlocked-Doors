local FriskDanceDetector, super = Class(Object)

function FriskDanceDetector:init(x, y)
    super:init(self, x, y)

    self:setHitbox(0, 0, 0, 0)
end

function FriskDanceDetector:setSprite(sprite)
    if self.sprite then self.sprite:remove() end
    self.sprite = Sprite(sprite)

    self:addChild(self.sprite)
end

function FriskDanceDetector:update()
    self.collided = Game.world:checkCollision(self)
end

return FriskDanceDetector