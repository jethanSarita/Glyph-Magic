#Condition
execute as @e[type=item_frame,nbt={Item:{id:"minecraft:breeze_rod",count:1},Facing:0b}] at @s if block ~ ~ ~ minecraft:soul_lantern[hanging=true] run summon marker ~ ~ ~ {Tags:["anchor"]}

#anchor
##ran1
execute as @e[type=marker,tag=anchor,tag=!ran1] at @s run summon marker ~ ~ ~ {Tags:["anchor_ray","down"]}
execute as @e[type=marker,tag=anchor,tag=!ran1] at @s run kill @e[type=item_frame,nbt={Item:{id:"minecraft:breeze_rod",count:1}},distance=..0.5]
execute as @e[type=marker,tag=anchor,tag=!ran1] at @s run setblock ~ ~ ~ lantern[hanging=true]
execute as @e[type=marker,tag=anchor,tag=!ran1] at @s run particle entity_effect{color:[0.733,0.400,0.212,1.00]} ~ ~-0.7 ~ 0.2 0.15 0.2 0.01 100 force
execute as @e[type=marker,tag=anchor,tag=!ran1] at @s run playsound item.chorus_fruit.teleport master @a ~ ~ ~ 1.0 0.0 0.0
execute as @e[type=marker,tag=anchor,tag=!ran1] at @s run playsound block.amethyst_block.break master @a ~ ~ ~
##Glyph Visuals
execute as @e[type=marker,tag=anchor] at @s run tp @s ~ ~ ~ ~1 ~
###!On
execute as @e[type=marker,tag=anchor,tag=!on] at @s positioned ~ ~-0.7 ~ run function glyph:levitation/anchor_glyph
###On
execute as @e[type=marker,tag=anchor,tag=on] at @s positioned ~ ~-0.7 ~ run function glyph:levitation/anchor_glyph_on

#Ran1
tag @e[type=marker,tag=anchor,tag=!ran1] add ran1

#Ray
##Movement
execute as @e[type=marker,tag=anchor_ray,tag=up] at @s run tp @s ~ ~0.5 ~
execute as @e[type=marker,tag=anchor_ray,tag=down] at @s run tp @s ~ ~-0.5 ~
##Ray Particles
execute as @e[type=marker,tag=anchor_ray,tag=down,tag=!not_found] at @s run particle dust{color:[1.000,0.835,0.000],scale:1} ~ ~ ~ 0 0.125 0 0 1
execute as @e[type=marker,tag=anchor_ray,tag=up,tag=not_found] at @s run particle dust{color:[0.008,0.467,0.478],scale:1} ~ ~ ~ 0 0.125 0 0 1
execute as @e[type=marker,tag=anchor_ray,tag=down,tag=not_found] at @s run particle dust{color:[0.008,0.467,0.478],scale:1} ~ ~ ~ 0 0.125 0 0 1
execute as @e[type=marker,tag=anchor_ray,tag=up,tag=found] at @s run particle dust{color:[0.96, 0.96, 0.96],scale:1} ~ ~ ~ 0 0.125 0 0 1
##Down Conitions
##>Bounce Puff
execute as @e[type=marker,tag=anchor_ray,tag=down] at @s unless block ~ ~ ~ air unless entity @e[type=marker,tag=anchor,distance=..0.5] run particle cloud ~ ~0.25 ~ 0.3 0 0.3 0 5 force
##>Tagging Levitation Glyph -> anchored
execute as @e[type=marker,tag=anchor_ray,tag=down] at @s unless block ~ ~ ~ air unless entity @e[type=marker,tag=anchor,distance=..0.5] if entity @e[type=marker,tag=levitation,distance=..1] run tag @e[type=marker,tag=levitation,distance=..1] add anchored
##>Add checker marker on levitation glyph
execute as @e[type=marker,tag=anchor_ray,tag=down] at @s unless block ~ ~ ~ air unless entity @e[type=marker,tag=anchor,distance=..0.5] as @e[type=marker,tag=levitation,distance=..1] at @s run summon marker ~ ~ ~ {Tags:["checker"]}
##>Tagging Self -> found
execute as @e[type=marker,tag=anchor_ray,tag=down] at @s unless block ~ ~ ~ air unless entity @e[type=marker,tag=anchor,distance=..0.5] if entity @e[type=marker,tag=levitation,distance=..1] run tag @s add found
##>Bounce Sound
execute as @e[type=marker,tag=anchor_ray,tag=down] at @s unless block ~ ~ ~ air unless entity @e[type=marker,tag=anchor,distance=..0.5] run playsound block.amethyst_block.break master @a ~ ~ ~
##>Tagging self -> not_found
execute as @e[type=marker,tag=anchor_ray,tag=down] at @s unless block ~ ~ ~ air unless entity @e[type=marker,tag=anchor,distance=..0.5] unless entity @e[type=marker,tag=levitation,distance=..1] run tag @s add not_found
##>Bounce up
execute as @e[type=marker,tag=anchor_ray,tag=down,tag=!noclip] at @s unless block ~ ~ ~ air unless entity @e[type=marker,tag=anchor,distance=..0.5] run tag @s add up
execute as @e[type=marker,tag=anchor_ray,tag=down,tag=!noclip] at @s unless block ~ ~ ~ air unless entity @e[type=marker,tag=anchor,distance=..0.5] run tag @s remove down
##Up Conitions
###Not Found
execute as @e[type=marker,tag=anchor] at @s if entity @e[type=marker,tag=anchor_ray,tag=up,tag=not_found,distance=..0.75] run tag @s add not_found
###Found
execute as @e[type=marker,tag=anchor] at @s if entity @e[type=marker,tag=anchor_ray,tag=up,tag=found,distance=..0.75] run tag @s add on
scoreboard players add @e[type=marker,tag=anchor_ray,tag=up,tag=found] glyph_timer 1
execute as @e[type=marker,tag=anchor_ray,tag=up,tag=found,scores={glyph_timer=5}] at @s run summon marker ~ ~ ~ {Tags:["levitation_spot","on"]}
scoreboard players reset @e[type=marker,tag=anchor_ray,tag=up,tag=found,scores={glyph_timer=5..}] glyph_timer
##Up End
execute as @e[type=marker,tag=anchor_ray,tag=up] at @s if entity @e[type=marker,tag=anchor,distance=..0.5] run kill @s
##Clear levitation spots
execute as @e[type=marker,tag=anchor_ray,tag=not_found] at @s run kill @e[type=marker,tag=levitation_spot,distance=..1]
##Collision Rays End
execute as @e[type=marker,tag=anchor_ray,tag=not_found] at @s run tag @e[type=marker,tag=anchor_ray,tag=not_found,distance=0.1..1] add ray_death

#Ray End
execute as @e[type=marker,tag=anchor_ray,tag=not_found,tag=ray_death] at @s run particle soul ~ ~-0.5 ~ 0.125 0.125 0.125 0 250 force
execute as @e[type=marker,tag=anchor_ray,tag=not_found,tag=ray_death] at @s run kill @s

#Not Found
execute as @e[type=marker,tag=anchor,tag=not_found] at @s if block ~ ~ ~ lantern[hanging=true] run setblock ~ ~ ~ soul_lantern[hanging=true]
execute as @e[type=marker,tag=anchor,tag=not_found] at @s run particle soul ~ ~-0.5 ~ 0.125 0.125 0.125 0 250 force
execute as @e[type=marker,tag=anchor,tag=not_found] at @s run playsound block.amethyst_block.break master @a ~ ~ ~
execute as @e[type=marker,tag=anchor,tag=not_found] at @s run playsound entity.armor_stand.break master @a ~ ~ ~ 1 0
execute as @e[type=marker,tag=anchor,tag=not_found] at @s run playsound minecraft:entity.allay.death master @a ~ ~ ~ 1 0.5
execute as @e[type=marker,tag=anchor,tag=not_found] at @s run kill @s

#On
##Ran2
execute as @e[type=marker,tag=anchor,tag=on,tag=!ran2] at @s run particle entity_effect{color:[1.00, 0.98, 0.94,1.00]} ~ ~-0.7 ~ 0.2 0.15 0.2 0.01 100 force
execute as @e[type=marker,tag=anchor,tag=on,tag=!ran2] at @s run playsound block.amethyst_block.break master @a ~ ~ ~
execute as @e[type=marker,tag=anchor,tag=on,tag=!ran2] at @s run playsound entity.armor_stand.break master @a ~ ~ ~ 1 0
execute as @e[type=marker,tag=anchor,tag=on,tag=!ran2] at @s run playsound item.chorus_fruit.teleport master @a ~ ~ ~ 1.0 0.0 0.0

#Ran2
tag @e[type=marker,tag=anchor,tag=on,tag=!ran2] add ran2

#Levitation Spot
##Particle1
execute as @e[type=marker,tag=levitation_spot] at @s run particle end_rod ~ ~ ~ 0 0 0 0 0
scoreboard players add @e[type=marker,tag=levitation_spot] glyph_timer 1
execute as @e[type=marker,tag=levitation_spot,scores={glyph_timer=10..}] at @s run particle end_rod ~ ~ ~ 0.75 0.75 0.75 0 1
scoreboard players reset @e[type=marker,tag=levitation_spot,scores={glyph_timer=10..}] glyph_timer
##Particle2
execute as @e[type=marker,tag=levitation_spot,tag=on] at @s as @e[distance=..4,type=item] at @s run particle minecraft:cloud ~ ~-0.25 ~ 0 0 0 0 1 force
execute as @e[type=marker,tag=levitation_spot,tag=on] at @s as @e[distance=..4,type=!player,type=!item,type=!marker] at @s run particle minecraft:cloud ~ ~-0.25 ~ 0 0 0 0 1 force
execute as @e[type=marker,tag=levitation_spot,tag=on] at @s as @e[distance=..4,scores={shift_time=1..}] at @s run particle minecraft:cloud ~ ~-0.25 ~ 0 0 0 0 1 force
##Particle3 #Unused
execute as @e[type=marker,tag=levitation_spot,tag=!on] at @s as @e[distance=..4,type=item,nbt={OnGround:0b}] at @s run particle minecraft:cloud ~ ~-0.25 ~ 0 0 0 0 1 force
execute as @e[type=marker,tag=levitation_spot,tag=!on] at @s as @e[distance=..4,type=!player,type=!item,type=!marker,nbt={OnGround:0b}] at @s run particle minecraft:cloud ~ ~-0.25 ~ 0 0 0 0 1 force
execute as @e[type=marker,tag=levitation_spot,tag=!on] at @s as @e[distance=..4,scores={shift_time=1..},nbt={OnGround:0b}] at @s run particle minecraft:cloud ~ ~-0.25 ~ 0 0 0 0 1 force
##Effects
execute as @e[type=marker,tag=levitation_spot,tag=on] at @s run effect give @a[distance=..3,scores={shift_time=1..}] minecraft:levitation 1 5 true
execute as @e[type=marker,tag=levitation_spot,tag=on] at @s run effect give @e[distance=..3,type=!player,type=!item] minecraft:levitation 1 5 true
execute as @e[type=marker,tag=levitation_spot,tag=on] at @s run effect give @a[distance=..3] minecraft:slow_falling 4 0 true
execute as @e[type=marker,tag=levitation_spot,tag=on] at @s run effect give @e[distance=..3,type=!player,type=!item] minecraft:slow_falling 4 0 true
execute as @e[type=marker,tag=levitation_spot,tag=on] at @s as @e[distance=..4,type=item] run data merge entity @s {Motion:[0.0,0.5,0.0]}

#Checker
##ran3
execute as @e[type=marker,tag=checker] at @s unless entity @e[type=marker,tag=levitation,distance=..0.1] run tag @s add send
execute as @e[type=marker,tag=checker] at @s if entity @e[type=marker,tag=anchor_ray,tag=not_found,distance=..1.5] run kill @s
execute as @e[type=marker,tag=checker,tag=send,tag=!ran3] at @s run playsound block.amethyst_block.break master @a ~ ~ ~
execute as @e[type=marker,tag=checker,tag=send,tag=!ran3] at @s run summon marker ~ ~1 ~ {Tags:["anchor_ray","up","not_found"]}
execute as @e[type=marker,tag=checker,tag=send,tag=!ran3] at @s run kill @s

#Checker2
execute as @e[type=marker,tag=anchor,tag=on] at @s unless block ~ ~ ~ lantern[hanging=true] run tag @s add send
execute as @e[type=marker,tag=anchor,tag=on,tag=send,tag=!ran3] at @s run summon marker ~ ~-1 ~ {Tags:["anchor_ray","down","not_found","noclip"]}
execute as @e[type=marker,tag=anchor,tag=on,tag=send,tag=!ran3] at @s run playsound block.amethyst_block.break master @a ~ ~ ~
execute as @e[type=marker,tag=anchor,tag=on,tag=send,tag=!ran3] at @s run playsound entity.armor_stand.break master @a ~ ~ ~
execute as @e[type=marker,tag=anchor,tag=on,tag=send,tag=!ran3] at @s run playsound entity.allay.death master @a ~ ~ ~ 1 0.5
execute as @e[type=marker,tag=anchor,tag=on,tag=send,tag=!ran3] at @s run particle entity_effect{color:[0.733,0.400,0.212,1.00]} ~ ~-0.7 ~ 0.2 0.15 0.2 0.01 100 force
execute as @e[type=marker,tag=anchor,tag=on,tag=send,tag=!ran3] at @s run kill @s

#Ran3
tag @e[type=marker,tag=anchor,tag=send,tag=!ran3] add ran3