require 'yaml'

def load_library(file)
  emoticons_library = YAML.load_file(file)
  #loads emojis to library
  language_key = {}
  #initializes a has to store the formatted the library information
  emoticons_library.each do |key, value|
    #iterates a hash to store the formatted library information.
    language_key[key] = {}
    #make the first element, the title of the emoji a new hash.
    language_key[key][:english] = value[0]
    
    language_key[key][:japanese] = value[1]
  
  #Turns yaml to hash of hashes  
  end
  language_key
end

def get_english_meaning(file, japanese_emoji)
  library = load_library(file)
  
  english_name = library.keys.find do |key|
    library[key][:japanese] == japanese_emoji
  end
english_name ? english_name : "Sorry, that emoticon was not found"
end

def get_japanese_emoticon(file, english_emoji)
  library = load_library(file)
  
  english_emoji = library.keys.find do |key|
  library[key][:english] == english_emoji
  end
  
english_emoji ? library[english_emoji][:japanese] : "Sorry, that emoticon was not found"
end