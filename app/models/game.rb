class Game < ActiveRecord::Base
  attr_accessible :description, :genre, :id, :picture, :platform, :publisher, :title, :year
  
def self.by_first_letter(initial)
    all(:conditions => "title like '#{initial}%'")
end

def self.by_release_year(releaseyear)
    all(:conditions => "year like '#{releaseyear}%'")
end


def self.to_csv(options = {})
	CSV.generate(options) do |csv|
		csv << column_names
		all.each do |game|
			csv << game.attributes.values_at(*column_names)
		end
	end
 end
  
  def self.import(file)
	CSV.foreach(file.path, headers: true, :encoding => 'windows-1251:utf-8') do |row|
		Game.create! row.to_hash
	end
  end
  
  
end
