class Campaign
  attr_reader :id
  attr_reader :name
  attr_reader :status
  attr_reader :amount

  def initialize(api_campaign)
    debugger
    puts "asdfsd"
    @id = api_campaign[:id]
    @name = api_campaign[:name]
    @status = api_campaign[:status]
    @amount = api_campaign[:amount]
  end

  def self.get_campaigns_list(response)
    result = {}
    if response[:entries]
      response[:entries].each do |api_campaign|
        campaign = Campaign.new(api_campaign)
        result[campaign.id] = campaign
      end
    end
    return result
  end
end