local Build = require "paintbuilder/build"

local function get_build_fixture()
    local build = Build:new({a="minecraft:cobblestone"})
    local layers = require "tests/mobfarm_fixture"
    build:add(layers[1], 2)
    build:add(layers[2], 21)
    build:add(layers[3])
    build:add(layers[4])
    build:add(layers[5], 3)
    build:add(layers[6])
    return build
end

local function test_build_getter()
    local build = get_build_fixture()
    assert(build:get(0,0,0) == nil, build:get(0,0,0))
    assert(build:get(8,2,9) == 'minecraft:cobblestone', build:get(8,2,9))
    assert(build:get(0,24,9) == 'minecraft:cobblestone', build:get(0,24,9))
end

local function main()
    test_build_getter()
end

main()
