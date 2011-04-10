# Lib used to determine browser version in Rails app

class BrowserDetector
  def initialize(request)
    @browser_data = request
    @user_agent = @browser_data.env['HTTP_USER_AGENT'] ?
      @browser_data.env['HTTP_USER_AGENT'].downcase : ''
  end

  def name
    agent = @user_agent
    if agent =~ /msie/i; return :ie
    elsif agent =~ /konqueror/i; return :konqueror
    elsif agent =~ /chrome/i; return :chrome
    elsif agent =~ /gecko/i; return :mozilla
    elsif agent =~ /opera/i; return :opera
    elsif agent =~ /applewebkit/i; return :safari
    else; return :else
    end
  end

  def version
    agent = @user_agent
    begin

      if agent =~ /msie/i
        agent.split(';').second.split(' ').second
      elsif agent =~ /konqueror/i
        agent.split('konqueror/').second.split(' ').first
      elsif agent =~ /chrome/i
        agent.split('chrome/').second.split(' ').first
      elsif agent =~ /gecko/i
        agent.split('firefox/').second.split(' ').first
      elsif agent =~ /opera/i
        agent.split('opera/').second.split(' ').first
      elsif agent =~ /applewebkit/i
        agent.split('safari/').second.split(' ').first
      else
        "Unknown"
      end
    rescue
      return "Unknown"
    end
  end

  def main_version
    agent = @user_agent

    begin
      if agent =~ /msie/i
        agent.split(';').second.split(' ').second.split('.').first.to_i
      elsif agent =~ /konqueror/i
        agent.split('konqueror/').second.split(' ').first.split('.').first.to_i
      elsif agent =~ /chrome/i
        agent.split('chrome/').second.split(' ').first.split('.').first.to_i
      elsif agent =~ /gecko/i
        agent.split('firefox/').second.split(' ').first.split('.').first.to_i
      elsif agent =~ /opera/i
        agent.split('opera/').second.split(' ').first.split('.').first.to_i
      elsif agent =~ /applewebkit/i
        agent.split('safari/').second.split(' ').first.split('.').first.to_i
      else
        "Unknown"
      end
    rescue
      return "Unknown"
    end
  end

  def is_ie6
    return true if self.name == :ie && self.main_version == 6
    return false
  end

  def is_ie7
    return true if self.name == :ie && self.main_version == 7
    return false
  end

  def is_ie8
      return true if self.name == :ie && self.main_version >= 8
      return false
  end

  def is_old_ie
    true if is_ie6 || is_ie7
  end

end
