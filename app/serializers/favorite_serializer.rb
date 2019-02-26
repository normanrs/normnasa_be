class FavoriteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :text, :url
end
