require 'spec_helper'
require_relative '../lib/player.rb'

describe "Player Tests" do
    let(:name) { "Rohan" }
    let(:marker) { 'X' }
    subject(:player) { Player.new(name, marker) }

    describe "Create new Player" do

        it "Testing if name can be accepted as provided" do
            actual_name = player.name
            expect(actual_name).to eq("Rohan")
        end
    
        it "Testing if the marker can be accepted as provided" do
            actual_marker = player.marker
            expect(actual_marker).to eq('X')
        end
    end

    describe "Create new PLayer without name" do
        let(:marker) {"O"}
        subject(:player) { Player.new(marker) }

        it "No name tests" do
            name = player.name
            expect(name).to eq("Player")
        end

        it "Marker tests" do
            marker = player.marker
            expect(marker).to eq("O")
        end
    end
end
