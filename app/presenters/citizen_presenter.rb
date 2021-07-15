class CitizenPresenter < SimpleDelegator
  def initialize(citizens:, query:)
    @citizens = citizens
    @query = query
  end

  def filtered_citizens
    @filtered_citizens = search.result
  end

  def search
    @results ||= @citizens.ransack @query
  end
end
