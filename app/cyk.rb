#!/usr/bin/ruby

require_relative './reader'
require 'text-table'

abort "Please provide input to program" unless ARGV.count > 0

grammar = load_grammar()

input = ARGV[0]
words = input.split(" ")
n = words.count
r = grammar.count

p = Array.new(n+1) {Array.new(n+1,nil)}

words.each_with_index do |word, idx|
    if grammar.has_key?(word)
        value = grammar[word]
        index = grammar.keys.index(word)
        p[idx+1][1] = value
    end
end

(2..n).each do |i|
    (1..n-i+1).each do |j|
        (1..i-1).each do |k|
            first = p[j][k]
            second = p[j+k][i-k]
            unless first.nil? and second.nil?
                rule = "#{first} #{second}"
                if grammar.has_key?(rule)
                    p[j][i] = grammar[rule]
                end
            end
        end
    end
end

puts "Sentence belongs to given grammar" unless p[1][n].nil?

# print results
table = Text::Table.new
table.head = [" "] + words
(1..n).each do |i|
    row = Array.new
    row.push(i)
    (1..n).each do |j|
        row.push(p[j][i])
    end

    table.rows << row
end

puts table.to_s
