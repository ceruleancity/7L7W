// Do:
// • 1 - Enhance the XML program to add spaces to show the indentation
//   structure.
// • 2 - Create a list syntax that uses brackets.
// • 3 - Enhance the XML program to handle attributes: if the first argument
//   is a map (use the curly brackets syntax), add attributes to
//   the XML program. For example:
//   book({"author": "Tate"}...) would print <book author="Tate">:

// 1
Builder := Object clone
Builder level := 0
Builder genTabs := method(
    self tabs := ""
    if( self level == 0, return )
    for(i, 0, self level,
        self tabs := self tabs .. "\t"
    )
)

Builder forward := method(
    self genTabs
    writeln(tabs, "<" , call message name, ">" )
    level = level + 1
    self genTabs
    call message arguments foreach(
        arg,
        content := self doMessage(arg);
        if(content type == "Sequence" , writeln(tabs .. content)))
    level = level - 1
    self genTabs
    writeln(tabs, "</" , call message name, ">" ))
    
Builder ul(
    li("Io" ),
    li("Lua" ),
    li("JavaScript" ))
    
// 2 
OperatorTable addAssignOperator(":" , "appendVal" )
curlyBrackets := method(
    mySize := call message arguments size
    r := List clone
    for(i,0,mySize-1,
        r append(0)
    )
    call message arguments foreach(arg,
        r doMessage(arg)
        )
    r
)

List appendVal := method(
    self atPut(
        call evalArgAt(0) asNumber,
        call evalArgAt(1) asNumber
    )
)

myList := doString("{0:1,1:2,2:666}")
myList println

// 3
Builder forward := method(
    self genTabs
    writeln(tabs, "<" , call message name, ">" )
    level = level + 1
    self genTabs
    call message arguments foreach(
        arg,
        content := self doMessage(arg);
        if(content type == "Sequence" , writeln(tabs .. content)))
    level = level - 1
    self genTabs
    writeln(tabs, "</" , call message name, ">" ))
    
Builder ul(
    li("Io" ),
    li("Lua" ),
    li("JavaScript" ))