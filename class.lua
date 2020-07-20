local function new()
  local getters = {}
  local setters = {}

  local class = {
    _getters = getters,
    _setters = setters,
  }

  function class.__index(t, k)
    local getter = getters[k]

    if getter then
      return getter(t)
    end

    return class[k]
  end

  function class.__newindex(t, k, v)
    local setter = setters[k]

    if not setter then
      error("Undefined setter: " .. k)
    end

    setter(t, v)
  end

  return class
end

return {
  new = new,
}
