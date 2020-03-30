class String
  def underscore
    self.gsub(/::/, '/')
    .gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
    .gsub(/([a-z\d])([A-Z])/,'\1_\2')
    .gsub(/[ ]/, '_')
    .gsub(/[\(\)]/, '')
    .tr("-", "_")
    .downcase
  end
end

Dir["./*.ico"].sort.each do |file|
  new_name = file.underscore

  if new_name.start_with? './__'
    n = new_name.gsub(/^\.\/__([0-9]+)\.ico/, '\1').to_i + 347
    puts "#{new_name} -> #{n}.ico"
    File.rename file, "./#{n}.ico"
  else
    File.rename file, new_name
  end
end
