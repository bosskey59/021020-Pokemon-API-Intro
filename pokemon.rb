class Pokemon
    attr_accessor :name, :base_experience, :height, :weight, :url, :id 
    @@all = []

    def initialize(name, url)
        @name= name
        @url = url
        @@all << self
    end

    def self.all
        @@all
    end

end