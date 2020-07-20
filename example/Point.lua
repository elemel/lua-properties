local Class = require("Class")

local unpack = unpack or table.unpack

local M = Class.new()

function M.new(x, y)
  x = x or 0
  y = y or 0

  assert(type(x) == "number")
  assert(type(y) == "number")

  return setmetatable({x, y}, M)
end

function M._getters:x()
  return self[1]
end

function M._setters:x(x)
  assert(type(x) == "number")
  self[1] = x
end

function M._getters:y()
  return self[2]
end

function M._setters:y(y)
  assert(type(y) == "number")
  self[2] = y
end

function M:__tostring()
  return string.format("(%.3g, %.3g)", unpack(self))
end

return M
