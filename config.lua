
local aspectRatio = display.pixelHeight / display.pixelWidth

application =
{
	content =
	{
		width = aspectRatio > 1.5 and 800 or math.ceil( 1200 / aspectRatio ),
		height = aspectRatio < 1.5 and 1200 or math.ceil( 800 * aspectRatio ),
		scale = "letterbox",
		fps = 30,
		antialias = false,
		xAlign = "center",
		yAlign = "center",

		imageSuffix =
        {

			["@2x"] = 1.3,  
           
        }

	}
}
