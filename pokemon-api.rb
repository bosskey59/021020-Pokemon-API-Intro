# run file
require "pry"
require "rest-client"
require "json"
require_relative "pokemon"



resp= RestClient.get("https://pokeapi.co/api/v2/pokemon?offset=0&limit=151")
resp_hash = JSON.parse(resp.body, symbolize_names:true)
pokemon_ary= resp_hash[:results]

pokemon_ary.each do |pokemon|
    Pokemon.new(pokemon[:name], pokemon[:url])
end

Pokemon.all.each do |pokemon_inst|
    resp= RestClient.get(pokemon_inst.url)
    resp_hash = JSON.parse(resp.body, symbolize_names:true)
    # base_exp = resp_hash[:base_experience]
    # height = resp_hash[:height]
    # weight = resp_hash[:weight]
    # pokemon_inst.weight = weight
    # pokemon_inst.height = height
    # pokemon_inst.base_exp = base_exp

    # pokemon_inst.tap do |p|
    #     p.weight = weight
    #     p.height = height
    #     p.base_exp = base_exp
    # end

    resp_hash.each do |key, value|
        pokemon_inst.send("#{key}=", value) if pokemon_inst.respond_to?("#{key}=")
    end

end

binding.pry

true

# API - database that
# REST
# pokemon api free.