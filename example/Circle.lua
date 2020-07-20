local Class = require("Class")
local Point = require("example.Point")

local M = Class.new()

function M.new(center, radius)
  center = center or Point.new()
  radius = radius or 1

  assert(type(center) == "table" and getmetatable(center) == Point)
  assert(type(radius) == "number" and radius >= 0)

  return setmetatable({_center = center, _radius = radius}, M)
end

function M._getters:area()
  return math.pi * self._radius * self._radius
end

return M
