require 'spec_helper'

describe 'Train' do

  before(:each) do
    @time = Train_Time.new({:arrive_time => '01:01:01', :id => nil})
    @time.save
  end  
  
  describe('.all') do
    it('returns an empty array when there are no times') do
      expect(Train.all).to(eq([]))
    end
  end
  
  describe('.clear') do
    it('clears all trains') do
      train1 = Train.new({:name => 'Red', :time_id => @time.id, :id => nil})
      train1.save
      train2 = Train.new({:name => 'Orange', :time_id => @time.id, :id => nil})
      train2.save
      Train.clear
      expect(Train.all).to(eq([]))
    end
  end

  describe('#==') do
    it('is the same train if it has same attributes as another train') do
      train1 = Train.new({:name => 'Blue', :time_id => @time.id, :id => nil})
      train2 = Train.new({:name => 'Blue', :time_id => @time.id, :id => nil})
      expect(train1).to(eq(train2))
    end
  end

  describe('#update') do
    it("adds a city to an train") do
    train = Train.new({:name => "Blue", :time_id => @time.id, :id => nil})
    train.save
    city = City.new({:name => "San Francisco", :state => 'CA', :id => nil})
    city.save
    train.update({:city_name => "San Francisco"})
    expect(train.cities).to(eq([city]))
    end
  end

  describe('.find') do
    it('finds a train by id') do
      train1 = Train.new({:name => 'Blue', :time_id => @time.id, :id => nil})
      train1.save
      train2 = Train.new({:name => 'Green', :time_id => @time.id, :id => nil})
      train2.save
      expect(Train.find(train1.id)).to(eq(train1))
    end
  end

  describe('#delete') do
    it('deletes a train by id') do
      time2 = Train_Time.new({:arrive_time => '01:01:01', :id => nil})
      time2.save
      train1 = Train.new({:name => 'Blue', :time_id => @time.id, :id => nil})
      train1.save
      train2 = Train.new({:name => 'Green', :time_id => time2.id, :id => nil})
      train2.save
      train1.delete
      expect(Train.all).to(eq([train2]))
    end
  end

  describe('.find_time') do
    it('finds a time by train id') do
      time1 = Train_Time.new({:arrive_time => '01:01:01', :id => nil})
      time1.save
      train1 = Train.new({:name => 'Blue', :time_id => @time.id, :id => nil})
      train1.save
      expect(train1.time_id).to(eq([time1]))
    end
  end
end