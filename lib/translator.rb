# require modules here
require "yaml"
require "pry"

def load_library(e)
 e = YAML.load_file("lib/emoticons.yml")
 new_hash = {}
e.each do |key, value|
  new_hash[key] = {english: value[0], japanese: value[1]}
end
new_hash
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  load_library(path).each do |key, value|
    if value[:english] == emoticon
      return value[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  # code goes here
  load_library(path).each do |key, value|
    if value[:japanese] == emoticon
      return key
    end
  end
  return "Sorry, that emoticon was not found"
end