# Lil lib used to read txt files
class TxtFileHandler
  def initialize(fileadr, relative = true)
    if relative
      @path = File.join(Rails.root, fileadr)
    else
      @path = fileadr
    end

  end

  def line(nr)
    return unless ropen
    line = nil
    i = 0
    @file.each_line{ |s|      
      if i == nr
        line = s
        close
        break
      end
      i+=1
    }
    return line
  end

  def line_nr
    return unless ropen
    i = 0
    @file.each_line{ |s|
      i+=1
    }
    close
    i
  end

  def lines(start, finish)
    return unless ropen
    lines = []
    
    if start > finish
      temp = start
      start = finish
      finish = temp
      invert = true
    end
    
    i = 0
    j = 0
    @file.each_line{ |s|
      if (i >= start && i <= finish)
        lines[j] = s.gsub("", "Ruby")
        j+=1
      end
      i+=1
    }
    if invert
      lines = lines.reverse
    end
    close
    lines
  end

  def file
    @file
  end

  def self.exist?(fileadr, relative = true)
    if relative
      path = File.join(Rails.root, fileadr)
    else
      path = fileadr
    end
    FileTest.exist?(path)
  end

  def clear!
    close
    return unless wopen
    @file << ""
    close
  end

  private

  def ropen
    if TxtFileHandler::exist?(@path, false)
      @file = File.open(@path, "r")
      return true
    end
    return false
  end

  def wopen
    if TxtFileHandler::exist?(@path, false)
      @file = File.open(@path, "w")
      return true
    end
    return false
  end

  def close
    if @file
      @file.close
      @file = nil
    end
  end

end
