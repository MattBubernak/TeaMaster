require 'rubygems'
require 'sitemap_generator'
require 'fileutils'

class SiteMapWorker
  include Sidekiq::Worker
  SitemapGenerator::Sitemap.default_host = 'http://www.HerbalTeaMaster.com'

  def perform(*args)
    # Do something
    SitemapGenerator::Sitemap.create do
      add '/welcome/index', :changefreq => 'daily'
      add '/recipes', :changefreq => 'daily'
      add '/blog', :changefreq => 'daily'
      Recipe.all.each do |recipe|
        add "recipes/"+recipe.id.to_s, :changefreq => 'daily'
      end
      Ingredient.all.each do |ingredient|
        add "ingredients/"+ingredient.id.to_s, :changefreq => 'daily'
      end
      Post.all.each do |post|
        add "/posts/"+post.id.to_s, :changefreq => 'daily'
      end
    end
  end
end
