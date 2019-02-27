module DashboardHelper
  
  def format_orcid_token_expiry(expiry)
    Time.at(expiry).to_datetime.strftime("%B %d, %Y at %I:%M %p")
  end
  
  def format_date_authorized(datetime)
    datetime.localtime.strftime("%B %d, %Y at %I:%M %p")
  end
  
end
