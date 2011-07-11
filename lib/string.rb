class String
  def should_include? text
    if text.respond_to?("flatten")
      remainder = self
      text.collect {|s| s.empty? ? nil : s}.compact().each { |s|
        index = remainder.index(s)
        if not index
          fail expected(s, remainder)
        end
        remainder = remainder[(index + s.length)..-1]
      }
    else
      fail(expected(text)) unless self.include?(text)
    end
  end


  def should_not_include? text
    if text.respond_to?("flatten")
      text.collect {|s| s.empty? ? nil : s}.compact().each { |s|
        fail(unexpected(s)) if self.include?(s)
      }
    else
      fail(unexpected(text)) if self.include?(text)
    end
  end

  def remove_quotes
    self.gsub(/^'|'$/, "")
  end

  def remove_quotes!
    self.gsub!(/^'|'$/, "")
    return self
  end

  def normalize_spaces
    non_breaking_space = "\xC2\xA0"
    self.gsub(/(#{non_breaking_space}|[\s])+/m, ' ').strip
  end

  def normalize_spaces!
    self.replace self.normalize_spaces
  end

  def to_variable_name
    self.downcase.strip.gsub(' ', '_')
  end

   def to_date
    begin
      Date.strptime(self, '%d/%m/%Y').strftime('%Y-%m-%d')
    rescue
      raise "Date must be of the format dd/mm/yyyy, you put: #{self}"
    end
  end

  def to_date_and_time tz='+01:00'
    begin
      if self =~ /..\/..\/.... ..:..:../
        DateTime.strptime(self, '%d/%m/%Y %H:%M:%S').strftime("%Y-%m-%dT%H:%M:%S.000#{tz}")
      else
        Date.strptime(self, '%d/%m/%Y').strftime("%Y-%m-%dT%H:%M:%S.000#{tz}")
      end
    rescue
      raise "Date must be of the format dd/mm/yyyy or dd/mm/yyyy HH:MM, date=#{self}"
    end
  end

  private
  def expected(expected, actual=self)
     "Failed expectation:
  expected '#{expected}',
       got '#{actual.strip}'"
  end

  def unexpected(expected)
     "Expected to not find '#{expected}', got '#{self}'"
  end

end


