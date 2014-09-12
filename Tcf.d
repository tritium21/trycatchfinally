import std.stdio;
int main() {
    try {
        try {
            throw new Exception("Foo");
        }
        catch (Exception e) {
            writefln("Inner Catch");
            throw e;
        }
        finally {
            writefln("Inner Finally");
        }
    }
    catch (Exception e) {
        writefln("Outer Catch");
    }
    finally {
        writefln("Outer Finally");
    }
    return 0;
}
