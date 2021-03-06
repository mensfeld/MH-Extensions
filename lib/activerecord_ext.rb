module ArMH
  module Extensions

    def self.included(base)
      base.extend AddActsAsMethod
    end

    module AddActsAsMethod

      # Should new element be first || last
      def mh_extensions(*sources)
        class_eval <<-END
          include ArMH::Extensions::InstanceMethods
        END

        if self.column_names.include?('created_by') && self.column_names.include?('updated_by')
          self.send(:define_method, "created_by=".to_sym) do |author|
            self.updated_by=author if self.updated_by.blank?
            super author
          end
        end
      end
    end

    module InstanceMethods
    end
  end
end

ActiveRecord::Base.send(:include, ArMH::Extensions)

# Lil workaround 4 Rails development evn
if Rails.env == 'development'
  class ActiveRecord::Base
    after_initialize :mh_extensions

    def mh_extensions
      self.class.mh_extensions
    end
  end
end

class Railtie < Rails::Railtie
  initializer "app.trigger_extensions_4_all_ar_models" do |app|
    app.config.after_initialize do
      ActiveRecord::Base.send(:descendants).each do |model|
        begin
          model.mh_extensions
        rescue
        end
      end
    end
  end
end

class ActiveRecord::Base
  class << self
    # Shorter name
    alias :human :human_attribute_name
  end
end
