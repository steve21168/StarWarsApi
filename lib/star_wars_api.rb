class StarWarsApi
  def self.get_characters
    results = []
    url = 'http://swapi.co/api/people/'
    page_num = 0

    loop do
      loading(page_num)
      response = RestClient.get(url)
      parsed = JSON.parse(response)
      results << parsed["results"]
      url = parsed["next"]
      page_num += 1
      break unless parsed["next"]
    end
    complete
    results.flatten!

    return results unless block_given?
    results.map {|result| yield(result)}
  end
end
