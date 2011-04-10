# Rozszerzenie do activerecord::base i do acts_as_tree ktore umozliwia
# korzystnaie z paru dodatkowych metod

# Wymaga do działania bibliotekli rand.rb
# http://raa.ruby-lang.org/project/rand/

class ActiveRecord::Base
  def has_children?
    !self.children.size.zero?
  end

  def has_siblings?
    !self.siblings.size.zero?
  end

  # Return the tree depth
  def depth
    return 0 unless has_children?
    children.inject(0) {|dep,c| dep > c.depth ? dep : c.depth} + 1
  end

  # Return the tree width
  def width
    return 1 unless has_children?
    children.inject(0) {|sum,c| sum + c.width}
  end

  # Ile węzłów mamy do roota z miejsca gdzie jesteśmy
  def nodes_to_root
    stop = false
    levels = 0
    parent = self.parent_id
    while !stop
      el =  parent ? self.class.find(parent) : nil
      if el
        parent = el.parent_id
        levels += 1
      else
        stop = true
      end
    end
    levels
  end

  # Sprawdza czy nasz rodzic w ogole istnieje
  def valid_parent?
    self.class.exists?(self.parent_id.to_i)
  end

  # Znajduje korzeń i zwraca go
  def root
    el = self
    nodes_to_root.times {
        el = self.parent
    }
    el
  end

  def leaf(random = false)
    unless self.has_children?
      return self
    end

    children = random ? self.children.shuffle : self.children

    children.each { |child|
      return child.leaf(random)
    }
    nil
  end

end

#ActiveRecord::Base.send(:include, ActiveRecordExtensions)

