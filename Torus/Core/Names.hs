{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings          #-}
module Torus.Core.Names
       ( Name, nameParts
       ) where

import Data.Monoid
import Data.String
import Data.Text   as T

import Torus.Core.Pretty

-- | Identifier names.
newtype Name = Name [Text]
             deriving (Show, Monoid, Eq, Ord)

-- | Explode the name into its parts.
nameParts :: Name -> [Text]
nameParts (Name parts) = parts

-- | Creates a name directly from a string.
instance IsString Name where
  fromString = Name . T.split (=='.') . fromString

instance Pretty Name where
  pretty = pretty . T.intercalate "." . nameParts
