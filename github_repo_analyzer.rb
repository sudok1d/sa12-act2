require 'httparty'

def repo_analyzer(username)
  response = HTTParty.get("https://api.github.com/users/#{username}/repos")

  repos = JSON.parse(response.body)

  most_starred_repo = repos.max_by { |repo| repo["stargazers_count"] }

  repo_info = {
    name: most_starred_repo['name'],
    description: most_starred_repo['description'],
    stars: most_starred_repo['stargazers_count'],
    url: most_starred_repo['html_url']
  }

  if repo_info[:description] = ''
    repo_info[:description] = 'N/A'
  end

  puts "Most Starred Repo"
  puts "Name: #{repo_info[:name]}"
  puts "Description: #{repo_info[:description]}"
  puts "Number of stars: #{repo_info[:stars]}"
  puts "URL: #{repo_info[:url]}"
end


repo_analyzer('sudok1d')
