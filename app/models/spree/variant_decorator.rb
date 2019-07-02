Spree::Variant.class_eval do
	def options_text
    values = self.option_values.sort do |a, b|
      a.option_type.position <=> b.option_type.position
    end

    values.to_a.map! do |ov|
      "#{ov.presentation}"
    end

    values.to_sentence({ words_connector: ", ", two_words_connector: ", " })
  end

  def variant_image_url
    product.images.try(:first).try(:attachment).try(:url) 
  end

  def attributes
    super.merge({:variant_image_url => variant_image_url})
  end

end