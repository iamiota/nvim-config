local config = {
  defaults = {
    mirage = true,
    overrides = {},
  },
}

setmetatable(config, { __index = config.defaults })

return config
