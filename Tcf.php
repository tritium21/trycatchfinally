<?php
try {
    try {
        throw new Exception("Foo");
    }
    catch (Exception $e) {
        echo "Inner Catch\n";
        throw $e;
    }
    finally {
        echo "Inner Finally\n";
    }
}
catch (Exception $e) {
    echo "Outer Catch\n";
}
finally {
    echo "Outer Finally\n";
}
?>
