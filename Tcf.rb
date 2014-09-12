begin
    begin
        raise "Foo"
    rescue => detail
        puts "Inner Catch"
        raise detail
    ensure
        puts "Inner Finally"
    end
rescue
    puts "Outer Catch"
ensure
    puts "Outer Finally"
end
