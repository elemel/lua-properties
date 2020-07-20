local Class = require("Class")

local M = Class.new()

function M.new(x, y)
  x = x or 0
  y = y or 0

  assert(type(x) == "number")
  assert(type(y) == "number")

  return setmetatable({_x = x, _y = y}, M)
end

function M._getters:x()
  return self._x
end

function M._setters:x(x)
  assert(type(x) == "number")
  self._x = x
end

function M._getters:y()
  return self._y
end

function M._setters:y(y)
  assert(type(y) == "number")
  self._y = y
end

function M:__tostring()
  return string.format("(%.3g, %.3g)", self._x, self._y)
end

return M
