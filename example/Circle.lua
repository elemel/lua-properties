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

function M._getters:center()
  return self._center
end

function M._setters:center(center)
  assert(type(center) == "table" and getmetatable(center) == Point)
  self._center = center
end

function M._getters:radius()
  return self._radius
end

function M._setters:radius(radius)
  assert(type(radius) == "number" and radius >= 0)
  self._radius = radius
end

function M._getters:circumference()
  return 2 * math.pi * self._radius
end

function M._getters:area()
  return math.pi * self._radius * self._radius
end

return M
