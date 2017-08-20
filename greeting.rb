def greeting
  ARGV[1..ARGV.length].each do |name|
    puts "#{ARGV[0]} #{name}"
  end
end

greeting
