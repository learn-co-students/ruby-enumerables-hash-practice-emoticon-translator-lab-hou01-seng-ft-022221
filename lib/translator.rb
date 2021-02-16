# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  hash = {}
  emoticons = YAML.load_file(file_path)
  emoticons.each do |meaning, emoticon|
    hash[meaning] = {:english => emoticon[0], :japanese => emoticon[1]}
  end
  hash
end


def get_english_meaning(file_path, emote)
  meaning_return = "Sorry, that emoticon was not found"
  emoticons = load_library(file_path)
  emoticons.each do |meaning, emotes|
    if emotes[:japanese] == emote
      meaning_return = meaning
    end
  end
  meaning_return
end

def get_japanese_emoticon(file_path, emote)
  emote_return = "Sorry, that emoticon was not found"
  emoticons = load_library(file_path)
  emoticons.each do |meaning, emotes|
    if emotes[:english] == emote
      emote_return = emotes[:japanese]
    end
  end
  emote_return
end
