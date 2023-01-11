-- build up 128 blocks above ground

-- start at bottom left corner facing top

-- 10x10

-- put it 80 blocks away
-- above ocean
-- 2 times
local layer0 = [[
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
]]

--21 times
local layer1 = [[
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - a a - - - - - - - - -
- - - - - - - - a - - a - - - - - - - -
- - - - - - - - a - - a - - - - - - - -
- - - - - - - - - a a - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
]]

--1 time
local layer2 = [[
- - - - - - - - - - - - - - - - - - - -
- - - - - - - - - a a - - - - - - - - -
- - - - - - - - - a a - - - - - - - - -
- - - - - - - - - a a - - - - - - - - -
- - - - - - - - - a a - - - - - - - - -
- - - - - - - - - a a - - - - - - - - -
- - - - - - - - - a a - - - - - - - - -
- - - - - - - - - a a - - - - - - - - -
- - - - - - - - - a a - - - - - - - - -
- a a a a a a a a - - a a a a a a a a -
- a a a a a a a a - - a a a a a a a a -
- - - - - - - - - a a - - - - - - - - -
- - - - - - - - - a a - - - - - - - - -
- - - - - - - - - a a - - - - - - - - -
- - - - - - - - - a a - - - - - - - - -
- - - - - - - - - a a - - - - - - - - -
- - - - - - - - - a a - - - - - - - - -
- - - - - - - - - a a - - - - - - - - -
- - - - - - - - - a a - - - - - - - - -
- - - - - - - - - - - - - - - - - - - -
]]

--1 time
local layer3 = [[
- - - - - - - - - a a - - - - - - - - -
- - - - - - - - a - - a - - - - - - - -
- - - - - - - - a - - a - - - - - - - -
- - - - - - - - a - - a - - - - - - - -
- - - - - - - - a - - a - - - - - - - -
- - - - - - - - a - - a - - - - - - - -
- - - - - - - - a - - a - - - - - - - -
- - - - - - - - a - - a - - - - - - - -
- a a a a a a a a - - a a a a a a a a -
a - - - - - - - - - - - - - - - - - - a
a - - - - - - - - - - - - - - - - - - a
- a a a a a a a a - - a a a a a a a a -
- - - - - - - - a - - a - - - - - - - -
- - - - - - - - a - - a - - - - - - - -
- - - - - - - - a - - a - - - - - - - -
- - - - - - - - a - - a - - - - - - - -
- - - - - - - - a - - a - - - - - - - -
- - - - - - - - a - - a - - - - - - - -
- - - - - - - - a - - a - - - - - - - -
- - - - - - - - - a a - - - - - - - - -
]]

--1 time
local layer4 = [[
- a a a a a a a a a a a a a a a a a a -
a a a a a a a a a - - a a a a a a a a a
a a a a a a a a a - - a a a a a a a a a
a a a a a a a a a - - a a a a a a a a a
a a a a a a a a a - - a a a a a a a a a
a a a a a a a a a - - a a a a a a a a a
a a a a a a a a a - - a a a a a a a a a
a a a a a a a a a - - a a a a a a a a a
a a a a a a a a a - - a a a a a a a a a
a - - - - - - - - - - - - - - - - - - a
a - - - - - - - - - - - - - - - - - - a
a a a a a a a a a - - a a a a a a a a a
a a a a a a a a a - - a a a a a a a a a
a a a a a a a a a - - a a a a a a a a a
a a a a a a a a a - - a a a a a a a a a
a a a a a a a a a - - a a a a a a a a a
a a a a a a a a a - - a a a a a a a a a
a a a a a a a a a - - a a a a a a a a a
a a a a a a a a a - - a a a a a a a a a
- a a a a a a a a a a a a a a a a a a -
]]

--3 times
local layer5 = [[
- a a a a a a a a a a a a a a a a a a -
a - - - - - - - - - - - - - - - - - - a
a - - - - - - - - - - - - - - - - - - a
a - - - - - - - - - - - - - - - - - - a
a - - - - - - - - - - - - - - - - - - a
a - - - - - - - - - - - - - - - - - - a
a - - - - - - - - - - - - - - - - - - a
a - - - - - - - - - - - - - - - - - - a
a - - - - - - - - - - - - - - - - - - a
a - - - - - - - - - - - - - - - - - - a
a - - - - - - - - - - - - - - - - - - a
a - - - - - - - - - - - - - - - - - - a
a - - - - - - - - - - - - - - - - - - a
a - - - - - - - - - - - - - - - - - - a
a - - - - - - - - - - - - - - - - - - a
a - - - - - - - - - - - - - - - - - - a
a - - - - - - - - - - - - - - - - - - a
a - - - - - - - - - - - - - - - - - - a
a - - - - - - - - - - - - - - - - - - a
- a a a a a a a a a a a a a a a a a a -
]]

--1 time
local layer6 = [[
- - - - - - - - - - - - - - - - - - - -
- a a a a a a a a a a a a a a a a a a -
- a a a a a a a a a a a a a a a a a a -
- a a a a a a a a a a a a a a a a a a -
- a a a a a a a a a a a a a a a a a a -
- a a a a a a a a a a a a a a a a a a -
- a a a a a a a a a a a a a a a a a a -
- a a a a a a a a a a a a a a a a a a -
- a a a a a a a a a a a a a a a a a a -
- a a a a a a a a a a a a a a a a a a -
- a a a a a a a a a a a a a a a a a a -
- a a a a a a a a a a a a a a a a a a -
- a a a a a a a a a a a a a a a a a a -
- a a a a a a a a a a a a a a a a a a -
- a a a a a a a a a a a a a a a a a a -
- a a a a a a a a a a a a a a a a a a -
- a a a a a a a a a a a a a a a a a a -
- a a a a a a a a a a a a a a a a a a -
- a a a a a a a a a a a a a a a a a a -
- - - - - - - - - - - - - - - - - - - -
]]

local build = require("paintbuilder/build"):new({
    ["a"] = "minecraft:cobblestone",
})

build.add(layer0, 2)
build.add(layer1, 21)
build.add(layer2)
build.add(layer3)
build.add(layer4, 3)
build.add(layer5)

build.start()