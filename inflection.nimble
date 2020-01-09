# Package

version       = "0.1.0"
author        = "Hidenobu Itsumura @dumblepytech1 as 'medy'"
description   = "Pluralizes, singularizes and transforms CamelCase and snake_case English nouns"
license       = "MIT"
srcDir        = "src"



# Dependencies

requires "nim >= 1.0.0"


import strformat
from os import `/`

task docs, "Generate API documents":
  let
    deployDir = "deploy" / "docs"
    pkgDir = srcDir
    srcFiles = @["inflection"]

  if existsDir(deployDir):
    rmDir deployDir
  for f in srcFiles:
    let srcFile = pkgDir / f & ".nim"
    exec &"nim doc --hints:off --project --out:{deployDir} --index:on {srcFile}"