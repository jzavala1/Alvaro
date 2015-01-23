class ConditionMailer < MandrillMailer::TemplateMailer
  default from: 'info@sensacional.cl'

  def send_condition(supplier)
    mandrill_mail template: 'navidad-1',
                  subject: 'Test',
                  to: {
                    email: supplier.email,
                    name: "#{supplier.first_name} #{supplier.last_name}"
                  },
                  vars: {
                    'USER_NAME' => supplier.first_name
                  },
                  important: true,
                  inline_css: true,
                  track_clicks: true
  end
end