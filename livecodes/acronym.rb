def acr(x)
  x.split.map { |word| word[0].upcase }.join
end

puts acr("united states of america")


class String
  def to_acro
    self.split.map { |word| word[0].upcase }.join
  end
end

puts "united states".to_acro
