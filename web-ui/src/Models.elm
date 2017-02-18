module Models exposing (..)

import Messages exposing (Route)
import Artifacts.Models exposing 
  (Artifact, Artifacts, Columns, Search, initialColumns, initialSearch)

-- MODEL: application level model, holds all app data

type alias Model =
  { artifacts: Artifacts
  , route: Route
  , errors: Errors
  , settings: Settings
  , addr: String
  , state: State
  }

-- settings from cmdline tool (injected into js)
type alias Settings =
  { readonly: Bool
  }

initialSettings : Settings
initialSettings =
  { readonly = True
  }

-- ERRORS: place to store errors that happen

-- TODO: this is supposed to display a list
-- that disappears over time
type alias Errors =
  { descs: List String
  }

initialErrors : Errors
initialErrors = 
    { descs = []
    }

-- log an error
appendError : Model -> String -> Model
appendError model err =
  let
    _ = Debug.log err

    errors = model.errors

    newErrors = { errors | descs = List.append errors.descs [err] }
  in 
    { model | errors = newErrors }

-- STATE

-- current user selections
-- TODO: store this in a cookie or something...
type alias State =
  { columns : Columns
  , search : Search
  }

initialState : State
initialState =
  { columns = initialColumns
  , search = initialSearch
  }
