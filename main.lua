local turtle = require "lib/turtle"
local Iterator = require "paintbuilder/zig_zag_iterator"
local Build = require "paintbuilder/build"
local GPS = require "paintbuilder/gps"

-- sucks from chest
local function restock()
    turtle.select(16)
    turtle.placeUp()
    while turtle.suckUp() do
    end
    turtle.dropUp()
    turtle.digUp()
    turtle.select(1)
end

local function select(blockname)
    for slot = 1,15 do
        local item = turtle.getItemDetail(slot)
        if item.name == blockname then
            turtle.select(slot)
            return true
        end
    end
    return false
end

local function main()
    local gps = GPS:new()
    local build = Build:new({a="minecraft:cobblestone"})
    local layers = require "tests/mobfarm_fixture"
    build:add(layers[1], 2)
    build:add(layers[2], 21)
    build:add(layers[3])
    build:add(layers[4])
    build:add(layers[5], 3)
    build:add(layers[6])
    for x,y,z in Iterator:from(20, 29, 20) do
        local blockname = build:get(x,y,z)
        if blockname then
            gps:go(x,y,z)
            if not select(blockname) then
                restock()
                select(blockname)
            end
            turtle.digDown()
            turtle.placeDown()
        end
    end
end

main()