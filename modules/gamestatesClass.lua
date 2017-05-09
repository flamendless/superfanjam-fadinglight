local CLASS = {}

CLASS.__index = CLASS

function CLASS:new() end

function CLASS:set(class_type)
	local cls = {}
  cls["__call"] = CLASS.__call
  cls.type = class_type
  cls.__index = cls
  cls.super = self
  cls.tag = tostring(class_type)
  setmetatable(cls, self)
  return cls
end

function CLASS:getTag()
	return self.tag
end

return CLASS
