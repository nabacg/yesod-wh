{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE ExtendedDefaultRules #-}

import Yesod


data HelloWorld = HelloWorld

mkYesod "HelloWorld" [parseRoutes|
/ HomeR GET
/ping TestR GET
/json JsonR GET
|] 


instance Yesod HelloWorld

getHomeR :: Handler Html
getHomeR = defaultLayout [whamlet|Hello World !|]

getTestR :: Handler Html
getTestR = defaultLayout [whamlet|PONG|]

getJsonR = return $ object ["msg" .= "Hello World"]

main :: IO ()
main = warp 3000 HelloWorld