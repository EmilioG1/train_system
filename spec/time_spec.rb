require 'spec_helper'


describe 'Time' do

  describe('#==') do
    it('is the same time if it has same attributes as another time') do
      time1 = Train_Time.new({:arrive_time => '01:01:01', :id => nil})
      time2 = Train_Time.new({:arrive_time => '01:01:01', :id => nil})
      expect(time1).to(eq(time2))
    end
  end

  describe('.all') do
    it('returns an empty array when there are no times') do
      expect(Train_Time.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a time') do
      time1 = Train_Time.new({:arrive_time => '01:01:01', :id => nil})
      time1.save
      time2 = Train_Time.new({:arrive_time => '01:01:22', :id => nil})
      time2.save
      expect(Train_Time.all).to(eq([time1,time2]))
    end
  end
  
  describe('.clear') do
    it('clears all times') do
      time1 = Train_Time.new({:arrive_time => '01:01:01', :id => nil})
      time1.save
      time2 = Train_Time.new({:arrive_time => '01:01:22', :id => nil})
      time2.save
      Train_Time.clear
      expect(Train_Time.all).to(eq([]))
    end
  end
  
  describe('#delete') do
    it('deletes a time by id') do
      time1 = Train_Time.new({:arrive_time => '01:01:01', :id => nil})
      time1.save
      time2 = Train_Time.new({:arrive_time => '01:01:22', :id => nil})
      time2.save
      time1.delete
      expect(Train_Time.all).to(eq([time2]))
    end
  end
  
  describe('#update') do
    it('updates a time by id') do
      time1 = Train_Time.new({:arrive_time => '01:01:01', :id => nil})
      time1.save
      time2 = Train_Time.new({:arrive_time => '01:01:22', :id => nil})
      time2.save
      time1.delete
      expect(Train_Time.all).to(eq([time2]))
    end
  end
  
  describe('.find') do
    it('finds a time by id') do
      time1 = Train_Time.new({:arrive_time => '01:01:01', :id => nil})
      time1.save
      time2 = Train_Time.new({:arrive_time => '01:01:22', :id => nil})
      time2.save
      expect(Train_Time.find(time1.id)).to(eq(time1))
    end
  end
end