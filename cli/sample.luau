-- Sample only. Not a KeyForge loader.

local function greet(name)
    if name == nil then
        return "hello"
    end
    return "hello " .. tostring(name)
end

print(greet("luau"))
