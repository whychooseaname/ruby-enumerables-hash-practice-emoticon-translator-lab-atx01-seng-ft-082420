# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  # code goes here
  response_hash={}
  library=YAML.load_file(file_path)
  library.each do |meaning, emoticon|
    response_hash[meaning]={}
    response_hash[meaning][:english]= emoticon[0]
    response_hash[meaning][:japanese]=emoticon[1]
  end
  response_hash
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  emoticon = library.keys.find do |key|
    library[key][:english] == emoticon
  end
  emoticon ? library[emoticon][:japanese] : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  emoticon = library.keys.find do |key|
    library[key][:japanese] == emoticon
  end
  emoticon ? emoticon : "Sorry, that emoticon was not found"
end

#library=> {"angel"=>{:english=>"O:)", :japanese=>"☜(⌒▽⌒)☞"},
