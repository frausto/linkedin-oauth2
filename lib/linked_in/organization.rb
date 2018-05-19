require 'time'
module LinkedIn
  # Organization APIs
  
  class Organization < APIResource

    def org_search(keywords)
      path = "/search?q=companiesV2&baseSearchParams.keywords=#{CGI.escape(keywords)}"
      results = get(path)
    end

    def org_by_email(email)
      path = "/organizations?q=emailDomain&emailDomain=#{CGI.escape(email)}"
      results = get(path)
      
    end
    
  end
end
