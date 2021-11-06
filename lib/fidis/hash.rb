# Fidis Hash Library
require 'terminal-table'


def hset(key, **hval)
  if key.instance_of?(Symbol)
      $DB[key] = hval
      700
  else
    error "KeyValueError: Keys can only be Symbols", 705
  end
end

def hpush(key, **hval)
  if key.instance_of?(Symbol)
    hash = $DB[key]
    if hash.instance_of?(Hash)
      hval.each do |hkey, val|
        hash[hkey] = val
      end
      700
    else
      error "KeyValueError: Keys Values can only be Hashes", 705
    end
  else
    error "KeyValueError: Keys can only be Symbols", 705
  end
end

def hget(key)
  if key.instance_of?(Symbol)
    hash = $DB[key]
    if hash.instance_of?(Hash)
      table = Terminal::Table.new title: "Hash :#{key}", headings: ["Key","Value"] do |t|
        hash.each do |hkey, val|
          t << [hkey, val]
        end
      end
      puts table
      700
    else
      error "KeyValueError: Keys Values can only be Hashes", 705
    end
  else
    error "KeyValueError: Keys can only be Symbols", 705
  end
end
