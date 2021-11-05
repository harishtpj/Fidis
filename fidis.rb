# Fidis - File Based Redis Store
require "./lib/fidis.rb"
require "pry"

$DB = {}
$ENV = {
  version: 1.0,
  author: "M.V.Harish Kumar"
}

Pry.config.windows_console_warning = false
Pry.config.prompt = Pry::Prompt.new(
  "Fidis",
  "prompt for fidis",
  [proc { "Fidis$>> " }]
)

puts "Welcome to Fidis v#{$ENV[:version]}"
puts "Created By #{$ENV[:author]}"
puts "Enter <help> for More info"
puts
Pry.start( :prompt => :fidis )
