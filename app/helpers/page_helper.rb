=begin
  Developer:      Varun
  Purpose:        for sharing common code section in fron end pages
=end
module PageHelper
  #function for removing white space tab nextline
  def remove_space(arg)
    return arg.delete(" \t\r\n")
  end
end
