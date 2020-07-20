local Circle = require("example.Circle")
local Point = require("example.Point")

local point = Point.new(1, 2)
assert(tostring(point) == "(1, 2)")

local circle = Circle.new(point, 3)
assert(math.abs(circle.area - 28.274333882308) < 1e-12)
