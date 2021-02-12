require 'pry'
require "yaml"

  # code goes here
   

def load_library(path)
  
  
  emoji_lib = YAML.load_file(path)
  updated_lib={}
  
  emoji_lib.each do |name, emoji_array|
    updated_lib[name] = {:english => {},:japanese => {}}
    emoji_array.each_with_index do |emoji,index|
      if index==0  
        updated_lib[name][:english]=emoji
        elsif index==1 
        updated_lib[name][:japanese]=emoji
       end
   end
 end
 updated_lib  
 
end
 

def get_japanese_emoticon(path, emoticon)
  jap_string=""
  emoji_lib = load_library(path)

    emoji_lib.each do |name,hash| 
    
  if hash[:english]==emoticon
    jap_string=hash[:japanese]
  end
end

  if jap_string=="" 
    return "Sorry, that emoticon was not found"
  else
  jap_string
  end
  
  
end

















def get_english_meaning(path,emoticon)
  # code goes here
  
  
  emoji_lib = load_library(path)
  
  updated_lib={}
  
    emoji_lib.each do |name, emoji_hash|
  
     updated_lib[emoji_hash[:japanese]]=name
    
    end
  updated_lib[emoticon] or p "Sorry, that emoticon was not found"
  
end

