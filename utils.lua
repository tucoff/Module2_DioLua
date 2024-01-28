local utils = {}

function utils.showAttributes(entity) 
    local vida = ""
    local ataque = ""
    local defesa = ""
    for i = 1, entity.maxHealth, 1 do
        if entity.health >= i then
            vida = vida .. "🧡"
        else
            vida = vida .. "💔"
        end 
    end
    print("VIDA:   " .. vida)
    for i = 1, 20, 1 do
        if entity.attack >= i then
            ataque = ataque .. "🟨"
        else
            ataque = ataque .. "⬛"
        end 
    end
    print("ATAQUE: " .. ataque)
    for i = 1, 20, 1 do
        if entity.defense >= i then
            defesa = defesa .. "🟨"
        else
            defesa = defesa .. "⬛"
        end 
    end
    print("DEFESA: " .. defesa)
end

function utils.enableUtf8()
    os.execute("chcp 65001")
end

return utils