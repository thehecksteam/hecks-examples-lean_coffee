Gem::Specification.new do |s|
  s.name        = 'lean_coffee'
  s.version     = '2'
  s.licenses    = ['MIT']
  s.summary     = 'Lean Coffee'
  s.description = 'Collaborative, dynamic, just in time meetings'
  s.authors     = ["Lean Coffee Developer"]
  s.email       = 'dev@lean_coffee.com'
  s.files       = Dir['lib/**/*.rb', 'domain/**/*.rb', 'events/**/*.rb', 'Domainfile']
  s.homepage    = 'http://www.example.com'
  s.metadata    = { 'hecks_domain' => 'true' }
end