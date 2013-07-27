# Which alphabet characters are missing from the sentence

s = 'The quick brown fox jumped over the lazy dog'

chars = s.downcase.delete(" ").chars.uniq
missing = []
('a'..'z').each do |ch|
  if not chars.include?(ch)
    missing << ch
  end
end

puts "Missing characters: #{missing.join(",")}"