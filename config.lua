application =
{
license={
        google={
            key="lic"
        }
    },

	content =
	{
		width = 320,
		height = 480, 
		scale = "zoomEven",
		fps = 30,
		
		--[[
		imageSuffix =
		{
			    ["@2x"] = 2,
		},
		--]]
	},

	--[[
	-- Push notifications
	notification =
	{
		iphone =
		{
			types =
			{
				"badge", "sound", "alert", "newsstand"
			}
		}
	},
	--]]    
}
