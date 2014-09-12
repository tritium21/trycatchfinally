first = true
begin
    if first
        begin
            raise "Foo"
        rescue => detail
            puts "Inner Catch"
            raise detail
        ensure
            puts "Inner Finally"
        end
    end
rescue
    puts "Outer Catch"
    first = false
    puts "Retry fires the begin block again"
    retry
else
    puts "Else runs if there is no exceptions"
ensure
    puts "Outer Finally"
end
