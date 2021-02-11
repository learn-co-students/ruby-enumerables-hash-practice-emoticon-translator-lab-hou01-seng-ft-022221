require"yaml"

def load_library(path)
 response = {}
 library= YAML.load_file(path)
 library.each do |names , emojis|
  response[names] = { :english => "#{emojis[0]}", :japanese => "#{emojis[1]}" }
end
response
end 

def get_japanese_emoticon(path, emoji)
  library = load_library(path)
  response = nil
  library.each do |name , emojis|
      english = emojis[:english]
      japanese = emojis[:japanese]
      if emoji == english
        response = japanese
      end
     end
        if response == nil
         response = "Sorry, that emoticon was not found"
   end 
  response
 end 

def get_english_meaning(path, emoji)
  library = load_library(path)
  response = nil
  library.each do |name , emojis|
    english = emojis[:english]
      japanese = emojis[:japanese]
      if emoji == japanese
        response = name
      end
    end 
    if response == nil
      response = "Sorry, that emoticon was not found"
    end 
    response 
  end
    