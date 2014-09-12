try:
    try:
        raise Exception("Foo")
    except Exception as e:
        print 'Inner Catch'
        raise
    finally:
        print 'Inner Finally'
except Exception as e:
    print 'Outter Catch'
finally:
    print 'Outter Finally'
