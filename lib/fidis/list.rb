# Fidis List Library

def lset(key, lval)
  if key.instance_of?(Symbol)
    if lval.instance_of?(Array)
      $DB[key] = lval
      700
    else
      error "KeyValueError: Only List Values are Supported", 705
    end
  else
    error "KeyValueError: Keys can only be Symbols", 705
  end
end
