module PageHelper
  #function for removing white space tab nextline
  def remove_space(arg)
    return arg.delete(" \t\r\n")
  end
end
