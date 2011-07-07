# coding: utf-8
# Dodatkowe metody klasy string

class String

  # Czy cenzurowano a jesli tak to ile niedobrych słów było
  @censored_words = false

  # Zwraca strina bez polskich literek, z małej litery, z usuniętymi innymi
  # znakami oraz z zamienioną spacją na pauze (-)
  def to_url
    temp = self.downcase
    temp
    temp.gsub!(/[âäàãáäå�?ăąǎǟǡǻ�?ȃȧẵặ]/,'a')
    temp.gsub!(/[ëêéèẽēĕėẻȅȇẹȩęḙḛ�?ếễểḕḗệ�?]/,'e')
    temp.gsub!(/[�?iìíîĩīĭïỉ�?ịįȉȋḭɨḯ]/,'i')
    temp.gsub!(/[òóôõ�?�?ȯö�?őǒ�?�?ơǫ�?ɵøồốỗổȱȫȭ�?�?ṑṓ�?ớỡởợǭộǿ]/,'o')
    temp.gsub!(/[ùúûũūŭüủůűǔȕȗưụṳųṷṵṹṻǖǜǘǖǚừứữửự]/,'u')
    temp.gsub!(/[ỳýŷỹȳ�?ÿỷẙƴỵ]/,'y')
    temp.gsub!(/[ñǹń]/,'n')
    temp.gsub!(/[çć]/,'c')
    temp.gsub!(/[ß]/,'ss')
    temp.gsub!(/[œ]/,'oe')
    temp.gsub!(/[ĳ]/,'ij')
    temp.gsub!(/[�?ł]/,'l')
    temp.gsub!(/[ś]/,'s')
    temp.gsub!(/[źż]/,'z')
    temp.gsub!(/[^a-zA-Z 0-9]/, "")
    temp.gsub!(/\s/,'-')
    temp.gsub!(/\-+$/,'')
    temp.gsub!(/^\-+/,'')
    temp
  end

  # to_url tylko wykonane na sobie
  def to_url!
    self.replace self.to_url
  end

  # Zamienia znak nowej linii na <br>'a
  def nl2br
    self.gsub("\n\r","<br>").gsub("\r", "").gsub("\n", "<br />")
  end

  def nl2br!
    self.replace self.nl2br
  end

  # Przycina tekst do lenght znakow dodajac end_str na koncu
  def trim(length = 20, end_str = '...')
    if self.length > length
      return "#{self[0, length-end_str.length]}#{end_str}"
    end
    self
  end

  # trim tylko wykonane na sobie
  def trim!(length = 20, end_str = '...')
    self.replace self.trim(length, end_str)
    self
  end

  # Cenzuruje niechciane słowa na podstawie tego co jest w bazie i zwraca
  def censor(changer = '*')
    Censor.run(self, changer)
  end

  # To samo co wyżej tylko operuje na sobie
  def censor!(changer = '*')
    @censored_words =  Censor.amount(self)
    self.replace Censor.run(self, changer)
  end

  # Czy dany string został ocenzurowany
  def censored?
    @censored_words
  end

  # Zamiana CamelCase na underline
  def underlinize
    self.split(/(?=[A-Z])/).join('_').downcase
  end

  # Zamiana CamelCase na underline na sobie
  def underlinize!
    self.replace self.underlinize
    self
  end

  def is_number?
    self.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end

  # Allows you turning a string into a class if class with provided name exists
  # Examples:
  # "Fixnum".to_class #=> Fixnum
  # "Something".to_class #=> nil
  def to_class
      chain = self.split "::"
      klass = Kernel
      chain.each do |klass_string|
        klass = klass.const_get klass_string
      end
      klass.is_a?(Class) ? klass : nil
    rescue NameError
      nil
    end

  def camelize(first_letter_in_uppercase = true)
    if first_letter_in_uppercase
      self.to_s.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }
    else
      self.to_s[0].chr.downcase + camelize(self)[1..-1]
    end
  end

  def camelize!(first_letter_in_uppercase = true)
    self.replace self.camelize(first_letter_in_uppercase)
    self
  end

end
