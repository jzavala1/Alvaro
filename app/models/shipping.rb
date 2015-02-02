class Shipping < ActiveRecord::Base
  # address, status

  def self.status
    status = [['Pendiente', 'pending'], ['Realizado', 'done'], ['Cancelado', 'cancelled']]
  end

  def self.payments
    payments = [['Efectivo', 'cash'], ['Transferencia', 'transfer'], ['Depósito', 'deposit'], ['Khipu', 'khipu'], ['Cheque', 'check'], ['Tarjeta de Crédito', 'credit'], ['Tarjeta de Débito', 'debit']]
  end
end
