class StarWarsApi
  def self.get_characters
    results = []
    url = 'http://swapi.co/api/people/'
    page_num = 0

    loop do
      self.loading(page_num)
      response = RestClient.get(url)
      parsed = JSON.parse(response)
      results << parsed["results"]
      url = parsed["next"]
      page_num += 1
      break unless parsed["next"]
    end
    self.complete
    results.flatten!

    return results unless block_given?
    results.map {|result| yield(result)}
  end

  def self.loading(page_num)
    icons = ['◐','◓','◑','◒']
    percent = "#{((page_num / 9.0) * 100).round(0)}%"

    icons.each do |icon|
      print "               ------#{icon} Loading #{percent} #{icon}------ \r"
      sleep 0.25
    end
  end

  def self.complete
    system 'clear'
    print "Complete!"
    sleep 1
  end
end
