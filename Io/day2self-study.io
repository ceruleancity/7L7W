// Do:
// 1. A Fibonacci sequence starts with two 1s. Each subsequent number
// is the sum of the two numbers that came before: 1, 1, 2, 3,
// 5, 8, 13, 21, and so on. Write a program to find the nth Fibonacci
// number. fib(1) is 1, and fib(4) is 3. As a bonus, solve the problem
// with recursion and with loops.
//     see fib.io

// 2. How would you change / to return 0 if the denominator is zero?
// Number / := method( Number, if(Number == 0, 0) )
// or maybe
// 0 dbz := method( Number, return 0 )
// Number / := method( Number, if( Number == 0, return Number dbz, return Number /) )

// 3. Write a program to add up all of the numbers in a two-dimensional
// array.
arr := List clone
arr := list(list(1,2),list(3,4),list(555,666));
len := arr size;
sum := 0;
for(i, 0, len-1,
    arr2 := arr at(i);
    len2 := arr2 size;
    for(j, 0, len2-1,
        val := arr2 at(j)
        sum = sum + val
        )
    );
sum println;

// 4. Add a slot called myAverage to a list that computes the average of
// all the numbers in a list. What happens if there are no numbers
// in a list? (Bonus: Raise an Io exception if any item in the list is not
// a number.)
List myAverage := method(
    sum := 0;
    len := self size;
    for( i, 0, len-1,
        sum = sum + self at(i);
    )
    return sum / len;
)

// test
arr := list(1,2,3,4,5)
"average of " print
arr print
": " print
arr myAverage println

// 5. Write a prototype for a two-dimensional list. The dim(x, y) method
// should allocate a list of y lists that are x elements long. set(x,y,
// value) should set a value, and get(x, y) should return that value.
TDList := List clone;
TDList lists := list(); // list of lists
TDList dim := method( x, y,
    if( self proto type == "List", return TDList clone dim( x, y ) )

    for(i, 0, y-1,
        newList := List clone;
        for(j, 0, x-1,
            newList append(nil)
        );
        self lists append(newList);
    );
    
    return self;
);

TDList set := method( x, y, value,
    self lists at(x) atPut( y, value );
);

TDList get := method( x, y,
    return self lists at(x) at(y);
);

TDList show := method(
    len_lists := self lists size;
    for(i, 0, len_lists-1,
        len_list := self lists at(i) size;
        for( j, 0, len_list-1,
            self lists at(i) at(j) print;
            " " print;
        )
        "" println;
    )
)

// Test
//list_o_lists := TDList clone;
//list_o_lists dim(2,5);
//list_o_lists set(4,1,"HELLO");
//list_o_lists show;

// 6. Bonus: Write a transpose method so that (new_matrix get(y, x)) ==
// matrix get(x, y) on the original list.
// TODO - Revisit this
TDList transpose := method(
    ret := TDList clone dim;
    // previous column size is self lists size, becomes new row size
    // previous row size is length of the first element of self lists, becomes new column size
    new_row_len := self lists size;
    new_column_len := self lists at(0) size;
    for(i, 0, new_column_len-1,
        new_list := List clone;
        for(j, 0, new_row_len-1,
            new_list atInsert(j, self lists at(i) at(j) );
        )
        ret lists atInsert(i, new_list);
    )
    return ret;
)

// 7. Write the matrix to a file, and read a matrix from a file.
TDList write := method( filename,
    f := File with(filename);
    f remove;
    f openForUpdating;
    len_lists := self lists size;
    for(i, 0, len_lists-1,
        len_list := self lists at(i) size;
        for( j, 0, len_list-1,
            f write(self lists at(i) at(j));
            f write(" ");
        )
        f write("\n");
    )
)

TDList read := method( filename,
    output := "";
    f := File with(filename);
    f openForReading;
    lines := f readLines;
    width := lines size;
    height := lines at(0) slicesBetween( "", " ") size;
    self dim(width, height);
    current_line := 0;
    lines foreach(line,
        line_list := line slicesBetween( "", " ");
        current_word := 0;
        line_list foreach( word,
            self set(current_line,current_word,word);
            current_word = current_word + 1;
        );
        current_line = current_line + 1;
    );
)

// myList := TDList clone
// myList dim(2,2)
// myList set(0,0,"Hello")
// myList set(1,0,"Hello")
// myList set(0,1,"Hello")
// myList set(1,1,"Hello")
// myList show
// myList write("file.txt")
// myList read("file.txt")
// myList show

// 8. Write a program that gives you ten tries to guess a random number
// from 1–100. If you would like, give a hint of “hotter” or “colder”
// after the first guess.
rand_num := (Random value( 99 ) + 1) floor;
rand_num print;
guess := 0;
prev_guess := guess;
diff := 0;
prev_diff := 0;
guesses := 0;
stdin := File standardInput;
loop := true;
while( loop == true,
    "Guess a number: " print;
    guess := stdin readLine asNumber;
    guesses = guesses + 1;
    if( guess == rand_num,
        ("you got it in " .. guesses .. " guesses!") print;
        loop = false;
    );
    diff = ( rand_num - guess ) abs;
    if( loop == true and guesses > 1,
        if( diff < prev_diff ) then("getting hotter!" println) elseif(diff == prev_diff) then("now you're on the other side of it!" println) else( "getting colder..." println)
    );
    
    prev_guess = guess;
    prev_diff = diff;
)
    


