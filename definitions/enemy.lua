local enemy = {}

enemy.maxHealth = math.random(30, 100)
enemy.health = enemy.maxHealth
enemy.attack = math.random(15)
enemy.defense = math.random(15)

return enemy