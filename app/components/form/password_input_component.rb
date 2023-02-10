module Form
  class PasswordInputComponent < BaseComponent
    def initialize(form, field, classes:)
      super(form, field, classes:)
    end

    def call
      form.password_field(field, class: classes)
    end
  end
end
