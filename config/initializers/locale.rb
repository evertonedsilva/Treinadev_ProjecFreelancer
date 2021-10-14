# Where the I18n library should search for translation files
#I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')]
#linha necessária caso queira carregar mais de 1 arquivo em locales

# Permitted locales available for the application
I18n.available_locales = [ :'pt-BR']

# Set default locale to something other than :en
I18n.default_locale = :'pt-BR'