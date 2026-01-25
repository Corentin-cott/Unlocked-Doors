local Player, super = Class("Player", true)

function Player:init(...)
    super:init(self, ...)
    
    self.frisk_dance_detector = Game.world:spawnObject(FriskDanceDetector(0, 0))
	self:addChild(self.frisk_dance_detector)
    self.frisk_dance_detector:setSprite("frisk_dance_detector")
    self.frisk_dance_detector:setOrigin(0, 0)
    local _, _, _, hitboxY = self:getHitbox()
    self.frisk_dance_detector:setPosition(self.frisk_dance_detector.x, self.frisk_dance_detector.y + self.height - hitboxY)
    self.frisk_dance_detector:setHitbox(0, 0, self.width, 1)
end

function Player:update()
    super:update(self)

    if Input.down("up") and Input.down("down") and self.frisk_dance_detector.collided then
        self:move(0, self.walk_speed + 2)
        self:setFacing("down")
    end
end

return Player