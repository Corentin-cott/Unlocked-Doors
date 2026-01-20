function Mod:init()
    print("Loaded "..self.info.name.."!")
    if new_file then
        self.save_name = "Chara"
    end
end