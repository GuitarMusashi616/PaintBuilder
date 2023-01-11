local addZaddX = {}
addZaddX.__index = addZaddX

local addZsubX = {}
addZsubX.__index = addZsubX

local subZaddX = {}
subZaddX.__index = subZaddX

local subZsubX = {}
subZsubX.__index = subZsubX

--zig zag iterator
local ZigZagIterator = {}
ZigZagIterator.__index = ZigZagIterator

function addZaddX:new(zzi)
  local ins = setmetatable({}, self)
  ins.zzi = zzi
  return ins
end

function addZaddX:next()
  local xmax = self.zzi.x == self.zzi.width
  local zmax = self.zzi.z == self.zzi.length
  
  if zmax and xmax then
    self.zzi.y = self.zzi.y + 1
    self.zzi:change_state(subZsubX)
  elseif xmax then
    self.zzi.z = self.zzi.z + 1
    self.zzi:change_state(addZsubX)
  else
    self.zzi.x = self.zzi.x + 1
  end
end

function addZsubX:new(zzi)
  local ins = setmetatable({}, self)
  ins.zzi = zzi
  return ins
end

function addZsubX:next()
  local xzero = self.zzi.x == 0
  local zmax = self.zzi.z == self.zzi.length
  
  if zmax and xzero then
    self.zzi.y = self.zzi.y + 1
    self.zzi:change_state(subZaddX)
  elseif xzero then
    self.zzi.z = self.zzi.z + 1
    self.zzi:change_state(addZaddX)
  else
    self.zzi.x = self.zzi.x - 1
  end
end

function subZsubX:new(zzi)
  local ins = setmetatable({}, self)
  ins.zzi = zzi
  return ins
end

function subZsubX:next()
  local xzero = self.zzi.x == 0
  local zzero = self.zzi.z == 0
  
  if zzero and xzero then
    self.zzi.y = self.zzi.y + 1
    self.zzi:change_state(addZaddX)
  elseif xzero then
    self.zzi.z = self.zzi.z - 1
    self.zzi:change_state(subZaddX)
  else
    self.zzi.x = self.zzi.x - 1
  end
end

function subZaddX:new(zzi)
  local ins = setmetatable({}, self)
  ins.zzi = zzi
  return ins
end

function subZaddX:next()
  local xmax = self.zzi.x == self.zzi.width
  local zzero = self.zzi.z == 0
  
  if xmax and zzero then
    self.zzi.y = self.zzi.y + 1
    self.zzi:change_state(addZsubX)
  elseif xmax then
    self.zzi.z = self.zzi.z - 1
    self.zzi:change_state(subZsubX)
  else
    self.zzi.x = self.zzi.x + 1
  end
end

function ZigZagIterator:new(xmax, ymax, zmax, x, y, z)
  --width, height, length should match the Schematic.Width, Schematic.Height, Schematic.Length
  --goes from 0,0,0 to height-1, width-1, length-1
  assert(xmax and type(xmax) == "number", "missing args")
  assert(ymax and type(ymax) == "number", "missing args")
  assert(zmax and type(zmax) == "number", "missing args")
  local ins = setmetatable({}, self)
  
  ins.width = xmax-1
  ins.height = ymax-1
  ins.length = zmax-1

  ins.x = x or 0
  ins.y = y or 0
  ins.z = z or 0
  
  ins.state = addZaddX:new(ins)
  return ins
end

function ZigZagIterator:from(xmax, ymax, zmax, x, y, z)
  local zzi = self:new(xmax, ymax, zmax, x, y, z)
  return zzi()
end

function ZigZagIterator:__call()
  local first, continue = true, true
  return function()
    if not first then
      continue = self:next()
    end
    if continue then
      first = false
      return self.x,self.y,self.z
    end
  end
end

function ZigZagIterator:next()
  if self.x >= self.width and self.y >= self.height and self.z >= self.length then
    return false
  end
  self.state:next()
  return true
end

function ZigZagIterator:get_xyz()
  return self.x, self.y, self.z
end

function ZigZagIterator:print()
  print(("x=%s, y=%s, z=%s"):format(self.x, self.y, self.z))
end

function ZigZagIterator:reset(x,y,z)
  self.x = x or 0 
  self.y = y or 0
  self.z = z or 0
end

function ZigZagIterator:change_state(state)
  self.state = state:new(self)
end

return ZigZagIterator