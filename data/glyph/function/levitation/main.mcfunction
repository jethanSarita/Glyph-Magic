#Condition
execute as @e[type=item_frame,nbt={Item:{id:"minecraft:wind_charge",count:1}}] at @s if block ~ ~-1 ~ minecraft:soul_campfire if block ~-1 ~-1 ~-1 redstone_wire if block ~ ~-1 ~-1 redstone_wire if block ~1 ~-1 ~-1 redstone_wire if block ~-1 ~-1 ~ redstone_wire if block ~1 ~-1 ~ redstone_wire if block ~-1 ~-1 ~1 redstone_wire if block ~ ~-1 ~1 redstone_wire if block ~1 ~-1 ~1 redstone_wire run summon marker ~ ~-1 ~ {Tags:["levitation"]}

#Glyph Visuals
execute at @e[type=marker,tag=levitation] positioned ~ ~ ~ run function glyph:levitation/levitation_glyph
execute as @e[type=marker,tag=levitation] at @s run tp @s ~ ~ ~ ~1 ~

#Spawning
execute as @e[type=marker,tag=levitation,tag=!ran1] at @s run kill @e[distance=..1,type=item_frame,nbt={Item:{id:"minecraft:wind_charge",count:1}}]
execute as @e[type=marker,tag=levitation,tag=!ran1] at @s run fill ~-1 ~ ~-1 ~1 ~ ~1 air
execute as @e[type=marker,tag=levitation,tag=!ran1] at @s run particle entity_effect{color:[0.96, 1.00, 0.90,1.00]} ~ ~ ~ 1 0 1 0.01 500 force
execute as @e[type=marker,tag=levitation,tag=!ran1] at @s run playsound minecraft:item.chorus_fruit.teleport master @a ~ ~ ~ 1.0 0.0 0.0

#ran1
tag @e[type=marker,tag=levitation,tag=!ran1] add ran1

#Buff
##Effect
execute as @e[type=marker,tag=levitation,tag=!anchored] at @s run effect give @e[distance=..10,type=!player,type=!item] minecraft:levitation 1 1 true
execute as @e[type=marker,tag=levitation,tag=!anchored] at @s as @e[distance=..10,type=item] run data merge entity @s {Motion:[0.0,0.5,0.0]}
execute as @e[type=marker,tag=levitation,tag=!anchored] at @s run effect give @a[distance=..10,scores={shift_time=1..}] minecraft:levitation 1 1 true
execute as @e[type=marker,tag=levitation,tag=!anchored] at @s run effect give @e[distance=..10,type=!player,type=!item] minecraft:slow_falling 1 1 true
execute as @e[type=marker,tag=levitation,tag=!anchored] at @s run effect give @a[distance=..10] minecraft:slow_falling 1 1 true
##Visuals
execute as @e[type=marker,tag=levitation,tag=!anchored] at @s as @e[distance=..10,type=item] at @s run particle minecraft:cloud ~ ~-0.25 ~ 0 0 0 0 1 force
execute as @e[type=marker,tag=levitation,tag=!anchored] at @s as @e[distance=..10,type=!player,type=!item,type=!marker] at @s run particle minecraft:cloud ~ ~-0.25 ~ 0 0 0 0 1 force
execute as @e[type=marker,tag=levitation,tag=!anchored] at @s as @e[distance=..10,scores={shift_time=1..}] at @s run particle minecraft:cloud ~ ~-0.25 ~ 0 0 0 0 1 force

#Sand
execute as @e[type=marker,tag=levitation] at @s if block ~ ~ ~ sand run tag @s add sand
execute as @e[type=marker,tag=levitation,tag=sand,tag=!ran2] at @s run setblock ~ ~ ~ soul_sand
execute as @e[type=marker,tag=levitation,tag=sand,tag=!ran2] at @s run particle entity_effect{color:[0.96, 1.00, 0.90,1.00]} ~ ~ ~ 1 0 1 0.01 500 force
execute as @e[type=marker,tag=levitation,tag=sand,tag=!ran2] at @s run particle soul ~ ~0.5 ~ 0.35 0.35 0.35 0 250 force
execute as @e[type=marker,tag=levitation,tag=sand,tag=!ran2] at @s run playsound minecraft:item.chorus_fruit.teleport master @a ~ ~ ~ 1.0 0.0
execute as @e[type=marker,tag=levitation,tag=sand,tag=!ran2] at @s run playsound entity.allay.death master @a ~ ~ ~ 1.0 0.0
execute as @e[type=marker,tag=levitation,tag=sand,tag=!ran2] at @s run kill @s

#ran2
tag @e[type=marker,tag=levitation,tag=sand,tag=!ran2] add ran2

function glyph:levitation/anchor

#Anchored
execute as @e[type=marker,tag=levitation,tag=!anchored] at @s run particle minecraft:end_rod ~ ~1 ~ 4.5 4.5 4.5 0 1 force

#Anchored broken
execute as @e[type=marker,tag=levitation,tag=anchored] at @s run tag @e[type=marker,tag=anchor_ray,tag=not_found,distance=..1.5] add ray_death
execute as @e[type=marker,tag=levitation,tag=anchored] at @s if entity @e[type=marker,tag=anchor_ray,tag=not_found,distance=..1.5] run particle entity_effect{color:[0.96, 1.00, 0.90,1.00]} ~ ~ ~ 1 0 1 0.01 500 force
execute as @e[type=marker,tag=levitation,tag=anchored] at @s if entity @e[type=marker,tag=anchor_ray,tag=not_found,distance=..1.5] run playsound minecraft:item.chorus_fruit.teleport master @a ~ ~ ~ 1.0 0.0
execute as @e[type=marker,tag=levitation,tag=anchored] at @s if entity @e[type=marker,tag=anchor_ray,tag=not_found,distance=..1.5] run playsound entity.allay.death master @a ~ ~ ~ 1.0 0.0
execute as @e[type=marker,tag=levitation,tag=anchored] at @s if entity @e[type=marker,tag=anchor_ray,tag=not_found,distance=..1.5] run kill @s