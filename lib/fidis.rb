# Fidis Library
require "./lib/fidis/list.rb"
require "./lib/fidis/hash.rb"
require "./lib/fidis/sset.rb"
require "yaml"

def error(msg, ecode)
  puts msg
  ecode
end

def get(key)
  if key.instance_of?(Symbol)
    if $DB[key] != nil
      $DB[key]
    else
      error "NotFoundError: No value for Key #{key} found", 704
    end
  else
    error "KeyValueError: Keys can only be Symbols", 705
  end
end

def set(key, val)
  if key.instance_of?(Symbol)
    if (val.instance_of?(Integer) || val.instance_of?(Float) || val.instance_of?(String))
      $DB[key] = val
      700
    else
      error "KeyValueError: Values only Support [Integer, Float, String]", 705
    end
  else
    error "KeyValueError: Keys can only be Symbols", 705
  end
end

def listkeys
  puts $DB.keys
  ($DB.keys).length
end

def incr(key, incr_val=1)
  if $DB[key].instance_of?(Integer) || $DB[key].instance_of?(Float)
    $DB[key] += incr_val
  else
    error "KeyValueError: Only Floats and Integer Values can be incremented", 705
  end
end

def del(key)
  if $DB.delete(key) != nil
    700
  else
    error "NotFoundError: No value for Key #{key} found", 704
  end
end

def type(key)
  if key.instance_of?(Symbol)
    if $DB[key] != nil
      $DB[key].class
    else
      error "NotFoundError: No value for Key #{key} found", 704
    end
  else
    error "KeyValueError: Keys can only be Symbols", 705
  end
end

def clscr
  if Gem.win_platform?
    system("cls")
  else
    system("clear")
  end
end

def tkeys(type)
  if type.instance_of?(String)
    type = Object.const_get type
    count = 0
    $DB.each do |key, val|
      if val.instance_of?(type)
        puts key
        count += 1
      end
    end
    count
  else
    error "TypeError: Only [Integer, String, Float, Array, Hash] Types are Supported", 702
  end
end

def save(filename)
  File.open(filename + '.yml', 'w') { |f| f.write $DB.to_yaml}
end
