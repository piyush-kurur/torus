{-|

The pretty printing for torus types.

-}

module Torus.Core.Pretty
       ( Pretty(..)
       ) where

import Data.Text        ( Text, unpack )
import Text.PrettyPrint

-- | This class captures stuff that can be pretty printed.
class Pretty a where
  pretty :: a -> Doc

instance Pretty Text where
  pretty = text . unpack
