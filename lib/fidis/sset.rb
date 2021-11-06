# Fidis Symbol Set Library
require "set"

def sset(key, sval)
  if key.instance_of?(Symbol)
    if sval.instance_of?(Array)
      if sval.all? {|x| x.instance_of?(Symbol) && $DB[x] != nil}
        $DB[key] = sval.to_set
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
