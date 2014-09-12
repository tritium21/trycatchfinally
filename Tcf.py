from __future__ import print_function

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
