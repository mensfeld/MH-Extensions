# Rozszerzenie klasy Array umożliwiające korzystanie z paginacji za pomocą
# pluginu Kaminaro
class Array
  def paginable(page, per_page, total_elements_amount)
    @paginate_page = page
    @paginate_per_page = per_page
    @paginate_total_elements_amount = total_elements_amount
    self.instance_eval <<-EVAL
      def current_page
        @paginate_page.to_i
      end

      def num_pages
        (@paginate_total_elements_amount/@paginate_per_page).floor.to_i
      end

      def limit_value
        @paginate_per_page.to_i
      end

      alias :total_pages :num_pages

    EVAL
  end
end
