module ApplicationHelper
  
  def orcid_authorize_url
    base_url = ENV['ORCID_SANDBOX'] == "true" ? "https://sandbox.orcid.org" : "https://orcid.org"
     
    base_url + '/oauth/authorize?client_id=' + ENV['ORCID_CLIENT_ID'] \
    + '&response_type=code&scope=/read-limited%20/person/update%20/activities/update&redirect_uri=' \
    + url_for(action: 'orcid', controller: 'users/omniauth_callbacks', only_path: false) \
    + '&state=' + session['omniauth.state'] 
  end
  
  def orcid_id_full(uid)
    base_url = ENV['ORCID_SANDBOX'] == "true" ? "https://sandbox.orcid.org" : "https://orcid.org"
    base_url + "/#{uid}"
  end
  
end
