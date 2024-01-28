local enemy = {}

local attributePoints = 60
local x = math.random(30)
enemy.maxHealth = x
enemy.health = enemy.maxHealth
attributePoints = 60 - x
x = math.random(attributePoints)
enemy.attack = x
enemy.defense = attributePoints - x

return enemy