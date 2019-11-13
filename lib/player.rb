class Player
    attr_reader :name, :marker
    attr_writer :name
    def initialize(name,marker)
        @name = name
        @marker = marker
    end
end