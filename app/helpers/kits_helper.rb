module KitsHelper
  def nested_groups2(kits)
    content_tag(:ul) do
      kits.map do |kit, sub_kits|
        content_tag(:li, (link_to "#{kit.combo_code}  #{kit.name}", kit_path(kit))) + nested_groups2(sub_kits) 
      end.join.html_safe
    end
  end
end
