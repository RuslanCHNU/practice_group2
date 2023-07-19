module TransactionsHelper
  def display_amount_with_sign(amount)
    amount
  end

  def add_spaces_to_name(name, amount)
    emoji = amount.negative? ? "😨" : "🤑"
    name.start_with?(/[\p{Emoji}]/) ? name : "#{emoji} #{name}".html_safe
  end
  
  def format_amount_with_decimals(amount)
    formatted_amount = amount.to_i == amount ? amount.to_i : amount.round(2)
    number_with_delimiter(formatted_amount, delimiter: ' ')
  end

  def format_transaction_date(date)
    today = Date.today
    yesterday = today - 1

    if date == today
      'Сьогодні'
    elsif date == yesterday
      'Вчора'
    else
      date.strftime('%d.%m.%Y') # Format date as "dd.mm.yyyy"
    end
  end
end
