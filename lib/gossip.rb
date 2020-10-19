require 'csv'
require 'sinatra'

class Gossip
  attr_accessor :author, :content

  def initialize(author,content)
    @author = author
    @content = content
  end

  # Sauvegarde chaque gossip dans un fichier csv, n'écrase pas les lignes ayant déjà du contenu
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      gossip = Gossip.new(csv_line[0], csv_line[1])
      all_gossips << gossip
    end
    return all_gossips
  end

  def self.find(id)
    all_gossips = self.all
    x = id.to_i
    x = x - 1
    puts all_gossips[x].author
    puts all_gossips[x].content
    return all_gossips[x]
  end

  # def self.update
  #   all_gossips = self.all
  #     CSV.open("./db/gossip.csv", "w") do |csv|
  #       gossips.each.with_index do |x|

  #     end
  #   end
  # end





end
