FactoryBot.define do
  factory :sector do
    name {'z9'}
    coordinates {[[1,1],[1,2],[2,2],[2,1]]}
    geojson_string {'{"type":"Polygon","coordinates":[[[1,1],[1,2],[2,2],[2,1]]]}'}
  end
end
