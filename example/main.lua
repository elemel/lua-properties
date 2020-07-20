local Circle = require("example.Circle")
local Point = require("example.Point")

local point = Point.new(1, 2)
point.x, point.y = point.y, point.x
assert(tostring(point) == "(2, 1)")

local circle = Circle.new(point)
circle.radius = 3
assert(math.abs(circle.circumference - 18.849555921539) < 1e-12)
assert(math.abs(circle.area - 28.274333882308) < 1e-12)
