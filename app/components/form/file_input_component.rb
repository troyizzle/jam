module Form
  class FileInputComponent < BaseComponent
    def initialize(form, field, classes:)
      super(form, field, classes:)
    end

    def render_label
      nil
    end
  end
end
