#include <iostream>
#include <string>
using namespace std;

// Thanks to kobok on sorcerynet irc for providing a proper c++ example.
 
class Finally {
  string msg;
  public:
  Finally(string msg) : msg(msg) { }
  ~Finally() { cout << msg; }
};
 
int main() {
    Finally f("Outer Finally\n");
    try {
        Finally f("Inner Finally\n");
        try {
            throw "Foo";
        }
        catch (const char* e) {
            cout << "Inner Catch\n";
            throw e;
        }
    }
    catch (const char* e) {
        cout << "Outer Catch\n";
    }
    return 0;
}
