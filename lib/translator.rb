# require modules here
require "yaml"
require "pry"

def load_library(ymlpage)
  # code goes here
  english = "english_emoticon"
  japanese = "japanese_emoticon"
  final_result = [ ]
  
  emoticons = YAML.load_file(ymlpage)
  emoticons.each_with_object({}) do |(key, value)|
    hash = {"#{key}" => {english: value.first, japanese: value.last}}
    final_result.push(hash)
  end
  final_result = final_result.reduce Hash.new, :merge
  return final_result
end

def get_japanese_emoticon(ymlpage, emoticon)
  # code goes here
  j_emoji = ""
  emoticons = load_library('./lib/emoticons.yml')
  emoticons.each_with_object({}) do |(key, value)|
    if emoticons.dig(key, :english) == emoticon
      j_emoji = emoticons.dig(key, :japanese)
      return j_emoji
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(ymlpage, emoticon)
  # code goes here
  emoji_meaning = ""
  emoticons = load_library('./lib/emoticons.yml')
  emoticons.each_with_object({}) do |(key, value)|
    if emoticons.dig(key, :japanese) == emoticon
      emoji_meaning = key
      return emoji_meaning
    end
  end
  return "Sorry, that emoticon was not found"
end