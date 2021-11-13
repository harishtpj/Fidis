# Fidis - File Based Redis Store
require "./lib/fidis.rb"
require "pry"
require "optparse"

$DB = {}
$ENV = {
  version: 1.0,
  author: "M.V.Harish Kumar"
}

options = {}
OptionParser.new do |opts|
  opts.on("-v", "--version", "Returns version of Application") do |v|
    puts "Fidis v#{$ENV[:version]}"
  end

  opts.on("-c", "--console", "Opens Fidis Shell") do |c|
    Pry.config.windows_console_warning = false
    Pry.config.prompt = Pry::Prompt.new(
      "Fidis",
      "prompt for fidis",
      [proc { "Fidis$>> " }]
    )
    puts "Welcome to Fidis v#{$ENV[:version]}"
    puts "Created By #{$ENV[:author]}"
    puts
    Pry.start( :prompt => :fidis )
  end

  opts.on("-lFNAME", "--load=FNAME", "Loads .yml data file") do |v|
    $DB = YAML::load_file(v)
  end

end.parse!
