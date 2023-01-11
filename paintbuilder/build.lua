local util = require "lib/util"
-- local Layer = util.interface("interfaces/layer", "paintbuilder/string_layer")
local Layer = require "paintbuilder/string_layer"

local Build = {}
Build.__index = Build

function Build:new(legend)
    local ins = setmetatable({}, self)
    ins.legend = legend
    ins.layers = {}
    return ins
end

function Build:add(layer_str, times)
    times = times or 1
    for _=1, times do
        self.layers[#self.layers+1] = Layer:new(layer_str, self.legend)
    end
end

function Build:get(x, y, z)
    local layer = self.layers[y+1]
    return layer:get(x, z)
end

return Build