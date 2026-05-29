--[[______   __
  / ____/ | / / Name: GN COLOR PATCH SNIPPET v1.0.0
 / / __/  |/ /  Desc: Fixes fill function in Figura for 1.21.4
/ /_/ / /|  / Author: GNanimates | https://gnon.top | @gn68s
\____/_/ |_/ License: CopyLeft License
]]

if client.compareVersions(client.getVersion(), "1.21.4") >= 0 then
	local ogIndex = figuraMetatables.Texture.__index

	local Texture = {}

	--ApplyFunc dosent seem to be affected

	function Texture:fill(x, y, width, height, color,g,b,a)
		local clr
		if g and b then
			clr = vec(b,g,color,a or 1)
		else
			clr = color * 1
         clr.xz = clr.zx
		end
		return ogIndex(self, "fill")(self,x, y, width, height, clr)
	end
	
	figuraMetatables.Texture.__index = function(self, index)
		return Texture[index] or ogIndex(self, index)
	end
end
