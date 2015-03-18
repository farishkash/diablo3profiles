require "diablo3profiles/version"
require "httparty"

module Diablo3profiles
  include HTTParty
  base_uri "https://us.api.battle.net/d3"

  attr_accessor :battleTag, :heroes

  def initialize(battleTag, heroes)
  	self.battleTag = battleTag
  	self.heroes = heroes
  end


  def self.find(battleTag)
  	response = get("/profile/#{battleTag}/?locale=en_US&apikey=YOURAPIKEY")
  	if response.success?
  		self.new(response["heroes"])
  	else
  		raise response.response
  	end
  end

end

Diablo3profiles.find("your profile, replace hash with hyphen example john#1422 should be john-1422")