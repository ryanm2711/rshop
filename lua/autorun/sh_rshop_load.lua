RShop = RShop or {}
RShop.Config = {}
RShop.Version = "1.0.0"

-- Loading files solution taken from https://wiki.facepunch.com/gmod/Global.include
local function AddFile(File, directory)
	local prefix = string.lower(string.Left(File, 3))

	if SERVER and prefix == "sv_" then
		include( directory .. File )
	elseif prefix == "sh_" then
		if SERVER then
			AddCSLuaFile( directory .. File )
		end
		include( directory .. File )
	elseif prefix == "cl_" then
		if SERVER then
			AddCSLuaFile( directory .. File )
		elseif CLIENT then
			include( directory .. File )
		end
	end
end

local function IncludeDir( directory )
	directory = directory .. "/"

	local files, directories = file.Find( directory .. "*", "LUA" )

	for _, v in ipairs( files ) do
		if string.EndsWith(v, ".lua") then
			AddFile( v, directory )
		end
	end
end

IncludeDir("rshop/config")
IncludeDir("rshop/core")
IncludeDir("rshop/ui")