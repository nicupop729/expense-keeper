class ExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_expense, only: %i[show edit update destroy]

  # GET /expenses or /expenses.json
  def index
    @category_name = params[:category_name]
    @category = current_user.categories.find_by(name: @category_name)
    @expenses = @category.expenses.order(created_at: :desc)
    @total_expenses = @category.expenses.sum(:amount)
  end

  # GET /expenses/1 or /expenses/1.json
  def show
    @category_name = params[:category_name]
    @category = current_user.categories.find_by(name: @category_name)
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
    @category_expense = CategoryExpense.new
    @categories = current_user.categories
  end

  # POST /expenses or /expenses.json
  def create
    @expense = Expense.new(name: expense_params[:name], amount: expense_params[:amount], user: current_user)

    respond_to do |format|
      if @expense.save
        @category = Category.find(expense_params[:category_id])
        @expense.categories.push(@category)
        format.html { redirect_to add_expense_url(@category.name), notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expense
    @expense = Expense.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:name, :amount, :category_id)
  end
end
