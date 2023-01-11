local StringLayer = {}
StringLayer.__index = StringLayer

local LEGEND_IGNORE = {
    ['-'] = true,
    ['\n'] = true,
    [' '] = true,
}

function StringLayer:new(layer_str, legend)
    local ins = setmetatable({}, self)
    ins.layer_str = layer_str
    ins.legend = legend
    ins:trim()
    ins.width, ins.height = ins:_validate_wh()
    return ins
end

function StringLayer:trim()
    self:_remove_spaces()
    self:_remove_leading_whitespace()
    self:_remove_trailing_whitespace()
end

function StringLayer:_remove_leading_whitespace()
    for i=1, #self.layer_str do
        local char = self.layer_str:sub(i,i)
        if char ~= '\n' and char ~= ' ' then
            self.layer_str = self.layer_str:sub(i)
            return
        end
    end
    self.layer_str = ""
end

function StringLayer:_remove_trailing_whitespace()
    for i=#self.layer_str, 1, -1 do
        local char = self.layer_str:sub(i,i)
        if char ~= '\n' and char ~= ' ' then
            self.layer_str = self.layer_str:sub(1,i)
            return
        end
    end
    self.layer_str = ""
end

function StringLayer:_remove_spaces()
    self.layer_str = self.layer_str:gsub(" ", "")
end

function StringLayer:_get_str()
    return self.layer_str
end

-- call once on construction after trim
function StringLayer:_validate_wh()
    local width
    local cur_width = 0
    local height = 0
    for i = 1,#self.layer_str+1 do
        local char = self.layer_str:sub(i,i)
        if char == '\n' or i == #self.layer_str+1 then
            if width == nil then
                width = cur_width
            else
                assert(cur_width == width, ("layer has inconsistent dimensions %s"):format(self.layer_str))
            end
            cur_width = 0
            height = height + 1
        else
            cur_width = cur_width + 1
        end
    end
    return width, height
end

-- call once after construction
function StringLayer:_validate_legend()
    for i = 1,#self.layer_str do
        local char = self.layer_str:sub(i,i)
        if not LEGEND_IGNORE[char] and not self.legend[char] then
            error(("%s does not have an associated blockname in legend %s"):format(char, self.legend), 0)
        end
    end
end

-- 0 indexed starting top left corner
-- x is blocks east
-- z is blocks south
function StringLayer:get(x, z)
    local i = (x+1) + z*(self.width+1)
    if i <= 0 or i > #self.layer_str then
        error(("x=%s, z=%s is out of bounds"):format(x, z), 0)
    end
    local char = self.layer_str:sub(i,i)
    -- if not self.legend[char] then
    --     error(("%s not in legend"):format(char), 0)
    -- end
    return self.legend[char]
end

return StringLayer