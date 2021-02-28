{-# language FlexibleInstances #-}
{-# language PackageImports #-}
{-# language Safe #-}
-- |
-- Module       : Data.Group.Cyclic
-- Copyright    : (c) 2020-2021 Emily Pillmore
-- License      : BSD-style
--
-- Maintainer   : Emily Pillmore <emilypi@cohomolo.gy>,
--                Reed Mullanix <reedmullanix@gmail.com>
-- Stability    : stable
-- Portability  : non-portable
--
-- This module contains definitions for 'Cyclic' groups,
-- along with the relevant combinators.
--
module Data.Group.Cyclic
( -- * Cyclic groups
  -- $cyclic
  G.Cyclic(..)
  -- ** Combinators
, classify
, G.generated
) where

import "groups" Data.Group as G

-- $setup
-- >>> :set -XPackageImports
-- >>> import Prelude
-- >>> import "group-theory" Data.Group
-- >>> import Data.Monoid
-- >>> import Data.Semigroup
-- >>> import Data.Word
-- >>> :set -XTypeApplications

-- -------------------------------------------------------------------- --
-- Cyclic groups


{- $cyclic

'Cyclic' is a 'Group' that is generated by a single element.
This element is called a /generator/ of the group. There can be many
generators for a group, e.g., any representative of an equivalence
class of prime numbers of the integers modulo @n@, but to make things
easy, we ask for only one generator.

-}

-- | Classify elements of a 'Cyclic' group.
--
-- Apply a classifying function @a -> Bool@ to the elements
-- of a 'Cyclic' group as generated by its designated generator.
--
-- === __Examples__:
--
-- >>> take 3 $ classify (< (3 :: Sum Word8))
-- [Sum {getSum = 1},Sum {getSum = 2}]
--
classify :: (Eq a, G.Cyclic a) => (a -> Bool) -> [a]
classify p = filter p G.generated'
{-# inline classify #-}
