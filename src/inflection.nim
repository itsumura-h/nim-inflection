import re, strutils, strformat

let PLURALS = [
  (re"(?i)(quiz)$", "$1zes"),
  (re"(?i)^(oxen)$", "$1"),
  (re"(?i)^(ox)$", "$1en"),
  (re"(?i)(m|l)ice$", "$1ice"),
  (re"(?i)(m|l)ouse$", "$1ice"),
  (re"(?i)(matr|vert|ind)(?:ix|ex)$", "$1ices"),
  (re"(?i)(x|ch|ss|sh)$", "$1es"),
  (re"(?i)([^aeiouy]|qu)y$", "$1ies"),
  (re"(?i)(hive)$", "$1s"),
  (re"(?i)([lr])f$", "$1ves"),
  (re"(?i)([^f])fe$", "$1ves"),
  (re"(?i)sis$", "ses"),
  (re"(?i)([ti])a$", "$1a"),
  (re"(?i)([ti])um$", "$1a"),
  (re"(?i)(buffal|potat|tomat)o$", "$1oes"),
  (re"(?i)(bu)s$", "$1ses"),
  (re"(?i)(alias|status)$", "$1es"),
  (re"(?i)(octop|vir)i$", "$1i"),
  (re"(?i)(octop|vir)us$", "$1i"),
  (re"(?i)^(ax|test)is$", "$1es"),
  # Irregular change
  (re"(?i)man$", "$1men"),
  (re"(?i)(pe)rson$", "$1ople"),
  # not matchs
  (re"(?i)s$", "s"),
  (re"$", "s"),
]

# const SINGULARS = [
#   (re"(?i)(database)s$", "$1"),
#   (re"(?i)(quiz)zes$", "$1"),
#   (re"(?i)(matr)ices$", "$1ix"),
#   (re"(?i)(vert|ind)ices$", "$1ex"),
#   (re"(?i)^(ox)en", "$1"),
#   (re"(?i)(alias|status)(es)?$", "$1"),
#   (re"(?i)(octop|vir)(us|i)$", "$1us"),
#   (re"(?i)^(a)x[ie]s$", "$1xis"),
#   (re"(?i)(cris|test)(is|es)$", "$1is"),
#   (re"(?i)(shoe)s$", "$1"),
#   (re"(?i)(o)es$", "$1"),
#   (re"(?i)(bus)(es)?$", "$1"),
#   (re"(?i)(m|l)ice$", "$1ouse"),
#   (re"(?i)(x|ch|ss|sh)es$", "$1"),
#   (re"(?i)(m)ovies$", "$1ovie"),
#   (re"(?i)(s)eries$", "$1eries"),
#   (re"(?i)([^aeiouy]|qu)ies$", "$1y"),
#   (re"(?i)([lr])ves$", "$1f"),
#   (re"(?i)(tive)s$", "$1"),
#   (re"(?i)(hive)s$", "$1"),
#   (re"(?i)([^f])ves$", "$1fe"),
#   (re"(?i)(t)he(sis|ses)$", "$1hesis"),
#   (re"(?i)(s)ynop(sis|ses)$", "$1ynopsis"),
#   (re"(?i)(p)rogno(sis|ses)$", "$1rognosis"),
#   (re"(?i)(p)arenthe(sis|ses)$", "$1arenthesis"),
#   (re"(?i)(d)iagno(sis|ses)$", "$1iagnosis"),
#   (re"(?i)(b)a(sis|ses)$", "$1asis"),
#   (re"(?i)(a)naly(sis|ses)$", "$1nalysis"),
#   (re"(?i)([ti])a$", "$1um"),
#   (re"(?i)(n)ews$", "$1ews"),
#   (re"(?i)(ss)$", "$1"),
#   (re"(?i)s$", ""),
# ]

const UNCOUNTABLES = [
  "equipment",
  "fish",
  "information",
  "jeans",
  "money",
  "rice",
  "series",
  "sheep",
  "species"
]

proc pluralize*(word:string): string =
  if word.len == 0 or UNCOUNTABLES.contains(word.toLowerAscii):
    return word
  else:
    for row in PLURALS:
      let rule = row[0]
      let replacement = row[1]
      if word.find(rule) >= 0:
        result = word.replacef(rule, replacement)
        echo result
        return result
    echo word
    return word
