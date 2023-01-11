local GPS = require "paintbuilder/gps"

local function test_GPS()
  local gps = GPS:new()
  gps:forward()
  gps:turnRight()
  gps:forward()
  gps:up()
  gps:go_y(4)
  gps:go_z(2)
  gps:go_x(7)
  gps:go(0,0,0)
end

local function test_shortest_turn()
  --WIP
  local gps = GPS:new()
  gps.facing = "north"
  gps:turn("west")
  --should print left turn
  gps.facing = "north"
  gps:turn("east")
  --should print right turn
  gps:turn("south")
  gps:turn("east")
  gps:turn("west")
  gps:turn("north")
end

local function main()
    test_GPS()
    test_shortest_turn()
end

main()