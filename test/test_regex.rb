require 'test/unit'
require_relative '../app/reader'

class RegexTests < Test::Unit::TestCase

    def setup
        @reader = Reader.new
    end

    def test_word()
        match = @reader.get_pattern().match("A -> a")
        assert_not_nil(match)
        assert_equal(match[1], "A")
        assert_equal(match[5], "a")

        match = @reader.get_pattern().match("A->a")
        assert_not_nil(match)
        assert_equal(match[1], "A")
        assert_equal(match[5], "a")
    end

    def test_extra_space()
        match = @reader.get_pattern().match(" A ->   a")
        assert_not_nil(match)
        assert_equal(match[1], "A")
        assert_equal(match[5], "a")
    end

    def test_grammar()
        match = @reader.get_pattern().match("NP -> A NB")
        assert_not_nil(match)
        assert_equal("NP", match[1])
        assert_equal("A NB", match[5])
    end

    def test_nil()
        match = @reader.get_pattern().match("S ->")
        assert_nil(match)
    end

end
