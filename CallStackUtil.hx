package hxutils;

import haxe.Stack;
class CallStackUtil{

    static public function printStackItemHelper(s:StackItem):String {
        var str = "";
        switch(s) {
            case Module(m):
                str = "Module: "+m;
            case Method(c, m):
                str = "Method: "+c+" # "+m;
            case Lambda(v):
                str = "Lambda v: "+v;
            case FilePos(s, f, l):
            case CFunction:
                str = "CFunction";
        }

        return str;
    }


    static public function printStackItem(s:StackItem):String {
        switch(s) {
            case Module(_), Method(_, _), Lambda(_), CFunction:
                return "";
            case FilePos(s, f, l):
            {
                var si = "";
                if(s != null)
                    si = "StackItem";
                else
                    si = "null";
                return (f+" "+l +": "+printStackItemHelper(s));
            }
        }
    }

    static public function print() {
        #if debug
        var cs = Stack.callStack();
        cs.shift();
        cs.reverse();
        var str = "\n======== CallStackUtil.print ========\n";
        if(cs.length == 0) {
            str += "\nEmpty callstack!\nRunning debug build in release player?";
        }
        for(c in cs) {
            str +="\n"+printStackItem(c);
        }

        trace(str+"\n\n======== End CallStackUtil.print ========\n");
        #else
        trace("error CallStackUtil.print called without -debug flag in build");
        throw ("error CallStackUtil.print called without -debug flag in build");
        #end
    }
}
