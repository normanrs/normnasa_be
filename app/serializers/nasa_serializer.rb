class NasaSerializer
  include FastJsonapi::ObjectSerializer
  attributes :text, :url
end
