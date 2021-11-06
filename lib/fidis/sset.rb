# Fidis Symbol Set Library
require "set"

def sset(key, sval)
  if key.instance_of?(Symbol)
    if sval.instance_of?(Array)
      if sval.all? {|x| x.instance_of?(Symbol) && $DB[x] != nil}
        $DB[key] = sval.to_set
        700
      else
        error "KeyValueError: A Symbol Set can only contain Symbols present in Fidis", 705
      end
    else
      error "KeyValueError: Only Set Values are Supported", 705
    end
  else
    error "KeyValueError: Keys can only be Symbols", 705
  end
end

def spush(key, val)
  if key.instance_of?(Symbol)
    if val.instance_of?(Symbol) && $DB[val] != nil
      if $DB[key].instance_of?(Set)
        $DB[key].add(val)
        700
      else
        error "KeyValueError: Keys Values can only be Sets", 705
      end
    else
      error "KeyValueError: A Symbol Set can only contain Symbols present in Fidis", 705
    end
  else
    error "KeyValueError: Keys can only be Symbols", 705
  end
end

def sget(key)
  if key.instance_of?(Symbol)
    set = $DB[key]
    if set.instance_of?(Set)
      table = Terminal::Table.new title: "Symbol Set :#{key}", headings: ["Key","Value"] do |t|
        set.to_a.each do |val|
          t << [val, $DB[val]]
        end
      end
      puts table
      700
    else
      error "KeyValueError: Keys Values can only be Symbol Sets", 705
    end
  else
    error "KeyValueError: Keys can only be Symbols", 705
  end
end
