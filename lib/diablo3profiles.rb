require "diablo3profiles/version"
require "httparty"

module Diablo3profiles
  include HTTParty
  base_uri "https://us.api.battle.net/d3"

  def self.find(id)
  	get("/profile/#{id}/?locale=en_US&apikey=3pk433rfduzst7zhkjppmsv69egud7jm")
  end

end

Diablo3profiles.find("farish-1632")