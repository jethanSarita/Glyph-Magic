#Breach

#Z Axis
execute as @e[type=item_frame,nbt={Item:{id:"minecraft:gunpowder",count:1},Facing:3b}] at @s if block ~ ~-1 ~ soul_torch run summon marker ~ ~-0.5 ~ {Tags:["breach_z","z-"]}
execute as @e[type=item_frame,nbt={Item:{id:"minecraft:gunpowder",count:1},Facing:2b}] at @s if block ~ ~-1 ~ soul_torch run summon marker ~ ~-0.5 ~ {Tags:["breach_z","z+"]}

#X Axis
execute as @e[type=item_frame,nbt={Item:{id:"minecraft:gunpowder",count:1},Facing:5b}] at @s if block ~ ~-1 ~ soul_torch run summon marker ~ ~-0.5 ~ {Tags:["breach_x","x-"]}
execute as @e[type=item_frame,nbt={Item:{id:"minecraft:gunpowder",count:1},Facing:4b}] at @s if block ~ ~-1 ~ soul_torch run summon marker ~ ~-0.5 ~ {Tags:["breach_x","x+"]}

#Particle System
execute at @e[type=marker,tag=breach_z,tag=!breach_z_red] run function glyph:breach/particle_z
execute at @e[type=marker,tag=breach_x,tag=!breach_x_red] run function glyph:breach/particle_x
execute at @e[type=marker,tag=breach_z,tag=!ran] run particle entity_effect{color:[0.443,0.851,0.890,1.00]} ~ ~ ~ 0.125 0.125 0 0 100 force
execute at @e[type=marker,tag=breach_x,tag=!ran] run particle entity_effect{color:[0.443,0.851,0.890,1.00]} ~ ~ ~ 0 0.125 0.125 0 100 force
execute at @e[type=marker,tag=breach_z_red] run function glyph:breach/particle_z_red
execute at @e[type=marker,tag=breach_x_red] run function glyph:breach/particle_x_red

#Sound
execute at @e[type=marker,tag=breach_z,tag=!ran] run playsound minecraft:item.chorus_fruit.teleport master @a ~ ~ ~ 1.0 0.0 0.0
execute at @e[type=marker,tag=breach_x,tag=!ran] run playsound minecraft:item.chorus_fruit.teleport master @a ~ ~ ~ 1.0 0.0 0.0

#Clear Extra
execute as @e[type=item_frame,nbt={Item:{id:"minecraft:gunpowder",count:1}}] at @s if block ~ ~-1 ~ soul_torch run kill @s
execute at @e[type=marker,tag=breach_z,tag=!ran] run setblock ~ ~-0.5 ~ air destroy
execute at @e[type=marker,tag=breach_x,tag=!ran] run setblock ~ ~-0.5 ~ air destroy
execute at @e[type=marker,tag=breach_z,tag=!ran] run kill @e[type=item,nbt={Item:{id:"minecraft:soul_torch",count:1}},distance=..3]
execute at @e[type=marker,tag=breach_x,tag=!ran] run kill @e[type=item,nbt={Item:{id:"minecraft:soul_torch",count:1}},distance=..3]

#Check for fire
execute as @e[type=marker,tag=breach_z] at @s if block ~ ~-.5 ~ fire run tag @s add breach_z_red
execute as @e[type=marker,tag=breach_x] at @s if block ~ ~-.5 ~ fire run tag @s add breach_x_red
execute as @e[type=marker,tag=breach_z_red,tag=!ran2] at @s if block ~ ~-.5 ~ fire run setblock ~ ~-.5 ~ air destroy
execute as @e[type=marker,tag=breach_x_red,tag=!ran2] at @s if block ~ ~-.5 ~ fire run setblock ~ ~-.5 ~ air destroy
execute as @e[type=marker,tag=breach_z_red,tag=!ran2] at @s run particle minecraft:smoke ~ ~ ~ 0.250 0.250 0 0 100 force
execute as @e[type=marker,tag=breach_x_red,tag=!ran2] at @s run particle minecraft:smoke ~ ~ ~ 0 0.250 0.250 0 100 force

#Run Once System
execute as @e[type=marker,tag=breach_z] run tag @s add ran
execute as @e[type=marker,tag=breach_x] run tag @s add ran
execute as @e[type=marker,tag=breach_z_red] run tag @s add ran2
execute as @e[type=marker,tag=breach_x_red] run tag @s add ran2

#Timer System
execute as @e[type=marker,tag=breach_z_red] run scoreboard players add @s glyph_timer 1
execute as @e[type=marker,tag=breach_x_red] run scoreboard players add @s glyph_timer 1

#Priming
execute as @e[type=marker,tag=breach_z_red,scores={glyph_timer=1..}] at @s run particle minecraft:smoke ~ ~ ~ 0 0 0 .05 1 force
execute as @e[type=marker,tag=breach_x_red,scores={glyph_timer=1..}] at @s run particle minecraft:smoke ~ ~ ~ 0 0 0 .05 1 force
execute as @e[type=marker,tag=breach_z_red,scores={glyph_timer=1}] at @s run playsound entity.tnt.primed master @a ~ ~ ~ 1.0 0.0 0.0
execute as @e[type=marker,tag=breach_x_red,scores={glyph_timer=1}] at @s run playsound entity.tnt.primed master @a ~ ~ ~ 1.0 0.0 0.0

#Explosion
execute as @e[type=marker,tag=breach_z_red,scores={glyph_timer=80}] at @s run fill ~ ~.5 ~-.5 ~ ~-.5 ~.5 air destroy
execute as @e[type=marker,tag=breach_x_red,scores={glyph_timer=80}] at @s run fill ~-.5 ~.5 ~ ~.5 ~-.5 ~ air destroy
execute as @e[type=marker,tag=breach_z_red,scores={glyph_timer=80}] at @s run playsound entity.generic.explode master @a ~ ~ ~ 1.0 0.0 0.0
execute as @e[type=marker,tag=breach_x_red,scores={glyph_timer=80}] at @s run playsound entity.generic.explode master @a ~ ~ ~ 1.0 0.0 0.0
execute as @e[type=marker,tag=breach_z_red,scores={glyph_timer=80..}] at @s run particle minecraft:explosion ~ ~ ~ 0 0 0 0 0 force
execute as @e[type=marker,tag=breach_x_red,scores={glyph_timer=80..}] at @s run particle minecraft:explosion ~ ~ ~ 0 0 0 0 0 force
execute as @e[type=marker,tag=breach_z_red,scores={glyph_timer=80..}] run kill @s
execute as @e[type=marker,tag=breach_x_red,scores={glyph_timer=80..}] run kill @s

#Sugar
execute as @e[type=marker,tag=breach_z] at @s if entity @e[distance=..0.5,type=item,nbt={Item:{id:"minecraft:sugar",count:1}}] run tag @s add breach_z_sugar
execute as @e[type=marker,tag=breach_x] at @s if entity @e[distance=..0.5,type=item,nbt={Item:{id:"minecraft:sugar",count:1}}] run tag @s add breach_x_sugar
execute as @e[type=marker,tag=breach_z_sugar,tag=!ran3] at @s run kill @e[distance=..0.5,type=item,nbt={Item:{id:"minecraft:sugar",count:1}}]
execute as @e[type=marker,tag=breach_x_sugar,tag=!ran3] at @s run kill @e[distance=..0.5,type=item,nbt={Item:{id:"minecraft:sugar",count:1}}]
execute as @e[type=marker,tag=breach_z_sugar,tag=!ran3] at @s run summon item_display ~ ~ ~ {Tags:["breach_sugar_z"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]},item:{id:"minecraft:sugar",count:1}}
execute as @e[type=marker,tag=breach_x_sugar,tag=!ran3] at @s run summon item_display ~ ~ ~ {Tags:["breach_sugar_x"],transformation:{left_rotation:[0f,1f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]},item:{id:"minecraft:sugar",count:1}}
execute as @e[type=marker,tag=breach_z_sugar,tag=!ran3] at @s run playsound entity.item.pickup master @a ~ ~ ~ 1.0 0.5 0.0
execute as @e[type=marker,tag=breach_x_sugar,tag=!ran3] at @s run playsound entity.item.pickup master @a ~ ~ ~ 1.0 0.5 0.0
execute as @e[type=marker,tag=breach_z_sugar,tag=breach_z_red,tag=!ran4] run scoreboard players set @s glyph_timer 70
execute as @e[type=marker,tag=breach_x_sugar,tag=breach_x_red,tag=!ran4] run scoreboard players set @s glyph_timer 70

#Sugar display
execute as @e[type=item_display,tag=breach_sugar_z] at @s unless entity @e[type=marker,tag=breach_z,distance=..0.1] run kill @s
execute as @e[type=item_display,tag=breach_sugar_x] at @s unless entity @e[type=marker,tag=breach_x,distance=..0.1] run kill @s

#Ran3
execute as @e[type=marker,tag=breach_z_sugar,tag=!ran3] run tag @s add ran3
execute as @e[type=marker,tag=breach_x_sugar,tag=!ran3] run tag @s add ran3

#Ran4
execute as @e[type=marker,tag=breach_z_sugar,tag=breach_z_red,tag=!ran4] run tag @s add ran4
execute as @e[type=marker,tag=breach_x_sugar,tag=breach_x_red,tag=!ran4] run tag @s add ran4

#Ink
execute as @e[type=marker,tag=breach_z] at @s if entity @e[distance=..0.5,type=item,nbt={Item:{id:"minecraft:glow_ink_sac",count:1}}] run tag @s add breach_z_ink
execute as @e[type=marker,tag=breach_x] at @s if entity @e[distance=..0.5,type=item,nbt={Item:{id:"minecraft:glow_ink_sac",count:1}}] run tag @s add breach_x_ink
execute as @e[type=marker,tag=breach_z_ink,tag=!ran5] at @s run kill @e[distance=..0.5,type=item,nbt={Item:{id:"minecraft:glow_ink_sac",count:1}}]
execute as @e[type=marker,tag=breach_x_ink,tag=!ran5] at @s run kill @e[distance=..0.5,type=item,nbt={Item:{id:"minecraft:glow_ink_sac",count:1}}]
#Sound
execute as @e[type=marker,tag=breach_z_ink,tag=!ran5] at @s run playsound entity.item.pickup master @a ~ ~ ~ 1.0 0.5 0.0
execute as @e[type=marker,tag=breach_x_ink,tag=!ran5] at @s run playsound entity.item.pickup master @a ~ ~ ~ 1.0 0.5 0.0
execute as @e[type=marker,tag=breach_z_ink,tag=!ran5] at @s run summon item_display ~ ~ ~ {Tags:["breach_ink_z"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]},item:{id:"minecraft:glow_ink_sac",count:1}}
execute as @e[type=marker,tag=breach_x_ink,tag=!ran5] at @s run summon item_display ~ ~ ~ {Tags:["breach_ink_x"],transformation:{left_rotation:[0f,1f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.5f,0.5f,0.5f]},item:{id:"minecraft:glow_ink_sac",count:1}}

#Glow Ink Deployment
execute as @e[type=marker,tag=breach_z_ink,tag=z+,scores={glyph_timer=75}] at @s run summon item ~ ~ ~1.5 {PickupDelay:-1,Motion:[0.0,0.1,0.5],Tags:["ink_bomb"],Item:{id:"minecraft:glow_ink_sac",count:1}}
execute as @e[type=marker,tag=breach_z_ink,tag=z-,scores={glyph_timer=75}] at @s run summon item ~ ~ ~-1.5 {PickupDelay:-1,Motion:[0.0,0.1,-0.5],Tags:["ink_bomb"],Item:{id:"minecraft:glow_ink_sac",count:1}}
execute as @e[type=marker,tag=breach_x_ink,tag=x+,scores={glyph_timer=75}] at @s run summon item ~1.5 ~ ~ {PickupDelay:-1,Motion:[0.5,0.1,0.0],Tags:["ink_bomb"],Item:{id:"minecraft:glow_ink_sac",count:1}}
execute as @e[type=marker,tag=breach_x_ink,tag=x-,scores={glyph_timer=75}] at @s run summon item ~-1.5 ~ ~ {PickupDelay:-1,Motion:[-0.5,0.1,0.0],Tags:["ink_bomb"],Item:{id:"minecraft:glow_ink_sac",count:1}}

#Glow Ink Explosion
execute at @e[type=item,tag=ink_bomb,nbt={OnGround:1b}] as @e[distance=..6] run tag @s add ink_bomb_hit
execute as @e[type=item,tag=ink_bomb,nbt={OnGround:1b}] at @s run particle minecraft:glow_squid_ink ~ ~ ~ 1.5 1.5 1.5 0.5 1000 force
execute at @e[type=item,tag=ink_bomb,nbt={OnGround:1b}] run playsound item.glow_ink_sac.use master @a ~ ~ ~ 1.0 0.0 0.0
execute at @e[type=item,tag=ink_bomb,nbt={OnGround:1b}] run playsound entity.creeper.primed master @a ~ ~ ~ 1.0 1.25 0.0
execute as @e[type=item,tag=ink_bomb,nbt={OnGround:1b}] run kill @s

#Glow Ink Blindness
execute as @e[tag=ink_bomb_hit] run scoreboard players add @s ink_bomb_timer 1
execute as @e[tag=ink_bomb_hit,scores={ink_bomb_timer=1}] run effect give @s minecraft:blindness 4 0 true
execute as @e[tag=ink_bomb_hit,scores={ink_bomb_timer=1..60}] at @s anchored eyes run particle minecraft:glow_squid_ink ^ ^ ^0.1 0.15 0.15 0.15 0.001 5 force
execute as @e[tag=ink_bomb_hit,scores={ink_bomb_timer=80}] run tag @s remove ink_bomb_hit
execute as @e[tag=ink_bomb_hit,scores={ink_bomb_timer=80..}] run scoreboard players reset @s ink_bomb_timer

#Ink display
execute as @e[type=item_display,tag=breach_ink_z] at @s unless entity @e[type=marker,tag=breach_z,distance=..0.1] run kill @s
execute as @e[type=item_display,tag=breach_ink_x] at @s unless entity @e[type=marker,tag=breach_x,distance=..0.1] run kill @s

#Ran5
execute as @e[type=marker,tag=breach_z_ink,tag=!ran5] run tag @s add ran5
execute as @e[type=marker,tag=breach_x_ink,tag=!ran5] run tag @s add ran5