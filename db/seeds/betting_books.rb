# frozen_string_literal: true
[
  { name: 'PrizePicks', enabled: true },
  { name: 'DraftKings', enabled: false },
  { name: 'FanDuel', enabled: false },
  { name: 'FantasyDraft', enabled: false }
].each do |book|
  BettingBook.find_or_create_by!(book)
end
