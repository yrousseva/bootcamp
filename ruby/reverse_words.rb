# Reverse the words in a sentence
# reverse("you can cage a swallow can't you?") => "you can't swallow a cage can you?"

def reverse_words(s)
  s.chop.split.reverse.join(" ") + "?"
end

s = "you can cage a swallow can't you?"
puts reverse_words(s)
