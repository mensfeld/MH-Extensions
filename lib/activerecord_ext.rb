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
            self.updated_by=author if self.updated_by.nil? || self.updated_by.length == 0
            super
          end
        end
      end
    end

    module InstanceMethods
    end
  end
end

ActiveRecord::Base.send(:include, ArMH::Extensions)


