["new", "open", "hold", "resolved", "invalid"].each do |status|
  Status.create(:name => status)
end
