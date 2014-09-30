# find: 
# 1
#   Q:  how to access files with code blocks
File.open("day2self-study.rb", "r") do |file|
    while (line = file.gets)
        # puts line
    end
end

#   Q:  how to access files without code blocks
file = File.new("day2self-study.rb", "r")
while (line = file.gets)
    # puts line
end
file.close

# 2
#   Q:  how would you translate a hash to an array? Can you translate arrays to
#       hashes?
#   A:  the hash object in Ruby has a method called values that returns an array
#       of all the values, it probably can do the same with the keys if you want.
#       you could make an array of key/value pairs as well.
#       looks like Ruby also provides a Hash[arg] function which will translate
#       an array to a hash and preserve the keys.

# 3
#   Q:  can you iterate through a hash?
#   A:  yes, the .each method of the Hash class will help

# 4
#   Q:  You can use Ruby arrays and stacks. What other common data structures
#       do arrays support?
#   A:  you could use a Ruby array as a queue by using .push and .last

# do
# 1
#   Q:  Print the contents of an array of sixteen numbers, four numbers
#       at a time, using just each. Now, do the same with each_slice in
#       Enumerable.
#   A:
    arr = (1..16).to_a
    sub_arr = []
    arr.each do |a|
        sub_arr.push(a)
        if (arr.index(a) + 1) % 4 == 0
            # puts("sub section: " + sub_arr.to_s)
            sub_arr = []
        end
    end
    # much better!
    # arr.each_slice(4) { |a| puts(a.to_s) }

#   Q:  The Tree class was interesting, but it did not allow you to specify
#       a new tree with a clean user interface. Let the initializer accept a
#       nested structure with hashes and arrays. You should be able to
#       specify a tree like this: {’grandpa’ => {’ dad’ => {’child 1’ => {}, ’child
#       2’ => {} }, ’uncle’ => {’child 3’ => {}, ’child 4’ => {} } } }.
#   A:  This one is above me, found answers at https://forums.pragprog.com/forums/147/topics/7077
#       see tree.rb

#   Q:  Write a simple grep that will print the lines of a file having any
#       occurrences of a phrase anywhere in that line. You will need to do
#       a simple regular expression match and read lines from a file. (This
#       is surprisingly simple in Ruby.) If you want, include line numbers.
#   A:  bad implementation below, much better implementation at grep.rb

# puts("file?")
# f = gets.chomp
# puts("search?")
#s = gets.chomp
#File.open(f, "r") do |file|
#    while (line = file.gets)
#        if line.index(s).to_i > 0
#            puts line
#        end
#    end
#end