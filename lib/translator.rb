require 'pry'
require 'yaml'

def load_library(path)
  final_hash = {}
    # enumerate over YAML file
    YAML.load_file(path).each do |key, value|
      # create an inner hash
      final_hash[key] = {} 
        # add new_symbols to inner hash keys
        final_hash[key][:english] = value[0]
        final_hash[key][:japanese] = value[1]
      # binding.pry
  end
  final_hash
end

def get_japanese_emoticon(path, emoticons)
  load_library(path).each do |key, value|
    if value[:english] == emoticons
      return value[:japanese]
    #binding.pry
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticons)
  
  load_library(path).each do |key, value|
    if value[:japanese] == emoticons
      return key
    end
  end
  return "Sorry, that emoticon was not found"
end