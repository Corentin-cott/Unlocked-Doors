local Map, super = Class(Map)

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