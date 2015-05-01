Builder := Object clone
Builder forward := method(
	write("sender = ", call sender, "\n")
    write("message name = ", call message name, "\n")
    //args := call message argsEvaluatedIn(call sender)
    //args foreach(i, v, write("arg", i, " = ", v, "\n") )
	// need to print depth spaces here if nested
	writeln("<", call message name, ">")
	call message arguments foreach(
		arg,
		content := self doMessage(arg);
		// if sequence, need to print depth + 1 spaces here
		if(content type == "Sequence", writeln(content)))
	// need to print depth spaces here if nested
	writeln("</", call message name, ">"))

Builder ul(
			li("Io" ),
			li("Lua" ),
			li("JavaScript" ))