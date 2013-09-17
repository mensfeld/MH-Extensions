# coding: utf-8
# Dodatkowe metody klasy string

include ActionView::Helpers::SanitizeHelper

class String

  def sanitize(options={})
    ActionController::Base.helpers.sanitize(self, options)
  end

  def sanitize!(options={})
    self.replace self.sanitize(options)
  end

  def strip_tags
    ActionView::Helpers::SanitizeHelper.strip_tags(self)
  end

  def strip_tags!
    self.replace strip_tags
  end

  # Zwraca strina bez polskich literek, z małej litery, z usuniętymi innymi
  # znakami oraz z zamienioną spacją na pauze (-)
  def to_url
    temp = self.to_slug.transliterate.to_s.downcase
    temp.gsub!(/[^a-zA-Z 0-9]/, "")
    temp.gsub!(/\s/,'-')
    temp.gsub!(/\-+$/,'')
    temp.gsub!(/^\-+/,'')
    temp.gsub!(/\-{2,}/, '-')
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

  # Zamiana CamelCase na underline
  def underlinize
    self.split(/(?=[A-Z])/).join('_').downcase.gsub("::_", "/")
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
