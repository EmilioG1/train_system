require 'rspec'
require 'pry'
require 'spec_helper'
require 'city'

describe 'City' do

  describe('#==') do
    it('is the same city if it has same attributes as another city') do
      city1 = City.new({:name => 'Portland', :state => 'OR', :id => nil})
      city2 = City.new({:name => 'Portland', :state => 'OR', :id => nil})
      expect(city1).to(eq(city2))
    end
  end

  describe('.all') do
    it('returns an empty array when there are no cities') do
      expect(City.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a cities') do
      city1 = City.new({:name => 'Portland', :state => 'OR', :id => nil})
      city1.save
      city2 = City.new({:name => 'Boston', :state => 'MA', :id => nil})
      city2.save
      expect(City.all).to(eq([city1,city2]))
    end
  end
  
  describe('.clear') do
    it('clears all cities') do
      city1 = City.new({:name => 'Portland', :state => 'OR', :id => nil})
      city1.save
      city2 = City.new({:name => 'Boston', :state => 'MA', :id => nil})
      city2.save
      City.clear
      expect(City.all).to(eq([]))
    end
  end
  
  describe('#delete') do
    it('deletes a city by id') do
      city1 = City.new({:name => 'Portland', :state => 'OR', :id => nil})
      city1.save
      city2 = City.new({:name => 'Boston', :state => 'MA', :id => nil})
      city2.save
      city1.delete
      expect(City.all).to(eq([city2]))
    end
  end
  
  describe('#update') do
    it('updates a city by id') do
      city1 = City.new({:name => 'Portland', :state => 'OR', :id => nil})
      city1.save
      city2 = City.new({:name => 'Boston', :state => 'MA', :id => nil})
      city2.save
      city1.delete
      expect(City.all).to(eq([city2]))
    end
  end
  
  describe('.find') do
    it('finds a city by id') do
      city1 = City.new({:name => 'Portland', :state => 'OR', :id => nil})
      city1.save
      city2 = City.new({:name => 'Boston', :state => 'MA', :id => nil})
      city2.save
      expect(City.find(city1.id)).to(eq(city1))
    end
  end
end