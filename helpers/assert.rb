class Assert

  def equals (current, expected, message)
    check(current==expected,message)
  end


  def not_equal (current,expected, message)
    check(current==expected,message)
  end

  def check (bool,message)
    if bool
      puts 'OK'
    else
      puts 'Keine'
      puts message
    end
  end
end

