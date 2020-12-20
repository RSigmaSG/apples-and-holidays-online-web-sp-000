require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.each do |season, season_hash|
    season_hash.each do |holiday, supplies|
      if ((holiday == :christmas) || (holiday == :new_years))
        #binding.pry
        supplies.push(supply)
      end
    end
  end
  
  holiday_hash
  
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |season, season_hash|
    season_hash.each do |holiday, supplies|
      if (holiday == :memorial_day )
        #binding.pry
        supplies.push(supply)
      end
    end
  end
  
  holiday_hash
  

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  
  holiday_hash[season][holiday_name] = supply_array

  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  
  out_arr = []
  out_arr = holiday_hash.collect do |season, season_hash|
    if season == :winter
      season_hash.collect do |festival, supply_arr|
        supply_arr
      end
    end
  end
  out_arr.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  
  #out_string = ""
  
  holiday_hash.each do |season, season_hash|
    
    puts "#{season.to_s.capitalize}:"
    season_hash.collect do |festival, supply_arr|
        festival_arr = festival.to_s.split("_")
        festival_arr = festival_arr.collect do |word| 
          word.to_s.capitalize
        end
        festival_str = festival_arr.join(" ")
        puts "  #{festival_str}: #{supply_arr.join(", ")}"
    end
    
  end
  
  #puts out_string
  #out_string
  
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  
   out_arr = []
   
   holiday_hash.each do |season, season_hash|
    
    season_hash.each do |festival, supply_arr|
        supply_arr.select{|supply| supply == "BBQ"}.each{|supply| out_arr.push(festival)}
          
    end
    
  end
  
  out_arr

end







