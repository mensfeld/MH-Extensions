# To change this template, choose Tools | Templates
# and open the template in the editor.

class Date
  def self.from_scratches(s, name, model = :range)
    return nil if s.nil?
    return nil if  s[model].nil?
    self.civil(s[model][:"#{name}(1i)"].to_i,s[model][:"#{name}(2i)"].to_i,s[model][:"#{name}(3i)"].to_i)
  end
end

