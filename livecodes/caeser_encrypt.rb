  def encrypt(sentence, n)
  result = ""
  # Create alphabet
  alphabet = Array('a'..'z')
  # Rotates the alphabet many times as Caesar number
  rotation = alphabet.rotate(n)
  # Encrypted alphabet (creates a hash ex. "a" => "d" )
  encrypted = {}
  alphabet.each_with_index { |e, i| encrypted[e] = rotation[i] }
    # Split the sentene into an array
  letters = sentence.split("")
    # Encrypt every letter
  letters.map do |e|
    if (("a".."z").include? e)
      result << encrypted[e]
    else
      result << e
    end
  end
  return result
end



puts "Write a sentence"
input = gets.chomp.downcase
puts "Write a caesar number"
n = gets.chomp.to_i

encrypted_message = encrypt(input, n)
puts encrypted_message
puts "Decrypt?"
gets.chomp
puts encrypt(encrypted_message, -n)

