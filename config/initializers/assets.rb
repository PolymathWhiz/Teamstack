# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

# Precompiling the admin style files seperately
Rails.application.config.assets.precompile += %w( admin/jquery.js admin/bootstrap.js admin/bootstrap-select.js admin/jquery.slimscroll.js admin/waves.js admin/jquery.countTo admin/admin.js admin/index.js admin/demo.js admin/custom.js admin/bootstrap.css admin/waves.css admin/animate.css admin/style.css admin/all-themes.css admin/custom.css)

