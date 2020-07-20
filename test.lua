local class = require("class")

local Point = class.new()

function Point.new(x, y)
  x = x or 0
  y = y or 0

  assert(type(x) == "number")
  assert(type(y) == "number")

  return setmetatable({_x = x, _y = y}, Point)
end

function Point._getters:x()
  return self._x
end

function Point._setters:x(x)
  assert(type(x) == "number")
  self._x = x
end

function Point._getters:y()
  return self._y
end

function Point._setters:y(y)
  assert(type(y) == "number")
  self._y = y
end

function Point:__tostring()
  return string.format("(%.3g, %.3g)", self._x, self._y)
end

local point = Point.new(1, 2)
assert(tostring(point) == "(1, 2)")

local Circle = class.new()

function Circle.new(center, radius)
  center = center or Point.new()
  radius = radius or 1

  assert(type(center) == "table" and getmetatable(center) == Point)
  assert(type(radius) == "number" and radius >= 0)

  return setmetatable({_center = center, _radius = radius}, Circle)
end

function Circle._getters:area()
  return math.pi * self._radius * self._radius
end

local circle = Circle.new(point, 3)
assert(math.abs(circle.area - 28.274333882308) < 1e-12)
