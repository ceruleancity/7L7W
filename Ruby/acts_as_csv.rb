#---
# Excerpted from "Seven Languages in Seven Weeks",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
#---
class ActsAsCsv
    def read
        file = File.new(self.class.to_s.downcase + '.csv')
        @headers = file.gets.chomp.split(', ')

        file.each do |row|
          @result << row.chomp.split(', ')
        end
    end

    def headers
        @headers
    end

    def csv_contents
        @result
    end

    def initialize
        @result = []
        read
    end

    def each(&block)
        ret_val = []
        @result.each do |data|
            ret_val << CsvRow.new(@headers, data)
        end
        ret_val.each(&block)
    end
end

class RubyCsv < ActsAsCsv
end

class CsvRow < ActsAsCsv
    def initialize(headers, data)
        @headers = headers
        @data = data
        @map = {}
        data.each do |x|
            value = x
            key = headers[data.index(x)]
            @map.merge!( key => value )
        end
    end

    def method_missing name, *args
        (@map[name.to_s])
    end
end

m = RubyCsv.new
m.each { |row| puts row.one } 
