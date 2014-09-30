# find: 
# 1
#   Q:  Ruby API
#   A:  http://www.ruby-doc.org/core-2.1.3/

# 2
#   Q:  The free online version of Programming Ruby: The Pragmatic Programmer's Guide
#   A:  http://ruby-doc.com/docs/ProgrammingRuby/

# 3
#   Q:  A method that substitutes part of a string
#   A:  
$sentence = "hello, this is a sentence"
$sentence.sub! 'hello', 'yo'
puts($sentence)

# 4
#   Q:  Information about Ruby's regex
#   A:  http://ruby-doc.org/core-2.1.1/Regexp.html
#       http://rubular.com/ ruby regex editor

# 5
#   Q:  Information about Ruby's ranges
#   A:  http://ruby-doc.org/core-2.0/Range.html

# do:
# 1
#   Q:  Hello World
#   A:
puts("Hello, world.")

# 2
#   Q:  Find the index of "Ruby" in the string "Hello, Ruby"
#   A:
"Hello, Ruby".index('Ruby')

# 3
#   Q:  Print your name ten times
#   A:
$i = 0
$num = 10
while $i < $num
    puts("ceruleus")
    $i += 1
end

# 4
#   Q:  Print the string “This is sentence number 1,” where the number 1
#       changes from 1 to 10
#   A:
$i = 0
$num = 10
while $i < $num
    $i += 1
    puts("this is sentence number " + $i.to_s)
end

# 5
#   Q:  Run a Ruby program from a file
#   A:  ruby day1self-study.rb

# bonus
#   Q:  Bonus problem: If you’re feeling the need for a little more, write
#       a program that picks a random number. Let a player guess the
#       number, telling the player whether the guess is too low or too high.
#       (Hint: rand(10) will generate a random number from 0 to 9, and
#       gets will read a string from the keyboard that you can translate to
#       an integer.)
#   A:
$done = false
$ans = rand(10)
    puts("guess a number 0-9")
while not $done
    $guess = Integer(gets.chomp)
    if $guess == $ans
        puts("yup!")
        $done = true
    else
        puts("nope.")
    end
end