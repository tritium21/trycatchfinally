#include <iostream>
using namespace std;

int main () {
    try {
        try {
            throw "Foo";
        }
        catch (const char* e) {
            cout << "Inner Catch\n(C++ has no finally statement)\n";
            throw e;
        }
    }
    catch (const char* e) {
        cout << "Outer Catch\n(C++ has no finally statement)\n";
    }
    return 0;
}
