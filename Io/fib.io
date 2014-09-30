// (recursion)
NumberFun := Object clone
NumberFun fib := method( start, end, x, y,
    if( end == 0, return x )
    if( end == 1, return y )
    if( start == end, return y )
    temp := y
    y := y + x
    x := temp
    start = start + 1
    fib( start, end, x, y )
)

NumberFun fib( 0, 32, 1, 1 ) println 

// loops
NumberFun fib2 := method( start2, end2, x2, y2,
    while( start2 <= end2,
        if( end2 == 0, return x2 );
        if( end2 == 1, return y2 );
        if( start2 == end2, return y2 );
        temp2 := y2;
        y2 := y2 + x2;
        x2 := temp2;
        start2 = start2 + 1 );
)

NumberFun fib2( 0, 5, 1, 1 ) println 