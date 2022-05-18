require 'rspec'
require 'pry'
require 'spec_helper'
require 'city'

describe 'City' do

  describe('#==') do
    it('is the same city if it has same attributes as another city') do
      city1 = City.new(:name => 'Portland', :state => 'OR', :id => nil)
      city2 = City.new(:name => 'Boston', :state => 'MA', :id => nil)
      expect(city1)to(eq(city2))
    end
  end

  describe('.all') do
    it('returns an empty array when there are no cities') do
      expect(City.all)to(eq([]))
    end
  end

  describe('.all') do
    it('returns an empty array when there are no cities') do
      expect(City.all)to(eq([]))
    end
  end
end