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

Dir["./*.ico"].each do |file|
  new_name = file.underscore

  File.rename file, new_name
end
