class Cyk

    def initialize(grammar, words)
        @grammar = grammar
        @words = words
        @n = words.count
        @table = Array.new(@n+1) {Array.new(@n+1, nil)}

        init_table(words)
    end

    def init_table(words)
        words.each_with_index do |word, idx|
            if @grammar.has_key?(word)
                value = @grammar[word]
                index = @grammar.keys.index(word)
                @table[idx+1][1] = value
                end
            end
    end

    def start()
        (2..@n).each do |i|
            (1..@n-i+1).each do |j|
                (1..i-1).each do |k|
                    add_rule(i, j, k)
                end
            end
        end
    end

    def add_rule(i, j, k)
        first = @table[j][k]
        second = @table[j+k][i-k]
        return if first.nil? and second.nil?
        rule = "#{first} #{second}"
        if (@grammar.has_key?(rule))
            @table[j][i] = @grammar[rule]
        end
    end

    def belongs
        return @table[1][@n] != nil
    end

    def table
        return @table
    end
end
