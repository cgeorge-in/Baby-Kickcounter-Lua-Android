---*************************************************
-- Please email to webplusmobileapps@gmail.com for any license issues or any questions on this code
---*************************************************

local wpmaGlobalAdmob = {}
local ads = require( "ads" )
local bannerAppID = "sss"  -- Admob Banner App ID
local interstitialAppID = "wwws"  -- Android Admob Interstitial
local adProvider = "admob"
local adListener
local interstitialFetchFlag = 1 -- Call Load Interstitial if this Flag is set to 1

local targetStore
targetStore = system.getInfo( "targetAppStore" )
print( "Target Store is "..targetStore)
----------------------------------------------------------------------------

----------------------------------------------------------------------------
function adListener( event )
      -- The 'event' table includes:
    -- event.name: string value of "adsRequest"
    -- event.response: message from the ad provider about the status of this request
    -- event.phase: string value of "loaded", "shown", or "refresh"
    -- event.type: string value of "banner" or "interstitial"
    -- event.isError: boolean true or false

    if (targetStore == 'nook') then
        return false 
    end
        
    local msg = event.response
    -- Quick debug message regarding the response from the library
    print( "Message from the ads library: ", msg )

    if (event.type == "banner") then
        if ( event.isError ) then
            print( "Error, no ad received", msg )
            bannerAdHeight = bannerAdHeightDefault
        else
            print( "Got an Ad!" )
            bannerAdHeight = ads.height() 
            if (bannerAdHeight == nil or bannerAdHeight == 0) then
                bannerAdHeight = bannerAdHeightDefault
            end
            getBannerHeight()
        end
    elseif (event.type == "interstitial") then
        if ( event.isError ) then
            print( "Error while calling interstitialAdListener ... Try another Ad from another provider" )
        -- attempt to fetch another ad
        elseif ( event.phase == "loaded" ) then
        -- an ad was preloaded
            interstitialFetchFlag = 0
            print("interstitial loaded and show can be called to show ad")
        elseif ( event.phase == "shown" ) then
        -- the ad was viewed and closed
            print("interstitial-closed shown")
        -- composer.gotoScene( "loopScene1", options)
        end
    end

end

--wpmaGlobalAdmob.bannerAdListener = bannerAdListener
----------------------------------------------------------------------------

function interstitialAdListener( event )

    if (targetStore == 'nook') then 
        return false 
    end

    if ( event.isError ) then
        print( "Error while calling interstitialAdListener ... Try another Ad from another provider" )
        -- attempt to fetch another ad
    elseif ( event.phase == "loaded" ) then
        -- an ad was preloaded
        interstitialFetchFlag = 0
        print("interstitial loaded and show can be called to show ad")
    elseif ( event.phase == "shown" ) then
        -- the ad was viewed and closed
        print("interstitial-closed shown")
      -- composer.gotoScene( "loopScene1", options)
    end
end

--wpmaGlobalAdmob.interstitialAdListener = interstitialAdListener
----------------------------------------------------------------------------

function initAdmobBannerAd()
    if (targetStore == 'nook') then 
        return false 
    end
    ads.init( adProvider, bannerAppID, adListener)
end

wpmaGlobalAdmob.initAdmobBannerAd = initAdmobBannerAd
----------------------------------------------------------------------------
function showAdmobBannerAd(position)
    if (targetStore == 'nook') then 
        return false 
    end

    if (position == nil) then
        position = "top"
    elseif (position ~= "top" and position ~= "bottom") then
        position = "top"
    end

    if (position == "top") then
      ads.show( "banner", { x=0, y=0, appId=bannerAppID })
    elseif (position == "bottom") then
      print( "Bottom Ad Called" )
      ads.show( "banner", { x = 0, y = display.contentHeight-40, appId=bannerAppID })
    else
      print( "Something wrong with Banner Ad Position Logic ... Shouldn't come to this statement" )
    end
    
end
wpmaGlobalAdmob.showAdmobBannerAd = showAdmobBannerAd
----------------------------------------------------------------------------
function hideAdmobBannerAd()
    if (targetStore == 'nook') then 
        return false 
    end
    ads.hide()
end
wpmaGlobalAdmob.hideAdmobBannerAd = hideAdmobBannerAd
----------------------------------------------------------------------------
function initAdmobInterstitialAd()
    if (targetStore == 'nook') then 
        return false 
    end
    ads.init( adProvider, interstitialAppID, adListener)
end

wpmaGlobalAdmob.initAdmobInterstitialAd = initAdmobInterstitialAd

----------------------------------------------------------------------------
function loadAdmobInterstitialAd()
    if (targetStore == 'nook') then 
        return false 
    end
    if (interstitialFetchFlag == 1) then
        ads.load( "interstitial", { appId=interstitialAppID } )
    else
        print( "Fetch Flag is 0 ... Ad must be ready to show" )
    end
    
end
wpmaGlobalAdmob.loadAdmobInterstitialAd = loadAdmobInterstitialAd
----------------------------------------------------------------------------
function showAdmobInterstitialAd()
    if (targetStore == 'nook') then 
        return false 
    end
    --if (ads.isLoaded( "interstitial", { appId=interstitialAppID } )) then
    if (interstitialFetchFlag == 0) then
      interstitialFetchFlag = 1
      ads.show( "interstitial", { appId=interstitialAppID } )
    else
      loadAdmobInterstitialAd() -- Load Admob Interstitial Ad and get ready for next call
      print( "ads.isLoaded" .. "returned FALSE and so can't display Interstitial Ad" )
    end
end
wpmaGlobalAdmob.showAdmobInterstitialAd = showAdmobInterstitialAd

----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
return wpmaGlobalAdmob