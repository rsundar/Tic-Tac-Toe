# frozen_string_literal: true
class Player
    attr_reader :name, :marker
    attr_writer :name
    # Need to use 2 arguments to initialize, hence a default value
    def initialize(name="Player", marker) 
        @name = name
        @marker = marker
    end
end