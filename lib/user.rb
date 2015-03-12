require 'pair_see'
require 'pry'

class User
  def initialize
    log_lines = PairSee::LogLines.new('.', '0-1-1')
    s = PairSee::Seer.new(log_lines, 'config/config.yml')
    p s.commits_not_by_known_pair
    p s.all_most_recent_commits
    p s.recommended_pairings
    p s.pretty_card_data
    p s.cards_per_person
    p s.all_commits
  end
end
