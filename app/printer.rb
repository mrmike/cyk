require 'text-table'

def print_result(head, result)
    n = result.count - 1
	table = Text::Table.new
	table.head = [""] + head
	(1..n).each do |i|
	    row = Array.new
	    row.push(i)
	    (1..n).each do |j|
            row.push(result[j][i].to_s)
	    end

	    table.rows << row
	end

	puts table.to_s
end
