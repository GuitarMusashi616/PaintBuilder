local Layer = require "paintbuilder/string_layer"

local function test_str_to_layer()
    local layer_str = [[
- - - - -
- - - - -
- - - - -
- - - - -
- - - - -
    ]]
    --remove whitespace, split by \n
    --remove leading/trailing whitespace
    local layer = Layer:new(layer_str)
    -- layer:_remove_leading_whitespace()
    -- assert(layer:_get_str() == "- - - - -\n- - - - -\n- - - - -\n- - - - -\n- - - - -\n    ", layer:_get_str())
    -- layer:_remove_trailing_whitespace()
    -- assert(layer:_get_str() == "- - - - -\n- - - - -\n- - - - -\n- - - - -\n- - - - -", layer:_get_str())
    -- layer:_remove_spaces()
    assert(layer:_get_str() == "-----\n-----\n-----\n-----\n-----", layer:_get_str())
end

local function test_validate_wh()
    local layer_str = [[
- - - - - -
- a a a a -
- a - - a -
- a a a a -
- - - - - -
    ]]

    local legend = {a="minecraft:cobblestone"}
    local layer = Layer:new(layer_str)
    -- layer:trim()
    local w,h = layer:_validate_wh() -- assert false if doesn't have same consistent dimensions
    print(w, h)
end

local function test_validate_legend()
    local layer_str = [[
- - - - - -
- a a a a -
- a b b a -
- a a a a -
- - - - - -
    ]]
    local legend = {a="minecraft:cobblestone", b="minecraft:chest"}
    local layer = Layer:new(layer_str, legend)
    -- layer:trim()
    -- layer:_validate_legend()
end

local function test_layer_getter()
    local layer_str = [[
- - - - - -
- a a a a -
- a b b a -
- a a a a -
- - - - - -
    ]]
    local legend = {a="minecraft:cobblestone", b="minecraft:chest"}
    local layer = Layer:new(layer_str, legend)
    -- layer:trim()
    -- 0 indexed from top left corner (x, z)
    local a = layer:get(1,1)
    local b = layer:get(3,2)
    local minus = layer:get(5,4)

    assert(a == 'minecraft:cobblestone', a)
    assert(b == 'minecraft:chest', b)
    assert(minus == nil, minus)
end

local function main()
    test_str_to_layer()
    test_validate_wh()
    test_validate_legend()
    test_layer_getter()
end

main()