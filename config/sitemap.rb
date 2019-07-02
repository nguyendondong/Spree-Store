# Change this to your host. See the readme at https://github.com/lassebunk/dynamic_sitemaps
# for examples of multiple hosts and folders.


Spree::Store.all.each do |store|
  host store.url
  folder "sitemaps/#{store.code}"
  sitemap :site do
    store.taxonomies.includes(root: :children).each do |taxonomy|
      taxonomy.root.children.each do |taxon|
        category_url = "http://#{host}#{Spree::Core::Engine.routes.url_helpers.nested_taxons_path(taxon.permalink)}"
        url category_url, priority: 1
      end
    end
    #url "/home", last_mod: Time.now, change_freq: "daily", priority: 1.0
    store.products.available.each do |product|
      #url Spree::Core::Engine.routes.url_helpers.product_url(product, :only_path => true), last_mod: product.updated_at, priority: 0.9
      product_url = "http://#{host}#{Spree::Core::Engine.routes.url_helpers.product_url(product, :only_path => true)}"
      url product_url, priority: 0.9
    end
    store.blog_entries.visible.each do |blog|
      blog_url = "http://#{host}#{Spree::Core::Engine.routes.url_helpers.blog_entry_permalink_path(:year => blog.published_at.strftime("%Y"), :month => blog.published_at.strftime("%m"), :day => blog.published_at.strftime("%d"), :slug => blog.permalink)}"
      url blog_url, priority: 0.8
    end

  end
end

# You can have multiple sitemaps like the above – just make sure their names are different.

# Automatically link to all pages using the routes specified
# using "resources :pages" in config/routes.rb. This will also
# automatically set <lastmod> to the date and time in page.updated_at:
#
#   sitemap_for Page.scoped

# For products with special sitemap name and priority, and link to comments:
#
#sitemap_for Spree::Product.available, name: :published_products do |product|
#  url Spree::Core::Engine.routes.url_helpers.product_url(product, :only_path => true), last_mod: product.updated_at, priority: 0.9
#end

# If you want to generate multiple sitemaps in different folders (for example if you have
# more than one domain, you can specify a folder before the sitemap definitions:
#
#   Site.all.each do |site|
#     folder "sitemaps/#{site.domain}"
#     host site.domain
#
#     sitemap :site do
#       url root_url
#     end
#
#     sitemap_for site.products.scoped
#   end

# Ping search engines after sitemap generation:
#
#   ping_with "http://#{host}/sitemap.xml"
