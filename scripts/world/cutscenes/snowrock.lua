return {
    ---@param cutscene WorldCutscene
    savepoint = function(cutscene, event)
        if Game:getFlag("first_save_done") then
            cutscene:text("* The fact that you are now able to run makes you feel empowered.")
            cutscene:text("* You are filled with RUNNING POWER.")
            return
        end
        cutscene:text("* Despite not understanding how you got here,[wait:10] you can feel a sense of familiarity.")
        cutscene:text("* You admire the view that greets you in this strange place,[wait:10] before noticing something...")
        cutscene:text("* The power,[wait:10] The light that you felt at the start of your journey,[wait:10] It's calling...")
        cutscene:text("* You extend your hand towards the light, and...")
        Game:setFlag("first_save_done", true)
    end,

    wall = function(cutscene, event)
        -- Open textbox and wait for completion
        cutscene:text("* The wall seems cracked.")

        -- If we have Susie, play a cutscene
        local susie = cutscene:getCharacter("susie")
        if susie then
            -- Detach camera and followers (since characters will be moved)
            cutscene:detachCamera()
            cutscene:detachFollowers()

            -- All text from now is spoken by Susie
            cutscene:setSpeaker(susie)
            cutscene:text("* Hey,[wait:5] think I can break\nthis wall?", "smile")

            -- Get the bottom-center of the broken wall
            local x = event.x + event.width/2
            local y = event.y + event.height/2

            -- Move Susie up to the wall over 0.75 seconds
            cutscene:walkTo(susie, x, y + 40, 0.75, "up")
            -- Move other party members behind Susie
            cutscene:walkTo(Game.world.player, x, y + 100, 0.75, "up")
            if cutscene:getCharacter("ralsei") then
                cutscene:walkTo("ralsei", x + 60, y + 100, 0.75, "up")
            end
            if cutscene:getCharacter("noelle") then
                cutscene:walkTo("noelle", x - 60, y + 100, 0.75, "up")
            end

            -- Wait 1.5 seconds
            cutscene:wait(1.5)

            -- Walk back,
            cutscene:wait(cutscene:walkTo(susie, x, y + 60, 0.5, "up", true))
            -- and run forward!
            cutscene:wait(cutscene:walkTo(susie, x, y + 20, 0.2))

            -- Slam!!
            Assets.playSound("impact")
            susie:shake(4)
            susie:setSprite("shock_up")

            -- Slide back a bit
            cutscene:slideTo(susie, x, y + 40, 0.1)
            cutscene:wait(1.5)

            -- owie
            susie:setAnimation({"away_scratch", 0.25, true})
            susie:shake(4)
            Assets.playSound("wing")

            cutscene:wait(1)
            cutscene:text("* Guess not.", "nervous")

            -- Reset Susie's sprite
            susie:resetSprite()

            -- Reattach the camera
            cutscene:attachCamera()

            -- Align the follower positions behind Kris's current position
            cutscene:alignFollowers()
            -- And reattach them, making them return to their target positions
            cutscene:attachFollowers()
            Game:setFlag("wall_hit", true)
        end
    end

    
}
