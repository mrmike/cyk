class Reader

    PATTERN = /([A-Za-z]+)([\s]*?)(->)([\s]*?)([A-Za-z]+.*)/

    def load_grammar
        return load_rules.merge(load_lexicon)
    end

    def load_rules
        return load_file("data/grammar.txt")
    end

    def load_lexicon
        return load_file("data/lexicon.txt")
    end

    def load_file(file_name)
        result = Hash.new
        File.open(file_name).each do |line|
            match = PATTERN.match(line.chomp())
            unless match.nil?
                result[match[5]] = match[1]
            end
        end

        return result
    end

    # for unit test purpose
    def get_pattern
        return PATTERN
    end

end
