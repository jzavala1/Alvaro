class SupplierMailer < MandrillMailer::TemplateMailer
  default from: 'info@sensacional.cl'

  def send_condition(supplier)
    mandrill_mail template: 'condiciones-generales-funcionamiento',
                  subject: 'Condiciones de servicio',
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