module ProductsHelper
  def fetch_categories
    Category.all.map{ |cat| [cat.category_name, cat.id] }
  end
end

