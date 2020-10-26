module Expenses
  class UpdateService
    attr_reader :params, :expense

    def initialize(expense, params={})
      @expense = expense
      @params = params.dup
    end

    def update_expense_amount(account, amount)
      new_account_balance = (account.balance + expense.amount) - amount
  
      account.update(balance: new_account_balance)
  
      expense.update(amount: amount)
    end
  
    def update_expense_account(old_account, new_account)
      amount = expense.amount
  
      new_account_balance = new_account.balance - amount
      old_account_balance = old_account.balance + amount
  
      new_account.update!(balance: new_account_balance)
      old_account.update!(balance: old_account_balance)
  
      expense.update!(account: new_account)
    end

    def execute
      ActiveRecord::Base.transaction do
        current_account = Account.find(expense.account_id)
        amount = params[:amount]

        if amount
          update_expense_amount(current_account, amount)

          params.delete(:amount)
        end

        if params[:account]
          new_account = Account.find(params[:account])

          update_expense_account(current_account, new_account)

          params.delete(:account)
        end

        expense.update!(params)
      end

      expense
    end
  end
end