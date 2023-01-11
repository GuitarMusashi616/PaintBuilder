local util = {}

util.interface = function(interface_filename, class_filename)
    local interface_methods = require(interface_filename)
    local class = require(class_filename)
    local interface = {}
    function interface:new(...)
        local interface_ins = {}
        local class_ins = class:new(...)
        for _, k in pairs(interface_methods) do
            if not class_ins[k] then
                error(("%s must implement %s method for %s"):format(class_filename, k, interface_filename), 0)
            end
            if type(class_ins[k]) ~= "table" and type(class_ins[k]) ~= "function" then
                error(("%s of %s interface for %s class must be either a table or a function"):format(k, interface_filename, class_filename), 0)
                -- only tables and functions are pass by reference
            end
            interface_ins[k] = function(inter_ins, ...)
                return class_ins[k](class_ins, ...)
            end
        end
        return interface_ins
    end
    return interface
end

return util