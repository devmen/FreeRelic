SimpleNavigation::Configuration.run do |navigation|  
  navigation.items do |primary|
    primary.item :books, 'Books', books_path
    primary.item :music, 'Music', musics_path
    primary.item :dvds, 'Dvds', dvds_path
  end
end