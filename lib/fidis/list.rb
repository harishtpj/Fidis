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

def lpush(key, lval)
  if key.instance_of?(Symbol)
    if (lval.instance_of?(Integer) || lval.instance_of?(Float) || lval.instance_of?(String))
      $DB[key].prepend(lval)
      700
    else
      error "KeyValueError: KeyValueError: Values only Support [Integer, Float, String]", 705
    end
  else
    error "KeyValueError: Keys can only be Symbols", 705
  end
end

def rpush(key, lval)
  if key.instance_of?(Symbol)
    if (lval.instance_of?(Integer) || lval.instance_of?(Float) || lval.instance_of?(String))
      $DB[key].append(lval)
      700
    else
      error "KeyValueError: KeyValueError: Values only Support [Integer, Float, String]", 705
    end
  else
    error "KeyValueError: Keys can only be Symbols", 705
  end
end
