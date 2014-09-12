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
    puts "Outter Catch"
ensure
    puts "Outter Finally"
end
