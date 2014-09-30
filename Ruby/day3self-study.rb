# do
# 1
#   Q:  Modify the CSV application to support an each method to return a
#       CsvRow object. Use method_missing on that CsvRow to return the value
#       for the column for a given heading.
#       For example, for the file:
#       one, two
#       lions, tigers
#       allow an API that works like this:
#       csv = RubyCsv.new
#       csv.each {|row| puts row.one}
#       This should print "lions".
#       2.5

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
