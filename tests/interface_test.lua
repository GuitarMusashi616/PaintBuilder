
local ZZI = require "paintbuilder/zig_zag_iterator"
local util = require "lib/util"
local interface = util.interface

-- first check if zig zag iterator is working
local function test_zzi()
  local zzi = ZZI:new(3,5,4)
  for i=1,100 do
    zzi:next()
    print(("x=%s, y=%s, z=%s"):format(zzi.x, zzi.y, zzi.z))
  end
end

-- next test the interface of zig zag iterator
local function test_interface()
    local Iterator = interface("interfaces/iterator", "paintbuilder/zig_zag_iterator")
    local iter = Iterator:new(5, 5, 5)
    if not iter then
        error("no iter", 0)
    end
    for i=1,100 do
        iter:next()
        iter:print()
    end
end

local function main()
    test_zzi()
    test_interface()
end

main()
