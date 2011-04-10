class Hash
  # Zamienia podany hash na zestaw parametrów do linka ?menu=123&cos=12
  def to_url_params
    elements = []
    keys.size.times do |i|
      elements << "#{CGI::escape(keys[i])}=#{CGI::escape(values[i])}"
    end
    elements.join('&')
  end

  # Zamienia parametry urla na hash ?menu=123&cos=12 => {:menu => 123, :cos => 12}
  def self.from_url_params(url_params)
    result = {}.with_indifferent_access
    url_params.split('&').each do |element|
      element = element.split('=')
      result[element[0]] = element[1]
    end
    result
  end
end
