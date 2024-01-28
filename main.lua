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
print("Esteja preparado para a batalha " .. player.name .. " pois poderosos inimigos estão a solta!")
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

-- LOOP

