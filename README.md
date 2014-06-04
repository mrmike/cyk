CYK Algorithm
----
Project goal was to implement Cocke–Younger–Kasami algorithm. For more info take a look at http://en.wikipedia.org/wiki/CYK_algorithm.

Installation
---
In project main folder run following command
```
$ bundle install
```
and that's all.

Grammar and lexicon
----

Before first usage add your grammar rules to **app/data/grammar.txt** file, e.g.
```
S -> NP VP
VP -> VP PP
VP -> V NP
PP -> P NP
NP -> DET N
```

You need to add word for your lexicon as well, to do that edit **app/data/lexicon.txt** file, e.g.
```
NP -> she
V -> eats
P -> with
N -> fish
N -> fork
DET -> a
```

Usage
----
To run algorithm simply ruby **app.rb** file in **app/** folder with given sentence as a input.
```
$ cd app/
$ ruby app.rb < input.txt
```

Result
---
Result is given in table form
```
+---+-----+------+-----+------+------+-----+------+
|   | she | eats |  a  | fish | with |  a  | fork |
+---+-----+------+-----+------+------+-----+------+
| 1 | NP  | V    | DET | N    | P    | DET | N    |
| 2 |     |      | NP  |      |      | NP  |      |
| 3 |     | VP   |     |      | PP   |     |      |
| 4 | S   |      |     |      |      |     |      |
| 5 |     |      |     |      |      |     |      |
| 6 |     | VP   |     |      |      |     |      |
| 7 | S   |      |     |      |      |     |      |
+---+-----+------+-----+------+------+-----+------+
```