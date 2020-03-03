# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest

include inflection

suite "pluralize":
  suite "check regular":
    test "s, x, ch, o":
      check  pluralize("bus") == "buses"
      check  pluralize("Bus") == "Buses"

      check  pluralize("box") == "boxes"
      check  pluralize("Box") == "Boxes"

      check  pluralize("church") == "churches"
      check  pluralize("Church") == "Churches"

      check  pluralize("dish") == "dishes"
      check  pluralize("Dish") == "Dishes"

      check  pluralize("potato") == "potatoes"
      check  pluralize("Potato") == "Potatoes"

    test "end 'o' but just add 's'":
      check  pluralize("canto") == "cantos"
      check  pluralize("Canto") == "Cantos"

      check  pluralize("hetero") == "heteros"
      check  pluralize("Hetero") == "Heteros"

      check  pluralize("kimono") == "kimonos"
      check  pluralize("Kimono") == "Kimonos"
      
      check  pluralize("photo") == "photos"
      check  pluralize("Photo") == "Photos"
      
      check  pluralize("piano") == "pianos"
      check  pluralize("Piano") == "Pianos"

      check  pluralize("pro") == "pros"
      check  pluralize("Pro") == "Pros"

      check  pluralize("portico") == "porticos"
      check  pluralize("Portico") == "Porticos"

      check  pluralize("quarto") == "quartos"
      check  pluralize("Quarto") == "Quartos"

      check  pluralize("radio") == "radios"
      check  pluralize("Radio") == "Radios"

      check  pluralize("video") == "videos"
      check  pluralize("Video") == "Videos"

      check  pluralize("zero") == "zeros"
      check  pluralize("Zero") == "Zeros"

    test "consonant + y -> consonant + ies":
      check  pluralize("city") == "cities"
      check  pluralize("City") == "Cities"

      check  pluralize("way") == "ways"
      check  pluralize("Way") == "Ways"

      check  pluralize("dictionary") == "dictionaries"
      check  pluralize("Dictionary") == "Dictionaries"

      check  pluralize("story") == "stories"
      check  pluralize("Story") == "Stories"

      check  pluralize("baby") == "babies"
      check  pluralize("Baby") == "Babies"

    test "end 'f', 'fe' -> replace to v and add 'es'":
      check pluralize("half") == "halves"
      check pluralize("Half") == "Halves"

      check pluralize("knife") == "knives"
      check pluralize("Knife") == "Knives"

      check pluralize("wife") == "wives"
      check pluralize("Wife") == "Wives"

      check pluralize("life") == "lives"
      check pluralize("Life") == "Lives"

      check pluralize("elf") == "elves"
      check pluralize("Elf") == "Elves"

      check pluralize("leaf") == "leaves"
      check pluralize("Leaf") == "Leaves"

    test "end 'f', 'fe' -> replace to v and add 'es'  Exception":
      check pluralize("belief") == "beliefs"
      check pluralize("Belief") == "Beliefs"

      check pluralize("roof") == "roofs"
      check pluralize("Roof") == "Roofs"
      
      check pluralize("proof") == "proofs"
      check pluralize("Proof") == "Proofs"

    test "octopi":
      check pluralize("octopus") == "octopi"
      check pluralize("Octopus") == "Octopi"

    test "CamelOctopi":
      check pluralize("CamelOctopus") == "CamelOctopi"
  
  test "check irregular":
    check pluralize("man") == "men"
    check pluralize("Man") == "Men"

    check pluralize("woman") == "women"
    check pluralize("Woman") == "Women"

    check pluralize("child") == "children"
    check pluralize("Child") == "Children"

    check pluralize("tooth") == "teeth"
    check pluralize("Tooth") == "Teeth"

    check pluralize("person") == "people"
    check pluralize("Person") == "People"

    check pluralize("mouse") == "mice"
    check pluralize("Mouse") == "Mice"

    check pluralize("goose") == "geese"
    check pluralize("Goose") == "Geese"

    check pluralize("foot") == "feet"
    check pluralize("Foot") == "Feet"

    check pluralize("ox") == "oxen"
    check pluralize("Ox") == "Oxen"

    check pluralize("potato") == "potatoes"
    check pluralize("Potato") == "Potatoes"

    check pluralize("tomato") == "tomatoes"
    check pluralize("Tomato") == "Tomatoes"

    check pluralize("tomato") == "tomatoes"
    check pluralize("Tomato") == "Tomatoes"

    check pluralize("cactus") == "cacti"
    check pluralize("Cactus") == "Cacti"


  test "empty_string":
    check pluralize("") == ""

  test "uncountability":
    for word in UNCOUNTABLES:
      assert pluralize(word) == word
      # assert word == inflection.singularize(word)
      # assert pluralize(word) == singularize(word)
