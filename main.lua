
--Progress spinner
local spinner=nil
--Buy button group
local buyGroup=nil
local buyGroup1=nil
local buyGroup1=nil
local backbGroup=nil
local restGroup=nil
local backbGroup=nil
--Advertisment group
local adGroup=nil
local adGroupscreen=nil
local restoreText=nil
local restoreBackground=nil
local removeadpg=nil
local wpmaGlobalAdmob = require("wpmaGlobalAdmob")
--Forward declaration for buyUnlock function
local buyUnlock=nil

unlockad=0
_W = display.contentWidth;
_H = display.contentHeight;

---------------------------------
-- 
-- IAP Badger initialisation
--
---------------------------------

--Load IAP Badger
iap = require("plugin.iap_badger")

--Create the catalogue
local catalogue = {

    --Information about the product on the app stores
    products = {	
    
        --removeAds is the product identifier.
        --Always use this identifier to talk to IAP Badger about the purchase.
        removeAds = {
                --A list of product names or identifiers specific to apple's App Store or Google Play.
                productNames = { apple="remove_ads", google="remove_banner1", amazon="Banner_Remove"},
                --The product type
                productType = "non-consumable",
                --This function is called when a purchase is complete.
                onPurchase=function() iap.setInventoryValue("unlock", true) end,
                --The function is called when a refund is made
                onRefund=function() iap.removeFromInventory("unlock", true) end,
        },
		
		        removeAds1 = {
                --A list of product names or identifiers specific to apple's App Store or Google Play.
                productNames = { apple="remove_ads1", google="remove_banner11", amazon="Banner_Remove1"},
                --The product type
                productType = "non-consumable",
                --This function is called when a purchase is complete.
                onPurchase=function() iap.setInventoryValue("unlock1", true) end,
                --The function is called when a refund is made
                onRefund=function() iap.removeFromInventory("unlock1", true) end,
        },
			        removeAds2 = {
                --A list of product names or identifiers specific to apple's App Store or Google Play.
                productNames = { apple="remove_ads2", google="remove_banner12", amazon="Banner_Remove12"},
                --The product type
                productType = "non-consumable",
                --This function is called when a purchase is complete.
                onPurchase=function() iap.setInventoryValue("unlock2", true) end,
                --The function is called when a refund is made
                onRefund=function() iap.removeFromInventory("unlock2", true) end,
        }
		
    },

    --Information about how to handle the inventory item
    inventoryItems = {
        unlock = { productType="non-consumable" },
        unlock2 = { productType="non-consumable" },
        unlock3 = { productType="non-consumable" }
    }
}

--Called when any purchase fails
local function failedListener()
    --If the spinner is on screen, remove it
    if (spinner) then 
        spinner:removeSelf()
        spinner=nil
    end
    
end

--This table contains all of the options we need to specify in this example program.
local iapOptions = {
    --The catalogue generated above
    catalogue=catalogue,
    --The filename in which to save the inventory
    filename="example1.txt",
    --Salt for the hashing algorithm
    salt = "something tr1cky to gue55!",
        
    --Listeners for failed and cancelled transactions will just remove the spinner from the screen
    failedListener=failedListener,
    cancelledListener=failedListener,
    --Once the product has been purchased, it will remain in the inventory.  Uncomment the following line
    --to test the purchase functions again in future.  It's also useful for testing restore purchases.
    --doNotLoadInventory=true,
    debugMode=false,
    
}

--Initialise IAP badger
iap.init(iapOptions)

---------------------------------
-- 
-- Making purchases
--
---------------------------------

--The functionality for removing the ads from the screen has been put in a separate
--function because it will be called from the purchaseListener and the restoreListener
--functions
local function removeAds()    
    --Remove the advertisement (need to check it's there first - if this function
    --is called from a product restore, it may not have been created)
--    if (adGroup) then
  --      adGroup:removeSelf()
 --      adGroup=nil
    -- end
	
	unlockad=1
	wpmaGlobalAdmob.hideAdmobBannerAd()
	print("just unlocked")
    --Change the button text
    buyGroup.text.text="Ads removed"
    buyGroup:removeEventListener("tap", buyUnlock)
	buyitz.isVisible=false
		buyitz:removeSelf()
        buyitz=nil  
	buyitz = display.newImageRect( "shop2.png", 180, 180 )
  buyitz.x = display.contentCenterX
  buyitz.y = 148-60+30-30
  buyitz.isVisible=true
	
end

--Called when the relevant app store has completed the purchase
local function purchaseListener(product )
    --Remove the spinner
    spinner:removeSelf()
    spinner=nil
    --Remove the ads
    removeAds()
    --Save the inventory change
    iap.saveInventory()
    --Give the user a message saying the purchase was successful
    native.showAlert("Info", "Your purchase was successful", {"Okay"})
end

buyUnlock=function()
    
    --Place a progress spinner on screen and tell the user the app is contating the store
    local spinnerBackground = display.newRect(160,240,360,600)
    spinnerBackground:setFillColor(1,1,1,0.75)
    --Spinner consumes all taps so the user cannot tap the purchase button twice
    spinnerBackground:addEventListener("tap", function() return true end)
    local spinnerText = display.newText("Contacting " .. iap.getStoreName() .. "...", 160,180, native.systemFont, 18)
    spinnerText:setFillColor(0,0,0)
    --Add a little spinning rectangle
    local spinnerRect = display.newRect(160,260,35,35)
    spinnerRect:setFillColor(0.25,0.25,0.25)
    transition.to(spinnerRect, { time=4000, rotation=360, iterations=999999, transition=easing.inOutQuad})
    --Create a group and add all these objects to it
    spinner=display.newGroup()
    spinner:insert(spinnerBackground)
    spinner:insert(spinnerText)
    spinner:insert(spinnerRect)
    
    --Tell IAP to initiate a purchase
    iap.purchase("removeAds", purchaseListener)
    
end




local function removeAds1()    
    --Remove the advertisement (need to check it's there first - if this function
    --is called from a product restore, it may not have been created)
--    if (adGroup) then
  --      adGroup:removeSelf()
 --      adGroup=nil
    -- end
	
	unlockad=1
	wpmaGlobalAdmob.hideAdmobBannerAd()
	print("just unlocked")
    --Change the button text
    buyGroup1.text.text="Ads removed"
    buyGroup1:removeEventListener("tap", buyUnlock1)
	buyitz.isVisible=false
		buyitz:removeSelf()
        buyitz=nil  
	buyitz = display.newImageRect( "shop222.png", 180, 180 )
  buyitz.x = display.contentCenterX
  buyitz.y = 148-60+30-30
  buyitz.isVisible=true
	
end



--Called when the relevant app store has completed the purchase
local function purchaseListener1(product )
    --Remove the spinner
    spinner:removeSelf()
    spinner=nil
    --Remove the ads
    removeAds1()
    --Save the inventory change
    iap.saveInventory()
    --Give the user a message saying the purchase was successful
    native.showAlert("Info", "Your purchase was successful", {"Okay"})
end

--Purchase function
--Most of the code in this function places a spinner on screen to prevent any further user interaction with
--the screen.  The actual code to initiate the purchase is the single line iap.purchase("removeAds"...)
buyUnlock1=function()
    
    --Place a progress spinner on screen and tell the user the app is contating the store
    local spinnerBackground = display.newRect(160,240,360,600)
    spinnerBackground:setFillColor(1,1,1,0.75)
    --Spinner consumes all taps so the user cannot tap the purchase button twice
    spinnerBackground:addEventListener("tap", function() return true end)
    local spinnerText = display.newText("Contacting " .. iap.getStoreName() .. "...", 160,180, native.systemFont, 18)
    spinnerText:setFillColor(0,0,0)
    --Add a little spinning rectangle
    local spinnerRect = display.newRect(160,260,35,35)
    spinnerRect:setFillColor(0.25,0.25,0.25)
    transition.to(spinnerRect, { time=4000, rotation=360, iterations=999999, transition=easing.inOutQuad})
    --Create a group and add all these objects to it
    spinner=display.newGroup()
    spinner:insert(spinnerBackground)
    spinner:insert(spinnerText)
    spinner:insert(spinnerRect)
    
    --Tell IAP to initiate a purchase
    iap.purchase("removeAds1", purchaseListener1)
    
end





local function removeAds2()    
    --Remove the advertisement (need to check it's there first - if this function
    --is called from a product restore, it may not have been created)
--    if (adGroup) then
  --      adGroup:removeSelf()
 --      adGroup=nil
    -- end
	
	unlockad=1
	wpmaGlobalAdmob.hideAdmobBannerAd()
	print("just unlocked")
    --Change the button text
    buyGroup2.text.text="Ads removed"
    buyGroup2:removeEventListener("tap", buyUnlock2)
	buyitz.isVisible=false
		buyitz:removeSelf()
        buyitz=nil  
	buyitz = display.newImageRect( "shop2222.png", 180, 180 )
  buyitz.x = display.contentCenterX
  buyitz.y = 148-60+30-30
  buyitz.isVisible=true
	
end



--Called when the relevant app store has completed the purchase
local function purchaseListener2(product )
    --Remove the spinner
    spinner:removeSelf()
    spinner=nil
    --Remove the ads
    removeAds2()
    --Save the inventory change
    iap.saveInventory()
    --Give the user a message saying the purchase was successful
    native.showAlert("Info", "Your purchase was successful", {"Okay"})
end

--Purchase function
--Most of the code in this function places a spinner on screen to prevent any further user interaction with
--the screen.  The actual code to initiate the purchase is the single line iap.purchase("removeAds"...)
buyUnlock2=function()
    
    --Place a progress spinner on screen and tell the user the app is contating the store
    local spinnerBackground = display.newRect(160,240,360,600)
    spinnerBackground:setFillColor(1,1,1,0.75)
    --Spinner consumes all taps so the user cannot tap the purchase button twice
    spinnerBackground:addEventListener("tap", function() return true end)
    local spinnerText = display.newText("Contacting " .. iap.getStoreName() .. "...", 160,180, native.systemFont, 18)
    spinnerText:setFillColor(0,0,0)
    --Add a little spinning rectangle
    local spinnerRect = display.newRect(160,260,35,35)
    spinnerRect:setFillColor(0.25,0.25,0.25)
    transition.to(spinnerRect, { time=4000, rotation=360, iterations=999999, transition=easing.inOutQuad})
    --Create a group and add all these objects to it
    spinner=display.newGroup()
    spinner:insert(spinnerBackground)
    spinner:insert(spinnerText)
    spinner:insert(spinnerRect)
    
    --Tell IAP to initiate a purchase
    iap.purchase("removeAds2", purchaseListener2)
    
end

---------------------------------
-- 
-- Restoring purchases
--
---------------------------------

local function restoreListener(productName, event)
    
    --If this is the first product to be restored, remove the spinner
    --(Not really necessary in a one-product app, but I'll leave this as template
    --code for those of you writing apps with multi-products).
    if (event.firstRestoreCallback) then
        --Remove the spinner from the screen
        spinner:removeSelf()
        spinner=nil        
        --Tell the user their items are being restore
        native.showAlert("Restore", "Your items are being restored", {"Okay"})
    end
    
    --Remove the ads
    if (productName=="removeAds") then removeAds() end
    if (productName=="removeAds1") then removeAds1() end
    if (productName=="removeAds2") then removeAds2() end
    
    --Save any inventory changes
    iap.saveInventory()
    
end

--Restore function
--Most of the code in this function places a spinner on screen to prevent any further user interaction with
--the screen.  The actual code to initiate the purchase is the single line iap.restore(false, ...)
local function restorePurchases()
    
    --Place a progress spinner on screen and tell the user the app is contating the store
    local spinnerBackground = display.newRect(160,240,360,600)
    spinnerBackground:setFillColor(1,1,1,0.75)
    --Spinner consumes all taps so the user cannot tap the purchase button twice
    spinnerBackground:addEventListener("tap", function() return true end)
    local spinnerText = display.newText("Contacting " .. iap.getStoreName() .. "...", 160,180, native.systemFont, 18)
    spinnerText:setFillColor(0,0,0)
    --Add a little spinning rectangle
    local spinnerRect = display.newRect(160,260,35,35)
    spinnerRect:setFillColor(0.25,0.25,0.25)
    transition.to(spinnerRect, { time=4000, rotation=360, iterations=999999, transition=easing.inOutQuad})
    --Create a group and add all these objects to it
    spinner=display.newGroup()
    spinner:insert(spinnerBackground)
    spinner:insert(spinnerText)
    spinner:insert(spinnerRect)
    
    --Tell IAP to initiate a purchase
    --Use the failedListener from onPurchase, which just clears away the spinner from the screen.
    --You could have a separate function that tells the user "Unable to contact the app store" or
    --similar on a timeout.
    --On the simulator, or in debug mode, this function attempts to restore all of the non-consumable
    --items in the catalogue.
    iap.restore(false, restoreListener, failedListener)
    
end
























display.setStatusBar( display.HiddenStatusBar )
--import the widget library
local widget = require( "widget" )
local widgetz = require( "widget" )
local widget0 = require( "widget" )
widgetz.setTheme("widget_theme_ios")
widget0.setTheme("widget_theme_ios")
 wheelreturnmin=0
 settings={}
bkimages={"1b.png","2b.png","3b.png","4b.png"}
 mylink="https://play.google.com/store/apps/details?id=com.gmail.rockingdna.staff.PregnancyKickcounter"
 mylink2="https://play.google.com/store/apps/details?id=com.gmail.rockingdna.staff.PregnancyKickcounter"
sizechart={"f4.png","f5.png","f6.png","f7.png","f8.png","f9.png","f10.png","f11.png","f12.png","f13.png","f14.png","f15.png","f16.png","f17.png","f18.png","f19.png","f20.png","f21.png","f22.png","f23.png","f24.png","f25.png","f26.png","f27.png","f28.png","f29.png","f30.png","f31.png","f32.png","f33.png","f34.png","f35.png","f36.png","f37.png","f38.png","f39.png","f40.png"}
sizetext1={"        Size of your baby: \n                 Poppyseed","        Size of your baby: \n                 Appleseed","        Size of your baby: \n            Sweet Pea","        Size of your baby: \n                 Blueberry","        Size of your baby: \n                 Raspberry","        Size of your baby: \n                 Green Olive","        Size of your baby: \n                 Prune","        Size of your baby: \n                 Lime","        Size of your baby: \n                 Plum","        Size of your baby: \n                 Peach","        Size of your baby: \n                 Lemon","        Size of your baby: \n              Navel Orange","        Size of your baby: \n                 Avocado","        Size of your baby: \n                 Onion","        Size of your baby: \n             Sweet Potato","        Size of your baby: \n                 Mango","        Size of your baby: \n                 Banana","        Size of your baby: \n                 Pomegranate","        Size of your baby: \n                 Papaya","        Size of your baby: \n                 Grapefruit","        Size of your baby: \n                 Cantaloupe","        Size of your baby: \n                 Cauliflower","        Size of your baby: \n                 Lettuce","        Size of your baby: \n                 Rutabaga","        Size of your baby: \n                 Eggplant","        Size of your baby: \n             Acorn Squash","        Size of your baby: \n                 Cucumber","        Size of your baby: \n                 Pineapple","        Size of your baby: \n                 Squash","        Size of your baby: \n                 Durian","        Size of your baby: \n          Butternut Squash","        Size of your baby: \n                 Coconut","        Size of your baby: \n                 Honeydew","        Size of your baby: \n                 Winter Melon","        Size of your baby: \n                 Pumpkin","        Size of your baby: \n                 Watermelon","        Size of your baby: \n                 Jackfruit"}
sizeleng={"        Baby's Length:\n                 0.014 to 0.04 in.","        Baby's Length:\n                 0.05 in.","        Baby's Length:\n                 1/8 in.","        Baby's Length:\n                 .5 in.","        Baby's Length:\n                 0.63 in.","        Baby's Length:\n                 .9 in.","        Baby's Length:\n                 1.22 in.","        Baby's Length:\n                 1.61 in.","        Baby's Length:\n                 2.13 in.","        Baby's Length:\n                 2.91 in.","        Baby's Length:\n                 3.42 in.","        Baby's Length:\n                 3.98 in.","        Baby's Length:\n                 4.57 in.","        Baby's Length:\n                 5.12 in.","        Baby's Length:\n                 5.59 in.","        Baby's Length:\n                 6.02 in.","        Baby's Length:\n                 6.46 in.","        Baby's Length:\n                 10.51 in.","        Baby's Length:\n                 10.94 in.","        Baby's Length:\n                 11.38 in.","        Baby's Length:\n                 11.81 in.","        Baby's Length:\n                 13.5 in.","        Baby's Length:\n                 14.02 in.","        Baby's Length:\n                 14.41 in.","        Baby's Length:\n                 14.80 in.","        Baby's Length:\n                 15.2 in.","        Baby's Length:\n                 15.71 in.","        Baby's Length:\n                 16.18 in.","        Baby's Length:\n                 16.69 in.","        Baby's Length:\n                 17.20 in.","        Baby's Length:\n                 17.72 in.","        Baby's Length:\n                 18.19 in.","        Baby's Length:\n                 18.66 in.","        Baby's Length:\n                 19.13 in.","        Baby's Length:\n                 19.61 in.","        Baby's Length:\n                 19.96 in.","        Baby's Length:\n                 20.16 to 21 in."}
sizewt={"        Baby's Weight:\n         less than 0.04 oz.","        Baby's Weight:\n         less than 0.04 oz.","        Baby's Weight:\n         less than 0.04 oz.","        Baby's Weight:\n         less than 0.04 oz.","        Baby's Weight:\n         less than 0.04 oz.","        Baby's Weight:\n                 .07 oz.","        Baby's Weight:\n                 0.14 oz.","        Baby's Weight:\n                 0.25 oz.","        Baby's Weight:\n                 0.49 oz.","        Baby's Weight:\n                 0.81 oz.","        Baby's Weight:\n                 1.52 oz.","        Baby's Weight:\n                 2.47 oz.","        Baby's Weight:\n                 3.53 oz.","        Baby's Weight:\n                 4.94 oz.","        Baby's Weight:\n                 6.70 oz.","        Baby's Weight:\n                 8.47 oz.","        Baby's Weight:\n                 10.58 oz.","        Baby's Weight:\n                 12.70 oz.","        Baby's Weight:\n                 15.17 oz.","        Baby's Weight:\n                 1.10 lb.","        Baby's Weight:\n                 1.32 lb.","        Baby's Weight:\n                 1.5 lb.","        Baby's Weight:\n                 1.68 lb.","        Baby's Weight:\n                 1.93 lb.","        Baby's Weight:\n                 2.22 lbs","        Baby's Weight:\n                 2.54 lbs.","        Baby's Weight:\n                 2.91 lbs.","        Baby's Weight:\n                 3.31 lbs.","        Baby's Weight:\n                 3.75 lbs.","        Baby's Weight:\n                 4.23 lbs.","        Baby's Weight:\n                 4.73 lbs.","        Baby's Weight:\n                 5.25 lbs.","        Baby's Weight:\n                 5.78 lbs.","        Baby's Weight:\n                 6.30 lbs.","        Baby's Weight:\n                 6.80 lbs.","        Baby's Weight:\n                 7.25 lbs.","        Baby's Weight:\n                 7.63 to 9 lbs."}
local notifications = require( "plugin.notifications" )
local wpmaGlobalAdmob = require("wpmaGlobalAdmob")
wpmaGlobalAdmob.initAdmobBannerAd()
wpmaGlobalAdmob.initAdmobInterstitialAd()

-- function alarmer( hra,  mma)
-- local minutesInSeconds = 60
-- local hoursInSeconds =minutesInSeconds*60
-- local dayInSeconds = hoursInSeconds*24
-- notifications.cancelNotification()
-- local currentTime =  os.date( '*t' )
-- local currentHour = currentTime.hour
-- local currentMinutes = currentTime.min
-- local currentSeconds = currentTime.sec

-- --print("xxxxxxxxxxxxxx"..currentTime.hour..":"..currentTime.min)

-- local secondsToRemoveToStartAt12am = (currentHour * hoursInSeconds) - (currentMinutes * minutesInSeconds) - currentSeconds

-- local days = 30

-- local timeToSendNotification =  (hra*hoursInSeconds)+(mma*minutesInSeconds) --this will set it to go off at 10pm every day

-- for i=0, days do
     -- local time3 = dayInSeconds*i - secondsToRemoveToStartAt12am + timeToSendNotification
	 -- --print("time:"..time3)
	 -- if time3 >0 then

     -- local optionsw = {
          -- alert = "Reminder for your Kicky session",
       -- --   badge = 1,
      -- --    sound = "alert.caf",
    -- }
    
-- notifications.scheduleNotification(dayInSeconds*i - secondsToRemoveToStartAt12am + timeToSendNotification, optionsw )
  -- --print(time3.."in alarm ------------------")

  -- end
-- end
-- end


local options1Z = {
   alert = "Is it time for Kick Tracking?",
  
   --sound = "2.wav",
   custom = { msg = "Alarm" }
}
--(DAYS*24*60*60)
local notificationTime1 = (2*24*60*60) --SEC LALA
local notificationTime2 = (10*24*60*60) --SEC LALA
local notificationTime3 = (5*24*60*60) --SEC LALA
-- local notificationTime1 = (60) --SEC LALA
-- local notificationTime2 = (30) --SEC LALA
 
 function helpme()
 Help1 = display.newImage( "help1.jpg" )
Help1.anchorX=0
Help1.anchorY=0
Help1.x  = 12
Help1.y  = 0
Help1.alpha=1 --.70 and .90
Help1:scale( .60, .60 )
Help1:addEventListener("touch", function()  Help1.isVisible=false return true end)
 end

  function helpme2()
 Help1 = display.newImage( "help1.jpg" )
Help1.anchorX=0
Help1.anchorY=0
Help1.x  = 12
Help1.y  = 0-5
Help1.alpha=1 --.70 and .90
Help1:scale( .64, .01 )
Help1:addEventListener("touch", function()     transition.fadeOut( Help1, { time=4500, transition=easing.inExpo  } ) return true end)
 end
 
 
   function helpmez()
 system.openURL(mylink2)  
 end
 
 
 
function updateduetag2()
--print("here!!!!!!!!!!!!!!!!")
if inthefuture==nil then

remainingtext="Set\ndate"
else
difference1=os.difftime( inthefuture, os.time())/86400
remainingtext=math.round(difference1).." days\n    to go"

if difference1<1 then
remainingtext="Any day\n    now"
end



end
contdownhearttext.text = remainingtext

end
 
 local loadsave = require("loadsave")
 
 
 if (loadsave.loadTable("initsession.json", system.DocumentsDirectory) ==nil) then

initsession={}
initsession[1]={}
initsession[1].currentsession=0
initsession[1].sessstarttime=0
initsession[1].table1=0
initsession[1].kickv=0
	initsession[1].datatrack=0
	initsession[1].statis=0
		initsession[1].datatrackall=0
	--	initsession[1].tempstamp=0
else
initsession=loadsave.loadTable("initsession.json", system.DocumentsDirectory)


-- resume logiic here
end


if (loadsave.loadTable("settings.json", system.DocumentsDirectory) ==nil) then

settings={}
settings[1]={}
settings[1].bkground=1
settings[1].remind=0 --[[0= not set ; 1 = rated; 2= later; 3 = no thanks]]--
settings[1].CHECKALARMONOFF=0
settings[1].CHECKSOUNDONOFF=0
settings[1].roll1=12
settings[1].roll2=0
settings[1].roll3="PM"
if settings[1].bkground == 1 then
settings[1].locabar="bar1.jpg" 
elseif settings[1].bkground == 3 then
settings[1].locabar="bar1.jpg"

else
settings[1].locabar="bar2.png"
end
else
settings=loadsave.loadTable("settings.json", system.DocumentsDirectory)

if settings[1].CHECKALARMONOFF== nill then

settings[1].CHECKALARMONOFF=0
settings[1].CHECKSOUNDONOFF=0
settings[1].roll1=12
settings[1].roll2=0
settings[1].roll3="PM"
end

if settings[1].CHECKALARMONOFF== 0 then

settings[1].CHECKALARMONOFF=0
settings[1].CHECKSOUNDONOFF=0
settings[1].roll1=12
settings[1].roll2=0
settings[1].roll3="PM"
end
--print("roll"..settings[1].roll1)
if settings[1].bkground == 1 then
settings[1].locabar="bar1.jpg" 
elseif settings[1].bkground == 3 then
settings[1].locabar="bar1.jpg"

else
settings[1].locabar="bar2.png"
end
end
--bkimages[settings[1].bkground]
 --print("sound state"..settings[1].CHECKSOUNDONOFF)
 


 
 
 function openlink()
 dry1=-50
 grateA = display.newGroup()
 
 				 rb1r = display.newRect( _W, _H, _W*2, _H*2 )
 rb1r:setFillColor( 0, 0, 0 ,.85)
--rb1r:toFront()
rb1r:addEventListener("touch", function()  return true end)
rb1r:addEventListener("tap", function()  return true end)
 
 
halt1rate= display.newRect( 0 , 200+dry1, 50+100*4, 44*3+30+65+50-50 )
halt1rate.alpha=.95
halt1rate.anchorX=0
halt1rate.anchorY=0
halt1rate:setFillColor( .2, .2, .2 ,.95)
halt1rate:setStrokeColor( .8, .8 ,.8 )
halt1rate.strokeWidth = .51

halt1ratetext = display.newText( "Rate Pregnancy Kickcounter", 160, 44*3+185-65-40+dry1,native.systemFont, 16 )
halt1ratetext:setFillColor( .2, 1, .3 )
halt2ratetext = display.newText( "            Did you enjoy using the App.\n     If so, please take a moment to rate it. \n     This helps us keep our updates free.\n             Thank you for your support.", 155, 44*3+185-65+35+dry1,native.systemFont, 14 )
halt2ratetext:setFillColor( .8, .8, .8 )

 star2 = display.newImage( "5stars2.png" )
star2.anchorX=0
star2.anchorY=0
star2.x  = 160-65-20+5+2-15-5-5-5-5+2
star2.y  = 44*3+185-65-40-20+30+dry1-10
star2.alpha=.75 --.70 and .90
star2:scale( .35, .35 )

 rateme1b = display.newImage( "r1.png" )
rateme1b.anchorX=0
rateme1b.anchorY=0
rateme1b.x  = 160-65
rateme1b.y  = 44*3+185-65-40-20+30+dry1+100+10
rateme1b.alpha=.8 --.70 and .90
rateme1b:scale( .70, .70 ) 

rateme2b = display.newImage( "r2.png" )
rateme2b.anchorX=0
rateme2b.anchorY=0
rateme2b.x  = 160-65
rateme2b.y  = 44*3+185-65-40-20+30+dry1+100+50+5
rateme2b.alpha=.8 --.70 and .90
rateme2b:scale( .70, .70 )

rateme3b = display.newImage( "r3.png" )
rateme3b.anchorX=0
rateme3b.anchorY=0
rateme3b.x  = 160-65
rateme3b.y  = 44*3+185-65-40-20+30+dry1+100+50+50
rateme3b.alpha=.8 --.70 and .90
rateme3b:scale( .70, .70 )
rateme3b.isVisible=false

 lograte = display.newImage( "stars.png" )
lograte.anchorX=0
lograte.anchorY=0
lograte.x  = 160-65+20
lograte.y  = 44*3+185-65-40-20+30+dry1-85-5
lograte.alpha=.8 --.70 and .90
lograte:scale( .25, .25 )

function rateme1b:touch( event )
    if event.phase == "began" then

settings[1].remind=1 
 system.openURL(mylink)  
 grateA.isVisible=false
 
end
end



  grateA:insert( rb1r )
 grateA:insert( halt1rate ) 
  grateA:insert( halt1ratetext )


  grateA:insert( lograte )
  grateA:insert( star2 )
halt2ratetext:toFront()

    grateA:insert( halt2ratetext )

rateme1b:toFront()
rateme2b:toFront()
rateme3b:toFront()
     grateA:insert( rateme1b )
  grateA:insert( rateme2b )
  grateA:insert( rateme3b )
 loadsave.saveTable(settings, "settings.json", system.DocumentsDirectory)
 	rateme1b:addEventListener( "touch", rateme1b )
rateme2b:addEventListener("touch", function()  settings[1].remind=2    grateA.isVisible=false return true end)
rateme3b:addEventListener("touch", function()   settings[1].remind=3   grateA.isVisible=false return true end)
 --system.openURL( mylink )
 end
 
 
 
 
local whereamI=1 --1-LADY 2-STAT  3- NOTE 4-STOP 5-KICKEARLIER
monTT2=    {
      "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"
    }
local function roundToFirstDecimal(t)
    return math.round(t*10)*0.1
end
	
		function haltit2()
g4A = display.newGroup()
halt1= display.newRect( 0 , 200, 50+100*4, 44*3+30-65 )
halt1.alpha=.95
halt1.anchorX=0
halt1.anchorY=0
halt1:setFillColor( .2, .2, .2 ,.95)
halt1:setStrokeColor( .8, .8 ,.8 )
halt1.strokeWidth = .51

halt1text = display.newText( "            Start or unpause session by\n     pressing start button before ending \n                       the session.", 155, 44*3+185-65,native.systemFont, 14 )
halt1text:setFillColor( .8, .8, .8 )

 g4A:insert( halt1 ) 
  g4A:insert( halt1text )
  
   transition.fadeOut( g4A, { time=3500, transition=easing.inCirc  } )
end
	
		function messenger2(text)
g4A = display.newGroup()
halt1= display.newRect( 0 , 200, 50+100*4, 44*3+30-65 )
halt1.alpha=.95
halt1.anchorX=0
halt1.anchorY=0
halt1:setFillColor( .2, .2, .2 ,.95)
halt1:setStrokeColor( .8, .8 ,.8 )
halt1.strokeWidth = .51

halt1text = display.newText( text, 155, 44*3+185-65,native.systemFont, 14 )
halt1text:setFillColor( .8, .8, .8 )

 g4A:insert( halt1 ) 
  g4A:insert( halt1text )
  
   transition.fadeOut( g4A, { time=3500, transition=easing.inCirc  } )
end
	
	
function reverseTable(t)
xq={}
for i=1,#t do
xq[i]={}
xq[i].title=t[#t+1-i].title
xq[i].collapsed=t[#t+1-i].collapsed
end
return xq

end

function removecal1()
if g1==nil then
else
g1:removeSelf()
g1 = nil
end
end

function print_r ( t )  
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            print(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        print(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                        print(indent..string.rep(" ",string.len(pos)+6).."}")
                    elseif (type(val)=="string") then
                        print(indent.."["..pos..'] => "'..val..'"')
                    else
                       print(indent.."["..pos.."] => "..tostring(val))
                    end
                end
            else
               print(indent..tostring(t))
            end
        end
    end
    if (type(t)=="table") then
       print(tostring(t).." {")
        sub_print_r(t,"  ")
        print("}")
    else
        sub_print_r(t,"  ")
    end
  print()
end


local tableView = require( "tableView" )
-- create a constant for the left spacing of the row content
local LEFT_PADDING = 10
local transActivated = false;
--Set the background to white
--display.setDefault( "background", 1, 1, 1 )

local populateList


local s={}
s[1]={}
s[1]={1,2,3,4,5,6}
function maxindex(kk)
val=0
ind=0
for ii=1,#kk do 
if kk[ii] > val then
val=kk[ii]
ind =ii
end

end
--print(#kk)
return  ind

end



function getdayname(a)
if a==1 then
k="Sunday     "
elseif a==2 then
k="Monday    "
elseif a==3 then
k="Tuesday   "
elseif a==4 then
k="Wednesday "
elseif a==5 then
k="Thursday  "
elseif a==6 then
k="Friday       "
elseif a==7 then 
k="Saturday   "
end
return k
end

function gethrrange(a)
if a<12 then
z= a.."am - "..a+1 .."am"
elseif  a== 12 then
z= a.."am - ".."1 pm"
elseif  a> 12 and a< 24 then
z= a-12 .."pm - "..a - 12  + 1 .."pm"
else
z= "12 pm - 1 am"
end
return z
end

function checkam(a)
if a<12 then
sta=" AM"

elseif  a== 12 then
sta=" PM"

elseif  a> 12 and a< 24 then
sta=" PM"

else
sta=" AM"

end
return sta
end



local dailytable={}
local hourlytable={}

for i=1,7 do
dailytable[i]={}
dailytable[i][1]={}
dailytable[i][1]=getdayname(i)
dailytable[i][2]={}
dailytable[i][2]=0
end
for i=1,24 do
hourlytable[i]={}
hourlytable[i][1]={}
hourlytable[i][1]=gethrrange(i)
hourlytable[i][2]={}
hourlytable[i][2]=0
end
--print("daily[[[[[[[[[[[[[]]]]]]]]]]]]]")
print_r(dailytable)
print_r(hourlytable)




--caldataint













function invoketable1(listItems1)


local tableView = require( "tableView" )
-- create a constant for the left spacing of the row content
local LEFT_PADDING = 10
local transActivated = false;
--Set the background to white
--display.setDefault( "background", 1, 1, 1 )
local listItems ={}
listItems = listItems1
local populateList



--Create a group to hold our widgets & images
widgetGroup1 = display.newGroup()

-- Forward reference for our back button & tableview
local backButton, list
local rowTitles = {}

local transAlpha = {}
local transY = {}

-- Hande row touch events
 function onRowTouch( event )
	local phase = event.phase
	local row = event.target
	
	if "press" == phase then
		--print( "Pressed row: " .. row.index )

	elseif "release" == phase then
		-- Update the item selected text
		--itemSelected.text = "You selected: " .. rowTitles[row.id]

        ----print(rowTitles[row.id])
		
		--Transition out the list, transition in the item selected text and the back button

		-- The table x origin refers to the center of the table in Graphics 2.0, so we translate with half the object's contentWidth
		transition.to( list, { x = - list.contentWidth * 0.5, time = 400, transition = easing.outExpo } )
		transition.to( itemSelected, { x = display.contentCenterX, time = 400, transition = easing.outExpo } )
		transition.to( backButton, { alpha = 1, time = 400, transition = easing.outQuad } )
		
		--print( "Tapped and/or Released row: " .. row.index )
	end
end

 function onCategoryTap(event)
    if(transActivated == false)then
        transActivated = true;
        local row = event.target
        --print("tapped Category", row.id)
        
        local addedRowHeight = 0
        local listRows = list._view._rows
        list._view._velocity = 0
            
        local function detailTrans(t, tMax, start, delta)
            local dy = addedRowHeight * t / tMax
            for i, v in pairs(transY) do
                if listRows[i]._view then
                    listRows[i]._view.y = v.startY + dy - v.height * 0.5
                end
                listRows[i].y = v.startY + dy
            end
            local alpha = start + delta * t / tMax
            list:reloadData()
            for i, v in pairs(transAlpha) do
                if listRows[i]._view then
                    listRows[i]._view.alpha = alpha
                end
            end
            return alpha
        end;
        
        local function detailTransComplete(_)
            for i, v in pairs(transY) do
                if listRows[i]._view then
                    listRows[i]._view.y = v.startY + addedRowHeight - v.height * 0.5
                end
                listRows[i].y = v.startY + addedRowHeight
            end
            for i, v in pairs(transAlpha) do
                if listRows[i]._view then
                    listRows[i]._view.alpha = 1
                end
            end
            transAlpha = {}
            transY = {}
            transActivated = false;
        end
        
        local rowHeight = 40    
        
        listItems[row.id].collapsed = not listItems[row.id].collapsed
        transAlpha = {}
        transY = {}
        if not listItems[row.id].collapsed then
            --Insert the subitems
            --setup items that need to be pushed down
            for i = row.row.index + 1, table.maxn(listRows) do
                if listRows[i] then
                    local ti = {}
                    ti.index = i + #listItems[row.id].items
                    ti.startY = listRows[i].y
                    ti.height = listRows[i]._height
                    transY[ti.index] = ti
                end
            end
            for j = 1, #listItems[row.id].items do
                    --Add the rows item title
                    rowTitles[row.id.."-"..j] = listItems[row.id].items[j]

                    --Insert the item
                    list:insertRow{
                            id = row.id.."-"..j,
                            rowHeight = rowHeight,
                            isCategory = false,
                            listener = onRowTouch
                    }
                    addedRowHeight = addedRowHeight + rowHeight + 1
                    --setup items to fade in
                    local ti = {}
                    ti.index = row.row.index + j
                    transAlpha[ti.index] = ti
                    --sort row indexes
                    if table.maxn(listRows) > row.row.index + j then
                        local tmpRow = listRows[row.row.index + j]
                        listRows[row.row.index + j] = listRows[table.maxn(listRows)]
                        if listRows[row.row.index + j] then
                            listRows[row.row.index + j].index = row.row.index + j
                            if listRows[row.row.index + j]._view then
                                listRows[row.row.index + j]._view.index = row.row.index + j
                            end
                        end
                        for i = table.maxn(listRows), row.row.index + j + 2, -1 do
                            listRows[i] = listRows[i - 1]
                            if listRows[i] then
                                listRows[i].index = i
                                if listRows[i]._view then
                                    listRows[i]._view.index = i
                                end
                            end
                        end
                        listRows[row.row.index + j + 1] = tmpRow
                        if tmpRow then
                            listRows[row.row.index + j + 1].index = row.row.index + j + 1
                            if listRows[row.row.index + j + 1]._view then
                                listRows[row.row.index + j + 1]._view.index = row.row.index + j + 1
                            end
                        end
                    end
            end
        else
            --delete the items
            --remove views first to avoid transition
            for i, v in pairs(list._view._rows) do
                if v._view then
                    display.remove(v._view)
                    v._view = nil
                end
            end
            local j = 1
            while row.row.index + j <= table.maxn(listRows) and (not listRows[row.row.index + j] or not listRows[row.row.index + j].isCategory) do
                    --Remove the rows item title
                    rowTitles[row.id.."-"..j] = nil
                    if listRows[row.row.index + j] then
                        list:deleteRow(row.row.index + j)
                    end
                    j = j + 1
            end

            local function listener( event )
                transActivated = false;
            end

            timer.performWithDelay( 200, listener )
            
        end
        local isGraphicsV1 = ( 1 == display.getDefault( "graphicsCompatibility" ) )
        --redrawRows
        local scrollHeight = 0
        local lastItem
        for i = 1, table.maxn(list._view._rows) do
            --set y for items that are not transitioned (remove when transition up done)
            local v = list._view._rows[i]
            if v then
                if not transY[i] then
                    if not lastItem then
                            local rowY = ( list._view._rows[i]._height * 0.5 ) - list._view.parent.height * 0.5
                            if isGraphicsV1 then
                                    rowY = ( list._view._rows[i]._height * 0.5 ) + 1
                            end
                            list._view._rows[i].y = rowY
                    else
                            if ( list._view._rows[lastItem].y ) then
                                list._view._rows[i].y = ( list._view._rows[lastItem].y + ( list._view._rows[lastItem]._height * 0.5 ) )
                                    + ( list._view._rows[i]._height * 0.5 ) + 1        
                            end
                    end
                end
                if list._view._rows[i] then
                    lastItem = i
                end
                --remove views to force update
                if v._view then
                    display.remove(v._view)
                    v._view = nil
                end
                scrollHeight = scrollHeight + v._height + 1
            end
        end
        --set scroll height
        list._view._scrollHeight = scrollHeight
        if list._view._scrollBar then
            list._view._scrollBar:repositionY()
        end
        --update table view
        list:reloadData()
        
        --hide items that will fade in and start transition
        if (table.maxn(transAlpha) > 0) or (table.maxn(transY) > 0) then
            local tai = nil
            for i, v in pairs(transAlpha) do
                if listRows[i]._view then
                    if tai == nil then
                        tai = i
                    end
                    if not listItems[row.id].collapsed then
                        listRows[i]._view.alpha = 0
                    end
                    listRows[i]._view:toBack()
                end
            end
            if tai then
                --if(transActivated == false) then
                  --  transActivated = true;
                    transition.to(listRows[tai]._view, {time = 200, alpha = 1, transition = detailTrans, onComplete = detailTransComplete})
                --end
            end
        end
        --list:deleteAllRows()
        --populateList()
    end
end

-- Handle row rendering
 function onRowRender( event )
	local phase = event.phase
	local row = event.row
	local isCategory = row.isCategory
        local tList = list
	row.reRender = true
	-- in graphics 2.0, the group contentWidth / contentHeight are initially 0, and expand once elements are inserted into the group.
	-- in order to use contentHeight properly, we cache the variable before inserting objects into the group

	local groupContentHeight = row.contentHeight
	
	local rowTitle = display.newText( row, rowTitles[row.id], 0, 0, native.systemFontBold, 10 )

        ----print("ORR called")
        
	-- in Graphics 2.0, the row.x is the center of the row, no longer the top left.
	rowTitle.x = LEFT_PADDING + 15

	-- we also set the anchorX of the text to 0, so the object is x-anchored at the left
	rowTitle.anchorX = 0

	rowTitle.y = groupContentHeight * 0.5
	rowTitle:setFillColor( .9, .9, .9 )
	
	if isCategory then
            
            local categoryBtn = display.newRect( row, 0, 0, row.width, row.height )
            categoryBtn.anchorX, categoryBtn.anchorY = 0, 0
            --categoryBtn:addEventListener ( "tap", onCategoryTap )
            categoryBtn.alpha = 0
            categoryBtn.isHitTestable = true
            categoryBtn.id = row.id
            categoryBtn.row = row
            
            local catIndicator = nil 
           
                catIndicator = display.newImage( row, "rowArrow.png", false )
           
            catIndicator.x = LEFT_PADDING
            catIndicator.anchorX = 0
            catIndicator.y = groupContentHeight * 0.5
            
        else
		local rowArrow = display.newImage( row, "rowArrow.png", false )
                
                rowArrow.x = row.contentWidth - LEFT_PADDING

		-- we set the image anchorX to 1, so the object is x-anchored at the right
		rowArrow.anchorX = 1

		-- we set the image anchorX to 1, so the object is x-anchored at the right
		rowArrow.y = groupContentHeight * 0.5
	end
end

-- Create a tableView
local list = tableView.new --adjustment to dimensions
{
	top = 50,
	width = 220+100, 
	height = display.contentHeight - 32 - 150-125+10+18,
	maskFile = "mask-320x448.png",
	onRowRender = onRowRender,
	onRowTouch = onRowTouch,
}
--Insert widgets/images into a group
widgetGroup1:insert( list )


function populateList()



print_r(listItems)
    for i = 1, #listItems do
	--Add the rows category title
	rowTitles[ #rowTitles + 1 ] = listItems[i].title
	
	--print(listItems[i].title)
	--Insert the category
	list:insertRow{
                id = i,
		rowHeight = 30,
		rowColor = 
		{ 
			default = { 255/255, 255/255, 255/255, 40/255 }, --search by 255 alpha or isvisible of rows
		},
		isCategory = true,
	}
        --print(listItems[i].collapsed )
        if not listItems[i].collapsed then
            --Insert the item
            for j = 1, #listItems[i].items do
                    --Add the rows item title
                    rowTitles[ #rowTitles + 1 ] = listItems[i].items[j]

                    --Insert the item
                    list:insertRow{
                            rowHeight = 20,
                            isCategory = false,
                            listener = onRowTouch
                    }
            end            
        end
    end
    
end
populateList()
end

function invoketable1z(listItems1)


local tableView = require( "tableView" )
-- create a constant for the left spacing of the row content
local LEFT_PADDING = 10
local transActivated = false;
--Set the background to white
--display.setDefault( "background", 1, 1, 1 )
local listItems ={}
listItems = listItems1
local populateList



--Create a group to hold our widgets & images
widgetGroup1 = display.newGroup()

-- Forward reference for our back button & tableview
local backButton, list
local rowTitles = {}

local transAlpha = {}
local transY = {}

-- Hande row touch events
 function onRowTouch( event )
	local phase = event.phase
	local row = event.target
	
	if "press" == phase then
		--print( "Pressed row: " .. row.index )

	elseif "release" == phase then
		-- Update the item selected text
		--itemSelected.text = "You selected: " .. rowTitles[row.id]

        ----print(rowTitles[row.id])
		
		--Transition out the list, transition in the item selected text and the back button

		-- The table x origin refers to the center of the table in Graphics 2.0, so we translate with half the object's contentWidth
		transition.to( list, { x = - list.contentWidth * 0.5, time = 400, transition = easing.outExpo } )
		transition.to( itemSelected, { x = display.contentCenterX, time = 400, transition = easing.outExpo } )
		transition.to( backButton, { alpha = 1, time = 400, transition = easing.outQuad } )
		
		--print( "Tapped and/or Released row: " .. row.index )
	end
end

 function onCategoryTap(event)
    if(transActivated == false)then
        transActivated = true;
        local row = event.target
        --print("tapped Category", row.id)
        
        local addedRowHeight = 0
        local listRows = list._view._rows
        list._view._velocity = 0
            
        local function detailTrans(t, tMax, start, delta)
            local dy = addedRowHeight * t / tMax
            for i, v in pairs(transY) do
                if listRows[i]._view then
                    listRows[i]._view.y = v.startY + dy - v.height * 0.5
                end
                listRows[i].y = v.startY + dy
            end
            local alpha = start + delta * t / tMax
            list:reloadData()
            for i, v in pairs(transAlpha) do
                if listRows[i]._view then
                    listRows[i]._view.alpha = alpha
                end
            end
            return alpha
        end;
        
        local function detailTransComplete(_)
            for i, v in pairs(transY) do
                if listRows[i]._view then
                    listRows[i]._view.y = v.startY + addedRowHeight - v.height * 0.5
                end
                listRows[i].y = v.startY + addedRowHeight
            end
            for i, v in pairs(transAlpha) do
                if listRows[i]._view then
                    listRows[i]._view.alpha = 1
                end
            end
            transAlpha = {}
            transY = {}
            transActivated = false;
        end
        
        local rowHeight = 40    
        
        listItems[row.id].collapsed = not listItems[row.id].collapsed
        transAlpha = {}
        transY = {}
        if not listItems[row.id].collapsed then
            --Insert the subitems
            --setup items that need to be pushed down
            for i = row.row.index + 1, table.maxn(listRows) do
                if listRows[i] then
                    local ti = {}
                    ti.index = i + #listItems[row.id].items
                    ti.startY = listRows[i].y
                    ti.height = listRows[i]._height
                    transY[ti.index] = ti
                end
            end
            for j = 1, #listItems[row.id].items do
                    --Add the rows item title
                    rowTitles[row.id.."-"..j] = listItems[row.id].items[j]

                    --Insert the item
                    list:insertRow{
                            id = row.id.."-"..j,
                            rowHeight = rowHeight,
                            isCategory = false,
                            listener = onRowTouch
                    }
                    addedRowHeight = addedRowHeight + rowHeight + 1
                    --setup items to fade in
                    local ti = {}
                    ti.index = row.row.index + j
                    transAlpha[ti.index] = ti
                    --sort row indexes
                    if table.maxn(listRows) > row.row.index + j then
                        local tmpRow = listRows[row.row.index + j]
                        listRows[row.row.index + j] = listRows[table.maxn(listRows)]
                        if listRows[row.row.index + j] then
                            listRows[row.row.index + j].index = row.row.index + j
                            if listRows[row.row.index + j]._view then
                                listRows[row.row.index + j]._view.index = row.row.index + j
                            end
                        end
                        for i = table.maxn(listRows), row.row.index + j + 2, -1 do
                            listRows[i] = listRows[i - 1]
                            if listRows[i] then
                                listRows[i].index = i
                                if listRows[i]._view then
                                    listRows[i]._view.index = i
                                end
                            end
                        end
                        listRows[row.row.index + j + 1] = tmpRow
                        if tmpRow then
                            listRows[row.row.index + j + 1].index = row.row.index + j + 1
                            if listRows[row.row.index + j + 1]._view then
                                listRows[row.row.index + j + 1]._view.index = row.row.index + j + 1
                            end
                        end
                    end
            end
        else
            --delete the items
            --remove views first to avoid transition
            for i, v in pairs(list._view._rows) do
                if v._view then
                    display.remove(v._view)
                    v._view = nil
                end
            end
            local j = 1
            while row.row.index + j <= table.maxn(listRows) and (not listRows[row.row.index + j] or not listRows[row.row.index + j].isCategory) do
                    --Remove the rows item title
                    rowTitles[row.id.."-"..j] = nil
                    if listRows[row.row.index + j] then
                        list:deleteRow(row.row.index + j)
                    end
                    j = j + 1
            end

            local function listener( event )
                transActivated = false;
            end

            timer.performWithDelay( 200, listener )
            
        end
        local isGraphicsV1 = ( 1 == display.getDefault( "graphicsCompatibility" ) )
        --redrawRows
        local scrollHeight = 0
        local lastItem
        for i = 1, table.maxn(list._view._rows) do
            --set y for items that are not transitioned (remove when transition up done)
            local v = list._view._rows[i]
            if v then
                if not transY[i] then
                    if not lastItem then
                            local rowY = ( list._view._rows[i]._height * 0.5 ) - list._view.parent.height * 0.5
                            if isGraphicsV1 then
                                    rowY = ( list._view._rows[i]._height * 0.5 ) + 1
                            end
                            list._view._rows[i].y = rowY
                    else
                            if ( list._view._rows[lastItem].y ) then
                                list._view._rows[i].y = ( list._view._rows[lastItem].y + ( list._view._rows[lastItem]._height * 0.5 ) )
                                    + ( list._view._rows[i]._height * 0.5 ) + 1        
                            end
                    end
                end
                if list._view._rows[i] then
                    lastItem = i
                end
                --remove views to force update
                if v._view then
                    display.remove(v._view)
                    v._view = nil
                end
                scrollHeight = scrollHeight + v._height + 1
            end
        end
        --set scroll height
        list._view._scrollHeight = scrollHeight
        if list._view._scrollBar then
            list._view._scrollBar:repositionY()
        end
        --update table view
        list:reloadData()
        
        --hide items that will fade in and start transition
        if (table.maxn(transAlpha) > 0) or (table.maxn(transY) > 0) then
            local tai = nil
            for i, v in pairs(transAlpha) do
                if listRows[i]._view then
                    if tai == nil then
                        tai = i
                    end
                    if not listItems[row.id].collapsed then
                        listRows[i]._view.alpha = 0
                    end
                    listRows[i]._view:toBack()
                end
            end
            if tai then
                --if(transActivated == false) then
                  --  transActivated = true;
                    transition.to(listRows[tai]._view, {time = 200, alpha = 1, transition = detailTrans, onComplete = detailTransComplete})
                --end
            end
        end
        --list:deleteAllRows()
        --populateList()
    end
end

-- Handle row rendering
 function onRowRender( event )
	local phase = event.phase
	local row = event.row
	local isCategory = row.isCategory
        local tList = list
	row.reRender = true
	-- in graphics 2.0, the group contentWidth / contentHeight are initially 0, and expand once elements are inserted into the group.
	-- in order to use contentHeight properly, we cache the variable before inserting objects into the group

	local groupContentHeight = row.contentHeight
	
	local rowTitle = display.newText( row, rowTitles[row.id], 0, 0, native.systemFontBold, 9 )

        ----print("ORR called")
        
	-- in Graphics 2.0, the row.x is the center of the row, no longer the top left.
	rowTitle.x = LEFT_PADDING + 15

	-- we also set the anchorX of the text to 0, so the object is x-anchored at the left
	rowTitle.anchorX = 0

	rowTitle.y = groupContentHeight * 0.5
	rowTitle:setFillColor( .9, .9, .9 )
	
	if isCategory then
            
            local categoryBtn = display.newRect( row, 0, 0, row.width, row.height )
            categoryBtn.anchorX, categoryBtn.anchorY = 0, 0
            --categoryBtn:addEventListener ( "tap", onCategoryTap )
            categoryBtn.alpha = 0
            categoryBtn.isHitTestable = true
            categoryBtn.id = row.id
            categoryBtn.row = row
            
            local catIndicator = nil 
           
                catIndicator = display.newImage( row, "rowArrow.png", false )
           
            catIndicator.x = LEFT_PADDING
            catIndicator.anchorX = 0
            catIndicator.y = groupContentHeight * 0.5
            
        else
		local rowArrow = display.newImage( row, "rowArrow.png", false )
                
                rowArrow.x = row.contentWidth - LEFT_PADDING

		-- we set the image anchorX to 1, so the object is x-anchored at the right
		rowArrow.anchorX = 1

		-- we set the image anchorX to 1, so the object is x-anchored at the right
		rowArrow.y = groupContentHeight * 0.5
	end
end

-- Create a tableView
local list = tableView.new --adjustment to dimensions
{
	top = 50+200+20,
	width = 220+100, 
	height = display.contentHeight - 32 - 150-125+10-52,
	maskFile = "mask-320x448.png",
	onRowRender = onRowRender,
	onRowTouch = onRowTouch,
}
--Insert widgets/images into a group
widgetGroup1:insert( list )


function populateList()



print_r(listItems)
    for i = 1, #listItems do
	--Add the rows category title
	rowTitles[ #rowTitles + 1 ] = listItems[i].title
	
	--print(listItems[i].title)
	--Insert the category
	list:insertRow{
                id = i,
		rowHeight = 30,
		rowColor = 
		{ 
			default = { 255/255, 255/255, 255/255, 40/255 }, --search by 255 alpha or isvisible of rows
		},
		isCategory = true,
	}
        --print(listItems[i].collapsed )
        if not listItems[i].collapsed then
            --Insert the item
            for j = 1, #listItems[i].items do
                    --Add the rows item title
                    rowTitles[ #rowTitles + 1 ] = listItems[i].items[j]

                    --Insert the item
                    list:insertRow{
                            rowHeight = 20,
                            isCategory = false,
                            listener = onRowTouch
                    }
            end            
        end
    end
    
end
populateList()
end



function invoketable3(listItems1)


local tableView = require( "tableView" )
-- create a constant for the left spacing of the row content
local LEFT_PADDING = 10
local transActivated = false;
--Set the background to white
--display.setDefault( "background", 1, 1, 1 )
local listItems ={}
listItems = listItems1
local populateList



--Create a group to hold our widgets & images
widgetGroup3 = display.newGroup()

-- Forward reference for our back button & tableview
local backButton, list
local rowTitles = {}

local transAlpha = {}
local transY = {}

-- Hande row touch events
 function onRowTouch( event )
	local phase = event.phase
	local row = event.target
	
	if "press" == phase then
		--print( "Pressed row: " .. row.index )

	elseif "release" == phase then
		-- Update the item selected text
		--itemSelected.text = "You selected: " .. rowTitles[row.id]

        ----print(rowTitles[row.id])
		
		--Transition out the list, transition in the item selected text and the back button

		-- The table x origin refers to the center of the table in Graphics 2.0, so we translate with half the object's contentWidth
		transition.to( list, { x = - list.contentWidth * 0.5, time = 400, transition = easing.outExpo } )
		transition.to( itemSelected, { x = display.contentCenterX, time = 400, transition = easing.outExpo } )
		transition.to( backButton, { alpha = 1, time = 400, transition = easing.outQuad } )
		
		--print( "Tapped and/or Released row: " .. row.index )
	end
end

 function onCategoryTap(event)
    if(transActivated == false)then
        transActivated = true;
        local row = event.target
        --print("tapped Category", row.id)
        
        local addedRowHeight = 0
        local listRows = list._view._rows
        list._view._velocity = 0
            
        local function detailTrans(t, tMax, start, delta)
            local dy = addedRowHeight * t / tMax
            for i, v in pairs(transY) do
                if listRows[i]._view then
                    listRows[i]._view.y = v.startY + dy - v.height * 0.5
                end
                listRows[i].y = v.startY + dy
            end
            local alpha = start + delta * t / tMax
            list:reloadData()
            for i, v in pairs(transAlpha) do
                if listRows[i]._view then
                    listRows[i]._view.alpha = alpha
                end
            end
            return alpha
        end;
        
        local function detailTransComplete(_)
            for i, v in pairs(transY) do
                if listRows[i]._view then
                    listRows[i]._view.y = v.startY + addedRowHeight - v.height * 0.5
                end
                listRows[i].y = v.startY + addedRowHeight
            end
            for i, v in pairs(transAlpha) do
                if listRows[i]._view then
                    listRows[i]._view.alpha = 1
                end
            end
            transAlpha = {}
            transY = {}
            transActivated = false;
        end
        
        local rowHeight = 40    
        
        listItems[row.id].collapsed = not listItems[row.id].collapsed
        transAlpha = {}
        transY = {}
        if not listItems[row.id].collapsed then
            --Insert the subitems
            --setup items that need to be pushed down
            for i = row.row.index + 1, table.maxn(listRows) do
                if listRows[i] then
                    local ti = {}
                    ti.index = i + #listItems[row.id].items
                    ti.startY = listRows[i].y
                    ti.height = listRows[i]._height
                    transY[ti.index] = ti
                end
            end
            for j = 1, #listItems[row.id].items do
                    --Add the rows item title
                    rowTitles[row.id.."-"..j] = listItems[row.id].items[j]

                    --Insert the item
                    list:insertRow{
                            id = row.id.."-"..j,
                            rowHeight = rowHeight,
                            isCategory = false,
                            listener = onRowTouch
                    }
                    addedRowHeight = addedRowHeight + rowHeight + 1
                    --setup items to fade in
                    local ti = {}
                    ti.index = row.row.index + j
                    transAlpha[ti.index] = ti
                    --sort row indexes
                    if table.maxn(listRows) > row.row.index + j then
                        local tmpRow = listRows[row.row.index + j]
                        listRows[row.row.index + j] = listRows[table.maxn(listRows)]
                        if listRows[row.row.index + j] then
                            listRows[row.row.index + j].index = row.row.index + j
                            if listRows[row.row.index + j]._view then
                                listRows[row.row.index + j]._view.index = row.row.index + j
                            end
                        end
                        for i = table.maxn(listRows), row.row.index + j + 2, -1 do
                            listRows[i] = listRows[i - 1]
                            if listRows[i] then
                                listRows[i].index = i
                                if listRows[i]._view then
                                    listRows[i]._view.index = i
                                end
                            end
                        end
                        listRows[row.row.index + j + 1] = tmpRow
                        if tmpRow then
                            listRows[row.row.index + j + 1].index = row.row.index + j + 1
                            if listRows[row.row.index + j + 1]._view then
                                listRows[row.row.index + j + 1]._view.index = row.row.index + j + 1
                            end
                        end
                    end
            end
        else
            --delete the items
            --remove views first to avoid transition
            for i, v in pairs(list._view._rows) do
                if v._view then
                    display.remove(v._view)
                    v._view = nil
                end
            end
            local j = 1
            while row.row.index + j <= table.maxn(listRows) and (not listRows[row.row.index + j] or not listRows[row.row.index + j].isCategory) do
                    --Remove the rows item title
                    rowTitles[row.id.."-"..j] = nil
                    if listRows[row.row.index + j] then
                        list:deleteRow(row.row.index + j)
                    end
                    j = j + 1
            end

            local function listener( event )
                transActivated = false;
            end

            timer.performWithDelay( 200, listener )
            
        end
        local isGraphicsV1 = ( 1 == display.getDefault( "graphicsCompatibility" ) )
        --redrawRows
        local scrollHeight = 0
        local lastItem
        for i = 1, table.maxn(list._view._rows) do
            --set y for items that are not transitioned (remove when transition up done)
            local v = list._view._rows[i]
            if v then
                if not transY[i] then
                    if not lastItem then
                            local rowY = ( list._view._rows[i]._height * 0.5 ) - list._view.parent.height * 0.5
                            if isGraphicsV1 then
                                    rowY = ( list._view._rows[i]._height * 0.5 ) + 1
                            end
                            list._view._rows[i].y = rowY
                    else
                            if ( list._view._rows[lastItem].y ) then
                                list._view._rows[i].y = ( list._view._rows[lastItem].y + ( list._view._rows[lastItem]._height * 0.5 ) )
                                    + ( list._view._rows[i]._height * 0.5 ) + 1        
                            end
                    end
                end
                if list._view._rows[i] then
                    lastItem = i
                end
                --remove views to force update
                if v._view then
                    display.remove(v._view)
                    v._view = nil
                end
                scrollHeight = scrollHeight + v._height + 1
            end
        end
        --set scroll height
        list._view._scrollHeight = scrollHeight
        if list._view._scrollBar then
            list._view._scrollBar:repositionY()
        end
        --update table view
        list:reloadData()
        
        --hide items that will fade in and start transition
        if (table.maxn(transAlpha) > 0) or (table.maxn(transY) > 0) then
            local tai = nil
            for i, v in pairs(transAlpha) do
                if listRows[i]._view then
                    if tai == nil then
                        tai = i
                    end
                    if not listItems[row.id].collapsed then
                        listRows[i]._view.alpha = 0
                    end
                    listRows[i]._view:toBack()
                end
            end
            if tai then
                --if(transActivated == false) then
                  --  transActivated = true;
                    transition.to(listRows[tai]._view, {time = 200, alpha = 1, transition = detailTrans, onComplete = detailTransComplete})
                --end
            end
        end
        --list:deleteAllRows()
        --populateList()
    end
end

-- Handle row rendering
 function onRowRender( event )
	local phase = event.phase
	local row = event.row
	local isCategory = row.isCategory
        local tList = list
	row.reRender = true
	-- in graphics 2.0, the group contentWidth / contentHeight are initially 0, and expand once elements are inserted into the group.
	-- in order to use contentHeight properly, we cache the variable before inserting objects into the group

	local groupContentHeight = row.contentHeight
	
	local rowTitle = display.newText( row, rowTitles[row.id], 0, 0, native.systemFontBold, 10 )

        ----print("ORR called")
        
	-- in Graphics 2.0, the row.x is the center of the row, no longer the top left.
	rowTitle.x = LEFT_PADDING + 15

	-- we also set the anchorX of the text to 0, so the object is x-anchored at the left
	rowTitle.anchorX = 0

	rowTitle.y = groupContentHeight * 0.5
	rowTitle:setFillColor( .8, .8, .8 )
	
	if isCategory then
            
            local categoryBtn = display.newRect( row, 0, 0, row.width, row.height )
            categoryBtn.anchorX, categoryBtn.anchorY = 0, 0
            --categoryBtn:addEventListener ( "tap", onCategoryTap )
            categoryBtn.alpha = 0
            categoryBtn.isHitTestable = true
            categoryBtn.id = row.id
            categoryBtn.row = row
            
            local catIndicator = nil 
           
                catIndicator = display.newImage( row, "rowArrow.png", false )
           
            catIndicator.x = LEFT_PADDING
            catIndicator.anchorX = 0
            catIndicator.y = groupContentHeight * 0.5
            
        else
		local rowArrow = display.newImage( row, "rowArrow.png", false )
                
                rowArrow.x = row.contentWidth - LEFT_PADDING

		-- we set the image anchorX to 1, so the object is x-anchored at the right
		rowArrow.anchorX = 1

		-- we set the image anchorX to 1, so the object is x-anchored at the right
		rowArrow.y = groupContentHeight * 0.5
	end
end

-- Create a tableView
local list = tableView.new --adjustment to dimensions
{
	top = 50,
	width = 220+100, 
	height = display.contentHeight - 32 - 150-125+10+18,
	maskFile = "mask-320x448.png",
	onRowRender = onRowRender,
	onRowTouch = onRowTouch,
}
--Insert widgets/images into a group
widgetGroup3:insert( list )


function populateList()



print_r(listItems)
    for i = 1, #listItems do
	--Add the rows category title
	rowTitles[ #rowTitles + 1 ] = listItems[i].title
	
	--print(listItems[i].title)
	--Insert the category
	list:insertRow{
                id = i,
		rowHeight = 30,
		rowColor = 
		{ 
			default = { 255/255, 255/255, 255/255, 40/255 }, --search by 255 alpha or isvisible of rows
		},
		isCategory = true,
	}
        --print(listItems[i].collapsed )
        if not listItems[i].collapsed then
            --Insert the item
            for j = 1, #listItems[i].items do
                    --Add the rows item title
                    rowTitles[ #rowTitles + 1 ] = listItems[i].items[j]

                    --Insert the item
                    list:insertRow{
                            rowHeight = 20,
                            isCategory = false,
                            listener = onRowTouch
                    }
            end            
        end
    end
    
end
populateList()
end




















function invoketable2(listItems1)


local tableView = require( "tableView" )
-- create a constant for the left spacing of the row content
local LEFT_PADDING = 10
local transActivated = false;
--Set the background to white
--display.setDefault( "background", 1, 1, 1 )
local listItems ={}
listItems = listItems1
local populateList



--Create a group to hold our widgets & images
widgetGroup2 = display.newGroup()

-- Forward reference for our back button & tableview
local backButton, list
local rowTitles = {}

local transAlpha = {}
local transY = {}

-- Hande row touch events
 function onRowTouch( event )
	local phase = event.phase
	local row = event.target
	
	if "press" == phase then
		--print( "Pressed row: " .. row.index )

	elseif "release" == phase then
		-- Update the item selected text
		--itemSelected.text = "You selected: " .. rowTitles[row.id]

        ----print(rowTitles[row.id])
		
		--Transition out the list, transition in the item selected text and the back button

		-- The table x origin refers to the center of the table in Graphics 2.0, so we translate with half the object's contentWidth
		transition.to( list, { x = - list.contentWidth * 0.5, time = 400, transition = easing.outExpo } )
		transition.to( itemSelected, { x = display.contentCenterX, time = 400, transition = easing.outExpo } )
		transition.to( backButton, { alpha = 1, time = 400, transition = easing.outQuad } )
		
		--print( "Tapped and/or Released row: " .. row.index )
	end
end

 function onCategoryTap(event)
    if(transActivated == false)then
        transActivated = true;
        local row = event.target
        --print("tapped Category", row.id)
        
        local addedRowHeight = 0
        local listRows = list._view._rows
        list._view._velocity = 0
            
        local function detailTrans(t, tMax, start, delta)
            local dy = addedRowHeight * t / tMax
            for i, v in pairs(transY) do
                if listRows[i]._view then
                    listRows[i]._view.y = v.startY + dy - v.height * 0.5
                end
                listRows[i].y = v.startY + dy
            end
            local alpha = start + delta * t / tMax
            list:reloadData()
            for i, v in pairs(transAlpha) do
                if listRows[i]._view then
                    listRows[i]._view.alpha = alpha
                end
            end
            return alpha
        end;
        
        local function detailTransComplete(_)
            for i, v in pairs(transY) do
                if listRows[i]._view then
                    listRows[i]._view.y = v.startY + addedRowHeight - v.height * 0.5
                end
                listRows[i].y = v.startY + addedRowHeight
            end
            for i, v in pairs(transAlpha) do
                if listRows[i]._view then
                    listRows[i]._view.alpha = 1
                end
            end
            transAlpha = {}
            transY = {}
            transActivated = false;
        end
        
        local rowHeight = 40    
        
        listItems[row.id].collapsed = not listItems[row.id].collapsed
        transAlpha = {}
        transY = {}
        if not listItems[row.id].collapsed then
            --Insert the subitems
            --setup items that need to be pushed down
            for i = row.row.index + 1, table.maxn(listRows) do
                if listRows[i] then
                    local ti = {}
                    ti.index = i + #listItems[row.id].items
                    ti.startY = listRows[i].y
                    ti.height = listRows[i]._height
                    transY[ti.index] = ti
                end
            end
            for j = 1, #listItems[row.id].items do
                    --Add the rows item title
                    rowTitles[row.id.."-"..j] = listItems[row.id].items[j]

                    --Insert the item
                    list:insertRow{
                            id = row.id.."-"..j,
                            rowHeight = rowHeight,
                            isCategory = false,
                            listener = onRowTouch
                    }
                    addedRowHeight = addedRowHeight + rowHeight + 1
                    --setup items to fade in
                    local ti = {}
                    ti.index = row.row.index + j
                    transAlpha[ti.index] = ti
                    --sort row indexes
                    if table.maxn(listRows) > row.row.index + j then
                        local tmpRow = listRows[row.row.index + j]
                        listRows[row.row.index + j] = listRows[table.maxn(listRows)]
                        if listRows[row.row.index + j] then
                            listRows[row.row.index + j].index = row.row.index + j
                            if listRows[row.row.index + j]._view then
                                listRows[row.row.index + j]._view.index = row.row.index + j
                            end
                        end
                        for i = table.maxn(listRows), row.row.index + j + 2, -1 do
                            listRows[i] = listRows[i - 1]
                            if listRows[i] then
                                listRows[i].index = i
                                if listRows[i]._view then
                                    listRows[i]._view.index = i
                                end
                            end
                        end
                        listRows[row.row.index + j + 1] = tmpRow
                        if tmpRow then
                            listRows[row.row.index + j + 1].index = row.row.index + j + 1
                            if listRows[row.row.index + j + 1]._view then
                                listRows[row.row.index + j + 1]._view.index = row.row.index + j + 1
                            end
                        end
                    end
            end
        else
            --delete the items
            --remove views first to avoid transition
            for i, v in pairs(list._view._rows) do
                if v._view then
                    display.remove(v._view)
                    v._view = nil
                end
            end
            local j = 1
            while row.row.index + j <= table.maxn(listRows) and (not listRows[row.row.index + j] or not listRows[row.row.index + j].isCategory) do
                    --Remove the rows item title
                    rowTitles[row.id.."-"..j] = nil
                    if listRows[row.row.index + j] then
                        list:deleteRow(row.row.index + j)
                    end
                    j = j + 1
            end

            local function listener( event )
                transActivated = false;
            end

            timer.performWithDelay( 200, listener )
            
        end
        local isGraphicsV1 = ( 1 == display.getDefault( "graphicsCompatibility" ) )
        --redrawRows
        local scrollHeight = 0
        local lastItem
        for i = 1, table.maxn(list._view._rows) do
            --set y for items that are not transitioned (remove when transition up done)
            local v = list._view._rows[i]
            if v then
                if not transY[i] then
                    if not lastItem then
                            local rowY = ( list._view._rows[i]._height * 0.5 ) - list._view.parent.height * 0.5
                            if isGraphicsV1 then
                                    rowY = ( list._view._rows[i]._height * 0.5 ) + 1
                            end
                            list._view._rows[i].y = rowY
                    else
                            if ( list._view._rows[lastItem].y ) then
                                list._view._rows[i].y = ( list._view._rows[lastItem].y + ( list._view._rows[lastItem]._height * 0.5 ) )
                                    + ( list._view._rows[i]._height * 0.5 ) + 1        
                            end
                    end
                end
                if list._view._rows[i] then
                    lastItem = i
                end
                --remove views to force update
                if v._view then
                    display.remove(v._view)
                    v._view = nil
                end
                scrollHeight = scrollHeight + v._height + 1
            end
        end
        --set scroll height
        list._view._scrollHeight = scrollHeight
        if list._view._scrollBar then
            list._view._scrollBar:repositionY()
        end
        --update table view
        list:reloadData()
        
        --hide items that will fade in and start transition
        if (table.maxn(transAlpha) > 0) or (table.maxn(transY) > 0) then
            local tai = nil
            for i, v in pairs(transAlpha) do
                if listRows[i]._view then
                    if tai == nil then
                        tai = i
                    end
                    if not listItems[row.id].collapsed then
                        listRows[i]._view.alpha = 0
                    end
                    listRows[i]._view:toBack()
                end
            end
            if tai then
                --if(transActivated == false) then
                  --  transActivated = true;
                    transition.to(listRows[tai]._view, {time = 200, alpha = 1, transition = detailTrans, onComplete = detailTransComplete})
                --end
            end
        end
        --list:deleteAllRows()
        --populateList()
    end
end

-- Handle row rendering
 function onRowRender( event )
	local phase = event.phase
	local row = event.row
	local isCategory = row.isCategory
        local tList = list
	row.reRender = true
	-- in graphics 2.0, the group contentWidth / contentHeight are initially 0, and expand once elements are inserted into the group.
	-- in order to use contentHeight properly, we cache the variable before inserting objects into the group

	local groupContentHeight = row.contentHeight
	
	local rowTitle = display.newText( row, rowTitles[row.id], 0, 0, native.systemFontBold, 10 )

        ----print("ORR called")
        
	-- in Graphics 2.0, the row.x is the center of the row, no longer the top left.
	rowTitle.x = LEFT_PADDING + 15

	-- we also set the anchorX of the text to 0, so the object is x-anchored at the left
	rowTitle.anchorX = 0

	rowTitle.y = groupContentHeight * 0.5
	rowTitle:setFillColor( .8, .8, .8 )
	
	if isCategory then
            
            local categoryBtn = display.newRect( row, 0, 0, row.width, row.height )
            categoryBtn.anchorX, categoryBtn.anchorY = 0, 0
            --categoryBtn:addEventListener ( "tap", onCategoryTap )
            categoryBtn.alpha = 0
            categoryBtn.isHitTestable = true
            categoryBtn.id = row.id
            categoryBtn.row = row
            
            local catIndicator = nil 
           
                catIndicator = display.newImage( row, "rowArrow.png", false )
           
            catIndicator.x = LEFT_PADDING
            catIndicator.anchorX = 0
            catIndicator.y = groupContentHeight * 0.5
            
        else
		local rowArrow = display.newImage( row, "rowArrow.png", false )
                
                rowArrow.x = row.contentWidth - LEFT_PADDING

		-- we set the image anchorX to 1, so the object is x-anchored at the right
		rowArrow.anchorX = 1

		-- we set the image anchorX to 1, so the object is x-anchored at the right
		rowArrow.y = groupContentHeight * 0.5
	end
end

-- Create a tableView
local list = tableView.new --adjustment to dimensions
{
	top = 50,
	width = 220+100, 
	height = display.contentHeight - 32 - 150-125+10+18,
	maskFile = "mask-320x448.png",
	onRowRender = onRowRender,
	onRowTouch = onRowTouch,
}
--Insert widgets/images into a group
widgetGroup2:insert( list )


function populateList()



print_r(listItems)
    for i = 1, #listItems do
	--Add the rows category title
	rowTitles[ #rowTitles + 1 ] = listItems[i].title
	
	--print(listItems[i].title)
	--Insert the category
	list:insertRow{
                id = i,
		rowHeight = 30,
		rowColor = 
		{ 
			default = { 255/255, 255/255, 255/255, 40/255 }, --search by 255 alpha or isvisible of rows
		},
		isCategory = true,
	}
        --print(listItems[i].collapsed )
        if not listItems[i].collapsed then
            --Insert the item
            for j = 1, #listItems[i].items do
                    --Add the rows item title
                    rowTitles[ #rowTitles + 1 ] = listItems[i].items[j]

                    --Insert the item
                    list:insertRow{
                            rowHeight = 20,
                            isCategory = false,
                            listener = onRowTouch
                    }
            end            
        end
    end
    
end
populateList()
end











function invoketable(listItems1)


local tableView = require( "tableView" )
-- create a constant for the left spacing of the row content
local LEFT_PADDING = 10
local transActivated = false;
--Set the background to white
--display.setDefault( "background", 1, 1, 1 )
local listItems ={}
listItems = listItems1
local populateList

--Create a group to hold our widgets & images
widgetGroup = display.newGroup()

-- Forward reference for our back button & tableview
local backButton, list
local rowTitles = {}

local transAlpha = {}
local transY = {}

-- Hande row touch events
 function onRowTouch( event )
	local phase = event.phase
	local row = event.target
	
	if "press" == phase then
		--print( "Pressed row: " .. row.index )

	elseif "release" == phase then
		-- Update the item selected text
		--itemSelected.text = "You selected: " .. rowTitles[row.id]

        ----print(rowTitles[row.id])
		
		--Transition out the list, transition in the item selected text and the back button

		-- The table x origin refers to the center of the table in Graphics 2.0, so we translate with half the object's contentWidth
		transition.to( list, { x = - list.contentWidth * 0.5, time = 400, transition = easing.outExpo } )
		transition.to( itemSelected, { x = display.contentCenterX, time = 400, transition = easing.outExpo } )
		transition.to( backButton, { alpha = 1, time = 400, transition = easing.outQuad } )
		
		--print( "Tapped and/or Released row: " .. row.index )
	end
end

 function onCategoryTap(event)
    if(transActivated == false)then
        transActivated = true;
        local row = event.target
        --print("tapped Category", row.id)
        
        local addedRowHeight = 0
        local listRows = list._view._rows
        list._view._velocity = 0
            
        local function detailTrans(t, tMax, start, delta)
            local dy = addedRowHeight * t / tMax
            for i, v in pairs(transY) do
                if listRows[i]._view then
                    listRows[i]._view.y = v.startY + dy - v.height * 0.5
                end
                listRows[i].y = v.startY + dy
            end
            local alpha = start + delta * t / tMax
            list:reloadData()
            for i, v in pairs(transAlpha) do
                if listRows[i]._view then
                    listRows[i]._view.alpha = alpha
                end
            end
            return alpha
        end;
        
        local function detailTransComplete(_)
            for i, v in pairs(transY) do
                if listRows[i]._view then
                    listRows[i]._view.y = v.startY + addedRowHeight - v.height * 0.5
                end
                listRows[i].y = v.startY + addedRowHeight
            end
            for i, v in pairs(transAlpha) do
                if listRows[i]._view then
                    listRows[i]._view.alpha = 1
                end
            end
            transAlpha = {}
            transY = {}
            transActivated = false;
        end
        
        local rowHeight = 40    
        
        listItems[row.id].collapsed = not listItems[row.id].collapsed
        transAlpha = {}
        transY = {}
        if not listItems[row.id].collapsed then
            --Insert the subitems
            --setup items that need to be pushed down
            for i = row.row.index + 1, table.maxn(listRows) do
                if listRows[i] then
                    local ti = {}
                    ti.index = i + #listItems[row.id].items
                    ti.startY = listRows[i].y
                    ti.height = listRows[i]._height
                    transY[ti.index] = ti
                end
            end
            for j = 1, #listItems[row.id].items do
                    --Add the rows item title
                    rowTitles[row.id.."-"..j] = listItems[row.id].items[j]

                    --Insert the item
                    list:insertRow{
                            id = row.id.."-"..j,
                            rowHeight = rowHeight,
                            isCategory = false,
                            listener = onRowTouch
                    }
                    addedRowHeight = addedRowHeight + rowHeight + 1
                    --setup items to fade in
                    local ti = {}
                    ti.index = row.row.index + j
                    transAlpha[ti.index] = ti
                    --sort row indexes
                    if table.maxn(listRows) > row.row.index + j then
                        local tmpRow = listRows[row.row.index + j]
                        listRows[row.row.index + j] = listRows[table.maxn(listRows)]
                        if listRows[row.row.index + j] then
                            listRows[row.row.index + j].index = row.row.index + j
                            if listRows[row.row.index + j]._view then
                                listRows[row.row.index + j]._view.index = row.row.index + j
                            end
                        end
                        for i = table.maxn(listRows), row.row.index + j + 2, -1 do
                            listRows[i] = listRows[i - 1]
                            if listRows[i] then
                                listRows[i].index = i
                                if listRows[i]._view then
                                    listRows[i]._view.index = i
                                end
                            end
                        end
                        listRows[row.row.index + j + 1] = tmpRow
                        if tmpRow then
                            listRows[row.row.index + j + 1].index = row.row.index + j + 1
                            if listRows[row.row.index + j + 1]._view then
                                listRows[row.row.index + j + 1]._view.index = row.row.index + j + 1
                            end
                        end
                    end
            end
        else
            --delete the items
            --remove views first to avoid transition
            for i, v in pairs(list._view._rows) do
                if v._view then
                    display.remove(v._view)
                    v._view = nil
                end
            end
            local j = 1
            while row.row.index + j <= table.maxn(listRows) and (not listRows[row.row.index + j] or not listRows[row.row.index + j].isCategory) do
                    --Remove the rows item title
                    rowTitles[row.id.."-"..j] = nil
                    if listRows[row.row.index + j] then
                        list:deleteRow(row.row.index + j)
                    end
                    j = j + 1
            end

            local function listener( event )
                transActivated = false;
            end

            timer.performWithDelay( 200, listener )
            
        end
        local isGraphicsV1 = ( 1 == display.getDefault( "graphicsCompatibility" ) )
        --redrawRows
        local scrollHeight = 0
        local lastItem
        for i = 1, table.maxn(list._view._rows) do
            --set y for items that are not transitioned (remove when transition up done)
            local v = list._view._rows[i]
            if v then
                if not transY[i] then
                    if not lastItem then
                            local rowY = ( list._view._rows[i]._height * 0.5 ) - list._view.parent.height * 0.5
                            if isGraphicsV1 then
                                    rowY = ( list._view._rows[i]._height * 0.5 ) + 1
                            end
                            list._view._rows[i].y = rowY
                    else
                            if ( list._view._rows[lastItem].y ) then
                                list._view._rows[i].y = ( list._view._rows[lastItem].y + ( list._view._rows[lastItem]._height * 0.5 ) )
                                    + ( list._view._rows[i]._height * 0.5 ) + 1        
                            end
                    end
                end
                if list._view._rows[i] then
                    lastItem = i
                end
                --remove views to force update
                if v._view then
                    display.remove(v._view)
                    v._view = nil
                end
                scrollHeight = scrollHeight + v._height + 1
            end
        end
        --set scroll height
        list._view._scrollHeight = scrollHeight
        if list._view._scrollBar then
            list._view._scrollBar:repositionY()
        end
        --update table view
        list:reloadData()
        
        --hide items that will fade in and start transition
        if (table.maxn(transAlpha) > 0) or (table.maxn(transY) > 0) then
            local tai = nil
            for i, v in pairs(transAlpha) do
                if listRows[i]._view then
                    if tai == nil then
                        tai = i
                    end
                    if not listItems[row.id].collapsed then
                        listRows[i]._view.alpha = 0
                    end
                    listRows[i]._view:toBack()
                end
            end
            if tai then
                --if(transActivated == false) then
                  --  transActivated = true;
                    transition.to(listRows[tai]._view, {time = 200, alpha = 1, transition = detailTrans, onComplete = detailTransComplete})
                --end
            end
        end
        --list:deleteAllRows()
        --populateList()
    end
end

-- Handle row rendering
 function onRowRender( event )
	local phase = event.phase
	local row = event.row
	local isCategory = row.isCategory
        local tList = list
	row.reRender = true
	-- in graphics 2.0, the group contentWidth / contentHeight are initially 0, and expand once elements are inserted into the group.
	-- in order to use contentHeight properly, we cache the variable before inserting objects into the group

	local groupContentHeight = row.contentHeight
	
	local rowTitle = display.newText( row, rowTitles[row.id], 0, 0, native.systemFontBold, 12 )

        ----print("ORR called")
        
	-- in Graphics 2.0, the row.x is the center of the row, no longer the top left.
	rowTitle.x = LEFT_PADDING + 15

	-- we also set the anchorX of the text to 0, so the object is x-anchored at the left
	rowTitle.anchorX = 0

	rowTitle.y = groupContentHeight * 0.5
	rowTitle:setFillColor( .8, .8, .8 )
	
	if isCategory then
            
            local categoryBtn = display.newRect( row, 0, 0, row.width, row.height )
            categoryBtn.anchorX, categoryBtn.anchorY = 0, 0
            --categoryBtn:addEventListener ( "tap", onCategoryTap )
            categoryBtn.alpha = 0
            categoryBtn.isHitTestable = true
            categoryBtn.id = row.id
            categoryBtn.row = row
            
            local catIndicator = nil 
           
                catIndicator = display.newImage( row, "rowArrow.png", false )
           
            catIndicator.x = LEFT_PADDING
            catIndicator.anchorX = 0
            catIndicator.y = groupContentHeight * 0.5
            
        else
		local rowArrow = display.newImage( row, "rowArrow.png", false )
                
                rowArrow.x = row.contentWidth - LEFT_PADDING

		-- we set the image anchorX to 1, so the object is x-anchored at the right
		rowArrow.anchorX = 1

		-- we set the image anchorX to 1, so the object is x-anchored at the right
		rowArrow.y = groupContentHeight * 0.5
	end
end

-- Create a tableView
local list = tableView.new --adjustment to dimensions
{
	top = 92,
	width = 220, 
	height = display.contentHeight - 32 - 150-125,
	maskFile = "mask-320x448.png",
	onRowRender = onRowRender,
	onRowTouch = onRowTouch,
}
--Insert widgets/images into a group
widgetGroup:insert( list )


function populateList()



print_r(listItems)
    for i = 1, #listItems do
	--Add the rows category title
	rowTitles[ #rowTitles + 1 ] = listItems[i].title
	
	--print(listItems[i].title)
	--Insert the category
	list:insertRow{
                id = i,
		rowHeight = 30,
		rowColor = 
		{ 
			default = { 255/255, 255/255, 255/255, 40/255 }, --search by 255 alpha or isvisible of rows
		},
		isCategory = true,
	}
        --print(listItems[i].collapsed )
        if not listItems[i].collapsed then
            --Insert the item
            for j = 1, #listItems[i].items do
                    --Add the rows item title
                    rowTitles[ #rowTitles + 1 ] = listItems[i].items[j]

                    --Insert the item
                    list:insertRow{
                            rowHeight = 20,
                            isCategory = false,
                            listener = onRowTouch
                    }
            end            
        end
    end
    
end
populateList()
end



local stopwatch = require "stopwatch"

local timeKeep = stopwatch.new()
local kickv = 0
timeKeep:pause()
local modf = math.modf
local globatime
local globanote = "Save session notes here or press the second note button on top to save reminders"
local globanote2 = "Save reminders here or press the first note button to save session related notes"
local hh=0
local mm=0
local ss = 0 
local mmt = 0
local datatrack = {}
 datatrack[1] = {}
 local table1={{title = "Press Record Kick", collapsed = true}}
local datatrackall={}
local statis={}
_W = display.contentWidth;
_H = display.contentHeight;
local sessstart = 0
local upclockon =0
local countdisp = display.newText( "           "..kickv.." Kicks:\n               in\n"..hh.." Hrs : "..mm.." Min : "..ss.." Sec", _W/2-25, 55, native.systemFont, 18 )
countdisp.alpha=.95
countdisp.align="center"




if (loadsave.loadTable("myTable.json", system.DocumentsDirectory) ==nil) then
datatrackall[1]={}
zx11 =  os.date('*t');
	
kk11=os.date("%Y-%m-%d %H:%M:%S", os.time(zx11))
--print(kk11)
----print(xy)

datatrackall[1].startAPPtimestamp1 = kk11
--datatrack[kickv+1][2] = zx
datatrackall[1].totalsessions=0
datatrackall[1].totalkicks=0
datatrackall[1].totaltodaysessions=0
datatrackall[1].totaltodaysessdate=0
datatrackall[1].longestsessiondurationstamp=nil
datatrackall[1].longestsessiondurationinMN=0
--datatrackall[1].postit = globanote2

datatrackall[1].startAPPhour1 = zx11.hour
datatrackall[1].startAPPwday1 = zx11.wday
datatrackall[1].startAPPday1 = zx11.day
datatrackall[1].startAPPmonth1 = zx11.month
datatrackall[1].startAPPyear1 = zx11.year
datatrackall[1].startAPPmin1 = zx11.min

else
datatrackall=loadsave.loadTable("myTable.json", system.DocumentsDirectory)
end



function caldataint()
kicklog={}
kicklogtable={}
kicklogtableall={}
ml=0
--print("h1")
if datatrackall[2]==nil then
else
--print("h2")
for jk=2,#datatrackall do

if datatrackall[jk].seskick==nil then
else
--print("h3")
ml=ml+1
kicklog[ml]= {}
kicklog[ml].year=datatrackall[jk].stopyear1
kicklog[ml].month=datatrackall[jk].stopmonth1
kicklog[ml].daya=datatrackall[jk].stopday1
kicklog[ml].kic=datatrackall[jk].seskick
kicklog[ml].dur=(datatrackall[jk].sessiondurHr*60)+datatrackall[jk].sessiondurMin
kicklog[ml].durTAG=datatrackall[jk].sessiondurHr.." Hrs "..datatrackall[jk].sessiondurMin.." Mins"
--print(datatrackall[jk].starthour1)
if checkam(datatrackall[jk].starthour1)== " PM" then
stahr=datatrackall[jk].starthour1-12
else
stahr=datatrackall[jk].starthour1
end
if checkam(datatrackall[jk].stophour1)== " PM" then
stphr=datatrackall[jk].stophour1-12
else
stphr=datatrackall[jk].stophour1
end
if stahr==0 then
stahr=12
end
if stphr==0 then
stphr=12
end
checkam(datatrackall[jk].stophour1)
kicklog[ml].tim1=stahr..":"..datatrackall[jk].startmin1..checkam(datatrackall[jk].starthour1).."-"..stphr..":"..datatrackall[jk].stopmin1..checkam(datatrackall[jk].stophour1)


end
end
end
kicklogtable=kicklog
kicklogtableall=kicklog
end

function refreshcaltable(monyear)


if myList==nil  then
--print("1kabooooom")
print_r(myList)
else
--print("kabooooom")
myList.isVisible=false
myList:removeSelf()
myList=nil
end


 if monyear== nil then
local date = os.date( "*t" )    -- returns table of date & time values
--print( date.year, date.month )
monyear=date.month..date.year
 end
if kicklogtableall==nil then
caldataint()
end
--print("zzzzzzzzzzzzzzzzzzzzz"..monyear)

print_r(kicklogtableall)
p=1
 tempk1={}
 

tempk1[1]= {}
tempk1[1].name="No session available for this month"
tempk1[1].phone=""
--print ("1hereeeeee```````````")

 
 
for zii=1,#kicklogtableall do
if monyear==kicklogtableall[zii].month..kicklogtableall[zii].year then
--print(monyear.."/"..kicklogtableall[zii].month..kicklogtableall[zii].year )
if p==1 then
tempk1[p]= {}
tempk1[p].year=kicklogtableall[zii].year
tempk1[p].month=kicklogtableall[zii].month
tempk1[p].daya=kicklogtableall[zii].daya
tempk1[p].kic=kicklogtableall[zii].kic
tempk1[p].dur=kicklogtableall[zii].dur
tempk1[p].tim1=kicklogtableall[zii].tim1
tempk1[p].sescount = 1
if kicklogtableall[zii].dur/60 <= 0 then
avgkm=" "
else
avgkm=math.round(tempk1[p].kic/(kicklogtableall[zii].dur/60))
if avgkm <= 0 then
avgkm=" "
if roundToFirstDecimal(tempk1[p].kic/(kicklogtableall[zii].dur/60))>0 then
avgkm=" - "..roundToFirstDecimal(tempk1[p].kic/(kicklogtableall[zii].dur/60)).." Kicks/Hour"
end
else
avgkm=" - "..avgkm.." Kicks/Hour"
end
end
--print("ssssssssssssssssssssssssssssssssssssss22222222 - "..tempk1[p].kic/(kicklogtableall[zii].dur/60).."round: "..avgkm)


tempk1[p].name=kicklogtableall[zii].daya.." "..monTT2[kicklogtableall[zii].month].." - Session "..tempk1[p].sescount..avgkm
tempk1[p].phone=tempk1[p].tim1.." - "..tempk1[p].kic.." kicks in "..kicklogtableall[zii].durTAG
p=p+1
else


if  tempk1[p-1].year..tempk1[p-1].month..tempk1[p-1].daya==kicklogtableall[zii].year..kicklogtableall[zii].month..kicklogtableall[zii].daya then

tempk1[p]= {}
tempk1[p].year=kicklogtableall[zii].year
tempk1[p].month=kicklogtableall[zii].month
tempk1[p].daya=kicklogtableall[zii].daya
tempk1[p].kic=kicklogtableall[zii].kic
tempk1[p].dur=kicklogtableall[zii].dur
tempk1[p].sescount=tempk1[p-1].sescount+1
tempk1[p].tim1=kicklogtableall[zii].tim1
if kicklogtableall[zii].dur/60 <= 0 then
avgkm=" "
else
avgkm=math.round(tempk1[p].kic/(kicklogtableall[zii].dur/60))
if avgkm <= 0 then
avgkm=" "
if roundToFirstDecimal(tempk1[p].kic/(kicklogtableall[zii].dur/60))>0 then
avgkm=" - "..roundToFirstDecimal(tempk1[p].kic/(kicklogtableall[zii].dur/60)).." Kicks/Hour"
end
else
avgkm=" - "..avgkm.." Kicks/Hour"
end
end
--print("ssssssssssssssssssssssssssssssssssssss22222222 - "..tempk1[p].kic/(kicklogtableall[zii].dur/60).."round: "..avgkm)



tempk1[p].name=kicklogtableall[zii].daya.." "..monTT2[kicklogtableall[zii].month].." - Session "..(tempk1[p].sescount)..avgkm
tempk1[p].phone=tempk1[p].tim1.." - "..tempk1[p].kic.." kicks in "..kicklogtableall[zii].durTAG
p=p+1
else

tempk1[p]= {}
tempk1[p].year=kicklogtableall[zii].year
tempk1[p].month=kicklogtableall[zii].month
tempk1[p].daya=kicklogtableall[zii].daya
tempk1[p].kic=kicklogtableall[zii].kic
tempk1[p].dur=kicklogtableall[zii].dur
tempk1[p].tim1=kicklogtableall[zii].tim1
tempk1[p].sescount = 1


--print("ssssssssssssssssssssssssssssssssssssss22222222 - "..tempk1[p].kic/(kicklogtableall[zii].dur/60).."round: "..avgkm)
if kicklogtableall[zii].dur/60 <= 0 then
avgkm=" "
else
avgkm=math.round(tempk1[p].kic/(kicklogtableall[zii].dur/60))
if avgkm <= 0 then
avgkm=" "
if roundToFirstDecimal(tempk1[p].kic/(kicklogtableall[zii].dur/60))>0 then
avgkm=" - "..roundToFirstDecimal(tempk1[p].kic/(kicklogtableall[zii].dur/60)).." Kicks/Hour"
end
else
avgkm=" - "..avgkm.." Kicks/Hour"
end
end
--print("ssssssssssssssssssssssssssssssssssssss22222222 - "..tempk1[p].kic/(kicklogtableall[zii].dur/60).."round: "..avgkm)

tempk1[p].name=kicklogtableall[zii].daya.." "..monTT2[kicklogtableall[zii].month].." - Session "..tempk1[p].sescount..avgkm
tempk1[p].phone=tempk1[p].tim1.." - "..tempk1[p].kic.." kicks in "..kicklogtableall[zii].durTAG
p=p+1
end
end
end
end
--print("ppppppppppppppppppppppppp")
print_r(tempk1)




--print ("hereeeeee```````````")






print_r(tempk1)



return tempk1
end











kicklog1={}
function caldataint2(kicklog1)
--print("sssssssssss")
print_r(kicklogtable)
local tempk={}
p=1
for zii=1,#kicklog1 do
if zii==1 then


tempk[p]= {}
tempk[p].year=kicklog[zii].year
tempk[p].month=kicklog[zii].month
tempk[p].daya=kicklog[zii].daya
tempk[p].kic=kicklog[zii].kic
tempk[p].dur=kicklog[zii].dur
else


if  tempk[p].year..tempk[p].month..tempk[p].daya==kicklog[zii].year..kicklog[zii].month..kicklog[zii].daya then
tempk[p].kic=tempk[p].kic+kicklog[zii].kic
tempk[p].dur=tempk[p].dur+kicklog[zii].dur
else
p=p+1
tempk[p]= {}
tempk[p].year=kicklog[zii].year
tempk[p].month=kicklog[zii].month
tempk[p].daya=kicklog[zii].daya
tempk[p].kic=kicklog[zii].kic
tempk[p].dur=kicklog[zii].dur
end
end
end
return tempk
end















caldataint()
kicklog=caldataint2(kicklog)


if (loadsave.loadTable("stat.json", system.DocumentsDirectory) ==nil) then
statis={}
statis[1]={}
statis[2]={}
for iq=1,7 do
statis[1][iq]={}
statis[1][iq]=0
end
for iq=1,24 do
statis[2][iq]={}
statis[2][iq]=0
end

else
statis=loadsave.loadTable("stat.json", system.DocumentsDirectory)
end



local function merge(fromTable, intoTable) 
    local lenFrom = #fromTable
    for i = 1, lenFrom do 
        table.insert(intoTable, fromTable[i])
    end 
end



 function resettimer()

timeKeep = nil
 local timeKeep = stopwatch.new()
 timeKeep:pause()
 upclockon =0
 end
 --local px, local py, local sx, local sy
 
function wrap_time(time_amount)
   local start_seconds = time_amount --start_seconds = 20000
 
   local start_minutes = modf(start_seconds/60) --start_minutes = 333
   local seconds = start_seconds - start_minutes*60 --seconds = 20
 
   local start_hours = modf(start_minutes/60) --start_hours = 5
   local minutes = start_minutes - start_hours*60 --minutes = 33
 
   local start_days = modf(start_hours/24) --start_days = 0
   local hours = start_hours - start_days*24 --hours = 5
 
   local wrapped_time = {days=start_days, hours=hours, minutes=minutes, seconds=seconds}
 
   return wrapped_time --returns 0, 5, 33, 20
end

local sessionduration1 ={}
function updateTimer()  
	--upclockon =1
countdisp.isVisible=false
tfor = timeKeep:getElapsedSeconds()
tfor = timeKeep:getElapsedSeconds()
local coolTime = wrap_time(tfor)
--print(tx)

zx1 =  os.date('*t');
	
kk1=os.date("%Y-%m-%d %H:%M:%S", os.time(zx1))

if sessstart==0 then

--print("initsession[1].currentsession")
--print_r(initsession[1].currentsession)


--print(kk1)
----print(xy)
if initsession[1].currentsession==0 then
datatrack[1].starttimestamp1 = kk1
--datatrack[kickv+1][2] = zx

datatrack[1].starthour1 = zx1.hour
datatrack[1].startwday1 = zx1.wday
datatrack[1].startday1 = zx1.day
datatrack[1].startmonth1 = zx1.month
datatrack[1].startyear1 = zx1.year
datatrack[1].startmin1 = zx1.min
initsession[1].zx1=zx1
initsession[1].kk1=kk1
	initsession[1].sessstarttime=os.time() 
initsession[1].currentsession=1+	initsession[1].currentsession
else
zx1=initsession[1].zx1
kk1=initsession[1].kk1
datatrack[1].starttimestamp1 = kk1
--datatrack[kickv+1][2] = zx

datatrack[1].starthour1 = zx1.hour
datatrack[1].startwday1 = zx1.wday
datatrack[1].startday1 = zx1.day
datatrack[1].startmonth1 = zx1.month
datatrack[1].startyear1 = zx1.year
datatrack[1].startmin1 = zx1.min
initsession[1].zx1=zx1


end

	loadsave.saveTable(initsession, "initsession.json", system.DocumentsDirectory)
sessstart=1
end

ss=coolTime.seconds
hh=coolTime.hours
mm=coolTime.minutes
countdisp = display.newText( "           "..kickv.." Kicks:\n               in\n"..hh.." Hrs : "..mm.." Min : "..ss.." Sec", _W/2-25, 55, native.systemFont, 18 )

datatrack[1].sessiondur= hh.." Hrs : "..mm.." Min : "..ss.." Sec"

datatrack[1].sessiondurHr= hh
datatrack[1].sessiondurMin= mm
datatrack[1].sessiondurSec= ss

countdisp.isVisible=false
countdisp.align="center"
if mmt==1 then
countdisp.isVisible=false
else
countdisp.isVisible=true
end
----print(tfor)



end



function bckchange(yp)
	background = display.newImage( yp, true )
background.x = display.contentWidth / 2-3
background.y = display.contentHeight / 2
background:scale( 3, 3)
end


function overlayduedate()
countdisp.isVisible=false
mmt=1
countdisp.alpha=0
whereamI=5 --1-LADY 2-STAT  3- NOTE 4-STOP 5-KICKEARLIER
 	--textbox screen
				local rb1 = display.newRect( _W, _H, _W*2, _H*2 )
 rb1:setFillColor( 0, 0, 0 ,.65)
rb1:toFront()
rb1:addEventListener("touch", function()  return true end)
rb1:addEventListener("tap", function()  return true end)
local box1 = display.newImage( settings[1].locabar )
box1.anchorX=0
box1.anchorY=0
box1.x  = -10
box1.y  = 1
box1.alpha=.9 --.70 and .90
box1:scale( 1, 3 )
--local widget = require( "widget" )
dueset=1
-- Handle press events for the checkbox
 function onSwitchPress( event )
   
	checkboxButton:setState( { isOn=true, isAnimated=true } )
	checkboxButtons:setState( { isOn=false, isAnimated=true } )
	
	dueset=1
	--print(dueset)
end

 function onSwitchPresss( event )
    
	checkboxButtons:setState( { isOn=true, isAnimated=true } )
	checkboxButton:setState( { isOn=false, isAnimated=true } )
	dueset=0
		--print(dueset)
end
local locatime =0
local box1text = display.newText( "Enter date for countdown clock:", _W/2, 80+65-100+40-20, native.systemFont, 19 )
box1text.alpha = .85

numtempmin=0

 WHEELday = {}
 WHEELmon = {}
 WHEELyear = {}
zeta=1
for y = 1, 100 do
WHEELday[y] = zeta
zeta=zeta+1
if zeta==32 then
zeta=1
end
end
zeta=1
-- Populate the "days" table
for d = 1, 100 do
    WHEELmon[d] = zeta
	zeta=zeta+1
	if zeta==13 then
zeta=1
end
end
zeta=2000
-- Populate the "days" table
for d = 1, 50 do
    WHEELyear[d] = zeta
	zeta=zeta+1
	
end

-- Configure the picker wheel columns
local columnData = 
{
    -- Months
    { 
        align = "left",
        width = 80,
        startIndex = 63,
        labels = WHEELday
    },
    -- Days
    {
        align = "left",
        width = 80,
        startIndex = 37,
        labels = WHEELmon
    },
    {
        align = "left",
        width = 100,
        startIndex = 16,
        labels = WHEELyear
    }, 
}

-- Create the widget
local pickerWheel = widgetz.newPickerWheel
{
    -- top = display.contentHeight - 322,
    columns = columnData,
    -- sheet = pickerWheelSheet,
    -- overlayFrame = 1,
    -- overlayFrameWidth = 320,
    -- overlayFrameHeight = 102,
    -- backgroundFrame = 1,
    -- backgroundFrameWidth = 320,
    -- backgroundFrameHeight = 022,
    -- separatorFrame = 1,
    -- separatorFrameWidth = 8,
    -- separatorFrameHeight = 222,
    -- columnColor = { 0.1, 0.1, 0.1, .9 },
    -- fontColor = { 0.4, 0.4, 0.7, 0.5 },
    -- fontColorSelected = { 1, 0.7, 0.0 }
}
	-- Position it however you like.
	pickerWheel.anchorChildren = true
	pickerWheel.anchorX = 0.5
	pickerWheel.anchorY = 0
	pickerWheel.x = display.contentCenterX
	pickerWheel.y = 80
	
-- Get the table of current values for all columns
-- This can be performed on a button tap, timer execution, or other event
local values = pickerWheel:getValues()

	displayTexthr = display.newText{
		text = "DD",
		width = display.contentWidth - 20,
		font = native.systemFont,
		fontSize = 18,
		align = "center"
	}
	displayTexthr:setFillColor(0)
	displayTexthr.anchorY = 0
	displayTexthr.x = pickerWheel.x-35-10-50
	displayTexthr.y = pickerWheel.y + pickerWheel.height/2 - 10
	
		displayTextmn = display.newText{
		text = "MM",
		width = display.contentWidth - 20,
		font = native.systemFont,
		fontSize = 18,
		align = "center"
	}
	displayTextmn:setFillColor(0)
	displayTextmn.anchorY = 0
	displayTextmn.x = pickerWheel.x-12
	displayTextmn.y = pickerWheel.y + pickerWheel.height/2 - 10
	



		displayTextyr = display.newText{
		text = "YYYY",
		width = display.contentWidth - 20,
		font = native.systemFont,
		fontSize = 18,
		align = "center"
	}
	displayTextyr:setFillColor(0)
	displayTextyr.anchorY = 0
	displayTextyr.x = pickerWheel.x+110
	displayTextyr.y = pickerWheel.y + pickerWheel.height/2 - 10
	
local box1textdd = display.newText( "This is my due date", 140, 320, native.systemFont, 12 )
box1textdd.alpha = .85
local box1textlp = display.newText( "This was the first day of my last period", 190, 360, native.systemFont, 12 )
box1textlp.alpha = .85
-- Create the widget
 checkboxButton = widget.newSwitch
{
    left = 50,
    top = 305,
    style = "checkbox",
    id = "Checkbox",
	   initialSwitchState = true,
    onPress = onSwitchPress
}

 checkboxButtons = widget.newSwitch
{
    left = 50,
    top = 345,
    style = "checkbox",
    id = "Checkbox",
	
    onPress = onSwitchPresss
}
--checkboxButtons:setState( { isOn=true, isAnimated=true } )
-- checkboxButtons.isOn=true













local cancel1 = display.newImage( "cancel.png" )
cancel1.anchorX=0
cancel1.anchorY=0
cancel1.x  = _W/2+50
cancel1.y  = _H-255+125+45-10
cancel1.alpha=1 --.70 and .90
cancel1:scale( .17, .15 )


local ok1 = display.newImage( "okx.png" )
ok1.anchorX=0
ok1.anchorY=0
ok1.x  = _W/2-75
ok1.y  = _H-250+125+45-10-5+2
ok1.alpha=.93 --.70 and .90
ok1:scale( .45, .45)



		--print("here"..numtempmin)
zx =  os.date('*t');
	zx1=	os.date("%Y-%m-%d %H:%M:%S", os.time(zx))
local box2text = display.newText( zx1, _W/2+40, _H-278, native.systemFont, 17 )
box2text.alpha = .85
box2text.isVisible=false



function cancel1:touch( event )
    if event.phase == "began" then
	cancel1.isVisible=false
	ok1.isVisible=false
	displayTexthr.isVisible=false
	displayTextmn.isVisible=false
	displayTextyr.isVisible=false
box1.isVisible=false
rb1.isVisible=false
box1text.isVisible=false
pickerWheel:removeSelf()
 checkboxButtons.isVisible=false
   checkboxButton.isVisible=false
   	box1textdd.isVisible=false
	box1textlp.isVisible=false
   
	  whereamI=1 --1-LADY 2-STAT  3- NOTE 4-STOP 5-KICKEARLIER
mmt=0
--print("clock: "..upclockon)
 WHEELHRS = nil
 WHEELMINS = nil

	countdisp.alpha=.95
	--updateTimer()
end
end

function kk( event )
    if event.phase == "began" then
	--dueset=1
		returntopage=1
	local values = pickerWheel:getValues()
	
	-- CORONA BUG: Sometimes the values can be nil.
	-- This happens when one of the tables stopped scrolling but hasn't "snapped" to a selected index.
	-- Prompt the user to fix the bad column.
	
	--print("VAL....................................")
	print_r(values)
	if not values[1] then
	--	native.showAlert(_M.appName, "Please make sure a day is selected.", {"OK"})
		messenger2("Please make sure a day is selected.")
		
		--print("1 ERROR")
	elseif not values[2] then
	--	native.showAlert(_M.appName, "Please make sure a month is selected.", {"OK"})
		--print("2 ERROR")
		messenger2("Please make sure a month is selected.")
	elseif not values[3] then
		--native.showAlert(_M.appName, "Please make sure a year is selected.", {"OK"})
		--print("3 ERROR")
		messenger2("Please make sure a year is selected.")
	else
	--print(values[1].value..values[2].value..values[3].value)
	returntopage=0

	if dueset==1 then
local mytime= os.time{year= values[3].value, month=values[2].value, day=values[1].value, hour=14, min=0, sec=0 } 

--local futureTime = os.date( '*t', mytime )

local difference=os.difftime( mytime, os.time())/86400
--print ("diff"..difference)

if difference<0 then
--native.showAlert("Please make sure due date selected is not a date in the past.", {"OK"})
messenger2("Please make sure due date selected\n          is not a date in the past.")
--print("Please make sure due date selected \nis not a date in the past.")
returntopage=1

else
inthefuture=mytime
settings[1].inthefuture=inthefuture
 settings[1].duestatus=1
loadsave.saveTable(settings, "settings.json", system.DocumentsDirectory)
returntopage=0
end


else

local mytime= os.time{year= values[3].value, month=values[2].value, day=values[1].value, hour=14, min=0, sec=0 } +24192000
local mytime2= os.time{year= values[3].value, month=values[2].value, day=values[1].value, hour=14, min=0, sec=0 } 
print_r(mytime2)
--local futureTime = os.date( '*t', mytime )

local difference=os.difftime( mytime2, os.time())/86400
--print ("diff"..difference)
print_r(mytime2)

if difference>0 then
--native.showAlert("Please make sure date selected is not a date in the future.", {"OK"})
messenger2("Please make sure date selected \n      is not a date in the future.")

--print("Please make sure date selected is not a date in the future")
returntopage=1

else
inthefuture=mytime
settings[1].inthefuture=inthefuture
 settings[1].duestatus=1
loadsave.saveTable(settings, "settings.json", system.DocumentsDirectory)
returntopage=0
end

	end
	if returntopage==0 then
	if inthefuture==nil then

remainingtext="Set\ndate"
else
difference1=os.difftime( inthefuture, os.time())/86400
remainingtext=math.round(difference1).." days\n    to go"

if difference1<1 then
remainingtext="Any day\n    now"
end



end

function updateduetag()
--print("here!!!!!!!!!!!!!!!!")
if inthefuture==nil then

remainingtext="Set\ndate"
else
difference1=os.difftime( inthefuture, os.time())/86400
remainingtext=math.round(difference1).." days\n    to go"

if difference1<1 then
remainingtext="Any day\n    now"
end



end
contdownhearttext.text = remainingtext

end


updateduetag()

--contdownhearttext.text = remainingtext
	
	--contdownhearttext = display.newText( remainingtext, 40, 25,native.systemFontBold, 13 )
--print("2   "..remainingtext)
	cancel1.isVisible=false
	ok1.isVisible=false
	displayTexthr.isVisible=false
	displayTextmn.isVisible=false
	displayTextyr.isVisible=false
box1.isVisible=false
rb1.isVisible=false
box1text.isVisible=false
pickerWheel:removeSelf()
   checkboxButtons.isVisible=false
   checkboxButton.isVisible=false
   	box1textdd.isVisible=false
	box1textlp.isVisible=false
	  whereamI=1 --1-LADY 2-STAT  3- NOTE 4-STOP 5-KICKEARLIER
mmt=0
--print("clock: "..upclockon)
 WHEELHRS = nil
 WHEELMINS = nil

	countdisp.alpha=.95
	--updateTimer()
	end
	end
	end
end



function ok21( event )
values = pickerWheel:getValues()
	if not values[1] then
		native.showAlert(_M.appName, "Please make sure a Hour value is selected.", {"OK"})
	elseif not values[2] then
		native.showAlert(_M.appName, "Please make sure a Min value is selected.", {"OK"})
	
	else
					displayxt = (values[1].value*60) + values[2].value 
			--print(displayxt)
numtempmin=displayxt
    if event.phase == "began" then
	play1.isVisible=false
	pause1.isVisible=true
	cancel1.isVisible=false
	ok1.isVisible=false
box1.isVisible=false
rb1.isVisible=false
	displayTexthr.isVisible=false
	displayTextmn.isVisible=false

box1text.isVisible=false
pickerWheel:removeSelf()

    
	  kickv=kickv+1
	  --print(kickv)
	  	  whereamI=1 --1-LADY 2-STAT  3- NOTE 4-STOP 5-KICKEARLIER
	  timer.performWithDelay(500, blinkfeet1, 5)
timer.performWithDelay(600, blinkfeet2, 5)
	  
	  	zx =  os.date('*t');
		--print(os.date("%Y-%m-%d %H:%M:%S", os.time(zx)));
--zx.min = zx.min - 5; -- subtract 5 minutes
--print(zx.min.." //// "..numtempmin)
if numtempmin==nil then

--print("therreeeeee")
numtempmin=0
end

zx.min = zx.min - numtempmin
--print(zx.min.." 2")
while zx.min<0 or  zx.hour<0 do
--print("in while")
if zx.min<0 then
zx.min=60+zx.min
zx.hour=zx.hour-1
if zx.hour<0 then
zx.hour = 24+zx.hour
zx.day=zx.day-1

if zx.day<0 then
zx.wday=zx.wday-1
if zx.wday<0 then
zx.wday=7+zx.wday
end




zx.month=zx.month-1
if zx.month== 4 or 6 or 9 or 115-20 then
zx.day=30+zx.day
elseif zx.day== 2 then
zx.day=28+zx.day
else
zx.day=31+zx.day


end


end
end
end
end

kk=os.date("%Y-%m-%d %H:%M:%S", os.time(zx))
--print(kk)

--tt1 =os.time(zx)
--print(zx)
	--[[	 
datatrack[kickv+1]={}
datatrack[kickv+1].count1 = kickv
datatrack[kickv+1].time1 = kk
--datatrack[kickv+1][2] = zx

datatrack[kickv+1].hour1 = zx.hour
datatrack[kickv+1].min1 = zx.min
datatrack[kickv+1].wday1 = zx.wday
datatrack[kickv+1].day1 = zx.day
datatrack[kickv+1].month1 = zx.month
datatrack[kickv+1].year1 = zx.year
]]--
table1[kickv]={}


if checkam(zx.hour)== " PM" then
stphr111=zx.hour-12

if stphr111<10 then
stphr111="0"..stphr111
end
if zx.hour==12  then stphr111=12 end


else
stphr111=zx.hour
if stphr111<10 then
stphr111="0"..stphr111
end
end

tomp1min=zx.min
if tomp1min<10 then
tomp1min="0"..tomp1min
end
tomp1=stphr111..":"..tomp1min..checkam(zx.hour)


table1[kickv].title="Kick "..kickv.." - "..tomp1
table1[kickv].collapsed = true

 WHEELHRS = nil
 WHEELMINS = nil

table2=reverseTable(table1)

for iq=1,7 do
if zx.wday==iq then
statis[1][iq]=statis[1][iq]+1
end
end

for iq=1,24 do
if zx.hour==iq then
statis[2][iq]=statis[2][iq]+1
end
end



widgetGroup:removeSelf()
invoketable(table2)



----print(datatrack[kickv+1].count1.."  "..datatrack[kickv+1].time1)
	  
	         if(tx==0 or tx==nil)then 
	   timeKeep:resume()
	    upclockon =1
				 		tx=  timer.performWithDelay(1000, updateTimer, 0)
						--print("here1")
					
				end
			mmt=0
		
 return locatime
end

end
end
cancel1:addEventListener( "touch", cancel1 )
ok1:addEventListener( "touch", kk )
--print(locatime)
 return locatime
 end
 
 
 --somewhere here______________________________________
 
function overlay1()
countdisp.isVisible=false
mmt=1
countdisp.alpha=0
whereamI=5 --1-LADY 2-STAT  3- NOTE 4-STOP 5-KICKEARLIER
 	--textbox screen
				local rb1 = display.newRect( _W, _H, _W*2, _H*2 )
 rb1:setFillColor( 0, 0, 0 ,.65)
rb1:toFront()
rb1:addEventListener("touch", function()  return true end)
rb1:addEventListener("tap", function()  return true end)
local box1 = display.newImage( settings[1].locabar )
box1.anchorX=0
box1.anchorY=0
box1.x  = -120
box1.y  = 40
box1.alpha=.9 --.70 and .90
box1:scale( 1, 2.3 )

local locatime =0
local box1text = display.newText( "  Enter time ago in \nHours and Minutes", _W/2, 80+65-100+40, native.systemFont, 20 )
box1text.alpha = .85

numtempmin=0

 WHEELHRS = {}
 WHEELMINS = {}

zeta=0
for y = 1, 100 do
WHEELHRS[y] = zeta
zeta=zeta+1
if zeta==13 then
zeta=0
end
end
zeta=0
-- Populate the "days" table
for d = 1, 100 do
    WHEELMINS[d] = zeta
	zeta=zeta+1
	if zeta==61 then
zeta=0
end
end


-- Configure the picker wheel columns
local columnData = 
{
    -- Months
    { 
        align = "left",
        width = 150-10,
        startIndex = 2+6+1+5+50+2,
        labels = WHEELHRS
    },
    -- Days
    {
        align = "left",
        width = 100,
        startIndex = 2+6+2+41+11,
        labels = WHEELMINS
    },
 
}

-- Create the widget
local pickerWheel = widgetz.newPickerWheel
{
    -- top = display.contentHeight - 322,
    columns = columnData,
    -- sheet = pickerWheelSheet,
    -- overlayFrame = 1,
    -- overlayFrameWidth = 320,
    -- overlayFrameHeight = 102,
    -- backgroundFrame = 1,
    -- backgroundFrameWidth = 320,
    -- backgroundFrameHeight = 022,
    -- separatorFrame = 1,
    -- separatorFrameWidth = 8,
    -- separatorFrameHeight = 222,
    -- columnColor = { 0.1, 0.1, 0.1, .9 },
    -- fontColor = { 0.4, 0.4, 0.7, 0.5 },
    -- fontColorSelected = { 1, 0.7, 0.0 }
}
	-- Position it however you like.
	pickerWheel.anchorChildren = true
	pickerWheel.anchorX = 0.5
	pickerWheel.anchorY = 0
	pickerWheel.x = display.contentCenterX
	
-- Get the table of current values for all columns
-- This can be performed on a button tap, timer execution, or other event
local values = pickerWheel:getValues()

	displayTexthr = display.newText{
		text = "Hour(s)",
		width = display.contentWidth - 20,
		font = native.systemFont,
		fontSize = 18,
		align = "center"
	}
	displayTexthr:setFillColor(0)
	displayTexthr.anchorY = 0
	displayTexthr.x = pickerWheel.x-35-10
	displayTexthr.y = pickerWheel.y + pickerWheel.height/2 - 10
	
		displayTextmn = display.newText{
		text = "Min(s)",
		width = display.contentWidth - 20,
		font = native.systemFont,
		fontSize = 18,
		align = "center"
	}
	displayTextmn:setFillColor(0)
	displayTextmn.anchorY = 0
	displayTextmn.x = pickerWheel.x+110
	displayTextmn.y = pickerWheel.y + pickerWheel.height/2 - 10
	





















local cancel1 = display.newImage( "cancel.png" )
cancel1.anchorX=0
cancel1.anchorY=0
cancel1.x  = _W/2+50
cancel1.y  = _H-255+125
cancel1.alpha=1 --.70 and .90
cancel1:scale( .20, .18 )


local ok1 = display.newImage( "okx.png" )
ok1.anchorX=0
ok1.anchorY=0
ok1.x  = _W/2-75
ok1.y  = _H-250+125
ok1.alpha=.93 --.70 and .90
ok1:scale( .52, .52)



		--print("here"..numtempmin)
zx =  os.date('*t');
	zx1=	os.date("%Y-%m-%d %H:%M:%S", os.time(zx))
local box2text = display.newText( zx1, _W/2+40, _H-278, native.systemFont, 17 )
box2text.alpha = .85
box2text.isVisible=false



function cancel1:touch( event )
    if event.phase == "began" then
	cancel1.isVisible=false
	ok1.isVisible=false
	displayTexthr.isVisible=false
	displayTextmn.isVisible=false
box1.isVisible=false
rb1.isVisible=false
box1text.isVisible=false
pickerWheel:removeSelf()
   
	  whereamI=1 --1-LADY 2-STAT  3- NOTE 4-STOP 5-KICKEARLIER
mmt=0
--print("clock: "..upclockon)
 WHEELHRS = nil
 WHEELMINS = nil

	countdisp.alpha=.95
	--updateTimer()
end
end
function ok1:touch( event )
values = pickerWheel:getValues()
	if not values[1] then
		native.showAlert(_M.appName, "Please make sure a Hour value is selected.", {"OK"})
	elseif not values[2] then
		native.showAlert(_M.appName, "Please make sure a Min value is selected.", {"OK"})
	
	else
					displayxt = (values[1].value*60) + values[2].value 
			--print(displayxt)
numtempmin=displayxt
    if event.phase == "began" then
	play1.isVisible=false
	pause1.isVisible=true
	cancel1.isVisible=false
	ok1.isVisible=false
box1.isVisible=false
rb1.isVisible=false
	displayTexthr.isVisible=false
	displayTextmn.isVisible=false
box1text.isVisible=false
pickerWheel:removeSelf()

    
	  kickv=kickv+1
	  --print(kickv)
	  	  whereamI=1 --1-LADY 2-STAT  3- NOTE 4-STOP 5-KICKEARLIER
	  timer.performWithDelay(500, blinkfeet1, 5)
timer.performWithDelay(600, blinkfeet2, 5)
	  
	  	zx =  os.date('*t');
		--print(os.date("%Y-%m-%d %H:%M:%S", os.time(zx)));
--zx.min = zx.min - 5; -- subtract 5 minutes
--print(zx.min.." //// "..numtempmin)
if numtempmin==nil then

--print("therreeeeee")
numtempmin=0
end

zx.min = zx.min - numtempmin
--print(zx.min.." 2")
while zx.min<0 or  zx.hour<0 do
--print("in while")
if zx.min<0 then
zx.min=60+zx.min
zx.hour=zx.hour-1
if zx.hour<0 then
zx.hour = 24+zx.hour
zx.day=zx.day-1

if zx.day<0 then
zx.wday=zx.wday-1
if zx.wday<0 then
zx.wday=7+zx.wday
end




zx.month=zx.month-1
if zx.month== 4 or 6 or 9 or 115-20 then
zx.day=30+zx.day
elseif zx.day== 2 then
zx.day=28+zx.day
else
zx.day=31+zx.day


end


end
end
end
end
--[[
kk=os.date("%Y-%m-%d %H:%M:%S", os.time(zx))
print_r(os.time(zx)) --settime
print(os.time(initsession[1].zx1))--start time
  xt=( os.difftime( os.time(zx), (os.time(initsession[1].zx1))))--diff
print(xt)

if xt<0 then
timeKeep:addTime(-xt)
end

]]--
--tt1 =os.time(zx)
--print(zx)
	--[[	 
datatrack[kickv+1]={}
datatrack[kickv+1].count1 = kickv
datatrack[kickv+1].time1 = kk
--datatrack[kickv+1][2] = zx

datatrack[kickv+1].hour1 = zx.hour
datatrack[kickv+1].min1 = zx.min
datatrack[kickv+1].wday1 = zx.wday
datatrack[kickv+1].day1 = zx.day
datatrack[kickv+1].month1 = zx.month
datatrack[kickv+1].year1 = zx.year
]]--
table1[kickv]={}


if checkam(zx.hour)== " PM" then
stphr111=zx.hour-12

if stphr111<10 then
stphr111="0"..stphr111
end
if zx.hour==12  then stphr111=12 end


else
stphr111=zx.hour
if stphr111<10 then
stphr111="0"..stphr111
end
end

tomp1min=zx.min
if tomp1min<10 then
tomp1min="0"..tomp1min
end
tomp1=stphr111..":"..tomp1min..checkam(zx.hour)


table1[kickv].title="Kick "..kickv.." - "..tomp1
table1[kickv].collapsed = true

 WHEELHRS = nil
 WHEELMINS = nil

table2=reverseTable(table1)

for iq=1,7 do
if zx.wday==iq then
statis[1][iq]=statis[1][iq]+1
end
end

for iq=1,24 do
if zx.hour==iq then
statis[2][iq]=statis[2][iq]+1
end
end



widgetGroup:removeSelf()
invoketable(table2)



----print(datatrack[kickv+1].count1.."  "..datatrack[kickv+1].time1)
	  
	         if(tx==0 or tx==nil)then 
	   timeKeep:resume()
	    upclockon =1
				 		tx=  timer.performWithDelay(1000, updateTimer, 0)
						--print("here1")
					
				end
			mmt=0
				
				initsession[1].table1=table1
	initsession[1].statis=statis
	initsession[1].kickv=kickv
	initsession[1].datatrack=datatrack
	initsession[1].datatrackall=datatrackall
	loadsave.saveTable(initsession, "initsession.json", system.DocumentsDirectory)
				
				
 return locatime
end
end
end
cancel1:addEventListener( "touch", cancel1 )
ok1:addEventListener( "touch", ok1 )
--print(locatime)
 return locatime
 end

 timstop=1
 
 --alarm1
 
 
function alarmoverlay1()
countdisp.isVisible=false
pully=25
mmt=1
countdisp.alpha=0
--print("sound state"..settings[1].CHECKSOUNDONOFF)
whereamI=5 --1-LADY 2-STAT  3- NOTE 4-STOP 5-KICKEARLIER
 	--textbox screen
				local rb1 = display.newRect( _W, _H, _W*2, _H*2 )
 rb1:setFillColor( 0, 0, 0 ,.65)
rb1:toFront()
rb1:addEventListener("touch", function()  return true end)
rb1:addEventListener("tap", function()  return true end)
local box1 = display.newImage("ala1m.jpg")
box1.anchorX=0
box1.anchorY=0
box1.x  = 0
box1.y  = 0
box1.alpha=1 --.70 and .90
box1:scale( 1, 1.2 )

local locatime =0
local box1text = display.newText( "Notify me for a session at:", _W/2, 80+65-100+40-pully-10, native.systemFontBold, 20 )
box1text.alpha = .85

numtempmin=0

 WHEELHRS = {}
 WHEELMINS = {}
 WHEELAPM = {}

zeta=1
for y = 1, 100 do
WHEELHRS[y] = zeta
zeta=zeta+1
if zeta==13 then
zeta=1
end
end
zeta=0
-- Populate the "days" table
for d = 1, 200 do
    WHEELMINS[d] = zeta
	zeta=zeta+1
	if zeta==60 then
zeta=0
end
end
delta=1
for y = 1, 50 do

WHEELAPM[delta] = "AM"
WHEELAPM[delta+1] = "PM"
delta=delta+2



end




local Soundon0 = display.newImage( "alss2.png" )
Soundon0.anchorX=.5
Soundon0.anchorY=0.5
Soundon0.x  = _W/2+65
Soundon0.y  = _H-255+125-5-pully+20
Soundon0.alpha=.93 --.70 and .90
Soundon0:scale( .6, .6 )


local AlarmOnoff0 = display.newImage( "als2.png" )
AlarmOnoff0.anchorX=0.5
AlarmOnoff0.anchorY=0.5
AlarmOnoff0.x  = _W/2 -- -65
AlarmOnoff0.y  = _H-255+125-5-pully+20
AlarmOnoff0.alpha=.93 --.70 and .90
AlarmOnoff0:scale( .6, .6 )



local Soundon = display.newImage( "alss1.png" )
Soundon.anchorX=.5
Soundon.anchorY=0.5
Soundon.x  = _W/2+65
Soundon.y  = _H-255+125-5-pully+20
Soundon.alpha=.93 --.70 and .90
Soundon:scale( .6, .6 )


local AlarmOnoff = display.newImage( "als1.png" )
AlarmOnoff.anchorX=0.5
AlarmOnoff.anchorY=0.5
AlarmOnoff.x  = _W/2 -- -65
AlarmOnoff.y  = _H-255+125-5-pully+20
AlarmOnoff.alpha=.93 --.70 and .90
AlarmOnoff:scale( .6, .6 )

local AlarmBack = display.newImage( "alb1.png" )
AlarmBack.anchorX=0.5
AlarmBack.anchorY=0.5
AlarmBack.x  = _W/2
AlarmBack.y  = _H-255+125+80-5-pully+10-5-15
AlarmBack.alpha=.93 --.70 and .90
AlarmBack:scale( .7, .75 )




if settings[1].roll1==12 then
alarmdeltahr=0
else
alarmdeltahr=settings[1].roll1
end
if settings[1].roll2==0 then
alarmdeltamin=0
else
alarmdeltamin=settings[1].roll2
end
if settings[1].roll3=="PM" then
alarmdeltampm=0
else
alarmdeltampm=1
end


--print("soundsss"..settings[1].CHECKSOUNDONOFF)

if settings[1].CHECKALARMONOFF==0 then

AlarmOnoff0.isVisible=true
AlarmOnoff.isVisible=false
Soundon0.isVisible=true
Soundon.isVisible=false


else
AlarmOnoff0.isVisible=false
AlarmOnoff.isVisible=true

if settings[1].CHECKSOUNDONOFF==0 then

Soundon0.isVisible=true
Soundon.isVisible=false

else
Soundon0.isVisible=false
Soundon.isVisible=true

end


end


-- Configure the picker wheel columns
local columnData = 
{
    -- Months
    { 
        align = "left",
        width = 100,
        startIndex = 50-2+alarmdeltahr,
        labels = WHEELHRS
    },
    -- Days
    {
        align = "left",
        width = 100,
        startIndex = 2+6+2+41+11-1+alarmdeltamin,
        labels = WHEELMINS
    },   -- Days
    {
        align = "left",
        width = 100,
        startIndex = 26+alarmdeltampm,
        labels = WHEELAPM
    },
 
}

-- Create the widget
local pickerWheel = widgetz.newPickerWheel
{
    -- top = display.contentHeight - 322,
    columns = columnData,
    -- sheet = pickerWheelSheet,
    -- overlayFrame = 1,
    -- overlayFrameWidth = 320,
    -- overlayFrameHeight = 102,
    -- backgroundFrame = 1,
    -- backgroundFrameWidth = 320,
    -- backgroundFrameHeight = 022,
    -- separatorFrame = 1,
    -- separatorFrameWidth = 8,
    -- separatorFrameHeight = 222,
    -- columnColor = { 0.1, 0.1, 0.1, .9 },
    -- fontColor = { 0.4, 0.4, 0.7, 0.5 },
    -- fontColorSelected = { 1, 0.7, 0.0 }
}
	-- Position it however you like.
	pickerWheel.anchorChildren = true
	pickerWheel.anchorX = 0.5
	pickerWheel.anchorY = 0.5
	pickerWheel.x = display.contentCenterX
	pickerWheel.y = display.contentCenterY-20-pully
	
-- Get the table of current values for all columns
-- This can be performed on a button tap, timer execution, or other event
local values = pickerWheel:getValues()

	displayTexthr = display.newText{
		text = "      ",
		width = display.contentWidth - 50,
		font = native.systemFont,
		fontSize = 18,
		align = "center"
	}
	displayTexthr:setFillColor(0)
	displayTexthr.anchorY = 0
	displayTexthr.x = pickerWheel.x-35-10
	displayTexthr.y = pickerWheel.y + pickerWheel.height/2 - 10-pully
	
		displayTextmn = display.newText{
		text = "                             ",
		width = display.contentWidth - 80,
		font = native.systemFont,
		fontSize = 18,
		align = "center"
	}
	displayTextmn:setFillColor(0)
	displayTextmn.anchorY = 0
	displayTextmn.x = pickerWheel.x+110
	displayTextmn.y = pickerWheel.y + pickerWheel.height/2 - 10-pully
	






		--print("here"..numtempmin)
zx =  os.date('*t');
	zx1=	os.date("%Y-%m-%d %H:%M:%S", os.time(zx))
local box2text = display.newText( zx1, _W/2+40, _H-278, native.systemFont, 17 )
box2text.alpha = .85
box2text.isVisible=false

--sound cordination issues sound disabled
Soundon0.isVisible=false
Soundon.isVisible=false

function Soundon0:touch( event )
    if event.phase == "began" then
	--overlayclearhis()
	
if settings[1].CHECKALARMONOFF==0 then

--message here to enable alert first


else

if settings[1].CHECKSOUNDONOFF==0 then

Soundon0.isVisible=false
Soundon.isVisible=true
settings[1].CHECKSOUNDONOFF=1
--sound cordination issues sound disabled
Soundon0.isVisible=false
Soundon.isVisible=false
else
Soundon0.isVisible=true
Soundon.isVisible=false
settings[1].CHECKSOUNDONOFF=0
--sound cordination issues sound disabled
Soundon0.isVisible=false
Soundon.isVisible=false
end


end
end
end
function Soundon:touch( event )
    if event.phase == "began" then
	--overlayclearhis()
	
if settings[1].CHECKALARMONOFF==0 then

--message here to enable alert first
Soundon0.isVisible=true
Soundon.isVisible=false
--sound cordination issues sound disabled
Soundon0.isVisible=false
Soundon.isVisible=false

else

if settings[1].CHECKSOUNDONOFF==0 then
Soundon0.isVisible=false
Soundon.isVisible=true
--sound cordination issues sound disabled
Soundon0.isVisible=false
Soundon.isVisible=false

settings[1].CHECKSOUNDONOFF=1

else

Soundon0.isVisible=true
Soundon.isVisible=false
settings[1].CHECKSOUNDONOFF=0
--sound cordination issues sound disabled
Soundon0.isVisible=false
Soundon.isVisible=false
end


end
end
end

function AlarmOnoff0:touch( event )
    if event.phase == "began" then
	--overlayclearhis()
	
if settings[1].CHECKALARMONOFF==0 then

--message here to enable alert first
AlarmOnoff.isVisible=true
AlarmOnoff0.isVisible=false
settings[1].CHECKALARMONOFF=1
else
AlarmOnoff0.isVisible=true
AlarmOnoff.isVisible=false
Soundon0.isVisible=true
Soundon.isVisible=false
--sound cordination issues sound disabled
Soundon0.isVisible=false
Soundon.isVisible=false
settings[1].CHECKSOUNDONOFF=0
settings[1].CHECKALARMONOFF=0

end
end
end
function AlarmOnoff:touch( event )
    if event.phase == "began" then
	--overlayclearhis()
	
if settings[1].CHECKALARMONOFF==0 then

--message here to enable alert first
AlarmOnoff.isVisible=true
AlarmOnoff0.isVisible=false

settings[1].CHECKALARMONOFF=1

else
AlarmOnoff0.isVisible=true
AlarmOnoff.isVisible=false
Soundon0.isVisible=true
Soundon.isVisible=false
settings[1].CHECKSOUNDONOFF=0
settings[1].CHECKALARMONOFF=0
--sound cordination issues sound disabled
Soundon0.isVisible=false
Soundon.isVisible=false

end
end
end

function AlarmBack:touch( event )
    if event.phase == "began" then
	values = pickerWheel:getValues()
	if not values[1] then
		native.showAlert(_M.appName, "Please make sure a Hour value is selected.", {"OK"})
	elseif not values[2] then
		native.showAlert(_M.appName, "Please make sure a Min value is selected.", {"OK"})
	elseif not values[3] then
		native.showAlert(_M.appName, "Please make sure a AM/PM value is selected.", {"OK"})
	
	else
	--sound cordination issues sound disabled
Soundon0.isVisible=false
Soundon.isVisible=false
	settings[1].roll1=values[1].value
settings[1].roll2=values[2].value
settings[1].roll3=values[3].value



if settings[1].CHECKALARMONOFF==0 then
--print("in alarm off------------------")

notifications.cancelNotification()
 --print("fffffffffffffffffffffffffffffffffffffff        cancelled1")
 time1 = os.date( "!*t", os.time() + notificationTime1 )
notificationID1 = notifications.scheduleNotification( time1, options1Z )

 time2 = os.date( "!*t", os.time() + notificationTime2 )
 notificationID2 = notifications.scheduleNotification( time2, options1Z )
 
 time3 = os.date( "!*t", os.time() + notificationTime3 )
 notificationID3 = notifications.scheduleNotification( time3, options1Z )
 else
 if settings[1].roll3=="PM" then
talhr=settings[1].roll1+12
else
talhr=settings[1].roll1
end
 --print("in alarm on------------------")
 if settings[1].roll3=="PM" then
 talhr=settings[1].roll1+12
 else
 talhr=settings[1].roll1
 end
 --print(talhr.."in alarm on------------------"..settings[1].roll2)
 
 
 local Hour = talhr
local Minutes = settings[1].roll2

local date = os.date( "*t" )
local DAYSEC = 24*3600
local TimeNow = (date.hour * 3600) + (date.min * 60) + date.sec
local AlarmTime = (Hour * 3600) + (Minutes * 60)
local SecondsToAdd = 0 
		
	if TimeNow < AlarmTime then
		SecondsToAdd = AlarmTime - TimeNow
	else
		SecondsToAdd = DAYSEC - TimeNow
		SecondsToAdd = SecondsToAdd + AlarmTime
	end

 
 --print("vvvvvvvvvvvvvvvvvvv "..SecondsToAdd)
local days = 30
notifications.cancelNotification()
local timeToSendNotification =  SecondsToAdd --this will set it to go off at 10pm every day

for i=0, days do
     local time3 = DAYSEC*i +SecondsToAdd
	 --print("time:"..time3)

 timezzz = os.date( "!*t", os.time() + time3 )
     local optionsw = {
          alert = "Reminder for your Kick-counting session",
       --   badge = 1,
      --    sound = "alert.caf",
    }
    
notifications.scheduleNotification(timezzz, optionsw )
 print_r(timezzz)

  
end
 
 
 
end
--print(values[1].value)
	AlarmBack.isVisible=false
	AlarmOnoff.isVisible=false
	AlarmOnoff0.isVisible=false
	Soundon.isVisible=false
	Soundon0.isVisible=false
	displayTexthr.isVisible=false
	displayTextmn.isVisible=false
box1.isVisible=false
rb1.isVisible=false
--displayxt = (values[1].value*60) + values[2].value

box1text.isVisible=false
pickerWheel:removeSelf()

	  whereamI=1 --1-LADY 2-STAT  3- NOTE 4-STOP 5-KICKEARLIER
mmt=0
--print("clock: "..upclockon)
 WHEELHRS = nil
 WHEELMINS = nil
 WHEELAPM = nil
    loadsave.saveTable(settings, "settings.json", system.DocumentsDirectory)
	countdisp.alpha=.95
	--updateTimer()
	end
end
end 
--[[
function AlarmOnoff:touch( event )
values = pickerWheel:getValues()
	if not values[1] then
		native.showAlert(_M.appName, "Please make sure a Hour value is selected.", {"OK"})
	elseif not values[2] then
		native.showAlert(_M.appName, "Please make sure a Min value is selected.", {"OK"})
	elseif not values[3] then
		native.showAlert(_M.appName, "Please make sure a AM/PM value is selected.", {"OK"})
	
	else
					displayxt = (values[1].value*60) + values[2].value 
			--print(displayxt)
numtempmin=displayxt
    if event.phase == "began" then
	play1.isVisible=false
	pause1.isVisible=true
	cancel1.isVisible=false
	ok1.isVisible=false
box1.isVisible=false
rb1.isVisible=false
	displayTexthr.isVisible=false
	displayTextmn.isVisible=false
box1text.isVisible=false
pickerWheel:removeSelf()

    
	  kickv=kickv+1
	  --print(kickv)
	  	  whereamI=1 --1-LADY 2-STAT  3- NOTE 4-STOP 5-KICKEARLIER
	  timer.performWithDelay(500, blinkfeet1, 5)
timer.performWithDelay(600, blinkfeet2, 5)
	  
	  	zx =  os.date('*t');
		--print(os.date("%Y-%m-%d %H:%M:%S", os.time(zx)));
--zx.min = zx.min - 5; -- subtract 5 minutes
--print(zx.min.." //// "..numtempmin)
if numtempmin==nil then

--print("therreeeeee")
numtempmin=0
end

zx.min = zx.min - numtempmin
--print(zx.min.." 2")
while zx.min<0 or  zx.hour<0 do
--print("in while")
if zx.min<0 then
zx.min=60+zx.min
zx.hour=zx.hour-1
if zx.hour<0 then
zx.hour = 24+zx.hour
zx.day=zx.day-1

if zx.day<0 then
zx.wday=zx.wday-1
if zx.wday<0 then
zx.wday=7+zx.wday
end




zx.month=zx.month-1
if zx.month== 4 or 6 or 9 or 115-20 then
zx.day=30+zx.day
elseif zx.day== 2 then
zx.day=28+zx.day
else
zx.day=31+zx.day


end


end
end
end
end

kk=os.date("%Y-%m-%d %H:%M:%S", os.time(zx))
--print(kk)

--tt1 =os.time(zx)
--print(zx)
--ignore 
datatrack[kickv+1]={}
datatrack[kickv+1].count1 = kickv
datatrack[kickv+1].time1 = kk
--datatrack[kickv+1][2] = zx

datatrack[kickv+1].hour1 = zx.hour
datatrack[kickv+1].min1 = zx.min
datatrack[kickv+1].wday1 = zx.wday
datatrack[kickv+1].day1 = zx.day
datatrack[kickv+1].month1 = zx.month
datatrack[kickv+1].year1 = zx.year
--ignore 
table1[kickv]={}


if checkam(zx.hour)== " PM" then
stphr111=zx.hour-12

if stphr111<10 then
stphr111="0"..stphr111
end
if zx.hour==12  then stphr111=12 end


else
stphr111=zx.hour
if stphr111<10 then
stphr111="0"..stphr111
end
end

tomp1min=zx.min
if tomp1min<10 then
tomp1min="0"..tomp1min
end
tomp1=stphr111..":"..tomp1min..checkam(zx.hour)


table1[kickv].title="Kick "..kickv.." - "..tomp1
table1[kickv].collapsed = true

 WHEELHRS = nil
 WHEELMINS = nil

table2=reverseTable(table1)

for iq=1,7 do
if zx.wday==iq then
statis[1][iq]=statis[1][iq]+1
end
end

for iq=1,24 do
if zx.hour==iq then
statis[2][iq]=statis[2][iq]+1
end
end



widgetGroup:removeSelf()
invoketable(table2)



----print(datatrack[kickv+1].count1.."  "..datatrack[kickv+1].time1)
	  
	         if(tx==0 or tx==nil)then 
	   timeKeep:resume()
	    upclockon =1
				 		tx=  timer.performWithDelay(1000, updateTimer, 0)
						--print("here1")
				end
			mmt=0
 return locatime
end
end

end
]]--
AlarmBack:addEventListener( "touch", AlarmBack )
Soundon0:addEventListener( "touch", Soundon0 )
Soundon:addEventListener( "touch", Soundon )
AlarmOnoff0:addEventListener( "touch", AlarmOnoff0 )
AlarmOnoff:addEventListener( "touch", AlarmOnoff )
--ok1:addEventListener( "touch", ok1 )
--print(locatime)
 return locatime
 end

 

 
 
 
 
 
 
 
function closeoverlay1()

	

	
mmt=1
	  whereamI=4 --1-LADY 2-STAT  3- NOTE 4-STOP 5-KICKEARLIER
countdisp.isVisible=false
countdisp.alpha=0
 	--textbox screen
				local rb1 = display.newRect( _W, _H, _W*2, _H*2 )
 rb1:setFillColor( 0, 0, 0 ,.65)
rb1:toFront()
rb1:addEventListener("touch", function()  return true end)
rb1:addEventListener("tap", function()  return true end)
local box1 = display.newImage( settings[1].locabar )
box1.anchorX=0
box1.anchorY=0

box1.x  = -120
box1.y  = 120
box1.alpha=.9 --.70 and .90
box1:scale( 1, 1.3 )


local box1text = display.newText( "Do you want to save\n the current session?", _W/2, _H-300, native.systemFont, 20 )
box1text.alpha = .85




local cancel1 = display.newImage( "cancel.png" )
cancel1.anchorX=0
cancel1.anchorY=0
cancel1.x  = _W/2+50 +20+5
cancel1.y  = _H-255+33+1
cancel1.alpha=1 --.70 and .90
cancel1:scale( .20, .18 )

local bk11 = display.newImage( "back.png" )

bk11.x  = _W/2-75-20-20+5
bk11.y  = _H-255+35+2-3
bk11.anchorX=0
bk11.anchorY=0
bk11.alpha=1 --.70 and .90
bk11:scale( .9, .9 )


local ok1 = display.newImage( "okx.png" )
ok1.anchorX=0
ok1.anchorY=0
ok1.x  =   _W/2-10
ok1.y  = _H-250+33
ok1.alpha=.93 --.70 and .90
ok1:scale( .52, .52)






function bk11:touch( event )
    if event.phase == "began" then
	cancel1.isVisible=false
	ok1.isVisible=false
box1.isVisible=false
rb1.isVisible=false
box1text.isVisible=false
   bk11.isVisible=false  
   	play1.isVisible=false
	pause1.isVisible=true
mmt=0
 timstop=0
	  whereamI=1 --1-LADY 2-STAT  3- NOTE 4-STOP 5-KICKEARLIER
	 updateTimer()
	


				countdisp.isVisible=true
				countdisp.alpha=.95

end
end




function cancel1:touch( event )
    if event.phase == "began" then

	cancel1.isVisible=false
	ok1.isVisible=false
box1.isVisible=false
rb1.isVisible=false
box1text.isVisible=false
      bk11.isVisible=false  
	  	  whereamI=1 --1-LADY 2-STAT  3- NOTE 4-STOP 5-KICKEARLIER
mmt=0
if(tx==0 or tx==nil)then else timeKeep:pause()  upclockon =0 timer.cancel(tx) tx=0 end 
 timstop=1

timeKeep:pause()
 upclockon =0
ky= timeKeep:getElapsedSeconds()
--print(ky)
timeKeep:addTime(-ky)
	
	 --print("z2")
	datatrack={}
	kickv=0
 datatrack[1] = {}
 sessstart=0
	 updateTimer()
	sessstart=0
  table1={{title = "Press Record Kick", collapsed = true}}
 widgetGroup:removeSelf()
invoketable(table1)  

				countdisp.isVisible=true
				countdisp.alpha=.95
								play1.isVisible=true
	pause1.isVisible=false
	
	
	initsession={}
initsession[1]={}
initsession[1].currentsession=0
initsession[1].sessstarttime=0
initsession[1].table1=0
initsession[1].kickv=0
	initsession[1].datatrack=0
	initsession[1].statis=0
		initsession[1].datatrackall=0
	--	initsession[1].tempstamp=0
		loadsave.saveTable(initsession, "initsession.json", system.DocumentsDirectory)
	
if ((iap.getInventoryValue("unlock")~=true) or (iap.getInventoryValue("unlock1")~=true) or (iap.getInventoryValue("unlock2")~=true))  then
print(iap.getInventoryValue("unlock"))
	 wpmaGlobalAdmob.showAdmobInterstitialAd() 
wpmaGlobalAdmob.loadAdmobInterstitialAd() 
end
end
end
function ok1:touch( event )

    if event.phase == "began" then

function ook()

	
	cancel1.isVisible=false
	ok1.isVisible=false
box1.isVisible=false
rb1.isVisible=false
box1text.isVisible=false
	  whereamI=1 --1-LADY 2-STAT  3- NOTE 4-STOP 5-KICKEARLIER
 bk11.isVisible=false  
mmt=0
 timstop=1
	if(tx==0 or tx==nil)then else timeKeep:pause()  upclockon =0 timer.cancel(tx) tx=0 end 
   
    table1={{title = "Press Record Kick", collapsed = true}}
 widgetGroup:removeSelf()
invoketable(table1)   

  
zx2 =  os.date('*t');
	play1.isVisible=true
	pause1.isVisible=false

	
kk2=os.date("%Y-%m-%d %H:%M:%S", os.time(zx2))
--print(kk2)
----print(xy)

datatrack[1].stoptimestamp1 = kk2
--datatrack[kickv+1][2] = zx

datatrack[1].stophour1 = zx2.hour
datatrack[1].stopwday1 = zx2.wday
datatrack[1].stopday1 = zx2.day
datatrack[1].stopmonth1 = zx2.month
datatrack[1].stopyear1 = zx2.year
datatrack[1].stopmin1 = zx2.min
datatrack[1].seskick = kickv

if datatrack[1].sessiondurHr==nil or  datatrack[1].sessiondurMin ==nil then
datatrack[1].sessiondurHr=0
if datatrack[1].sessiondurMin ==nil then
datatrack[1].sessiondurMin=0
end
end
	   tp=datatrack[1].sessiondurHr*60+datatrack[1].sessiondurMin
	   if tp >= datatrackall[1].longestsessiondurationinMN then
	   datatrackall[1].longestsessiondurationstartstamp=datatrack[1].starttimestamp1
	   datatrackall[1].longestsessiondurationstopstamp=  datatrack[1].stoptimestamp1
	 --change above
datatrackall[1].longestsessiondurationinMN=tp
	   
	   
	   end
	   tlp=zx2.year.."-"..zx2.month.."-"..zx2.day
	   if datatrackall[1].totaltodaysessdate== tlp then
	   datatrackall[1].totaltodaysessions=datatrackall[1].totaltodaysessions+1
	   else
	   datatrackall[1].totaltodaysessdate=tlp
	  datatrackall[1].totaltodaysessions=1
	   end
	   
	   datatrackall[1].totalsessions=datatrackall[1].totalsessions+1
datatrackall[1].totaltodaysessions=datatrackall[1].totaltodaysessions+1

	   

merge(datatrack,datatrackall)

datatrackall[1].totalkicks=datatrackall[1].totalkicks+kickv

loadsave.saveTable(datatrackall, "myTable.json", system.DocumentsDirectory)
loadsave.saveTable(statis, "stat.json", system.DocumentsDirectory)

sumKickv=0  --summary
sumKickv=kickv
datatracksum={}
datatracksum=datatrack
tempdur=datatracksum[1].sessiondurHr.." Hours "..datatracksum[1].sessiondurMin.." Minutes"
tempmindur=(datatracksum[1].sessiondurHr*60)+datatracksum[1].sessiondurMin
avgkmz="N/A"
avgkm1z=0
if tempmindur/60 <= 0 then
avgkmz="N/A"
avgkm1z=0
else
avgkmz=math.round(sumKickv/(tempmindur/60))
avgkm1z=avgkmz
if avgkmz <= 0 then
avgkmz="N/A"
avgkm1z=0
if roundToFirstDecimal(sumKickv/(tempmindur/60))>0 then
avgkmz=roundToFirstDecimal(sumKickv/(tempmindur/60)).." Kicks/Hour"
avgkm1z=roundToFirstDecimal(sumKickv/(tempmindur/60))
end
else
avgkmz=avgkmz.." Kicks/Hour"
end
end






if checkam(datatracksum[1].starthour1)== " PM" then
stahr=datatracksum[1].starthour1-12
else
stahr=datatracksum[1].starthour1
end
if checkam(datatracksum[1].stophour1)== " PM" then
stphr=datatracksum[1].stophour1-12
else
stphr=datatracksum[1].stophour1
end
if stahr==0 then
stahr=12
end
if stphr==0 then
stphr=12
end
checkam(datatracksum[1].stophour1)
tempstamp=stahr..":"..datatracksum[1].startmin1..checkam(datatracksum[1].starthour1).."-"..stphr..":"..datatracksum[1].stopmin1..checkam(datatracksum[1].stophour1)





--print("hoho")
print_r(datatrack)
print_r(datatrackall)
kickv=0
	
timeKeep:pause() 
 upclockon =0
ky= timeKeep:getElapsedSeconds()
--print(ky)
timeKeep:addTime(-ky)




	
	 --print("z2")
	datatrack={}
	
 datatrack[1] = {}
 sessstart=0
	 updateTimer()
	sessstart=0
caldataint()
kicklog=caldataint2(kicklog)

				countdisp.isVisible=true
				countdisp.alpha=.95
				
				
function summaryrep()
if ((iap.getInventoryValue("unlock")~=true) or (iap.getInventoryValue("unlock1")~=true) or (iap.getInventoryValue("unlock2")~=true))  then
print(iap.getInventoryValue("unlock"))
	 wpmaGlobalAdmob.showAdmobInterstitialAd() 
wpmaGlobalAdmob.loadAdmobInterstitialAd() 
end
dddh=40
--flower.isVisible=false
rb1aa = display.newRect( _W, _H, _W*2, _H*2 )
 rb1aa:setFillColor( 0, 0, 0 ,.65)
rb1aa:toFront()
rb1aa:addEventListener("touch", function()  return true end)
rb1aa:addEventListener("tap", function()  return true end)
local boxaa1 = display.newImage( settings[1].locabar )
boxaa1.anchorX=0
boxaa1.anchorY=0
boxaa1.x  = 0
boxaa1.y  = 80+65-100+dddh
boxaa1.alpha=.9 --.70 and .90
boxaa1:scale( .25, 1.4 )
local ok1zzz = display.newImage( "okx.png" )
ok1zzz.anchorX=0
ok1zzz.anchorY=0
ok1zzz.x  =   _W/2-10
ok1zzz.y  = _H-250+33-5+10+10
ok1zzz.alpha=.93 --.70 and .90
ok1zzz:scale( .52, .52)
sessstart=0
local sum2text = display.newText( "Total number of Kicks:            "..sumKickv.." Kicks\nSession time:                          "..tempstamp, 30, 65+20+15+20+dddh,native.systemFont, 12 )
local sum3text = display.newText( "Session duration:                    "..tempdur, 30, 65+20+15+27+20+dddh,native.systemFont, 12 )
sum2text.anchorX=0
sum2text.anchorY=0
sum2text:setFillColor( 1, 1, 1 )
sum3text.anchorX=0
sum3text.anchorY=0
   sum3text:setFillColor( 1, 1, 1 )   

local sum1text = display.newText( "Session Summary", _W /2, 65+dddh+10,native.systemFontBold, 22 )
sum1text:setFillColor( 1, 1, 1 )


local sum1textz = display.newText( "Please note: Ideally, you want to feel at least 5 Kicks/Hour.", _W /2, 65+dddh+10+110-2,native.systemFontBold, 9)
sum1textz:setFillColor( 1, 1, 1 )


	
initsession={}
initsession[1]={}
initsession[1].currentsession=0
initsession[1].sessstarttime=0
initsession[1].table1=0
initsession[1].kickv=0
	initsession[1].datatrack=0
	initsession[1].statis=0
		initsession[1].datatrackall=0
	--	initsession[1].tempstamp=0
		loadsave.saveTable(initsession, "initsession.json", system.DocumentsDirectory)
---------------------------------------

 
 function openlink1()
 dry1=-60
 grateA = display.newGroup()
 
 				 rb1r = display.newRect( _W, _H, _W*2, _H*2 )
 rb1r:setFillColor( 0, 0, 0 ,.85)
--rb1r:toFront()
rb1r:addEventListener("touch", function()  return true end)
rb1r:addEventListener("tap", function()  return true end)
 
 
halt1rate= display.newRect( 0 , 200+dry1, 50+100*4, 44*3+30+65+50 )
halt1rate.alpha=.95
halt1rate.anchorX=0
halt1rate.anchorY=0
halt1rate:setFillColor( .2, .2, .2 ,.95)
halt1rate:setStrokeColor( .8, .8 ,.8 )
halt1rate.strokeWidth = .51

halt1ratetext = display.newText( "Rate the App - My Baby's Kick Counter", 160, 44*3+185-65-40+dry1,native.systemFont, 16 )
halt1ratetext:setFillColor( .2, 1, .3 )
halt2ratetext = display.newText( "            Did you enjoy using the App.\n     If so, please take a moment to rate it. \n     This helps us keep our updates free.\n             Thank you for your support.", 155, 44*3+185-65+35+dry1,native.systemFont, 14 )
halt2ratetext:setFillColor( .8, .8, .8 )

 star2 = display.newImage( "5stars2.png" )
star2.anchorX=0
star2.anchorY=0
star2.x  = 160-65-20+5+2-15-5-5-5-5+2
star2.y  = 44*3+185-65-40-20+30+dry1-10
star2.alpha=.75 --.70 and .90
star2:scale( .35, .35 )

 rateme1b = display.newImage( "r1.png" )
rateme1b.anchorX=0
rateme1b.anchorY=0
rateme1b.x  = 160-65
rateme1b.y  = 44*3+185-65-40-20+30+dry1+100+10
rateme1b.alpha=.8 --.70 and .90
rateme1b:scale( .70, .70 ) 

rateme2b = display.newImage( "r2.png" )
rateme2b.anchorX=0
rateme2b.anchorY=0
rateme2b.x  = 160-65
rateme2b.y  = 44*3+185-65-40-20+30+dry1+100+50+5
rateme2b.alpha=.8 --.70 and .90
rateme2b:scale( .70, .70 )

rateme3b = display.newImage( "r3.png" )
rateme3b.anchorX=0
rateme3b.anchorY=0
rateme3b.x  = 160-65
rateme3b.y  = 44*3+185-65-40-20+30+dry1+100+50+50
rateme3b.alpha=.8 --.70 and .90
rateme3b:scale( .70, .70 )
rateme3b.isVisible=false

 lograte = display.newImage( "stars.png" )
lograte.anchorX=0
lograte.anchorY=0
lograte.x  = 160-65+20
lograte.y  = 44*3+185-65-40-20+30+dry1-85-5
lograte.alpha=.8 --.70 and .90
lograte:scale( .25, .25 )

function rateme1b:touch( event )
    if event.phase == "began" then

settings[1].remind=1 
 system.openURL(mylink)  
 grateA.isVisible=false
 
end
end



  grateA:insert( rb1r )
 grateA:insert( halt1rate ) 
  grateA:insert( halt1ratetext )


  grateA:insert( lograte )
  grateA:insert( star2 )
halt2ratetext:toFront()

    grateA:insert( halt2ratetext )

rateme1b:toFront()
rateme2b:toFront()
rateme3b:toFront()
     grateA:insert( rateme1b )
  grateA:insert( rateme2b )
  grateA:insert( rateme3b )
 loadsave.saveTable(settings, "settings.json", system.DocumentsDirectory)
 	rateme1b:addEventListener( "touch", rateme1b )
rateme2b:addEventListener("touch", function()  settings[1].remind=2    grateA.isVisible=false return true end)
rateme3b:addEventListener("touch", function()   settings[1].remind=3   grateA.isVisible=false return true end)
 --system.openURL( mylink )
 end
function shareit2()
-- creating the display group --

local isSimulator = "simulator" == system.getInfo( "environment" )

if isSimulator then
	native.showAlert( "Build for device", "This plugin is not supported on the Corona Simulator, please build for an iOS/Android device or Xcode simulator", { "OK" } )
end

-- Hide the status bar
display.setStatusBar( display.HiddenStatusBar )

-- Require the widget library
local widget = require( "widget" )

-- Use the iOS 7 theme for this sample
--widget.setTheme( "widget_theme_ios7" )

-- This is the name of the native popup to show, in this case we are showing the "social" popup
local popupName = "social"


-- Display some text


local sendMessage = true
local sendURL = true
local sendImage = false

-- Exectuted upon touching & releasing a widget button

	local serviceName = "share"
	local isAvailable = native.canShowPopup( popupName, serviceName )
	if avgkmz=="N/A" then
			txthere1 = "Hi Dear,\nI wanted to share some good health with you & your little one.\nTry the Pregnancy Kickcounter app.\n"
	else
	txthere1= "Hi Dear,\n My baby kicked "..avgkmz.." today on Pregnancy Kickcounter app.\n Try\n"
	
	end
	-- For demonstration purposes, we set isAvailable to true here for Android.
	if "Android" == system.getInfo( "platformName" ) then
		isAvailable = true
	end
	--messenger2("  1 Thank you for spreading the joy\nof good health with your loved ones.")


	-- If it is possible to show the popup
	if isAvailable then
	


		local listener = {}
		function listener:popup( event )
			----print( "name(" .. event.name .. ") type(" .. event.type .. ") action(" .. tostring(event.action) .. ") limitReached(" .. tostring(event.limitReached) .. ")" )			
		end
		
		local options = {}
		options.service = serviceName
		options.listener = listener
		if sendMessage then
			options.message = txthere1
		end
		if sendURL then
			options.url = { "https://play.google.com/store/apps/details?id=com.gmail.rockingdna.staff.PregnancyKickcounter" }
		end
	

		-- Show the popup
		native.showPopup( popupName, options )
	else
		if isSimulator then
			native.showAlert( "Build for device", "This plugin is not supported on the Corona Simulator, please build for an iOS/Android device or the Xcode simulator", { "OK" } )
		else
			-- Popup isn't available.. Show error message
			native.showAlert( "Cannot send " .. serviceName .. " message.", "Please setup your " .. serviceName .. " account or check your network connection (on android this means that the package/app (ie Twitter) is not installed on the device)", { "OK" } )
		end
	end


--timer.performWithDelay(1000,messenger2("Thank you for spreading the joy\nof good health with your loved ones."), 1 )


-- Use the share intent on Android to get any platform we could want

	-- Create a background to go behind our widget buttons


	-- Create a share button

	
end






--[[ Require the widget library
local widget = require( "widget" )

-- Use the Android "Holo Dark" theme for this sample
widget.setTheme( "widget_theme_android_holo_dark" )
]]--

-- Executed upon touching and releasing the button created below
local function onShareButtonReleased( event )
    
	messenger2("   Thank you for spreading the joy\nof good health with your loved ones.")




		--print("here email")
	if avgkmz=="N/A" then
			txthere1 = "Hi Dear,\nI wanted to share some good health with you & your little one.\nTry Pregnancy Kickcounter app.\n"
	else
	txthere1= "Hi Dear,\nMy baby kicked "..avgkmz.." today on Pregnancy Kickcounter app.\nTry\n"
	
	end
	

		
		
		local options =
{
   to = "",
   subject = "Wishing you and your baby good health.",
   body = txthere1,
}
native.showPopup( "mail", options )
		
	
	
end








--------------------------------------


local sum11text = display.newText( "Average kicks/hour:   "..avgkmz, 30, 65+15+20+dddh,native.systemFontBold, 15 )

sum11text.anchorX=0
sum11text.anchorY=0



local shareme = display.newImage( "SJ3.png" )
shareme.anchorX=.5
shareme.anchorY=.5
shareme.x  = _W/2+10-20-40-10
shareme.y  = 80+65-100+dddh+150+10+10
shareme.alpha=.9 --.70 and .90
shareme:scale( .5, .5 )
shareme.id = "share"


 rate2 = display.newImage( "rateit1.png" )
rate2.anchorX=.5
rate2.anchorY=.5
rate2.x  = _W/2+10-20-40-10+60+60+10+5
rate2.y  = 80+65-100+dddh+150+10+10
rate2.alpha=.9 --.70 and .90
rate2:scale( .5, .5 )



function ok1zzz:touch( event )
    if event.phase == "began" then
	--showinters()
	sum2text.isVisible=false
	sum11text.isVisible=false
	boxaa1.isVisible=false
	ok1zzz.isVisible=false
	shareme.isVisible=false
	rate2.isVisible=false
		rb1aa.isVisible=false
		sum1text.isVisible=false
		sum3text.isVisible=false
		sum1textz.isVisible=false
		--print("mooo"..datatrackall[1].totalsessions)
		if datatrackall[1].totalsessions== 10 then
		--print("in l1")

		openlink()
				
		end

		if datatrackall[1].totalsessions== 25 then
		--print("in l1")

		openlink()
				
		end

		if datatrackall[1].totalsessions== 50 then
		--print("in l1")

		openlink()
				
		end
	end
	end
shareme:addEventListener( "touch", shareit2 )
ok1zzz:addEventListener( "touch", ok1zzz )
rate2:addEventListener( "touch", openlink1 )
end				
summaryrep()

 return locatime
end
end
ook()
end




bk11:addEventListener( "touch", bk11 )
cancel1:addEventListener( "touch", cancel1 )
ok1:addEventListener( "touch", ok1 )


--print(locatime)
 return true
 end

 
 
 
function note1()
mmt=1
countdisp.isVisible=false

countdisp.alpha=0
 	--textbox screen
	
	
		  whereamI=3 --1-LADY 2-STAT  3- NOTE 4-STOP 5-KICKEARLIER
	
	 	local statb = display.newImage( "statb1-(2).jpg" )
statb.anchorX  = 0
statb.anchorY  = 0
statb.x  = 0
statb.y  = 0
statb:scale( 2,2 )



	
				local rb1 = display.newRect( _W, _H, _W*2, _H*2 )
 rb1:setFillColor( 0, 0, 0 ,.65)
rb1:toFront()
rb1:addEventListener("touch", function()  return true end)
rb1:addEventListener("tap", function()  return true end)


local locatime =0
local box1text = display.newText( "Enter notes:", 100,50, native.systemFont, 20 )
box1text.alpha = 1
local flag11=1

local noteField = native.newTextBox( 161, 240, 245, 350 )
noteField.isEditable = true
noteField.align = "left"
noteField.size = 20
noteField.text = globanote
noteField.alpha=.5
--datatrack[1].note1 = globanote

----print(datatrack[1].note1)



local nt1 = display.newImage( "n5.png" )
nt1.anchorX=0
nt1.anchorY=0
nt1.x  = _W/2+16
nt1.y  = 16
nt1.alpha=1 --.70 and .90
nt1:scale( .4, .4 )
local nt2 = display.newImage( "n8.png" )
nt2.anchorX=0
nt2.anchorY=0
nt2.x  = _W/2+75
nt2.y  = 16
nt2.alpha=.7 --.70 and .90
nt2:scale( .1, .1 )

local ok1 = display.newImage( "okx.png" )
ok1.anchorX=0
ok1.anchorY=0
ok1.x  = _W/2-10
ok1.y  = _H-250+35+160
ok1.alpha=.93 --.70 and .90
ok1:scale( .52, .52)
native.setKeyboardFocus( noteField )

function nt1:touch( event )
    if event.phase == "began" then
flag11=1
	nt1.alpha=1
nt2.alpha=.7
--noteField.text = globanote
--datatrack[1].note1 = globanote


end
end

function nt2:touch( event )
    if event.phase == "began" then
	flag11=2
nt1.alpha=.7
nt2.alpha=1
noteField.text = globanote2
datatrackall[1].postit = globanote2

end
end



function ok1:touch( event )
    if event.phase == "began" then
		  whereamI=1 --1-LADY 2-STAT  3- NOTE 4-STOP 5-KICKEARLIER
	ok1.isVisible=false
nt1.isVisible=false
nt2.isVisible=false
rb1.isVisible=false
statb.isVisible=false
box1text.isVisible=false

      noteField:removeSelf()
	  
	  datatrack[1].note1 = globanote
	  datatrackall[1].postit = globanote2
	
	 --print("globalnote"..datatrack[1].note1)
	        --print("hohook")
		mmt=0
 return globanote
end
end
nt1:addEventListener( "touch", nt1 )
nt2:addEventListener( "touch", nt2 )

ok1:addEventListener( "touch", ok1 )
--print(globanote)
 return globanote
 end

function setduedate()

countdisp.isVisible=false
pully=25
mmt=1
countdisp.alpha=0
----print("sound state"..settings[1].CHECKSOUNDONOFF)
whereamI=5 --1-LADY 2-STAT  3- NOTE 4-STOP 5-KICKEARLIER
 	--textbox screen
				local rb1 = display.newRect( _W, _H, _W*2, _H*2 )
 rb1:setFillColor( 0, 0, 0 ,.65)
rb1:toFront()
rb1:addEventListener("touch", function()  return true end)
rb1:addEventListener("tap", function()  return true end)
local box1 = display.newImage("1b.png")
box1.anchorX=0
box1.anchorY=0
box1.x  = 0
box1.y  = 0
box1.alpha=1 --.70 and .90
box1:scale( 1, 1.2 )

local locatime =0
local box1text = display.newText( "Settings", _W/2, 80+65-100+40-pully-10, native.systemFontBold, 20 )
box1text.alpha = .85

numtempmin=0

 WHEELday = {}
 WHEELmon = {}
 WHEELyear = {}

zeta=1
for y = 1, 100 do
WHEELday[y] = zeta
zeta=zeta+1
if zeta==31 then
zeta=1
end
end
zeta=1
-- Populate the "days" table
for d = 1, 200 do
    WHEELmon[d] = zeta
	zeta=zeta+1
	if zeta==13 then
zeta=1
end
end
delta=2000
for y = 0, 100 do

WHEELyear[delta] = y

delta=delta+1


end



-- local dueBack = display.newImage( "alb1.png" )
-- dueBack.anchorX=0.5
-- dueBack.anchorY=0.5
-- dueBack.x  = _W/2
-- dueBack.y  = _H-255+125+80-5-pully+10-5-15
-- dueBack.alpha=.93 --.70 and .90
-- dueBack:scale( .7, .75 )

duedeltaday=0
duedeltamon=0
duedeltayear=0


-- Configure the picker wheel columns
local columnDataZ = 
{
    -- Months
    { 
        align = "left",
        width = 100,
        startIndex = 5+duedeltaday,
        labels = WHEELday
    },
    -- Days
    {
        align = "left",
        width = 100,
        startIndex = 5+duedeltamon,
        labels = WHEELmon
    },   -- Days
    {
        align = "left",
        width = 100,
        startIndex = 5+duedeltayear,
        labels = WHEELyear
    },
 
}

-- Create the widget
local pickerWheel = widget0.newPickerWheel
{
    -- top = display.contentHeight - 322,
    columns = columnDataZ,
    -- sheet = pickerWheelSheet,
    -- overlayFrame = 1,
    -- overlayFrameWidth = 320,
    -- overlayFrameHeight = 102,
    -- backgroundFrame = 1,
    -- backgroundFrameWidth = 320,
    -- backgroundFrameHeight = 022,
    -- separatorFrame = 1,
    -- separatorFrameWidth = 8,
    -- separatorFrameHeight = 222,
    -- columnColor = { 0.1, 0.1, 0.1, .9 },
    -- fontColor = { 0.4, 0.4, 0.7, 0.5 },
    -- fontColorSelected = { 1, 0.7, 0.0 }
}
	-- Position it however you like.
	pickerWheel.anchorChildren = true
	pickerWheel.anchorX = 0.5
	pickerWheel.anchorY = 0.5
	pickerWheel.x = display.contentCenterX
	pickerWheel.y = display.contentCenterY-20-pully
	
-- Get the table of current values for all columns
-- This can be performed on a button tap, timer execution, or other event
local values = pickerWheel:getValues()

	displayTexthr = display.newText{
		text = "      ",
		width = display.contentWidth - 50,
		font = native.systemFont,
		fontSize = 18,
		align = "center"
	}
	displayTexthr:setFillColor(0)
	displayTexthr.anchorY = 0
	displayTexthr.x = pickerWheel.x-35-10
	displayTexthr.y = pickerWheel.y + pickerWheel.height/2 - 10-pully
	
		displayTextmn = display.newText{
		text = "                             ",
		width = display.contentWidth - 80,
		font = native.systemFont,
		fontSize = 18,
		align = "center"
	}
	displayTextmn:setFillColor(0)
	displayTextmn.anchorY = 0
	displayTextmn.x = pickerWheel.x+110
	displayTextmn.y = pickerWheel.y + pickerWheel.height/2 - 10-pully
	






		-- --print("here"..numtempmin)
-- zx =  os.date('*t');
	-- zx1=	os.date("%Y-%m-%d %H:%M:%S", os.time(zx))
-- local box2text = display.newText( zx1, _W/2+40, _H-278, native.systemFont, 17 )
-- box2text.alpha = .85
-- box2text.isVisible=false



function AlarmBack:touch( event )
    if event.phase == "began" then
	values = pickerWheel:getValues()
	if not values[1] then
		native.showAlert(_M.appName, "Please make sure a day value is selected.", {"OK"})
	elseif not values[2] then
		native.showAlert(_M.appName, "Please make sure a month value is selected.", {"OK"})
	elseif not values[3] then
		native.showAlert(_M.appName, "Please make sure a year value is selected.", {"OK"})
	
	else
	--sound cordination issues sound disabled

	AlarmBack.isVisible=false
	
	displayTexthr.isVisible=false
	displayTextmn.isVisible=false
	displayTextmn.isVisible=false
box1.isVisible=false
rb1.isVisible=false
--displayxt = (values[1].value*60) + values[2].value

box1text.isVisible=false
pickerWheel:removeSelf()

	  whereamI=1 --1-LADY 2-STAT  3- NOTE 4-STOP 5-KICKEARLIER
mmt=0
--print("clock: "..upclockon)
 WHEELHRS = nil
 WHEELMINS = nil
 WHEELAPM = nil
   -- loadsave.saveTable(settings, "settings.json", system.DocumentsDirectory)
	countdisp.alpha=.95
	--updateTimer()
	end
end
end 

AlarmBack:addEventListener( "touch", AlarmBack )

--ok1:addEventListener( "touch", ok1 )
--print(locatime)
 return locatime
 end

 


 
--local mysetting = "1b.png"
zback=bckchange(bkimages[settings[1].bkground])
local r = display.newRect( _W, 80, _W, _H*2 )
r:setFillColor( .25, .25, .25 ,0)

local lady = display.newImage( "3.png" )
lady.anchorX  = 0
lady.anchorY  = 0
lady:scale( 1, 1 )

if settings[1].inthefuture==nil then

remainingtext="Set\ndate"
else
difference1=os.difftime( settings[1].inthefuture, os.time())/86400
remainingtext=math.round(difference1).." days\n    to go"

if difference1<1 then
remainingtext="Any day\n    now"
end

DATEFUT=	os.date("%Y-%m-%d %H:%M:%S", settings[1].inthefuture)
--print("due date*******************************************")
print_r(DATEFUT)
--print("conc date*******************************************")
concdate1= os.date("%Y-%m-%d %H:%M:%S", (settings[1].inthefuture- (270*24*60*60)))
concdate2= os.date("%Y-%m-%d %H:%M:%S", (settings[1].inthefuture- (262*24*60*60)))
print_r(concdate1.."-"..concdate2)
--print("1st trimesterfirst day of your last menstrual period (LMP) and ends with the last day of the 13th week*******************************************")
lmp=settings[1].inthefuture- (280*24*60*60)
print_r(os.date("%Y-%m-%d %H:%M:%S", (lmp)).."-"..os.date("%Y-%m-%d %H:%M:%S", (lmp)+ (92*24*60*60)))
--print("2nd trimester **********: Starts at the beginning of the 14th week after your LMP and lasts through the 27th week of pregnancy.*********************************")
print_r(os.date("%Y-%m-%d %H:%M:%S", (lmp)+ (93*24*60*60)).."-"..os.date("%Y-%m-%d %H:%M:%S", (lmp)+ (186*24*60*60)))
--print("3rd trimester **********: Starts at the beginning of the 28th week after your LMP and ends with labor..*********************************")
print_r(os.date("%Y-%m-%d %H:%M:%S", (lmp)+ (187*24*60*60)).."- around "..os.date("%Y-%m-%d %H:%M:%S", settings[1].inthefuture))

end




function shareit()
local isSimulator = "simulator" == system.getInfo( "environment" )

if isSimulator then
	native.showAlert( "Build for device", "This plugin is not supported on the Simulator, please build for an iOS/Android device or Xcode simulator", { "OK" } )
end

-- Hide the status bar
display.setStatusBar( display.HiddenStatusBar )

-- Require the widget library
local widget = require( "widget" )

-- Use the iOS 7 theme for this sample
--widget.setTheme( "widget_theme_ios7" )

-- This is the name of the native popup to show, in this case we are showing the "social" popup
local popupName = "social"


-- Display some text


local sendMessage = true
local sendURL = true
local sendImage = false

-- Exectuted upon touching & releasing a widget button

	local serviceName = "share"
	local isAvailable = native.canShowPopup( popupName, serviceName )

	-- For demonstration purposes, we set isAvailable to true here for Android.
	if "Android" == system.getInfo( "platformName" ) then
		isAvailable = true
	end
	--messenger2("  1 Thank you for spreading the joy\nof good health with your loved ones.")


	-- If it is possible to show the popup
	if isAvailable then
		messenger2("Thank you for spreading the joy\nof good health with your loved ones.")


		local listener = {}
		function listener:popup( event )
			----print( "name(" .. event.name .. ") type(" .. event.type .. ") action(" .. tostring(event.action) .. ") limitReached(" .. tostring(event.limitReached) .. ")" )			
		end
		
		local options = {}
		options.service = serviceName
		options.listener = listener
		if sendMessage then
			options.message = "Hi Dear, I wanted to share some good health for you & your little one.\nTry Pregnancy Kickcounter app"

		

		
		end
		if sendURL then
			options.url = { "https://play.google.com/store/apps/details?id=com.gmail.rockingdna.staff.PregnancyKickcounter" }
		end
	

		-- Show the popup
		native.showPopup( popupName, options )
	else
		if isSimulator then
			native.showAlert( "Build for device", "This plugin is not supported on the Corona Simulator, please build for an iOS/Android device or the Xcode simulator", { "OK" } )
		else
			-- Popup isn't available.. Show error message
			native.showAlert( "Cannot send " .. serviceName .. " message.", "Please setup your " .. serviceName .. " account or check your network connection (on android this means that the package/app (ie Twitter) is not installed on the device)", { "OK" } )
		end
	end





-- Use the share intent on Android to get any platform we could want

	-- Create a background to go behind our widget buttons


	-- Create a share button

	
end










 contdownheart = display.newImage( "dow.png" )
contdownheart.x  = 40+10-3-2
contdownheart.y  = 25+10-5-2
contdownheart.alpha=.3 --.70 and .90
contdownheart:scale( .4, .4 )
contdownheart:rotate( -30 )
 contdownhearttext = display.newText( remainingtext, 40, 25,native.systemFontBold, 13 )
contdownhearttext.anchorX=.5
contdownhearttext.anchorY=.5
contdownhearttext:setFillColor( .2, 1, 1 )
contdownhearttext.x  = 40+10+3+2+2
contdownhearttext.y  = 25+10-3+2+5
contdownhearttext:rotate( 00 )
contdownhearttext.alpha=.7


 contdownhearttext2 = display.newText( "    View\n progress", 40, 25,native.systemFontBold, 13 )
contdownhearttext2.anchorX=.5
contdownhearttext2.anchorY=.5
contdownhearttext2:setFillColor( .2, 1, 1 )
contdownhearttext2.x  = 40+10+3+2+2
contdownhearttext2.y  = 25+10-3+2+5
contdownhearttext2:rotate( 00 )
contdownhearttext2.alpha=.7

srno=true
tempvals=2000
function blinkhearttext()

if srno then
srno=false
transition.fadeOut( contdownhearttext, { time=tempvals } )
transition.fadeIn( contdownhearttext2, { time=tempvals } )
else
srno=true
transition.fadeOut( contdownhearttext2, { time=tempvals } )
transition.fadeIn( contdownhearttext, { time=tempvals } )

end
   timer.performWithDelay(6000, blinkhearttext)
end
blinkhearttext()
--transition.blink( square, { time=1000 } )

--print("1   "..remainingtext)

 play1 = display.newImage( "bb1.png" )
play1.x  = display.contentWidth-60+2
play1.y  = 80+5 -20+5
play1.alpha=.90 --.70 and .90
play1:scale( .38, .38 )
















 spreadjoy = display.newImage( "SJ3.png" )
spreadjoy.x  = display.contentWidth-60-5+5-5+2-3-2-2-1+10+1-10+5
spreadjoy.y  = 80+5 -20-30-10-5-3-1-2-1
spreadjoy.alpha=.80 --.70 and .90
spreadjoy:scale( .5, .5 )

 stop1 = display.newImage( "bb2.png" )
stop1.x  = display.contentWidth-60+2+1
stop1.y  = 145-20
stop1.alpha=.90
stop1:scale( .28, .28 )
	
	pause1 = display.newImage( "bb3.png" )
	pause1.x  = display.contentWidth-60+2
pause1.y  =  80+5 -20+5
pause1.alpha=.90 --.70 and .90
pause1:scale( .38, .38 )
pause1.isVisible=false

local	addnote1 = display.newImage( "n2.png" )
	addnote1.x  = display.contentWidth-60
addnote1.y  = 80+5+115-20
addnote1.alpha=.70 --.70 and .90
addnote1:scale( .38, .38 )
addnote1.isVisible=false
	analytic1 = display.newImage( "ss1.png" )
	analytic1.x  = display.contentWidth-60+2+4
analytic1.y  = 80+5+115-20+60-58
analytic1.alpha=1 --.70 and .90
analytic1:scale( .2, .2 )


	shop = display.newImage( "shop3.png" )
	shop.x  = 50
shop.y  = 80+5+115-20+60-58+50+50+50+60
shop.alpha=.85 --.70 and .90
shop:scale( .2, .2 )


function callad()


--adGroup = display.newGroup()
--adGroupscreen = display.newGroup()
local background1 = display.newRect(160,240,360,700)
background1:setFillColor({type="gradient", color1={ 0,0,0 }, color2={ 0,0,0 }, direction="down"})
background1.alpha=.9
background1.x=_W/2
background1.y=_H/2

background1:addEventListener("tap", function() return true end)
background1:addEventListener("touch", function() return true end)
--adGroupscreen:insert(background)
--Draw "buy" button
    --Create button background
	yy=80
	shopt = display.newText( "Support us by feeding our office cat\nand as a thank you get a Pro version.", _W/2, 210-30, native.systemFont, 15 )
shopt:setFillColor( 1, 1, 1 )


if ((iap.getInventoryValue("unlock")~=true) and (iap.getInventoryValue("unlock1")~=true) and (iap.getInventoryValue("unlock2")~=true))  then
	      buyitz = display.newImageRect( "shop1.png", 180, 180 )
  buyitz.x = display.contentCenterX
  buyitz.y = 148-60+30-30
  elseif ((iap.getInventoryValue("unlock2")==true)) then 
  	      buyitz = display.newImageRect( "shop2222.png", 180, 180 )
  buyitz.x = display.contentCenterX
  buyitz.y = 148-60+30-30
  
    elseif ((iap.getInventoryValue("unlock1")==true)) then 
  	      buyitz = display.newImageRect( "shop222.png", 180, 180 )
  buyitz.x = display.contentCenterX
  buyitz.y = 148-60+30-30
  
      elseif ((iap.getInventoryValue("unlock")==true)) then 
  	      buyitz = display.newImageRect( "shop2.png", 180, 180 )
  buyitz.x = display.contentCenterX
  buyitz.y = 148-60+30-30
  
    end
  
    local buyBackground = display.newRect(160, 330, 180, 30)
    buyBackground.stroke = { 0.5, 0.5, 0.5 }
    buyBackground.strokeWidth = 2
	buyBackground.y=buyBackground.y+80-yy-60+30-30
	buyBackground.x=buyBackground.x-100+100
    --Create "buy IAP" text object
    local buyText = display.newText("Feed 1 Tuna", buyBackground.x, buyBackground.y, native.systemFont, 18)
    buyText:setFillColor(0,0,0)
    --Place objects into a group
	
	
	    local buyBackground1 = display.newRect(160, 330, 180, 30)
    buyBackground1.stroke = { 0.5, 0.5, 0.5 }
    buyBackground1.strokeWidth = 2
	buyBackground1.y=buyBackground1.y+80-yy-60+30-30+50
	buyBackground1.x=buyBackground1.x-100+100
    --Create "buy IAP" text object
    local buyText1 = display.newText("Feed 3 Tunas", buyBackground1.x, buyBackground1.y, native.systemFont, 18)
    buyText1:setFillColor(0,0,0)
	
	
		    local buyBackground2 = display.newRect(160, 330, 180, 30)
    buyBackground2.stroke = { 0.5, 0.5, 0.5 }
    buyBackground2.strokeWidth = 2
	buyBackground2.y=buyBackground2.y+80-yy-60+30-30+50+50
	buyBackground2.x=buyBackground2.x-100+100
    --Create "buy IAP" text object
    local buyText2 = display.newText("Feed 10 Tunas", buyBackground2.x, buyBackground2.y, native.systemFont, 18)
    buyText2:setFillColor(0,0,0)
	
	
    buyGroup = display.newGroup()
    buyGroup:insert(buyBackground)
    buyGroup:insert(buyText)
	
	   buyGroup1 = display.newGroup()
    buyGroup1:insert(buyBackground1)
    buyGroup1:insert(buyText1)
	
		   buyGroup2 = display.newGroup()
    buyGroup2:insert(buyBackground2)
    buyGroup2:insert(buyText2)


 --   buyGroup:insert(shopt)
    
    buyGroup.text=buyText
    buyGroup1.text=buyText1
    buyGroup2.text=buyText2
    
--If the user has purchased the game before, change the button
if (iap.getInventoryValue("unlock")==true) then
    buyText.text="Ads removed"
	wpmaGlobalAdmob.hideAdmobBannerAd()
	--buyitz:removeSelf()

	
else
    --Otherwise add a tap listener to the button that unlocks the game
    buyGroup:addEventListener("tap", buyUnlock)
end


if (iap.getInventoryValue("unlock1")==true) then
    buyText1.text="Ads removed"
	wpmaGlobalAdmob.hideAdmobBannerAd()
	--buyitz:removeSelf()

	
else
    --Otherwise add a tap listener to the button that unlocks the game
    buyGroup1:addEventListener("tap", buyUnlock1)
end
    
	
if (iap.getInventoryValue("unlock2")==true) then
    buyText2.text="Ads removed"
	wpmaGlobalAdmob.hideAdmobBannerAd()
	--buyitz:removeSelf()

	
else
    --Otherwise add a tap listener to the button that unlocks the game
    buyGroup2:addEventListener("tap", buyUnlock2)
end
	
	
--Draw "restore" button
    --Create button background
    local restoreBackground = display.newRect(160, 330, 180, 30)
    restoreBackground.stroke = { 0.5, 0.5, 0.5 }
    restoreBackground.strokeWidth = 2
	restoreBackground.y = restoreBackground.y-yy-60+30
	restoreBackground.x = restoreBackground.x-100+100
    --Create "buy IAP" text object
    local restoreText = display.newText("Restore purchases", restoreBackground.x, restoreBackground.y, native.systemFont, 18)
    restoreText:setFillColor(0,0,0)
    --Add event listener
	
	    restGroup = display.newGroup()
    restGroup:insert(restoreBackground)
    restGroup:insert(restoreText)
    
    restGroup.text=restoreText
    restGroup:addEventListener("tap", restorePurchases)
	
	
	  local backb = display.newRect(160, 330, 180, 30)
    backb.stroke = { 0.5, 0.5, 0.5 }
    backb.strokeWidth = 2
	backb.y=backb.y+160-yy-60+30+40
	backb.x=backb.x-100+100
    --Create "buy IAP" text object
    local backbText = display.newText("Back", backb.x, backb.y, native.systemFont, 18)
    backbText:setFillColor(0,0,0)
    --Add event listener
	
		    backbGroup = display.newGroup()
    backbGroup:insert(backbText)
    backbGroup:insert(restoreText)
    

	
function removeadpg( event )
   if ( event.phase == "began" ) then
      elseif ( event.phase == "moved" ) then
      elseif ( event.phase == "ended" ) then

	  if (buyitz)== nil then
	  else
buyitz.isVisible=false
		buyitz:removeSelf()
        buyitz=nil  

end
--buyitz:removeSelf()

buyGroup:removeEventListener("tap", buyUnlock)
buyGroup1:removeEventListener("tap", buyUnlock1)
buyGroup2:removeEventListener("tap", buyUnlock2)



restGroup:removeEventListener("tap", restorePurchases)


restoreText.isVisible=false
 restGroup:removeSelf()
   restGroup=nil 
 --adGroupscreen:removeSelf()
  --      adGroupscreen=nil    
		buyGroup:removeSelf()
        buyGroup=nil  	
		
				buyGroup1:removeSelf()
        buyGroup1=nil
		
				buyGroup2:removeSelf()
        buyGroup2=nil
		
		backbGroup:removeSelf()
        backbGroup=nil  
		
			background1:removeSelf()
        background1=nil  		

		shopt:removeSelf()
        shopt=nil  			
	
	
	
		
		end
      return true
end
			    backbGroup = display.newGroup()
    backbGroup:insert(backb)
    backbGroup:insert(backbText)
	  backbGroup:addEventListener("touch", removeadpg)


--If the user hasn't unlocked the game, display an advertisement across the top of the screen
if ((iap.getInventoryValue("unlock")~=true) or (iap.getInventoryValue("unlock1")~=true) or (iap.getInventoryValue("unlock2")~=true))  then
unlockad=0
end

end



 DROPMENU = display.newGroup()

 

plus1 = display.newImage( "plus1.png" )
plus1.x  = display.contentWidth-53
plus1.y  = 80+5+115-20+60-5
plus1.alpha=.85 --.70 and .90
plus1:scale( .52, .52 )

alarm1 = display.newImage( "1alarm.png" )
alarm1.x  = display.contentWidth-53
alarm1.y  = plus1.y+42
alarm1.alpha=.95 --.70 and .90
alarm1:scale( .15, .15)

gear2 = display.newImage( "gear.png" )
gear2.x  = display.contentWidth-53
gear2.y  = alarm1.y+43
gear2.alpha=.75 --.70 and .90
gear2:scale( .35, .35 )



like1 = display.newImage( "like.png" )
like1.x  = display.contentWidth-53
like1.y  = gear2.y+43
like1.alpha=1 --.70 and .90
like1:scale( .28, .28 )

help1 = display.newImage( "help.png" )
help1.x  = display.contentWidth-53
help1.y  = like1.y+43
help1.alpha=1 --.70 and .90
help1:scale( .52, .52 )
--email 
dropback = display.newRoundedRect( 	plus1.x, plus1.y-18, 40, 60*2.6+48,18 )
dropback.anchorX=.5
dropback.anchorY=0
dropback.alpha=.4
  dropback:setFillColor( 0.65 )
  
      DROPMENU:insert( dropback )
   DROPMENU:insert( alarm1 ) 
   DROPMENU:insert( gear2 ) 
   DROPMENU:insert( like1 ) 
   DROPMENU:insert( help1 ) 
   DROPMENU.anchorX=1
DROPMENU.anchorY=1
   DROPMENUstat=0
   DROPMENU.alpha=0

--transition.scaleTo( DROPMENU, { xScale=1.0, yScale=1, time=2000 } )
--transition.to( DROPMENU, { time=500, delay=2500, alpha=1.0, onComplete=listener2 } )
tempdrop=nil
function timerclean() tempdrop = nil end


function nextback()
if settings[1].bkground== #bkimages then
settings[1].bkground=0
end
settings[1].bkground=1+settings[1].bkground
if settings[1].bkground == 1 then
settings[1].locabar="bar1.jpg" 
elseif settings[1].bkground == 3 then
settings[1].locabar="bar1.jpg"

else
settings[1].locabar="bar2.png"
end
loadsave.saveTable(settings, "settings.json", system.DocumentsDirectory)

background.isVisible=false
bckchange(bkimages[settings[1].bkground])
background:toBack()
end

function fadeoutDropmenu()
if(tempdrop~=nil) then  -- Check whether timer is triggering or not 
  timer.cancel(tempdrop)
end

--print("out")
transition.to( DROPMENU, { time=500, delay=100, alpha=0.0, onComplete=timerclean } )
DROPMENUstat=0
end

function timeoutDropmenu()
if tempdrop==nil then
else
timer.cancel(tempdrop)
tempdrop=nil
end

tempdrop=timer.performWithDelay( 10000, fadeoutDropmenu, 1 )
end


function fadeinDropmenu()

transition.to( DROPMENU, { time=500, delay=100, alpha=1.0, onComplete= timeoutDropmenu} )
DROPMENUstat=0
end

  function gear2:touch( event )
    if event.phase == "began" then
	nextback()
 end
  end

    function help1:touch( event )
    if event.phase == "began" then
	helpmez()
 end
  end    
  function like1:touch( event )
    if event.phase == "began" then
openlink()
 end
  end  
  function alarm1:touch( event )
    if event.phase == "began" then
  alarmoverlay1()
 end
  end
  
  
  function plus1:touch( event )
    if event.phase == "began" then
	if DROPMENUstat==0 then
	fadeinDropmenu()
	 DROPMENUstat=1 
	else
	fadeoutDropmenu()
	 DROPMENUstat=0 
	end
	
	 end
  end
    gear2:addEventListener( "touch", gear2 )
    plus1:addEventListener( "touch", plus1 )
    help1:addEventListener( "touch", help1 )
    like1:addEventListener( "touch", like1 )
    alarm1:addEventListener( "touch", alarm1 )
  
countdisp:toFront()

local feet1 = display.newImage( "pf.png" )
feet1.x  = display.contentWidth/2+70
feet1.y  = display.contentHeight-185
feet1.alpha = .05
feet1:scale( -.07, .07 )
local feet2 = display.newImage( "pf.png" )
feet2.x  = display.contentWidth/2+42
feet2.y  = display.contentHeight-185
feet2.alpha = .05
feet2:scale( .07, .07 )

local b1 = display.newImage( "k1.png" )
b1.x  = display.contentWidth/2                        
b1.y  = display.contentHeight-35-25-10+3
b1:scale( .9, .7 )
local ber2 = display.newImage( "k2.png" )
ber2.x  = display.contentWidth/2                       
ber2.y  = display.contentHeight-35-47-25-10+3
ber2:scale( .9, .8 )
	  whereamI=1 --1-LADY 2-STAT  3- NOTE 4-STOP 5-KICKEARLIER
	  
	  ------------------------------
	local appID2 = "ca-app-pub-5935841090166494/9349994196"  
	  local ads2 = require( "ads" )

local function adListener2( event )
    if ( event.isError ) then
        -- Failed to receive an ad
    else
        ads2.show( "interstitial", { x=0, y=0, "ca-app-pub-5935841090166494/9349994196" } )
    end

end


function showinters()
ads2.init( "admob", "ca-app-pub-5935841090166494/9349994196", adListener2 )
ads2.load( "interstitial", { "ca-app-pub-5935841090166494/9349994196", testMode=true } )
	  end
	  
	--showinters()  
	  
	  
	  
	  
	  
	  
	  
	  -----------------------------
local ads = require("ads")
local t
local appID = "ca-app-pub-5935841090166494/4861817799"
 interstitialAppID = "ca-app-pub-5935841090166494/9349994196"

adtesting=true
ads.load("interstitial", { appId=interstitialAppID, testMode = true })

local function adListener( event )
    if ( event.isError ) then
        -- attempt to fetch another ad
    elseif ( event.phase == "loaded" ) then
        -- an ad was preloaded
    elseif ( event.phase == "shown" ) then
        -- the ad was viewed and closed
	
		
				
ads.init("admob", "ca-app-pub-5935841090166494/4861817799", adListener)
ads.show("banner", {x = 0, y = 40, "ca-app-pub-5935841090166494/4861817799", testMode = false})
		intersnow=0
		
	
    end
end

--background = display.newImage("Images/background.png", 0, 0)

local function showBanner()
ads.init("admob", "ca-app-pub-5935841090166494/4861817799", adListener)
    ads.show("banner", {x = 0, y = 40, "ca-app-pub-5935841090166494/4861817799", testMode = false})

if intersnow==0 then
elseif intersnow==1 then

		if ( ads.isLoaded("interstitial") ) then
    ads.show("interstitial")
	ads.load("interstitial", { appId=interstitialAppID })
	else
	
ads.init("admob", "ca-app-pub-5935841090166494/4861817799", adListener)
ads.show("banner", {x = 0, y = 40, "ca-app-pub-5935841090166494/4861817799", testMode = false})
		intersnow=0
		
	ads.load("interstitial", { appId=interstitialAppID })
	

end


	end
	end
intersnow=0

if ((iap.getInventoryValue("unlock")~=true) or (iap.getInventoryValue("unlock1")~=true) or (iap.getInventoryValue("unlock2")~=true))  then
print(iap.getInventoryValue("unlock"))
wpmaGlobalAdmob.showAdmobBannerAd("bottom")
 wpmaGlobalAdmob.loadAdmobInterstitialAd()
 end
	--showBanner()
	-- timer.performWithDelay(60000, showBanner, -1) 
	
	
	
function startscreen()

 g2 = display.newGroup()
white = display.newRect( 0, 0, 1000, 1500 )
white:setFillColor( .95, .93, .9 ,1)

 -- local log1o1 = display.newImage( "logo2.png" )
-- log1o1.anchorX=0
-- log1o1.anchorY=0
-- log1o1.x  = -40-40+40+9
-- log1o1.y  = 120
-- log1o1.alpha=.5 --.70 and .90
-- log1o1:scale( 20.38, 20.38 )


 local log1o = display.newImage( "logo1.png" )
log1o.anchorX=0
log1o.anchorY=0
log1o.x  = 5+7+25-9
log1o.y  = 200+10
log1o.alpha=1 --.70 and .90
log1o:scale( .55, .55 )

  g2:insert( white ) 
   g2:insert( log1o ) 
-- g2:insert( log1o1 ) 
   
   
  transition.fadeOut( g2, { time=2300, transition=easing.inCirc  } )
   
end


	
	
	
	local listItems1 ={}
	
	
	
	
	
	
-- table


--populateList()






 
listItems1 = {
		{ title = "mob", collapsed = true},
	{ title = "1", collapsed = true},
	{ title = "Lunch", collapsed = true },
	{ title = "Dinner", collapsed = true },
	{ title = "Desert", collapsed = true},
    { title = "Mob", collapsed = true},
}
  
  xx12= invoketable(table1)
  --print(xx12)
    --print(widgetGroup)
 
 --widgetGroup:toBack()
widgetGroup:removeSelf()
--widgetGroup.isVisible=false
 
  
 --   populateList(listItems)
-- list:sync(listItems)
 --  list:reloadData()
   
--widgetGroup:toBack()

 --widgetGroup.isVisible=true



 

  
  xx12= invoketable(table1)







--table end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
function statoverlay()

 caldx=22
 caldy=150-50-35
 stw=0
 cellx=38
 celly=30
 	  whereamI=2 --1-LADY 2-STAT  3- NOTE 4-STOP 5-KICKEARLIER
countdisp.isVisible=false
mmt=1
countdisp.alpha=0
 	local statb = display.newImage( "statb1-(2).jpg" )
statb.anchorX  = 0
statb.anchorY  = 0
statb.x  = 0
statb.y  = 0
statb:scale( 2, 2 )


				local rb13 = display.newRect( _W, _H, _W*2, _H*2 )
 rb13:setFillColor( 0, 0, 0 ,.64)
rb13:toFront()
rb13:addEventListener("touch", function()  return true end)
rb13:addEventListener("tap", function()  return true end)
xpad=2
ypad=1
mm=_H-255+35+160+15
 cancel1s = display.newImage( "back1.png" )

cancel1s.anchorX=.5
cancel1s.anchorY=.5
cancel1s.x  = 70+xpad-5
cancel1s.y  = 20+10+7+ypad-23-2
cancel1s.alpha=.9 --.70 and .90
cancel1s:scale( .46, .46 )
cancel1s.stat=0


local er1 = display.newImage( "er4.png" )
er1.anchorX=.5
er1.anchorY=.5
er1.x  = 70+70+15+70+15+xpad+13
er1.y  = 20+10+7+ypad-23-2
er1.alpha=.9 --.70 and .90
er1:scale( .46, .46 )
er1.stat=0


local hand = display.newImage( "hand.png" )
hand.anchorX=.5
hand.anchorY=.5
hand.x  = _W/2
hand.y  = _H-255+35+120+25-100
hand.alpha=.6 --.70 and .90
hand:scale( .75, .75 )
hand.isVisible=false


 genhead1 = display.newImage( "gen1.png" )
genhead1.anchorX=.5
genhead1.anchorY=.5
genhead1.x  = 70+xpad-5
genhead1.y  = 20+10+7+ypad
genhead1.alpha=.9 --.70 and .90
genhead1:scale( .46, .46 )
genhead1.stat=0

 dailystat1 = display.newImage( "dail1.png" )
dailystat1.anchorX=.5
dailystat1.anchorY=.5
dailystat1.x  = 70+70+15+xpad+4
dailystat1.y  = 20+10+7+ypad
dailystat1.alpha=.9 --.70 and .90
dailystat1:scale( .46, .46 )
dailystat1.stat=0

 Hourlystat1 = display.newImage( "hrly1.png" )
Hourlystat1.anchorX=.5
Hourlystat1.anchorY=.5
Hourlystat1.x  = 70+70+15+xpad+4
Hourlystat1.y  = 20+10+7+ypad-23-2
Hourlystat1.alpha=.9 --.70 and .90
Hourlystat1:scale( .46, .46 )
Hourlystat1.stat=0

 logg1 = display.newImage( "log1.png" )
logg1.anchorX=.5
logg1.anchorY=.5
logg1.x  = 70+70+15+70+15+xpad+13
logg1.y  = 20+10+7+ypad
logg1.alpha=.9 --.70 and .90
logg1:scale( .46, .46 )
logg1.stat=0


genhead2 = display.newImage( "gen2.png" )
genhead2.anchorX=.5
genhead2.anchorY=.5
genhead2.x  = 70+xpad-5
genhead2.y  = 20+10+7+ypad
genhead2.alpha=.9 --.70 and .90
genhead2:scale( .46, .46 )
genhead2.stat=0

 dailystat2 = display.newImage( "dail2.png" )
dailystat2.anchorX=.5
dailystat2.anchorY=.5
dailystat2.x  = 70+70+15+xpad+4
dailystat2.y  = 20+10+7+ypad
dailystat2.alpha=.9 --.70 and .90
dailystat2:scale( .46, .46 )
dailystat2.stat=0

 Hourlystat2 = display.newImage( "hrly2.png" )
Hourlystat2.anchorX=.5
Hourlystat2.anchorY=.5
Hourlystat2.x  = 70+70+15+xpad+4
Hourlystat2.y  = 20+10+7+ypad-23-2
Hourlystat2.alpha=.9 --.70 and .90
Hourlystat2:scale( .46, .46 )
Hourlystat2.stat=0

 logg2 = display.newImage( "log2.png" )
logg2.anchorX=.5
logg2.anchorY=.5
logg2.x  = 70+70+15+70+15+xpad+13
logg2.y  = 20+10+7+ypad
logg2.alpha=.9 --.70 and .90
logg2:scale( .46, .46 )
logg2.stat=0


caut1 = display.newText( "  Note: Loading and analysis of data may take few seconds.\nScreen updating/refreshing is paused for faster data processing.", 165, 44*3+185-65+95+75,native.systemFont, 9 )
caut1:setFillColor( .8, .8, .8 )

intersnow=1
--showBanner()
if ((iap.getInventoryValue("unlock")~=true) or (iap.getInventoryValue("unlock1")~=true) or (iap.getInventoryValue("unlock2")~=true))  then
print(iap.getInventoryValue("unlock"))
 wpmaGlobalAdmob.showAdmobInterstitialAd() 
wpmaGlobalAdmob.loadAdmobInterstitialAd() 
end
--timer.performWithDelay(60000, showBanner, -1) 
function offall()
genhead2.isVisible=false
dailystat2.isVisible=false
Hourlystat2.isVisible=false
logg2.isVisible=false
genhead1.isVisible=true
dailystat1.isVisible=true
Hourlystat1.isVisible=true
logg1.isVisible=true

end

function offall2()
genhead2.isVisible=false
dailystat2.isVisible=false
Hourlystat2.isVisible=false
logg2.isVisible=false
genhead1.isVisible=false
dailystat1.isVisible=false
Hourlystat1.isVisible=false
logg1.isVisible=false

end
--[[
function onbutton(obj)
obj[1].isVisible=false
obj[2].isVisible=true
end
]]--
offall()
for i=1,7 do
if statis[1][i]==nil then
else
dailytable[i][2]=statis[1][i]
end
end
for i=1,24 do

if statis[2][i]==nil then
else
hourlytable[i][2]=statis[2][i]
end
end
--print("11daily[[[[[[[[[[[[[]]]]]]]]]]]]]")
print_r(dailytable)
print_r(hourlytable)


genhead2.isVisible=true
genhead1.isVisible=false
local currentStatActive=1

floaganalyz=1
function tabbb1(taby)
--print("in  taby")
removecal1()
if taby==1 then

if widgetGroup2==nil then
else
widgetGroup2:removeSelf()
end
if widgetGroup3==nil then
else
widgetGroup3:removeSelf()
--print("yoy")
end

if widgetGroup1==nil then
else
widgetGroup1:removeSelf()
end
if datatrackall[1].longestsessiondurationstartstamp==nil then
for i=1,2 do
tab12[i]={}
tab12[i].collapsed=true
end 
tab12[1].title= "Analysis engine requires more time to identify patterns"
tab12[2].title= "Try completing few more sessions"
floaganalyz=0
else
for i=1,6 do
tab12[i]={}
tab12[i].collapsed=true
end 
floaganalyz=1
tab12[1].title= "Total Kicks recorded till date: "..datatrackall[1].totalkicks+kickv.." kicks"
tab12[2].title= "Total number of sessions: "..datatrackall[1].totalsessions
tab12[3].title= "Longest session date: "..datatrackall[1].longestsessiondurationstartstamp
tab12[4].title= "Longest session duration: "..datatrackall[1].longestsessiondurationinMN.." min"

dd1= getdayname(maxindex(statis[1]))
hr1=gethrrange(maxindex(statis[2]))
--print ("max_______________________________:".. hr1)
tab12[5].title= "Most active day: "..dd1
tab12[6].title= "Most active hour: "..hr1
end
--print("stat")
print_r(statis)
	hand.isVisible=false
invoketable1(tab12)

--print("tab")
print_r(tab12)


elseif taby==2 then
if widgetGroup1==nil then
else
widgetGroup1:removeSelf()
end
if widgetGroup3==nil then
else
widgetGroup3:removeSelf()
end
if widgetGroup2==nil then
else
widgetGroup2:removeSelf()
end
tab121={}
m=1
tab121[1]={}
tab121[1].collapsed=true
tab121[1].title= "Overall kicks by hours - till date"

for i=1,24 do
if hourlytable[i][2]==0 then
else
m=m+1
tab121[m]={}
tab121[m].collapsed=true
tab121[m].title= hourlytable[i][1]..":           "..hourlytable[i][2]
end
end 
print_r(tab121)



invoketable2(tab121)
print_r(tab121)


elseif taby==3 then
if widgetGroup1==nil then
else
widgetGroup1:removeSelf()
end
if widgetGroup2==nil then
else
widgetGroup2:removeSelf()
end
if widgetGroup3==nil then
else
widgetGroup3:removeSelf()
end
tab1211={}

m=1
tab1211[m]={}
tab1211[m].collapsed=true
tab1211[m].title= "Overall kicks by day - till date"
for i=1,7 do
if dailytable[i][2]==0 then
else
m=m+1
tab1211[m]={}
tab1211[m].collapsed=true
tab1211[m].title= dailytable[i][1]..":           "..dailytable[i][2]
end
end 
print_r(tab1211)

invoketable3(tab1211)
print_r(tab1211)
caldataint()
kicklog=caldataint2(kicklog)



elseif taby==4 then
if widgetGroup2== nil then
else
widgetGroup2:removeSelf()
end
--print("yoy")

if widgetGroup1==nil then
else
widgetGroup1:removeSelf()
--print("yoy")
end

if widgetGroup3==nil then
else
widgetGroup3:removeSelf()
--print("yoy")
end

--invoketable4(listItems)



     function get_days_in_month(month, year)
         days_in_month = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 }   
         d = days_in_month[month]
        
        --Check for leap year
        if (month == 2) then
            if year%4==0 and (year%100~=0 or year%400==0) then
                d = 29
            end
        end
        
        return d  
    end
	
	 local get_day_of_week =
    {
        "sun", "mon", "tue", "wed", "thu", "fri", "sat"
    }
    
    --Get the first day of the month
     function get_start_day( cur_month, cur_year )
         temp = os.time{year = cur_year, month=cur_month, day=1}
        return tonumber(os.date("%w", temp))
    end
	
	function haltit()
g3 = display.newGroup()
halt1= display.newRect( 0+caldx , 50+caldy, cellx*7+5, celly*3 )
halt1.alpha=.95
halt1.anchorX=0
halt1.anchorY=0
halt1:setFillColor( .2, .2, .2 ,.95)
halt1:setStrokeColor( .8, .8 ,.8 )
halt1.strokeWidth = .51

halt1text = display.newText( "No records found for this month.", 50+100+caldx, 44*3+30+caldy-65,native.systemFont, 15 )
halt1text:setFillColor( .8, .8, .8 )

 g3:insert( halt1 ) 
  g3:insert( halt1text )
  
   transition.fadeOut( g3, { time=1500, transition=easing.inCirc  } )
end

 --[[
 calstartday=get_start_day( month, year )
 calenddate=get_days_in_month(month, year)
 ]]--
 --calstartday=7
 --calenddate=28
 ----print(calenddate)
 
local monthc
local yearc

 function popcal(monthc, yearc)
 
 
 if monthc== nil then
local date = os.date( "*t" )    -- returns table of date & time values
--print( date.year, date.month )
monthc=date.month
yearc=date.year
dayc=date.day
print_r(date)
 end
 

 
 

 
 
 calstartday=get_start_day( monthc, yearc )+1
 calenddate=get_days_in_month(monthc, yearc)
 removecal()
  g1 = display.newGroup()
  
  base = display.newRect( 1+caldx+4 , 1+24+caldy, cellx*7, celly*6 )
base.alpha=.75
base.anchorX=0
base.anchorY=0
monTT=    {
      "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"
    }
  monhead = display.newRect(3+((1-1)*45)+caldx+1+1, -4+5+1+-3+24-16-50+34+caldy, cellx*7, 8+4+3+celly/3 )
  
monhead.alpha=.75
monhead.anchorX=0
monhead.anchorY=0
monhead:setFillColor( .0, .0, .0 ,.8)
monhead:setStrokeColor( .8, .8 ,.8 )
monhead.strokeWidth = stw

monheadtext = display.newText( monTT[monthc]..", "..yearc, -5+68+3-44-8 + (45*(4-1))-3+caldx, 46-10+(44*(-1)+7)+caldy+5-3,native.systemFont, 10 )
monheadtext:setFillColor( 1, .5, .4 )
monheadtext.anchorX=.5
monheadtext.anchorY=.5

 g1:insert(monhead ) 
  g1:insert(monheadtext ) 

 g1:insert( base ) 
 
  local barro1 = display.newImage( "barrow.png" )
barro1.anchorX=0
barro1.anchorY=0
barro1.x  = 5+7-5+caldx
barro1.y  = 200+10-220+1-2+caldy+5-5
barro1.alpha=1 --.70 and .90
barro1:scale( .32, .32 )

 local barro2 = display.newImage( "barrow4.png" )
barro2.anchorX=0
barro2.anchorY=0
barro2.x  = 5+7-5+250+42+caldx-45-2-5
barro2.y  = 200+10-220+1-2+caldy+5-3-2
barro2.alpha=1 --.70 and .90
barro2:scale( .32, .32 )

 local refcal = display.newImage( "refcal2.png" )
refcal.anchorX=0
refcal.anchorY=0
refcal.x  = 5+7+258+5+caldx+5-45+5+3
refcal.y  = 200+10+35+2+caldy-75+3
refcal:scale( .23, .23 )
refcal.isVisible=true
refcal.alpha=.6




--barro2.xScale = -1

  g1:insert(barro2 ) 
  g1:insert(barro1 ) 
  
  flagl=0
  
   if kicklog==nil then

else

--print("2111111111111111111111111111111b")
for i=1,#kicklog do
if yearc==kicklog[i].year then
if monthc==kicklog[i].month then
 flagl=1
 else
 
 end
 else
   --flagl=1
 end
 end
 end
 if  flagl==0 then
 haltit()
 end
  
  dday=    {
        "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"
    }
	HEA1text={}
	head={}
 for i=1,7 do
  head[i] = display.newRect( 1+1+3+((i-1)*cellx)+caldx , 5+24-16+caldy, cellx, celly/3 )
head[i].alpha=.75
head[i].anchorX=0
head[i].anchorY=0
head[i]:setFillColor( .0, .0, .0 ,.8)
head[i]:setStrokeColor( .8, .8 ,.8 )
head[i].strokeWidth = stw

HEA1text[i] = display.newText( dday[i], 3+((i-1)*cellx)+20+caldx , 2+24-8+caldy,native.systemFont, 9 )
HEA1text[i]:setFillColor( 1, 1, 1 )
 g1:insert( head[i] ) 
  g1:insert( HEA1text[i] ) 
 end
 
 
 
 
 

 local email = display.newImage( "email.png" )
email.anchorX=.5
email.anchorY=.5
email.x  = _W/2+70+5+5+5
email.y  = 260-10+5
email.alpha=.9 --.70 and .90
email:scale( .6, .6 )


 ii=1
jj=1
rrb={}
k=1
m=0
box1text={}
k1text={}


for ii= 1,6 do
rrb[ii]={}
for jj= 1,7 do
rrb[ii][jj]={}

rrb[ii][jj] = display.newRect( 68+3-44-3 + (cellx*(jj-1))+caldx, -6+46+(celly*(ii-1))+caldy, cellx, celly )
 rrb[ii][jj]:setFillColor( .5, .5, .5 ,.1)
 rrb[ii][jj]:setStrokeColor( .8, .8 ,.8 )
rrb[ii][jj].strokeWidth = stw
 
 
 g1:insert( rrb[ii][jj] ) 
 if k < calstartday then
 box1text[k] = display.newText( "", 68+3-44-8 + (cellx*(jj-1))+caldx, 46-10+(celly*(ii-1))+caldy,native.systemFont, 12 )
box1text[k]:setFillColor( 0, 0, 1 )
 rrb[ii][jj]:setFillColor( .5, .5, .5 ,.65)
 g1:insert( rrb[ii][jj] ) 
 g1:insert( box1text[k] ) 
 elseif k>calenddate+calstartday-1 then  
box1text[k] = display.newText( "", 68+3-44-8 + (cellx*(jj-1))+caldx, 46-10+(celly*(ii-1))+caldy,native.systemFont, 12 )
box1text[k]:setFillColor( 0, 0, 1 )
 rrb[ii][jj]:setFillColor( .5, .5, .5 ,.65)

 g1:insert( box1text[k] ) 
else
m=m+1
 box1text[k] = display.newText( m, 8+68+3-44-8-3 + (cellx*(jj-1))+caldx, -2+46-10+(celly*(ii-1))+caldy,native.systemFont, 11 )
box1text[k]:setFillColor( 0, 0, 1 )
g1:insert( box1text[k] ) 


if kicklog==nil then
else
--print("1111111111111111111111111111111b")
for iz=1,#kicklog do
if yearc==kicklog[iz].year then
if monthc==kicklog[iz].month then

if kicklog[iz].daya==m  then
box1text[calstartday-1  +   m]:setFillColor( 1, 0, 1 )



 k1text[k] = display.newText( kicklog[iz].kic.." Kicks".."\n in "..math.round(kicklog[iz].dur/60).."+ Hrs", 68+3-44-8-10-4+5 + (cellx*(jj-1))+caldx-3, -9+46-10+(celly*(ii-1))+20-3+5+caldy-2,native.systemFont, 8)
k1text[k]:setFillColor( .46, 0, 1 )
k1text[k].anchorX=0
k1text[k].anchory=0
g1:insert( k1text[k] ) 



--logic


end
end
end
end

end



end
k=k+1

end
end
--print("**********&&&&&&&&&&&&&&&&&&&&&&&&&")
print_r(kicklog)
--print(monthc)

local date1 = os.date( "*t" )    -- returns table of date & time values
print_r(date1)
if date1.year==yearc then
--print("1y")
if date1.month==monthc then
--print("2m")

--print("3d")
box1text[calstartday-1  +   date1.day]:setFillColor( 1, .2, 0 )
refcal.isVisible=false
end
end
 








local widget1a = require( "widget" )
local myList
local myData = {}
alpha11=.2
tmpcaltab={}
function rechangetable(tmpcaltab)

myData = {}
myData=tmpcaltab


if myList==nil or 0 then

else
myList.isVisible=false
myList:removeSelf()
myList=nil
end

local function onRowTouch(event) 
    --print(event.phase)
    if event.phase == 'tap' or event.phase == 'release' then
        --native.showAlert("Row " .. event.target.index, "Selected")
		
    end
end
local function onRowRender( event )

   --Set up the localized variables to be passed via the event table

    row = event.row
   local id = row.index
   local params = event.row.params

   row.bg = display.newRect( 0, 0, display.contentWidth, 60 )
   row.bg.anchorX = 0
   row.bg.anchorY = 0
   row.bg.alpha=0 --alpha
   
   row.bg:setFillColor( 255, 255, 255,1/255 ) --color
   row:insert( row.bg )

   if ( event.row.params ) then    
      row.nameText = display.newText( params.name, 12, 0, native.systemFontBold, 13 )
      row.nameText.anchorX = 0
      row.nameText.anchorY = 0.5
      row.nameText:setFillColor( 1 )
      row.nameText.y = 20
      row.nameText.x = 42+10

      row.phoneText = display.newText( params.phone, 12, 0, native.systemFont, 12 )
      row.phoneText.anchorX = 0
      row.phoneText.anchorY = 0.5
      row.phoneText:setFillColor( .97 )
      row.phoneText.y = 40
      row.phoneText.x = 42+10

      row.rightArrow = display.newImageRect( "Ico.png", 30 , 30, 40 )
      row.rightArrow.x = display.contentWidth - 20-10-260+5
      row.rightArrow.y = row.height / 2
 row.rightArrow.alpha=.6
	  
	  
      row:insert( row.nameText )
      row:insert( row.phoneText )
      row:insert( row.rightArrow )
   end
   return true
end

local function reloadData()
    -- you provide this function
    -- fetch your updated ata
    -- flush the table with:
    myList:deleteAllRows()
    -- reinsert your data
	for i = 1, #myData do
   myList:insertRow{
      rowHeight = 60,
      isCategory = false,
rowColor = { default={ 1, 0, 1, alpha11}, over={ 1, 0.5, 0, 1 } },
      lineColor = { 0.90, 0.90, 0.90 },
      params = {
         name = myData[i].name,
         phone = myData[i].phone
      }
   }
end
end

local springStart = 0
local needToReload = false

local function scrollListener( event )
   if ( event.phase == "began" ) then
      springStart = event.target.parent.parent:getContentPosition()
      needToReload = false
   elseif ( event.phase == "moved" ) then
      if ( event.target.parent.parent:getContentPosition() > springStart + 60 ) then
         needToReload = true
      end
   elseif ( event.limitReached == true and event.phase == nil and event.direction == "down" and needToReload == true ) then
      ----print( "Reloading Table!" )
      needToReload = false
     -- reloadTable()
	     elseif ( event.limitReached == true and event.phase == nil and event.direction == "up" and needToReload == true or false ) then
      ----print( "Reloading Table!" )
      needToReload = false
     -- reloadTable()
	  
	  
   end

   return true
end
function gg()
--print("hi")
end
local navBarHeight = 220+52
local tabBarHeight = 72



myList = widget1a.newTableView
{
   top = navBarHeight, 
   width = display.contentWidth, 
   
   height = display.contentHeight - navBarHeight - tabBarHeight,
   onRowRender = onRowRender,
   hideBackground=false,
   backgroundColor = { 0.4, 0.4, 0.4 },
   onRowTouch = onRowTouch,
   listener = scrollListener,
   
}
for i = 1, #myData do
   myList:insertRow{
      rowHeight = 60,
	  
      isCategory = false,
rowColor = { default={ .7, .7, .7, alpha11}, over={ .7, .7, .7, alpha11} },
      lineColor = { 0.90, 0.90, 0.90,.7 },
      params = {
         name = myData[i].name,
         phone = myData[i].phone
      }
   }
end
  g1:insert(myList )
end

monTT2=    {
      "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"
    }



--[[
tempk1[p].year=kicklogtable[zii].year
tempk1[p].month=kicklogtable[zii].month
tempk1[p].daya=kicklogtable[zii].daya
tempk1[p].kic=kicklogtable[zii].kic
tempk1[p].dur=kicklogtable[zii].dur
tempk1[p].tim1=kicklogtable[zii].tim1
tempk1[p].sescount = 1

tempk1[p].name=kicklogtable[zii].daya.." "..monTT2[kicklogtable[zii].month].." - Session "..tempk1[p].sescount
tempk1[p].phone=tempk1[p].tim1.." - "..tempk1[p].kic.." kicks - "..tempk1[p].dur.." Mins"
]]--


--rechangetable(myData1)

	kicklogtable=refreshcaltable()
rechangetable(kicklogtable)


 function backcal()
monthc=monthc-1
      g1.isVisible=false
	  
if monthc<1 then
monthc=12
yearc=yearc-1

end
popcal(monthc,yearc)
		kicklogtable=refreshcaltable(monthc..yearc)
rechangetable(kicklogtable)

g1.isVisible=true
end

function fwcal()
monthc=monthc+1
if monthc>12 then
monthc=1
yearc=yearc+1

end
popcal(monthc,yearc)
		kicklogtable=refreshcaltable(monthc..yearc)
rechangetable(kicklogtable)
end

  function barro1:touch( event )
    if event.phase == "began" then
	backcal()
	--print(monthc..yearc)

  end
  end
    function barro2:touch( event )
    if event.phase == "began" then
	
	fwcal()
		
  end
  end
  function email:touch( event )
    if event.phase == "began" then
	--print("here email")
	--fwcal()
	ps=#tempk1

	emailtext="Pregnancy Kickcounter - My Baby's Kick Counter\nSession History\n\n"
		for zs=1,#tempk1 do
	
		emailtext=emailtext.."\n"..tempk1[ps].name.."\n"..tempk1[ps].phone.."\n"
		ps=ps-1
		end
		
		emailtext=emailtext.."\n\nPregnancy Kickcounter - My Baby's Kick Counter\nhttps://play.google.com/store/apps/details?id=com.gmail.rockingdna.staff.PregnancyKickcounter"
		print_r(emailtext)
		
		
		local options =
{
   to = "",
   subject = "Pregnancy Kickcounter-My Baby's Kick Counter - Session History",
   body = emailtext,
}
native.showPopup( "mail", options )
		
		
		
		--print_r(tempk1)
  end
  end
  
  
  
  function refcal:touch( event )
    if event.phase == "began" then
	
popcal()
		kicklogtable=refreshcaltable()
rechangetable(kicklogtable)
refcal.isVisible=false
	myList.isVisible=false
  end
  end
g1:insert(myList )
g1:insert(refcal )
 g1:insert( email ) 
  barro1:addEventListener( "touch", barro1 )
  barro2:addEventListener( "touch", barro2 )
   refcal:addEventListener( "touch", refcal )
   email:addEventListener( "touch", email )






 
end


function removecal()
if g1==nil then
else
g1:removeSelf()
g1 = nil
end
end

caldataint()
kicklog=caldataint2(kicklog)

popcal()






end
end


function logg1:touch( event )

if event.phase=="began" then
messenger2("LOADING.....")
 
end
if event.phase=="ended" then
  --print("Button Pressed!")
   	offall()
	logg1.isVisible=false
logg2.isVisible=true
currentStatActive=4
tabbb1(currentStatActive)
  --print("Button Press Ended!")
  tabbb1(currentStatActive)
end

end



function Hourlystat1:touch( event )

if event.phase=="began" then
   --print("Button Pressed!")
   	offall()
	Hourlystat1.isVisible=false
Hourlystat2.isVisible=true
currentStatActive=2
tabbb1(currentStatActive)
  --print("Button Press Ended!")
end
if event.phase=="ended" then

end

end

function dailystat1:touch( event )

if event.phase=="began" then
   --print("Button Pressed!")
   	offall()
	dailystat1.isVisible=false
dailystat2.isVisible=true
currentStatActive=3
tabbb1(currentStatActive)
  --print("Button Press Ended!")
end
if event.phase=="ended" then

end

end
function genhead1:touch( event )

if event.phase=="began" then
   --print("Button Pressed!")
   	offall()
	genhead1.isVisible=false
genhead2.isVisible=true
currentStatActive=1
tabbb1(currentStatActive)
  --print("Button Press Ended!")
end
if event.phase=="ended" then

end

end

genhead1:addEventListener( "touch", genhead1 )
dailystat1:addEventListener( "touch", dailystat1 )
Hourlystat1:addEventListener( "touch", Hourlystat1 )
logg1:addEventListener( "touch", logg1 )
	--[[
	function dailystat[1]:touch( event )
    if event.phase == "began" then
	offall()
	onbutton(dailystat)
	
	end
	
	end
	function Hourlystat[1]:touch( event )
    if event.phase == "began" then
	offall()
	onbutton(Hourlystat)
	
	end
	
	end
	function logg[1]:touch( event )
    if event.phase == "began" then
	offall()
	onbutton(logg)
	
	end
	
	end



]]--


local flower = display.newImage( "flower.png" )
flower.anchorX=.5
flower.anchorY=.5
flower.x  = _W/2
flower.y  = mm-80
flower.alpha=.5 --.70 and .90
flower:scale( .38, .38 )
flower.isVisible=false
local function spinImage (event)
  transition.to( flower, { rotation = flower.rotation-360, time=24000, onComplete=spinImage } )
end
spinImage()



tab12={}

function closeflower()


  transition.fadeOut( hand, { time=750, transition=easing.inCirc  } )
end

function flower:touch( event )
    if event.phase == "began" then
	hand.alpha=.6
	hand.isVisible=not hand.isVisible
	
		
transition.to( hand, { time=800, delay=300, onComplete=closeflower } )

end
end


tabbb1(1)

function erasehis()
  
	cancel1s.isVisible=false
	statb.isVisible=false
er1.isVisible=false
rb13.isVisible=false
	caut1.isVisible=false

flower.isVisible=false
hand.isVisible=false







offall2()

--widgetGroup1:removeSelf()

  table1={{title = "Press Record Kick", collapsed = true}}
if widgetGroup1==nil then
else
widgetGroup1:removeSelf()
end

if widgetGroup2==nil  then
else
widgetGroup2:removeSelf()
end
if widgetGroup3==nil then
else
widgetGroup3:removeSelf()
--print("yoy")
end 

mmt=0
if(tx==0 or tx==nil)then else timeKeep:pause()  upclockon =0 timer.cancel(tx) tx=0 end 
 timstop=1

timeKeep:pause()
 upclockon =0
ky= timeKeep:getElapsedSeconds()
--print(ky)
timeKeep:addTime(-ky)
	
	 --print("z2")
	datatrack={}
	kickv=0
 datatrack[1] = {}
 sessstart=0
	 updateTimer()
	sessstart=0
  table1={{title = "Press Record Kick", collapsed = true}}
 widgetGroup:removeSelf()
invoketable(table1)  

				countdisp.isVisible=true
				countdisp.alpha=.95
								play1.isVisible=true
	pause1.isVisible=false











kickv=0
	
timeKeep:pause() 
 upclockon =0
ky= timeKeep:getElapsedSeconds()

timeKeep:addTime(-ky)


 
 
 
 
	
	


zx1 =  os.date('*t');
	
kk1=os.date("%Y-%m-%d %H:%M:%S", os.time(zx1))
--print(kk1)
----print(xy)


	datatrackall={}
	datatrack={}
	
 datatrack[1] = {}

 
 globanote = "Save session notes here or press the second note button on top to save reminders"
 globanote2 = "Save reminders here or press the first note button to save session related notes"
 hh=0
 mm=0
 ss = 0 
 mmt = 0
 table1={}
 table1={{title = "Press Record Kick ", collapsed = true}}
 datatrack = {}
 datatrack[1] = {}
 datatrackall={}
  datatrackall[1]={}
 datatrackall[1].totalsessions=0
datatrackall[1].totalkicks=0
datatrackall[1].totaltodaysessions=0
datatrackall[1].totaltodaysessdate=0
datatrackall[1].longestsessiondurationstamp=nil
datatrackall[1].longestsessiondurationinMN=0
datatrackall[1].postit = globanote2

statis={}
statis[1]={}
statis[2]={}
for iq=1,7 do
statis[1][iq]={}
statis[1][iq]=0
end
for iq=1,24 do
statis[2][iq]={}
statis[2][iq]=0
end
removecal1()
 upclockon =0
 
sessstart=1

loadsave.saveTable(datatrackall, "myTable.json", system.DocumentsDirectory)
loadsave.saveTable(statis, "stat.json", system.DocumentsDirectory)
				
 updateTimer()
mmt=0
if(tx==0 or tx==nil)then else timeKeep:pause()  upclockon =0 timer.cancel(tx) tx=0 end 


timeKeep:pause()
 upclockon =0
ky= timeKeep:getElapsedSeconds()
--print(ky)
timeKeep:addTime(-ky)
	
	 --print("z2")
	datatrack={}
	kickv=0
 datatrack[1] = {}
 sessstart=0
	 updateTimer()
	 sessstart=0
mmt=0
end

function overlayclearhis()
	local rb1x = display.newRect( _W, _H, _W*2, _H*2 )
 rb1x:setFillColor( 0, 0, 0 ,.65)
rb1x:toFront()
rb1x:addEventListener("touch", function()  return true end)
rb1x:addEventListener("tap", function()  return true end)
local box1x = display.newImage( settings[1].locabar )
box1x.anchorX=0
box1x.anchorY=0
box1x.x  = 0
box1x.y  = 80+65-100+100
box1x.alpha=.9 --.70 and .90
box1x:scale( .25, 1 )
local box1textx = display.newText( "     Are you sure you want to \n clear the entire kick log history?", _W/2, 80+65-100+40+100, native.systemFont, 18 )
box1textx.alpha = .85

local cancel1x = display.newImage( "cancel.png" )
cancel1x.anchorX=0
cancel1x.anchorY=0
cancel1x.x  = _W/2+50
cancel1x.y  = _H-255+125-200+100
cancel1x.alpha=1 --.70 and .90
cancel1x:scale( .20, .18 )


local ok1x = display.newImage( "okx.png" )
ok1x.anchorX=0
ok1x.anchorY=0
ok1x.x  = _W/2-75
ok1x.y  = _H-250+125-200+100
ok1x.alpha=.93 --.70 and .90
ok1x:scale( .52, .52)


local warn1 = display.newImage( "warn.png" )
warn1.anchorX=0.5
warn1.anchorY=0.5
warn1.x  = _W/2
warn1.y  = _H/2-100-40
warn1.alpha=1 --.70 and .90
warn1:scale( .8, .8 )

function ok1x:touch( event )
    if event.phase == "began" then
	--print("cccccc1")
		ok1x:removeSelf()
		warn1:removeSelf()
	cancel1x:removeSelf()
	box1textx:removeSelf()
	box1x:removeSelf()
	rb1x:removeSelf()
	erasehis()
	end
	end

function cancel1x:touch( event )
    if event.phase == "began" then
	--print("cccc1cc1")
	ok1x:removeSelf()
	cancel1x:removeSelf()
	box1textx:removeSelf()
	box1x:removeSelf()
		warn1:removeSelf()
	rb1x:removeSelf()
	end
	end
cancel1x:addEventListener( "touch", cancel1x )
ok1x:addEventListener( "touch", ok1x )

end

function er1:touch( event )
    if event.phase == "began" then
	overlayclearhis()
end
end



function cancel1s:touch( event )
	 
    if event.phase == "began" then
	 function canclll()
	 whereamI=1 --1-LADY 2-STAT  3- NOTE 4-STOP 5-KICKEARLIER
	 
	if widgetGroup1==nil  then
else
widgetGroup1:removeSelf()
end

	if widgetGroup2==nil  then
else
widgetGroup2:removeSelf()
end

if widgetGroup3==nil then
else
widgetGroup3:removeSelf()
--print("yoy")
end
removecal1()

	cancel1s.isVisible=false
	caut1.isVisible=false
	statb.isVisible=false
er1.isVisible=false
rb13.isVisible=false
flower.isVisible=false
hand.isVisible=false
offall2()


mmt=0
end
canclll()
end
end
cancel1s:addEventListener( "touch", cancel1s )
er1:addEventListener( "touch", er1 )

flower:addEventListener( "touch", flower )
--[[local box1 = display.newImage( "bar1.jpg" )
box1.anchorX=0
box1.anchorY=0
box1.x  = 0
box1.y  = 80+65
box1.alpha=.9 --.70 and .90
box1:scale( .25, 1 )
]]--
 return true
 end

 
	
	
	
	
	
	
	
function blinkfeet1()
    if(feet1.alpha < .4) then
        transition.to( feet1, {time=490, alpha=.4})
	
    else 
        transition.to( feet1, {time=490, alpha=0.05})
	
		--transition.to( feet2, {time=490, alpha=.05})
		
		
    end
	
end

function blinkfeet2()
    if(feet1.alpha < .4) then
        transition.to( feet2, {time=590, alpha=.4})
	
    else 
        transition.to( feet2, {time=590, alpha=0.05})
	
		--transition.to( feet2, {time=490, alpha=.05})
		
		
    end
	
end
function endfeet()
feet1.alpha = .05
feet2.alpha = .05
end
function play1:touch( event )
    if event.phase == "began" then
	play1.isVisible=false
	pause1.isVisible=true

        --print( "You touched the play1!" )
		 timeKeep:resume()
		 upclockon =1
		 --print(tx)
		 if(tx==0 or tx==nil)then 
				 		tx=  timer.performWithDelay(1000, updateTimer, 0)
					
						--print("here")
				end
				initsession[1].table1=table1
	initsession[1].statis=statis
	initsession[1].kickv=kickv
	initsession[1].datatrack=datatrack
	initsession[1].datatrackall=datatrackall
--	initsession[1].tempstamp=tempstamp
	loadsave.saveTable(initsession, "initsession.json", system.DocumentsDirectory)
	
        return true
    end
end


  
function resumethisshit()
--print("i am here inside")
print_r(initsession)
if initsession[1].currentsession> 0 and controllzforresume==1 then
--print("i am here inside cond")
play1.isVisible=false
	pause1.isVisible=true
	
  whereamI=1 



	
table1=	initsession[1].table1
statis=	initsession[1].statis
	kickv=initsession[1].kickv
datatrack=	initsession[1].datatrack
datatrackall=	initsession[1].datatrackall
--tempstamp=initsession[1].tempstamp
	table2=reverseTable(table1)	
widgetGroup:removeSelf()
invoketable(table2)


        --print( "You touched the play1!" )
	--	 timeKeep:resume()
		 upclockon =1
		 --print(tx)
		 if(tx==0 or tx==nil)then 
				 		tx=  timer.performWithDelay(1000, updateTimer, 0)
						--print("here")
				end
				
				if initsession[1].currentsession >0 then
         
		 resumeTime = os.time()  
		  
		 deltaTimesec=  math.round((resumeTime - initsession[1].sessstarttime)) --session start time
						resumeTime = 0
						
						timeKeep:pause()
						
timeKeep:addTime(deltaTimesec)
timeKeep:resume()
updateTimer()
		
		end
				suspendTime = 0 
				updateduetag2()
				
				
    
    end

end

function feet1:touch( event )
    if event.phase == "began" then
	
	timer.performWithDelay(500, blinkfeet1, 5)

	 elseif event.phase == "ended" then
-- overlaysize()
        return true
    end
end

function feet2:touch( event )
    if event.phase == "began" then

timer.performWithDelay(600, blinkfeet2, 5)

	 elseif event.phase == "ended" then

        return true
    end
end

function addnote1:touch( event )
    if event.phase == "began" then
	addnote1.alpha=1
	 elseif event.phase == "ended" then
	 addnote1.alpha=.65
        --print( "You touched the addnote!" )
	note1()
        return true
    end
end

function analytic1:touch( event )
    if event.phase == "began" then
	analytic1.alpha=1
	messenger2("LOADING.....")
	 elseif event.phase == "ended" then
	 analytic1.alpha=.70
        --print( "You touched the analytic1!" )
		statoverlay()
	print_r(datatrack)
    end
end


function shop:touch( event )
    if event.phase == "began" then
	shop.alpha=.2
	messenger2("LOADING.....")
	 elseif event.phase == "ended" then
	 shop.alpha=1
        --print( "You touched the analytic1!" )
	--	statoverlay()
	--print_r(datatrack)
	callad()
    end
end

function stop1:touch( event )
    if event.phase == "began" then
if pause1.isVisible==true then
if kickv ==0 then
  	  whereamI=1 --1-LADY 2-STAT  3- NOTE 4-STOP 5-KICKEARLIER
mmt=0
if(tx==0 or tx==nil)then else timeKeep:pause()  upclockon =0 timer.cancel(tx) tx=0 end 
 timstop=1

timeKeep:pause()
 upclockon =0
ky= timeKeep:getElapsedSeconds()
--print(ky)
timeKeep:addTime(-ky)
	
	 --print("z2")
	datatrack={}
	kickv=0
 datatrack[1] = {}
 sessstart=0
	 updateTimer()
	sessstart=0
  table1={{title = "Press Record Kick", collapsed = true}}
 widgetGroup:removeSelf()
invoketable(table1)  

				countdisp.isVisible=true
				countdisp.alpha=.95
								play1.isVisible=true
	pause1.isVisible=false

else
        --print( "You touched the stop1!" )
timstop=0
		closeoverlay1()
		if timstop==1 then
				play1.isVisible=true
	pause1.isVisible=false
		end
        --return true
		
		end
		else 
		haltit2()
		end
    end
end

function b1:touch( event )
    if event.phase == "began" then
		play1.isVisible=false
	pause1.isVisible=true
       if(tx==0 or tx==nil)then 
	   timeKeep:resume()
	   upclockon =1
				 		tx=  timer.performWithDelay(1000, updateTimer, 0)
							
						--print("here1")
				end
		kickv =kickv+1
		 --print( "You touched the b1!" ..kickv)
		 
		--xy = os.date( "%c" )
				zx =  os.date('*t');
	
kk=os.date("%Y-%m-%d %H:%M:%S", os.time(zx))
--print(kk)
----print(xy)
--[[
datatrack[kickv+1]={}
datatrack[kickv+1].count1 = kickv
datatrack[kickv+1].time1 = kk
--datatrack[kickv+1][2] = zx

datatrack[kickv+1].hour1 = zx.hour
datatrack[kickv+1].wday1 = zx.wday
datatrack[kickv+1].day1 = zx.day
datatrack[kickv+1].min1 = zx.min
datatrack[kickv+1].month1 = zx.month
datatrack[kickv+1].year1 = zx.year
]]--
table1[kickv]={}

if checkam(zx.hour)== " PM" then
stphr111=zx.hour-12

if stphr111<10 then
stphr111="0"..stphr111
end
if zx.hour==12  then stphr111=12 end


else
stphr111=zx.hour
if stphr111<10 then
stphr111="0"..stphr111
end
end

tomp1min=zx.min
if tomp1min<10 then
tomp1min="0"..tomp1min
end
tomp1=stphr111..":"..tomp1min..checkam(zx.hour)



table1[kickv].title="Kick "..kickv.." - "..tomp1
table1[kickv].collapsed = true


for iq=1,7 do
if zx.wday==iq then
statis[1][iq]=statis[1][iq]+1
end
end

for iq=1,24 do
if zx.hour==iq then
statis[2][iq]=statis[2][iq]+1
end
end

table2=reverseTable(table1)



widgetGroup:removeSelf()
invoketable(table2)
initsession[1].table1=table1
	initsession[1].statis=statis
	initsession[1].kickv=kickv
	initsession[1].datatrack=datatrack
	initsession[1].datatrackall=datatrackall
	--initsession[1].tempstamp=tempstamp
	loadsave.saveTable(initsession, "initsession.json", system.DocumentsDirectory)
	
----print(datatrack[kickv+1].count1.."  "..datatrack[kickv+1].time1)

		 --updateTimer()
		timer.performWithDelay(500, blinkfeet1, 5)
timer.performWithDelay(600, blinkfeet2, 5)
		 
        return true
		
	
    end
end
function ber2:touch( event )
    if event.phase == "began" then


				
			
globatime=overlay1()


			 --updateTimer()
		 
        return true
		
	
    end
end


-- if settings[1].CHECKALARMONOFF==0 then
-- --print("in alarm off------------------")

-- notifications.cancelNotification()
-- time1 = os.date( "!*t", os.time() + notificationTime1 )
-- notificationID1 = notifications.scheduleNotification( time1, options1Z )

-- time2 = os.date( "!*t", os.time() + notificationTime2 )
-- notificationID2 = notifications.scheduleNotification( time2, options1Z )
-- else
-- --print("in alarm on------------------")
-- if settings[1].roll3=="PM" then
-- talhr=settings[1].roll1+12
-- else
-- talhr=settings[1].roll1
-- end
-- --print(talhr.."in alarm on------------------"..settings[1].roll2)
-- alarmer(talhr,settings[1].roll2)
-- end
           
     
    


function pause1:touch( event )
    if event.phase == "began" then
	play1.isVisible=true
	pause1.isVisible=false

        --print( "You touched the pause!" )
		 
		 --print(tx)
	if(tx==0 or tx==nil)then else timeKeep:pause()  upclockon =0 timer.cancel(tx) tx=0 end 
        return true
    end
end

controllzforresume=1
local function onSystemEvent( event )

    local eventType = event.type

    if ( eventType == "applicationStart" ) then
	-- notifications.cancelNotification() 
	
	startscreen()
        --occurs when the application is launched and all code in "main.lua" is executed
    elseif ( eventType == "applicationExit" ) then
	startscreen()
	-- notifications.cancelNotification() 
	
	-- if settings[1].CHECKALARMONOFF==0 then
-- -- notifications.cancelNotification()
-- time1 = os.date( "!*t", os.time() + notificationTime1 )
-- notificationID1 = notifications.scheduleNotification( time1, options1Z )

-- time2 = os.date( "!*t", os.time() + notificationTime2 )
-- notificationID2 = notifications.scheduleNotification( time2, options1Z )
-- else
-- if settings[1].roll3=="PM" then
-- talhr=settings[1].roll1+12
-- else
-- talhr=settings[1].roll1
-- end
-- alarmer(talhr,settings[1].roll2)
-- end
	
	

        --occurs when the user or OS task manager quits the application
    elseif ( eventType == "applicationSuspend" ) then
	
	        suspendTime = os.time()
       
    
-- notifications.cancelNotification() 
	-- if settings[1].CHECKALARMONOFF==0 then
-- notifications.cancelNotification()
-- time1 = os.date( "!*t", os.time() + notificationTime1 )
-- notificationID1 = notifications.scheduleNotification( time1, options1Z )

-- time2 = os.date( "!*t", os.time() + notificationTime2 )
-- notificationID2 = notifications.scheduleNotification( time2, options1Z )
-- else
-- if settings[1].roll3=="PM" then
-- talhr=settings[1].roll1+12
-- else
-- talhr=settings[1].roll1
-- end
-- alarmer(talhr,settings[1].roll2)
-- end
 


        --perform all necessary actions for when the device suspends the application, i.e. during a phone call
    elseif ( eventType == "applicationResume" ) then
	startscreen()
	-- notifications.cancelNotification() 
	controllzforresume=0
	
	   if upclockon ==1 then
         
		 resumeTime = os.time()  
		  
		 deltaTimesec=  math.round((resumeTime - suspendTime))
						resumeTime = 0
						
						timeKeep:pause()
						
timeKeep:addTime(deltaTimesec)
timeKeep:resume()
updateTimer()
		
		end
				suspendTime = 0 
				updateduetag2()
	--[[
while zx.min<0 or  zx.hour<0 do
--print("in while")
if zx.min<0 then
zx.min=60+zx.min
zx.hour=zx.hour-1
if zx.hour<0 then
zx.hour = 24+zx.hour
zx.day=zx.day-1

if zx.day<0 then
zx.wday=zx.wday-1
if zx.wday<0 then
zx.wday=7+zx.wday
end




zx.month=zx.month-1
if zx.month== 4 or 6 or 9 or 115-20 then
zx.day=30+zx.day
elseif zx.day== 2 then
zx.day=28+zx.day
else
zx.day=31+zx.day


end


end
end
end
end
	
	]]--
        --perform all necessary actions for when the app resumes from a suspended state
    elseif ( eventType == "applicationOpen" ) then
	-- notifications.cancelNotification() 
        --occurs when the application is asked to open a URL resource (Android and iOS only)
    end
end

Runtime:addEventListener( "system", onSystemEvent )



feet2:addEventListener( "touch", feet2 )
feet1:addEventListener( "touch", feet1 )
play1:addEventListener( "touch", play1 )
spreadjoy:addEventListener( "touch", shareit )
addnote1:addEventListener( "touch", addnote1 )
pause1:addEventListener( "touch", pause )
stop1:addEventListener( "touch", stop1 )
b1:addEventListener( "touch", b1 )
ber2:addEventListener( "touch", ber2 )
analytic1:addEventListener( "touch", analytic1 )
shop:addEventListener( "touch", shop )


if settings[1].CHECKALARMONOFF==0 then
--print("in alarm off------------------")

notifications.cancelNotification()
 --print("fffffffffffffffffffffffffffffffffffffff        cancelled3")
 time1 = os.date( "!*t", os.time() + notificationTime1 )
notificationID1 = notifications.scheduleNotification( time1, options1Z )

 time2 = os.date( "!*t", os.time() + notificationTime2 )
 notificationID2 = notifications.scheduleNotification( time2, options1Z )
 
 
 time3 = os.date( "!*t", os.time() + notificationTime3 )
 notificationID3 = notifications.scheduleNotification( time3, options1Z )
 
end
local function myUnhandledErrorListener( event )

    local iHandledTheError = true

    if iHandledTheError then
        --print( "Handling the unhandled error", event.errorMessage )
    else
        --print( "Not handling the unhandled error", event.errorMessage )
    end
    
    return iHandledTheError
end

Runtime:addEventListener("unhandledError", myUnhandledErrorListener)

 -- alarmoverlay1()
 
 --setduedate()
  if settings[1].duestatus==nil then
 settings[1].duestatus=0
 settings[1].inthefuture=nil
 loadsave.saveTable(settings, "settings.json", system.DocumentsDirectory)
 overlayduedate()
 else
 dueset=settings[1].duestatus
inthefuture=settings[1].inthefuture
 
 end
--overlayduedate()
print_r(settings)

function checkduestate()
  if settings[1].duestatus==nil then
 overlayduedate()
  else
overlayduedate2()
  end
end
  contdownheart:addEventListener( "touch", checkduestate )

updateduetag2()
 xsa=timer.performWithDelay(1000*60*60, updateduetag2,-1) 

 

 
 function invoketable1zz(listItems1)


local tableView = require( "tableView" )
-- create a constant for the left spacing of the row content
local LEFT_PADDING = 10
local transActivated = false;
--Set the background to white
--display.setDefault( "background", 1, 1, 1 )
local listItems ={}
listItems = listItems1
local populateList



--Create a group to hold our widgets & images
widgetGroup1s = display.newGroup()

-- Forward reference for our back button & tableview
local backButton, list
local rowTitles = {}

local transAlpha = {}
local transY = {}

-- Hande row touch events
 function onRowTouch( event )
	local phase = event.phase
	local row = event.target
	
	if "press" == phase then
		--print( "Pressed row: " .. row.index )

	elseif "release" == phase then
		-- Update the item selected text
		--itemSelected.text = "You selected: " .. rowTitles[row.id]

        ----print(rowTitles[row.id])
		
		--Transition out the list, transition in the item selected text and the back button

		-- The table x origin refers to the center of the table in Graphics 2.0, so we translate with half the object's contentWidth
		transition.to( list, { x = - list.contentWidth * 0.5, time = 400, transition = easing.outExpo } )
		transition.to( itemSelected, { x = display.contentCenterX, time = 400, transition = easing.outExpo } )
		transition.to( backButton, { alpha = 1, time = 400, transition = easing.outQuad } )
		
		--print( "Tapped and/or Released row: " .. row.index )
	end
end

 function onCategoryTap(event)
    if(transActivated == false)then
        transActivated = true;
        local row = event.target
        --print("tapped Category", row.id)
        
        local addedRowHeight = 0
        local listRows = list._view._rows
        list._view._velocity = 0
            
        local function detailTrans(t, tMax, start, delta)
            local dy = addedRowHeight * t / tMax
            for i, v in pairs(transY) do
                if listRows[i]._view then
                    listRows[i]._view.y = v.startY + dy - v.height * 0.5
                end
                listRows[i].y = v.startY + dy
            end
            local alpha = start + delta * t / tMax
            list:reloadData()
            for i, v in pairs(transAlpha) do
                if listRows[i]._view then
                    listRows[i]._view.alpha = alpha
                end
            end
            return alpha
        end;
        
        local function detailTransComplete(_)
            for i, v in pairs(transY) do
                if listRows[i]._view then
                    listRows[i]._view.y = v.startY + addedRowHeight - v.height * 0.5
                end
                listRows[i].y = v.startY + addedRowHeight
            end
            for i, v in pairs(transAlpha) do
                if listRows[i]._view then
                    listRows[i]._view.alpha = 1
                end
            end
            transAlpha = {}
            transY = {}
            transActivated = false;
        end
        
        local rowHeight = 320    
        
        listItems[row.id].collapsed = not listItems[row.id].collapsed
        transAlpha = {}
        transY = {}
        if not listItems[row.id].collapsed then
            --Insert the subitems
            --setup items that need to be pushed down
            for i = row.row.index + 1, table.maxn(listRows) do
                if listRows[i] then
                    local ti = {}
                    ti.index = i + #listItems[row.id].items
                    ti.startY = listRows[i].y
                    ti.height = listRows[i]._height
                    transY[ti.index] = ti
                end
            end
            for j = 1, #listItems[row.id].items do
                    --Add the rows item title
                    rowTitles[row.id.."-"..j] = listItems[row.id].items[j]

                    --Insert the item
                    list:insertRow{
                            id = row.id.."-"..j,
                            rowHeight = rowHeight,
                            isCategory = false,
                            listener = onRowTouch
                    }
                    addedRowHeight = addedRowHeight + rowHeight + 1
                    --setup items to fade in
                    local ti = {}
                    ti.index = row.row.index + j
                    transAlpha[ti.index] = ti
                    --sort row indexes
                    if table.maxn(listRows) > row.row.index + j then
                        local tmpRow = listRows[row.row.index + j]
                        listRows[row.row.index + j] = listRows[table.maxn(listRows)]
                        if listRows[row.row.index + j] then
                            listRows[row.row.index + j].index = row.row.index + j
                            if listRows[row.row.index + j]._view then
                                listRows[row.row.index + j]._view.index = row.row.index + j
                            end
                        end
                        for i = table.maxn(listRows), row.row.index + j + 2, -1 do
                            listRows[i] = listRows[i - 1]
                            if listRows[i] then
                                listRows[i].index = i
                                if listRows[i]._view then
                                    listRows[i]._view.index = i
                                end
                            end
                        end
                        listRows[row.row.index + j + 1] = tmpRow
                        if tmpRow then
                            listRows[row.row.index + j + 1].index = row.row.index + j + 1
                            if listRows[row.row.index + j + 1]._view then
                                listRows[row.row.index + j + 1]._view.index = row.row.index + j + 1
                            end
                        end
                    end
            end
        else
            --delete the items
            --remove views first to avoid transition
            for i, v in pairs(list._view._rows) do
                if v._view then
                    display.remove(v._view)
                    v._view = nil
                end
            end
            local j = 1
            while row.row.index + j <= table.maxn(listRows) and (not listRows[row.row.index + j] or not listRows[row.row.index + j].isCategory) do
                    --Remove the rows item title
                    rowTitles[row.id.."-"..j] = nil
                    if listRows[row.row.index + j] then
                        list:deleteRow(row.row.index + j)
                    end
                    j = j + 1
            end

            local function listener( event )
                transActivated = false;
            end

            timer.performWithDelay( 200, listener )
            
        end
        local isGraphicsV1 = ( 1 == display.getDefault( "graphicsCompatibility" ) )
        --redrawRows
        local scrollHeight = 0
        local lastItem
        for i = 1, table.maxn(list._view._rows) do
            --set y for items that are not transitioned (remove when transition up done)
            local v = list._view._rows[i]
            if v then
                if not transY[i] then
                    if not lastItem then
                            local rowY = ( list._view._rows[i]._height * 0.5 ) - list._view.parent.height * 0.5
                            if isGraphicsV1 then
                                    rowY = ( list._view._rows[i]._height * 0.5 ) + 1
                            end
                            list._view._rows[i].y = rowY
                    else
                            if ( list._view._rows[lastItem].y ) then
                                list._view._rows[i].y = ( list._view._rows[lastItem].y + ( list._view._rows[lastItem]._height * 0.5 ) )
                                    + ( list._view._rows[i]._height * 0.5 ) + 1        
                            end
                    end
                end
                if list._view._rows[i] then
                    lastItem = i
                end
                --remove views to force update
                if v._view then
                    display.remove(v._view)
                    v._view = nil
                end
                scrollHeight = scrollHeight + v._height + 1
            end
        end
        --set scroll height
        list._view._scrollHeight = scrollHeight
        if list._view._scrollBar then
            list._view._scrollBar:repositionY()
        end
        --update table view
        list:reloadData()
        
        --hide items that will fade in and start transition
        if (table.maxn(transAlpha) > 0) or (table.maxn(transY) > 0) then
            local tai = nil
            for i, v in pairs(transAlpha) do
                if listRows[i]._view then
                    if tai == nil then
                        tai = i
                    end
                    if not listItems[row.id].collapsed then
                        listRows[i]._view.alpha = 0
                    end
                    listRows[i]._view:toBack()
                end
            end
            if tai then
                --if(transActivated == false) then
                  --  transActivated = true;
                    transition.to(listRows[tai]._view, {time = 200, alpha = 1, transition = detailTrans, onComplete = detailTransComplete})
                --end
            end
        end
        --list:deleteAllRows()
        --populateList()
    end
end

-- Handle row rendering
 function onRowRender( event )
	local phase = event.phase
	local row = event.row
	local isCategory = row.isCategory
        local tList = list
	row.reRender = true
	-- in graphics 2.0, the group contentWidth / contentHeight are initially 0, and expand once elements are inserted into the group.
	-- in order to use contentHeight properly, we cache the variable before inserting objects into the group

	local groupContentHeight = row.contentHeight
	
	local rowTitle = display.newText( row, rowTitles[row.id], 0, 0, native.systemFontBold, 12 )

        ----print("ORR called")
        
	-- in Graphics 2.0, the row.x is the center of the row, no longer the top left.
	rowTitle.x = LEFT_PADDING + 15+150-10-55+5+10+20-10-2-4

	-- we also set the anchorX of the text to 0, so the object is x-anchored at the left
	rowTitle.anchorX = 0

	rowTitle.y = groupContentHeight * 0.5-65-10+8+10+30+20-2
	rowTitle:setFillColor( 1, 1, .9 )
	
	if isCategory then
            
            local categoryBtn = display.newRect( row, 0, 0, row.width, row.height )
            categoryBtn.anchorX, categoryBtn.anchorY = 0, 0
            --categoryBtn:addEventListener ( "tap", onCategoryTap )
            categoryBtn.alpha = 0
            categoryBtn.isHitTestable = true
            categoryBtn.id = row.id
            categoryBtn.row = row
		--	--print("something great")
          --  print_r(row.id)
            local catIndicator = nil 
           
                catIndicator = display.newImage( row, sizechart[row.id], false )
           catIndicator:scale( .95, .95)
            catIndicator.x = LEFT_PADDING
            catIndicator.anchorX = 0
            catIndicator.y = (groupContentHeight * 0.5)
            
        else
		local rowArrow = display.newImage( row, "f4.png", false )
                
                rowArrow.x = row.contentWidth - LEFT_PADDING

		-- we set the image anchorX to 1, so the object is x-anchored at the right
		rowArrow.anchorX = 1

		-- we set the image anchorX to 1, so the object is x-anchored at the right
		rowArrow.y = groupContentHeight * 0.5
	end

end

-- Create a tableView
local list = tableView.new --adjustment to dimensions
{
	top = 50,
	width = 220+100, 
	height = display.contentHeight - 32 - 150-125+10+18+100,
	maskFile = "mask-320x448.png",
	onRowRender = onRowRender,
	onRowTouch = onRowTouch,
}
--Insert widgets/images into a group
widgetGroup1s:insert( list )


function populateList()



print_r(listItems)
    for i = 1, #listItems do
	--Add the rows category title
	rowTitles[ #rowTitles + 1 ] = listItems[i].title
	
	--print(listItems[i].title)
	--Insert the category
	list:insertRow{
                id = i,
		rowHeight = 180,
		rowColor = 
		{ 
			default = { 255/255, 255/255, 255/255, 40/255 }, --search by 255 alpha or isvisible of rows
		},
		isCategory = true,
	}
        --print(listItems[i].collapsed )
        if not listItems[i].collapsed then
            --Insert the item
            for j = 1, #listItems[i].items do
                    --Add the rows item title
                    rowTitles[ #rowTitles + 1 ] = listItems[i].items[j]

                    --Insert the item
                    list:insertRow{
                            rowHeight = 20,
                            isCategory = false,
                            listener = onRowTouch
                    }
            end            
        end
		 
    end
	
end
populateList()
if FIRST==1 then
  list:scrollToIndex( startmehere-3, 1)
  FIRST=FIRST+1
end
end

 
 
 
 function overlaysize()
countdisp.isVisible=false
mmt=1
FIRST=1
dddh=40
countdisp.alpha=0
whereamI=5 --1-LADY 2-STAT  3- NOTE 4-STOP 5-KICKEARLIER
 	--textbox screen


local box1 = display.newImage( "ia.jpg" )
box1.anchorX=0
box1.anchorY=0
box1.x  = -10
box1.y  = 1
box1.alpha=1 --.70 and .90
box1:scale( 1, 1 )

--local widget = require( "widget" )

				local rb1 = display.newRect( _W, _H, _W*2, _H*2 )
 rb1:setFillColor( 0, 0, 0 ,.6)
rb1:toFront()
rb1:addEventListener("touch", function()  return true end)
rb1:addEventListener("tap", function()  return true end)


local tttext = display.newText( "Growth Milestones", _W /2, dddh-10,native.systemFontBold, 22 )
tttext:setFillColor( 0, 1, 1 )
		sometextzz=" "
	if inthefuture==nil then
	
	startmehere=4
	else

	lmsp=inthefuture- (280*24*60*60)
differencae11=os.difftime(os.time()/86400, lmp/86400)

if differencae11<0 then
differencae11=0
end
nWKsS = math.floor(differencae11/7)
nWKSZ=nWKsS
--print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
--print(nWKSZ)
	sometextzz="You are now in week "..math.abs( math.floor(nWKSZ)).." of your pregnancy"

if nWKSZ<5 then
startmehere=4
elseif nWKSZ>39 then
 startmehere=39
 else
 startmehere=nWKSZ
 
end
end
local tttextz = display.newText( sometextzz, _W /2, dddh-10+340,native.systemFontBold, 13 )
tttextz:setFillColor( 1, 1, 1 )
local ok1x = display.newImage( "RR12.png" )
ok1x.anchorX=.5
ok1x.anchorY=.5
ok1x.x  = _W/2-10

ok1x.y  = _H-250+125+45-10-5+2+20
ok1x.alpha=1 --.70 and .90
ok1x:scale( .5, .5)
sometextz="Conception period: "
tab1211z1={}
trimcount=1
for m=1,37 do

if m+3==14 then
trimcount=1
elseif m+3==29 then
trimcount=3
end
tab1211z1[m]={}
tab1211z1[m].collapsed=true
tab1211z1[m].title= "\n\n    Week: "..(m+3).." [Trimester "..trimcount.."]\n\n"..sizetext1[m].."\n"..sizeleng[m].."\n"..sizewt[m]

end

invoketable1zz(tab1211z1)
 
function ok1x:touch( event )
    if event.phase == "began" then
	--overlayduedate()
	--cancel1xc.isVisible=false
	tttext.isVisible=false
	ok1x.isVisible=false
	tttextz.isVisible=false

box1.isVisible=false
rb1.isVisible=false



  widgetGroup1s:removeSelf()
	  whereamI=1 --1-LADY 2-STAT  3- NOTE 4-STOP 5-KICKEARLIER
--mmt=0


--	countdisp.alpha=.95
	--updateTimer()
end
end

ok1x:addEventListener( "touch", ok1x )


end
 
 function overlayduedate2()
 
if settings[1].inthefuture==nil then

overlayduedate() 
else
countdisp.isVisible=false
mmt=1

dddh=40
countdisp.alpha=0
whereamI=5 --1-LADY 2-STAT  3- NOTE 4-STOP 5-KICKEARLIER
 	--textbox screen

local box1 = display.newImage( "ca.jpg" )
box1.anchorX=0
box1.anchorY=0
box1.x  = -10
box1.y  = 1
box1.alpha=1 --.70 and .90
box1:scale( 1.6, 1.6 )
--local widget = require( "widget" )
dueset=1
				local rb1 = display.newRect( _W, _H, _W*2, _H*2 )
 rb1:setFillColor( 0, 0, 0 ,.85)
rb1:toFront()
rb1:addEventListener("touch", function()  return true end)
rb1:addEventListener("tap", function()  return true end)
local cancel1xc = display.newImage( "RR11.png" )
cancel1xc.anchorX=0
cancel1xc.anchorY=0
cancel1xc.x  = _W/2+20
cancel1xc.y  =_H-250+125+45-10-5+2+20
cancel1xc.alpha=1 --.70 and .90
cancel1xc:scale( .5, .5 )

local sizeit = display.newImage( "gmile.png" )
sizeit.anchorX=.5
sizeit.anchorY=.5
sizeit.x  = _W/2-10+50+30

sizeit.y  = _H-250+125+45-10-5+2+20-200+20
sizeit.alpha=1 --.70 and .90
sizeit:scale( .5, .5)


local ok1x = display.newImage( "RR12.png" )
ok1x.anchorX=0
ok1x.anchorY=0
ok1x.x  = _W/2-120

ok1x.y  = _H-250+125+45-10-5+2+20
ok1x.alpha=.93 --.70 and .90
ok1x:scale( .5, .5)



function getstartweekdate(wkno,flg1)

startweekdate= (lmp)+ ((wkno-1)*7*24*60*60)
--print("start"..startweekdate)
if flg1==1 then
return os.date("%d-%b-%Y", startweekdate)
else 
return startweekdate
end

end

function getendweekdate(wkno,flg2)

endtweekdate= (lmp)+ ((wkno)*7*24*60*60)-(24*60*60)
--print("end"..endtweekdate)

if flg2==1 then
return os.date("%d-%b-%Y", endtweekdate)
else 
return endtweekdate
end

end



local tttext = display.newText( "Pregnancy Milestones*", _W /2, dddh-10,native.systemFontBold, 22 )
tttext:setFillColor( 0, 1, 1 )
local tttextz = display.newText( "*Estimated dates", _W /2+72, dddh-10+20,native.systemFontBold, 10 )
tttextz:setFillColor( 1, .2, 1 )



difference1=os.difftime( os.time(),settings[1].inthefuture)/86400
remainingtext=math.round(difference1).." days\n    to go"

DATEFUT=	os.date("%d-%b-%Y", settings[1].inthefuture)
sometext="    Your baby will be due on or around: "..DATEFUT
--print_r(DATEFUT)
----print("Conception likely took place around"..DATEFUT)
concdate1= os.date("%d-%b-%Y", (settings[1].inthefuture- (270*24*60*60)))
concdate2= os.date("%d-%b-%Y", (settings[1].inthefuture- (262*24*60*60)))
--sometext=sometext.."\n\nConception likely around: "..concdate1.." - "..concdate2
sometextz="Conception period: "..concdate1.." - "..concdate2
tab12111={}
m=0
m=m+1
tab12111[m]={}
tab12111[m].collapsed=true
tab12111[m].title= sometextz




difference12=math.round(os.difftime( settings[1].inthefuture,os.time())/86400 )
--


lmp=settings[1].inthefuture- (280*24*60*60)
difference11=os.difftime(os.time()/86400, lmp/86400)
if difference11<0 then
difference11=0
end
nWKS = string.format("%02.f", math.floor(difference11/7))
nWKS2 = string.format("%02.f", math.floor(difference12/7))
			--	nDYS = string.format("%02.f", math.floor(difference11/7 - (nWKS)));


--sometext=sometext.."\n\n\n              You are now "..math.abs(difference11).." days pregnant and\n                 are in week "..math.abs(nWKS).." of your pregnancy."


sometextz="You are now "..math.floor(difference11).." days pregnant"
m=m+1
tab12111[m]={}
tab12111[m].collapsed=true
tab12111[m].title= sometextz
--sometextz="week "..math.abs(nWKS).." of your pregnancy."

sometextz="You are now in week "..math.abs( math.floor(nWKS)).." of your pregnancy"
m=m+1
tab12111[m]={}
tab12111[m].collapsed=true
tab12111[m].title= sometextz

if difference12>0 then
--sometext=sometext.."\n\n         "..difference12.." days (~"..nWKS2.." weeks) remaining"
sometextz="About "..difference12.." days (~"..nWKS2.." weeks) remaining"

m=m+1
tab12111[m]={}
tab12111[m].collapsed=true
tab12111[m].title= sometextz


end
sometext2=os.date("%d-%b-%Y", (lmp)).." - "..os.date("%d-%b-%Y", (lmp)+ (92*24*60*60))
print_r(tab12111)


--print_r(os.date("%d-%b-%Y", (lmp)).."-"..os.date("%d-%b-%Y", (lmp)+ (92*24*60*60)))
----print("2nd trimester **********: Starts at the beginning of the 14th week after your LMP and lasts through the 27th week of pregnancy.*********************************")

sometext2=sometext2.."\n\n\n\n"..os.date("%d-%b-%Y", (lmp)+ (93*24*60*60)).." - "..os.date("%d-%b-%Y", (lmp)+ (186*24*60*60))



--print_r(os.date("%d-%b-%Y", (lmp)+ (93*24*60*60)).."-"..os.date("%d-%b-%Y", (lmp)+ (186*24*60*60)))
----print("3rd trimester **********: Starts at the beginning of the 28th week after your LMP and ends with labor..*********************************")
--print_r(os.date("%d-%b-%Y", (lmp)+ (187*24*60*60)).."- around "..os.date("%d-%b-%Y", settings[1].inthefuture))

sometext2=sometext2.."\n\n\n\n"..os.date("%d-%b-%Y", (lmp)+ (187*24*60*60)).." - "..os.date("%d-%b-%Y", settings[1].inthefuture)

--print("starttttttttttttttttttt"..getstartweekdate(1,0).." - "..getendweekdate(1,0))

m=m+1
tab12111[m]={}
tab12111[m].collapsed=true
tab12111[m].title= "Baby's heart starts beating: "..getstartweekdate(5,1)

m=m+1
tab12111[m]={}
tab12111[m].collapsed=true
tab12111[m].title= "Baby's brainwave activity starts: "..getstartweekdate(8,1)

m=m+1
tab12111[m]={}
tab12111[m].collapsed=true
tab12111[m].title= "Dating scan/1st scan: "..getstartweekdate(8,1).." - "..getendweekdate(13,1)

m=m+1
tab12111[m]={}
tab12111[m].collapsed=true
tab12111[m].title= "Heartbeat detected with doppler: "..getstartweekdate(14,1)

m=m+1
tab12111[m]={}
tab12111[m].collapsed=true
tab12111[m].title= "Test for down's syndrome: "..getstartweekdate(10,1).." - "..getendweekdate(15,1)

m=m+1
tab12111[m]={}
tab12111[m].collapsed=true
tab12111[m].title= "Nuchal translucency scan: "..getstartweekdate(11,1).." - "..getendweekdate(16,1)

m=m+1
tab12111[m]={}
tab12111[m].collapsed=true
tab12111[m].title= "Double Marker Test: "..getstartweekdate(8,1).." - "..getendweekdate(14,1)

m=m+1
tab12111[m]={}
tab12111[m].collapsed=true
tab12111[m].title= "Triple Marker Test: "..getstartweekdate(14,1).." - "..getendweekdate(18,1)

m=m+1
tab12111[m]={}
tab12111[m].collapsed=true
tab12111[m].title= "Quad Marker Test: "..getstartweekdate(15,1)

m=m+1
tab12111[m]={}
tab12111[m].collapsed=true
tab12111[m].title= "Amniocentesis: "..getstartweekdate(16,1)

m=m+1
tab12111[m]={}
tab12111[m].collapsed=true
tab12111[m].title= "Anomaly scan: "..getstartweekdate(18,1).." - "..getendweekdate(23,1)

m=m+1
tab12111[m]={}
tab12111[m].collapsed=true
tab12111[m].title= "1st kick for dad/Your baby can hear: "..getstartweekdate(21,1)

m=m+1
tab12111[m]={}
tab12111[m].collapsed=true
tab12111[m].title= "Voice recognition: "..getstartweekdate(22,1)

m=m+1
tab12111[m]={}
tab12111[m].collapsed=true
tab12111[m].title= "Glucose Screen: "..getstartweekdate(26,1)

m=m+1
tab12111[m]={}
tab12111[m].collapsed=true
tab12111[m].title= "Good infant survival rate: "..getstartweekdate(27,1)

m=m+1
tab12111[m]={}
tab12111[m].collapsed=true
tab12111[m].title= "Daily Fetal Movements Count: "..getstartweekdate(28,1)

m=m+1
tab12111[m]={}
tab12111[m].collapsed=true
tab12111[m].title= "Fetal testing in HR patients: "..getstartweekdate(32,1)

m=m+1
tab12111[m]={}
tab12111[m].collapsed=true
tab12111[m].title= "Full term/Elective Delivery after this Date: "..getstartweekdate(39,1)
--[[
other dates
Ovulation: OD: 2wks0d
wk 5 baby's heart starts beating wk5
Week 8 Brainwave activity starts
dating scan + 1st scan 8-13
heartbeat with doppler 14
test for down's syndrome 10 - 15
nuchal translucency scan - 11-16
Double Marker Test 8 weeks of pregnancy up to 14 weeks.
Triple Marker Pregnancy Test 14th and 18th week 
Quad Markers:15wks0d
Amniocentesis:16wks0d
Anatomic Ultrasound:19wks0d

anomaly scan 18-23
1st kick for dad/Your baby can hear 21
voice recognition 22
Glucose Screen:26wks0d
Daily Fetal Movements Count:09/13/2015 28wks0d
Usual time to do fetal testing in HR patients:10/11/2015 32wks0d
good infant survival rate 27 
full term/Elective Delivery after this Date 39



]]--

invoketable1z(tab12111)

if os.time()>((lmp)+ (186*24*60*60)) then
zximg="1g.png"


yy  = 50+50
elseif os.time()>(lmp)+ (92*24*60*60) then
zximg="1gn.png"

yy  = 50
else
zximg="1gnp.png"

yy=0

end

 log12 = display.newImage( zximg )
log12.anchorY=.5
log12.anchorX=.5
log12.x  = _W/2-80
log12.y  = 140
log12.alpha=1 --.70 and .90
log12:scale( .35, .35 )

 arw = display.newImage( "greenar.png" )
arw.anchorX=0
arw.anchorY=0

arw.alpha=.93 --.70 and .90
arw:scale( .08, .08)
arw.x  = 285-7
arw.y  = 82+yy


 tttexttt = display.newText(sometext, 30, 65+40+15+20+dddh+70,native.systemFont, 11 )
tttexttt.anchorX=0
tttexttt.anchorY=0
tttexttt:setFillColor( 1, 1, 1 )
 tttexttt2 = display.newText(sometext2, 140, 85,native.systemFont, 11 )
tttexttt2.anchorX=0
tttexttt2.anchorY=0
tttexttt2:setFillColor( 1, 1, 1 )




function ok1x:touch( event )
    if event.phase == "began" then
	--overlayduedate()
	cancel1xc.isVisible=false
	ok1x.isVisible=false

box1.isVisible=false
rb1.isVisible=false
tttext.isVisible=false
tttextz.isVisible=false
tttexttt.isVisible=false
tttexttt2.isVisible=false
log12.isVisible=false
arw.isVisible=false
sizeit.isVisible=false

   widgetGroup1:removeSelf()
	  whereamI=1 --1-LADY 2-STAT  3- NOTE 4-STOP 5-KICKEARLIER
mmt=0


	countdisp.alpha=.95
	--updateTimer()
end
end

function cancel1xc:touch( event )
    if event.phase == "began" then
	overlayduedate()
	cancel1xc.isVisible=false
	ok1x.isVisible=false
tttext.isVisible=false
tttextz.isVisible=false
tttexttt.isVisible=false
tttexttt2.isVisible=false
log12.isVisible=false
box1.isVisible=false
rb1.isVisible=false
arw.isVisible=false
sizeit.isVisible=false
    widgetGroup1:removeSelf()
	  whereamI=1 --1-LADY 2-STAT  3- NOTE 4-STOP 5-KICKEARLIER
-- mmt=0


	-- countdisp.alpha=.95
	--updateTimer()
end
end
cancel1xc:addEventListener( "touch", cancel1xc )
ok1x:addEventListener( "touch", ok1x )
sizeit:addEventListener( "touch", overlaysize )

end
end
-- overlaysize()

resumethisshit()



function openlink1z()
 dry1=-60
 grateA = display.newGroup()
 
 				 rb1r = display.newRect( _W, _H, _W*2, _H*2 )
 rb1r:setFillColor( 0, 0, 0 ,.85)
--rb1r:toFront()
rb1r:addEventListener("touch", function()  return true end)
rb1r:addEventListener("tap", function()  return true end)
 
 
halt1rate= display.newRect( 0 , 200+dry1, 50+100*4, 44*3+30+65+50 )
halt1rate.alpha=.95
halt1rate.anchorX=0
halt1rate.anchorY=0
halt1rate:setFillColor( .2, .2, .2 ,.95)
halt1rate:setStrokeColor( .8, .8 ,.8 )
halt1rate.strokeWidth = .51

halt1ratetext = display.newText( "Rate the App - My Baby's Kick Counter", 160, 44*3+185-65-40+dry1,native.systemFont, 16 )
halt1ratetext:setFillColor( .2, 1, .3 )
halt2ratetext = display.newText( "            Did you enjoy using the App.\n     If so, please take a moment to rate it. \n     This helps us keep our updates free.\n             Thank you for your support.", 155, 44*3+185-65+35+dry1,native.systemFont, 14 )
halt2ratetext:setFillColor( .8, .8, .8 )

 star2 = display.newImage( "5stars2.png" )
star2.anchorX=0
star2.anchorY=0
star2.x  = 160-65-20+5+2-15-5-5-5-5+2
star2.y  = 44*3+185-65-40-20+30+dry1-10
star2.alpha=.75 --.70 and .90
star2:scale( .35, .35 )

 rateme1b = display.newImage( "r1.png" )
rateme1b.anchorX=0
rateme1b.anchorY=0
rateme1b.x  = 160-65
rateme1b.y  = 44*3+185-65-40-20+30+dry1+100+10
rateme1b.alpha=.8 --.70 and .90
rateme1b:scale( .70, .70 ) 

rateme2b = display.newImage( "r2.png" )
rateme2b.anchorX=0
rateme2b.anchorY=0
rateme2b.x  = 160-65
rateme2b.y  = 44*3+185-65-40-20+30+dry1+100+50+5
rateme2b.alpha=.8 --.70 and .90
rateme2b:scale( .70, .70 )

rateme3b = display.newImage( "r3.png" )
rateme3b.anchorX=0
rateme3b.anchorY=0
rateme3b.x  = 160-65
rateme3b.y  = 44*3+185-65-40-20+30+dry1+100+50+50
rateme3b.alpha=.8 --.70 and .90
rateme3b:scale( .70, .70 )
rateme3b.isVisible=false

 lograte = display.newImage( "stars.png" )
lograte.anchorX=0
lograte.anchorY=0
lograte.x  = 160-65+20
lograte.y  = 44*3+185-65-40-20+30+dry1-85-5
lograte.alpha=.8 --.70 and .90
lograte:scale( .25, .25 )

function rateme1b:touch( event )
    if event.phase == "began" then

settings[1].remind=1 
 system.openURL(mylink)  
 grateA.isVisible=false
 
end
end



  grateA:insert( rb1r )
 grateA:insert( halt1rate ) 
  grateA:insert( halt1ratetext )


  grateA:insert( lograte )
  grateA:insert( star2 )
halt2ratetext:toFront()

    grateA:insert( halt2ratetext )

rateme1b:toFront()
rateme2b:toFront()
rateme3b:toFront()
     grateA:insert( rateme1b )
  grateA:insert( rateme2b )
  grateA:insert( rateme3b )
 loadsave.saveTable(settings, "settings.json", system.DocumentsDirectory)
 	rateme1b:addEventListener( "touch", rateme1b )
rateme2b:addEventListener("touch", function()  settings[1].remind=2    grateA.isVisible=false return true end)
rateme3b:addEventListener("touch", function()   settings[1].remind=3   grateA.isVisible=false return true end)
 --system.openURL( mylink )
 end


if datatrackall[1].totalsessions%5 == 0 and settings[1].remind==2 and upclockon ==0  then
openlink1z()
elseif  upclockon ==1 then

else
 helpme()
 end