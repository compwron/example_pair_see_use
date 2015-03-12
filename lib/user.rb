require 'pair_see'
require 'pry'

class User
  def initialize
    # log_lines = PairSee::LogLines.new('.', '0-1-1')
    # s = PairSee::Seer.new(log_lines, 'config/config.yml')
    # p s.commits_not_by_known_pair
    # p s.all_most_recent_commits
    # p s.recommended_pairings
    # p s.pretty_card_data
    # p s.cards_per_person
    # p s.all_commits

    options1 = {
      names: %w(Person1 Person2 Person3),
      card_prefix: 'FOO-',
      after_date: '2000-12-31',
      repo_location: '.', # cannot have both log lines and repo location
    }
    s1 = PairSee::Seer.new(options1)
    _all_usages(s1)

    options2 = {
      names: %w(Person1 Person2 Person3),
      card_prefix: 'FOO-',
      after_date: '2000-12-31',
      log_lines: [ # cannot have both log lines and repo location
        OpenStruct.new(date: Time.now, message: 'commit message 1'),
        OpenStruct.new(date: Time.now, message: 'commit message 2')
      ]
    }
    s2 = PairSee::Seer.new(options1)
    _all_usages(s2)
  end

  def _all_usages(seer)
    p seer.commits_not_by_known_pair
    p seer.all_most_recent_commits
    p seer.recommended_pairings
    p seer.pretty_card_data
    p seer.cards_per_person
    p seer.all_commits
  end
end
