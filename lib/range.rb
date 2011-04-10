# Małe rozszerzenie do klasy przedziałów - sprawdza czy przedział podany
# zawiera sie w naszym

class Range
  def overlap?(range)
    self.include?(range.first) || range.include?(self.first)
  end
end
