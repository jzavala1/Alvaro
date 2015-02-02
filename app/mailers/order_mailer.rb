class OrderMailer < MandrillMailer::TemplateMailer
  default from: 'info@sensacional.cl'

  def send_initial_contract(order)
    mandrill_mail template: 'contrato-inicial',
                  subject: 'Contrato inicial',
                  to: {
                    email: order.supplier.email,
                    name: "#{order.supplier.first_name} #{order.supplier.last_name}"
                  },
                  vars: {
                    'USER_FIRST_NAME' => order.supplier.first_name,
                    'USER_LAST_NAME' => order.supplier.last_name,
                    'USER_RUT' => order.supplier.rut,
                    'USER_EMAIL' => order.supplier.email,
                    'USER_ADDRESS' => order.supplier.address,
                    'ORDER_DATE' => I18n::localize(Order.last.date, format: "%d de %B del %Y")
                  },
                  important: true,
                  inline_css: true,
                  track_clicks: true
  end

  def send_order_confirmation(order)
    mandrill_mail template: 'confirmacion-retiro',
                  subject: 'Confirmación Retiro',
                  to: {
                    email: order.supplier.email,
                    name: "#{order.supplier.first_name} #{order.supplier.last_name}"
                  },
                  vars: {
                    'USER_FIRST_NAME' => order.supplier.first_name,
                    'USER_LAST_NAME' => order.supplier.last_name,
                    'USER_RUT' => order.supplier.rut,
                    'USER_EMAIL' => order.supplier.email,
                    'USER_ADDRESS' => order.supplier.address,
                    'ORDER_DATE' => I18n::localize(Order.last.date, format: "%d de %B del %Y")
                  },
                  important: true,
                  inline_css: true,
                  track_clicks: true
  end

  def send_offer(order, non_consignated, consignated, rejected)
    mandrill_mail template: 'oferta-rechazados',
                  subject: 'Oferta',
                  to: {
                    email: order.supplier.email,
                    name: "#{order.supplier.first_name} #{order.supplier.last_name}"
                  },
                  vars: {
                    'USER_FIRST_NAME' => order.supplier.first_name,
                    'USER_LAST_NAME' => order.supplier.last_name,
                    'USER_RUT' => order.supplier.rut,
                    'USER_EMAIL' => order.supplier.email,
                    'USER_ADDRESS' => order.supplier.address,
                    'ORDER_DATE' => I18n::localize(Order.last.date, format: "%d de %B del %Y"),
                    'NON_CONSIGNATED_PRODUCTS' => render('app/views/mandrill/offer.html.erb', non_consignated),
                    'CONSIGNATED_PRODUCTS' => render('app/views/mandrill/offer.html.erb', consignated),
                    'REJECTED_PRODUCTS' => render('app/views/mandrill/offer.html.erb', rejected)
                  },
                  important: true,
                  inline_css: true,
                  track_clicks: true
  end

  def render(path, data)
    template = Tilt::ERBTemplate.new(path)
    @products = data
    template.render(self)
  end
end