
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
2DList := List clone;
2DList lists := List clone; // list of lists
2DList dim := method( x, y,
    for(i, 0, y-1,
        newList := List clone;
        for(j, 0, x-1,
            newList append(nil)
        );
        self lists append(newList);
    );
);

2DList set := method( x, y, value,
    self lists at(x) atPut( y, value );
);

2DList get := method( x, y,
    return self lists at(x) at(y);
);

// Test
list_o_lists := 2DList clone;
list_o_lists dim(5,5);
list_o_lists set(3,4,"HELLO");
list_o_lists get(3,4) println;
list_o_lists get(4,4) println;


// 6. Bonus: Write a transpose method so that (new_matrix get(y, x)) ==
// matrix get(x, y) on the original list.

// 7. Write the matrix to a file, and read a matrix from a file.

// 8. Write a program that gives you ten tries to guess a random number
// from 1–100. If you would like, give a hint of “hotter” or “colder”
// after the first guess.

