from __future__ import print_function

try:
    try:
        try:
            raise Exception("Foo")
        except Exception as e:
            print('Inner Catch')
            raise
        finally:
            print('Inner Finally')
    except Exception as e:
        print('Outer Catch')
    finally:
        print('Outer Finally')
except:
    pass
else:
    print("Else runs if no exception is raised")
finally:
    print("Finally always runs")
