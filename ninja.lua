--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:75287c9830ce7d00b908cba74952901c:1/1$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- ninja
            x=2,
            y=2,
            width=225,
            height=194,

        },
        {
            -- ninja right
            x=229,
            y=2,
            width=191,
            height=193,

        },
        {
            -- ninja left
            x=2,
            y=198,
            width=190,
            height=193,

        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["ninja"] = 1,
    ["ninja right"] = 2,
    ["ninja left"] = 3,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
