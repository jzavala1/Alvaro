json.array!(@sections) do |section|
  json.extract! section, :id, :name, :sub_category_id
  json.url section_url(section, format: :json)
end
