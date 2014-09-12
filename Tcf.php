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
    echo "Outter Catch\n";
}
finally {
    echo "Outter Finally\n";
}
?>
