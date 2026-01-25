local WaterfallArea, super = Class(Event, "waterfallarea")

function WaterfallArea:init(data)
    super:init(self, data.x, data.y, data.width, data.height)

    self:setHitbox(20, 48, 28, 24)

    self:setOrigin(0.5, 0)

    self.disabled = false
    self.shoot_speed = data.properties["shootspeed"] or 10

    self.shoot_timer = 0

    self.rate = (data.properties["rate"] or 5) * 0.1
    self.rate_variance = (data.properties["ratevariance"] or 2) * 0.1
    
    self.rate = (data.properties["rate"] or 5) * 0.1
    self.next_shot_time = self:getNextShotTime()
    
    self.stop_if_player_bellows = data.properties["stopifplayerbellows"] or false

    self.height = data.height or 200
end

function WaterfallArea:update()
    super:update(self)

    if self.disabled or not Game.world or not Game.world.player then
        if self.stop_if_player_bellows and Game.world.player.y < self.y + self.height then
            self.shoot_timer = 0
        end
        return
    end

    self.shoot_timer = self.shoot_timer + DT

    if self.shoot_timer >= self.next_shot_time then
        self.shoot_timer = 0
        self.next_shot_time = self:getNextShotTime()

        local random_x = Utils.random(self.x, self.x + self.width)
        local top_area = self.y

        local bullet = self.world:spawnBullet(
            "waterdrop",
            random_x,
            top_area,
            math.rad(90),
            top_area + self.height,
            0.15
        )

        bullet.physics.speed = self.shoot_speed
    end
end

function WaterfallArea:getNextShotTime()
    return math.max(0.05, Utils.random(
        self.rate - self.rate_variance,
        self.rate + self.rate_variance
    ))
end


return WaterfallArea