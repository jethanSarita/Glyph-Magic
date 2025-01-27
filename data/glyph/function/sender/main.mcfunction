#0.4375

#-z
execute as @e[type=item_frame,nbt={Item:{id:"minecraft:quartz",count:1},Facing:2b}] at @s if block ~ ~ ~0.5 soul_lantern run summon marker ~ ~ ~0.5 {Tags:["sender","-z"]}
execute as @e[type=item_frame,nbt={Item:{id:"minecraft:quartz",count:1},Facing:2b}] at @s if block ~ ~ ~0.5 soul_lantern run kill @s
execute as @e[type=marker,tag=sender,tag=-z] at @s positioned ~ ~-0.25 ~-0.5 run function glyph:sender/sender_glyph_z
#+z
execute as @e[type=item_frame,nbt={Item:{id:"minecraft:quartz",count:1},Facing:3b}] at @s if block ~ ~ ~-0.5 soul_lantern run summon marker ~ ~ ~-0.5 {Tags:["sender","+z"]}
execute as @e[type=item_frame,nbt={Item:{id:"minecraft:quartz",count:1},Facing:3b}] at @s if block ~ ~ ~-0.5 soul_lantern run kill @s
execute as @e[type=marker,tag=sender,tag=+z] at @s positioned ~ ~-0.25 ~0.5 run function glyph:sender/sender_glyph_z
#-x
execute as @e[type=item_frame,nbt={Item:{id:"minecraft:quartz",count:1},Facing:4b}] at @s if block ~0.5 ~ ~ soul_lantern run summon marker ~0.5 ~ ~ {Tags:["sender","-x"]}
execute as @e[type=item_frame,nbt={Item:{id:"minecraft:quartz",count:1},Facing:4b}] at @s if block ~0.5 ~ ~ soul_lantern run kill @s
execute as @e[type=marker,tag=sender,tag=-x] at @s positioned ~-0.5 ~-0.25 ~ run function glyph:sender/sender_glyph_x
#+x
execute as @e[type=item_frame,nbt={Item:{id:"minecraft:quartz",count:1},Facing:5b}] at @s if block ~-0.5 ~ ~ soul_lantern run summon marker ~-0.5 ~ ~ {Tags:["sender","+x"]}
execute as @e[type=item_frame,nbt={Item:{id:"minecraft:quartz",count:1},Facing:5b}] at @s if block ~-0.5 ~ ~ soul_lantern run kill @s
execute as @e[type=marker,tag=sender,tag=+x] at @s positioned ~0.5 ~-0.25 ~ run function glyph:sender/sender_glyph_x
#-y
execute as @e[type=item_frame,nbt={Item:{id:"minecraft:quartz",count:1},Facing:0b}] at @s if block ~ ~0.5 ~ soul_lantern run summon marker ~ ~0.5 ~ {Tags:["sender","-y"]}
execute as @e[type=item_frame,nbt={Item:{id:"minecraft:quartz",count:1},Facing:0b}] at @s if block ~ ~0.5 ~ soul_lantern run kill @s
execute as @e[type=marker,tag=sender,tag=+x] at @s positioned ~ ~-0.5 ~ run function glyph:sender/sender_glyph_y
#+y
execute as @e[type=item_frame,nbt={Item:{id:"minecraft:quartz",count:1},Facing:1b}] at @s if block ~ ~-0.5 ~ soul_lantern run summon marker ~ ~-0.5 ~ {Tags:["sender","+y"]}
execute as @e[type=item_frame,nbt={Item:{id:"minecraft:quartz",count:1},Facing:1b}] at @s if block ~ ~-0.5 ~ soul_lantern run kill @s
execute as @e[type=marker,tag=sender,tag=+x] at @s positioned ~ ~0.5 ~ run function glyph:sender/sender_glyph_y

execute as @e[type=marker,tag=sender] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:amethyst_shard",count:1}},distance=..0.75] run tag @s add shot
execute as @e[type=marker,tag=sender] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:amethyst_shard",count:1}},distance=..0.75] run tag @s add run
execute as @e[type=marker,tag=sender,tag=shot,tag=run] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:amethyst_shard",count:1}},distance=..0.75]
execute as @e[type=marker,tag=sender,tag=shot,tag=run] at @s if block ~ ~ ~ lantern[hanging=false] run setblock ~ ~ ~ lantern[hanging=false]
execute as @e[type=marker,tag=sender,tag=shot,tag=run] at @s if block ~ ~ ~ lantern[hanging=true] run setblock ~ ~ ~ lantern[hanging=true]
execute as @e[type=marker,tag=sender,tag=shot,tag=run,tag=-z] at @s run summon marker ~ ~-0.25 ~-0.5 {Tags:["ray","-z"]}
execute as @e[type=marker,tag=sender,tag=shot,tag=run,tag=+z] at @s run summon marker ~ ~-0.25 ~-0.5 {Tags:["ray","+z"]}
execute as @e[type=marker,tag=sender,tag=shot,tag=run,tag=-x] at @s run summon marker ~ ~-0.25 ~-0.5 {Tags:["ray","-x"]}
execute as @e[type=marker,tag=sender,tag=shot,tag=run,tag=+x] at @s run summon marker ~ ~-0.25 ~-0.5 {Tags:["ray","+x"]}
execute as @e[type=marker,tag=sender,tag=shot,tag=run,tag=-y] at @s run summon marker ~ ~-0.25 ~-0.5 {Tags:["ray","-y"]}
execute as @e[type=marker,tag=sender,tag=shot,tag=run,tag=+y] at @s run summon marker ~ ~-0.25 ~-0.5 {Tags:["ray","+y"]}
tag @e[type=marker,tag=sender,tag=run] remove run 

execute as @e[type=marker,tag=ray] at @s run particle dust{color:[0.008,0.467,0.478],scale:1} ~ ~ ~ 0 0 0 0 1 force

execute as @e[type=marker,tag=ray,tag=-z] at @s run tp @s ~ ~ ~-0.5
execute as @e[type=marker,tag=ray,tag=+z] at @s run tp @s ~ ~ ~0.5
execute as @e[type=marker,tag=ray,tag=-x] at @s run tp @s ~-0.5 ~ ~
execute as @e[type=marker,tag=ray,tag=+x] at @s run tp @s ~0.5 ~ ~
execute as @e[type=marker,tag=ray,tag=-y] at @s run tp @s ~ ~-0.5 ~
execute as @e[type=marker,tag=ray,tag=+y] at @s run tp @s ~ ~0.5 ~