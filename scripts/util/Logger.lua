-- Simple class to wrap 'print' or 'console.log', just to make porting easier
local Logger = {}

local function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k,v in pairs(o) do
            if type(k) ~= 'number' then k = '"'..k..'"' end
            s = s .. '['..k..'] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

function Logger.info(message)
    if type(message) == 'table' then
        local string = dump(message)
        console.log(string)
    else
        console.log(message)
    end
end


return Logger