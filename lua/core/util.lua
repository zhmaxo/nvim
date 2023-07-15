local Util = require("lazy.core.util")

local M = {}

function M.has(plugin)
  return require("lazy.core.config").plugins[plugin] ~= nil
end

function M.load(name)
  -- local Util = require("lazy.core.util")
  local function _load(mod)
      require(mod)
    --[[ Util.try(function()
    end, {
      msg = "Failed loading " .. mod,
      on_error = function(msg)
        local modpath = require("lazy.core.cache").find(mod)
        if modpath then
          Util.error(msg)
        end
      end,
    }) ]]--
  end
  --[[ -- always load lazyvim, then user file
  if M.defaults[name] then
    _load("lazyvim.config." .. name)
  end
  ]]--
  _load("config." .. name)
  if vim.bo.filetype == "lazy" then
    -- HACK: LazyVim may have overwritten options of the Lazy ui, so reset this here
    vim.cmd([[do VimResized]])
  end
end

function M.toggle(option, silent, values)
	  if values then
	    if vim.opt_local[option]:get() == values[1] then
	      vim.opt_local[option] = values[2]
    else
      vim.opt_local[option] = values[1]
    end
    return Util.info("Set " .. option .. " to " .. vim.opt_local[option]:get(), { title = "Option" })
	  end
	  vim.opt_local[option] = not vim.opt_local[option]:get()
	  if not silent then
	    if vim.opt_local[option]:get() then
	      Util.info("Enabled " .. option, { title = "Option" })
    else
      Util.warn("Disabled " .. option, { title = "Option" })
    end
  end
end

return M
