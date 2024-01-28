-- DEPEDENCIES
local player = require("definitions.player")
local enemy = require("definitions.enemy")
local utils = require("utils")
utils.enableUtf8()

-- HEADER
print([[
======================================================    

                  /| ________________
            O|===|* >________________>
                  \|

                -----------------------
                ⨈⨐⨤⨂⨫⨣⨰ ⪋⩴⪴ ⪺⫎⫈⫪⫽⫶⫳⫱⫱⫰⩸⩊
                 SIMULADOR DE BATALHAS 

======================================================
        Você empunha sua espada e se prepara
          para lutar. É hora da batalha!]])

-- CRIAÇÃO DE PERSONAGEM
print("Esteja preparado para a batalha " .. player.name .. "! Pois um poderoso inimigos está a solta!")
print("Você tem " .. player.attributePoints .. " pontos de atributos para distribuir entre ataque e defesa!")
print("Quantos pontos você deseja colocar em ataque? (Saiba que os pontos remanescentes serão alocados imediatamente em defesa.)")
local x = io.read("*n")
if x > player.attributePoints then
    player.attack = player.attributePoints
    player.attributePoints = 0
else
    if x < 0 then  
        x = 0
    end
    player.attack = x
    player.attributePoints = player.attributePoints - x
end
player.defense = player.attributePoints

utils.showAttributes(player)

print("")
print("CUIDADO!!!!!! O inimigo está na sua frente!!")
print("E os atributos desse ser maligno são:")

utils.showAttributes(enemy)

local win = false

-- LOOP
while true do

    print("Escolha sua acção!")
    print("1. Ataque")
    print("2. Use poção")
    print("3. Fuja")

    local choose = io.read("*n")

    if choose == 1 then
        if math.random(10) > 4 then 
            enemy.health = enemy.health + (enemy.defense/3) - (player.attack/1.5)
            print("Seu golpe em cheio!!")
        else
            print("Seu golpe errou!")
        end
        print("Agora é a vez o inimigo golpear!")
        if math.random(10) > 7 then 
            player.health = player.health + (player.defense/3) - (enemy.attack/1.5)
            print("Golpe do inimigo veio em cheio!!")
        else
            print("O golpe do inimigo errou!")
        end
    end

    if choose == 2 then 
        if player.potions > 0 and player.health < player.maxHealth then
            player.health = player.maxHealth
            print("Tomou poção!")
            player.potions = player.potions - 1
        else
            print("Não foi possível tomar poção...")
        end
    end

    if choose == 3 then
        if math.random(4) > 3 then 
            print("Desviou!!")
        else
            print("Não foi possível desviar!!! O golpe acertou em cheio.")
            player.health = player.health + (player.defense/3) - (enemy.attack/1.5)
        end
    end

    print("==========================")
    print("Vida do Player")
    utils.showAttributes(player)
    print("==========================")
    print("Vida do Inimigo")
    utils.showAttributes(enemy)

    if enemy.health <= 0 then
        win = true
        break
    end

    if player.health <= 0 then
        break
    end

end

if win then 
    print("VOCÊ SALVOU O MUNDO!!! PARABÉNSSSSS!!!!!!")
else
    print("Você falhou, agora o mundo será destruído pois ninguem mais poderá parar ele. Fim...")
end