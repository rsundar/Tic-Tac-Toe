class Player
    attr_reader :name, :marker
    attr_writer :name
    #Need to use 2 arguments to initialize, hence a default value
    def initialize(name,marker="Default Name") 
        @name = name
        @marker = marker
    end
end