
{-- Haskell bindings to the Torque C API

(c) Kenneth Hoste (2012)
--}
{-# LANGUAGE ForeignFunctionInterface #-}

#c
#include "pbs_ifl.h"
#include "pbs_error.h"
#endc

module HAPBS where

import C2HS

--
-- pbs_connect: make connection to server
--
--  server :: String: server (syntax: host[:port])
-- 
--  result :: Int

{#fun unsafe pbs_connect as ^ 
    { `String' } -> `Int' #} 

--
-- pbs_submit: submit a new job
--
--  connect :: Int : 
--  attropl :: Ptr Attrop :
--  script :: String : script path
--  destination :: String : 
--  extend :: String : 
-- 
--  result :: String : job id
#c
typedef struct attropl attropl_t;
#endc

{#pointer *attropl_t as Attrop#}

{#fun unsafe pbs_submit as ^ 
    { `Int'       ,
      castPtr `Attrop',
      `String'    , 
      `String'    , 
      `String'      } 
    -> `String' #} 

