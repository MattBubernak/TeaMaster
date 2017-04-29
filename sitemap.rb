require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://www.HerbalTeaMaster.com'
SitemapGenerator::Sitemap.create do
  add '/welcome/index', :changefreq => 'daily', :priority => 0.9
  add '/recipes', :changefreq => 'daily'
  add '/blog', :changefreq => 'daily'
  add '/recipes/1', :changefreq => 'daily'
  add '/recipes/14', :changefreq => 'daily'
  add '/ingredients', :changefreq => 'daily'
end
SitemapGenerator::Sitemap.ping_search_engines # Not needed if you use the rake tasks
