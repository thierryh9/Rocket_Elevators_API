# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
#Rails.application.config.assets.precompile += %w(creative/manifest.js creative/manifest.css images/* bootstrap/* fonts/* magnific-popup/* morphext/* owlcarousel2/* rs-plugin-5/* stylesheets/* javascripts/*)
Rails.application.config.assets.precompile += ['.js', '.css', '*.css.erb']
Rails.application.config.assets.precompile += %w( contact.js )
Rails.application.config.assets.precompile += %w( scripts.js )
Rails.application.config.assets.precompile += %w( smoothscroll.js )
Rails.application.config.assets.precompile += %w( revicons.ttf )
Rails.application.config.assets.precompile += %w( demo.portfolio_ajax.js )
Rails.application.config.assets.precompile += %w( isotope.pkgd.min.js )