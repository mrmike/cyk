require_relative './cyk'
require_relative './reader'
require_relative './printer'

grammar = Reader.new.load_grammar()
words = gets.chomp.split(" ")

cyk = Cyk.new(grammar, words)
cyk.start()

print_result(words, cyk.table)
