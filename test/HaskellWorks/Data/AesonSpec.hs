{-# LANGUAGE OverloadedStrings #-}

module HaskellWorks.Data.AesonSpec
  ( spec
  ) where

import Data.Aeson
import Data.Semigroup
import HaskellWorks.Data.Aeson
import Test.Hspec

{-# ANN module ("HLint: ignore Redundant do"  :: String) #-}

spec :: Spec
spec = describe "HaskellWorks.Data.Aeson" $ do
  it "123123" $ do
    let actual = objectWith
          (  "one"    .=! (1 :: Int)
          <> "two"    .=? Just (2 :: Int)
          <> "three"  .=? (Nothing :: Maybe Int)
          )
    let expected = object
          [ "one"    .= (1 :: Int)
          , "two"    .= (2 :: Int)
          ]
    actual `shouldBe` expected
