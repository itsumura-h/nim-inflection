# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest

include inflection

suite "pluralize":
  test "check regular":
    check "posts" == pluralize("post")
    check "octopi" == pluralize("octopus")
    check "sheep" == pluralize("sheep")
    check "CamelOctopi" == pluralize("CamelOctopus")
  
  test "irregular":
    check "men" == pluralize("man")
    check "women" == pluralize("woman")
    check "people" == pluralize("person")

  test "pluralize_plurals":
    check "plurals" == pluralize("plurals")
    check "Plurals" == pluralize("Plurals")

  test "pluralize_empty_string":
    check "" == pluralize("")

  test "uncountability":
    for word in UNCOUNTABLES:
      assert word == pluralize(word)
      # assert word == inflection.singularize(word)
      # assert pluralize(word) == singularize(word)