
local capabilities = require "st.capabilities"
local Driver = require "st.driver"
local cosock = require "cosock"                                         -- for time only
local socket = require "cosock.socket"                                  -- for time only
local log = require "log"


local function validate_ipaddress(ip)

    local valid = true
    
    if ip then
      local chunks = {ip:match("^(%d+)%.(%d+)%.(%d+)%.(%d+)$")}
      if #chunks == 4 then
        for i, v in pairs(chunks) do
          if tonumber(v) > 255 then 
            valid = false
            break
          end
        end
      else
        valid = false
      end
    else
      valid = false
    end
    
    if valid then
      return ip
    else
      return nil
    end
        
  end