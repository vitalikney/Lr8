# frozen_string_literal: true

# class of controller's actions
class CalcController < ApplicationController
  before_action :set_input, only: :view
  before_action :check_input, only: :view

  def input; end

  def view
    list = Enumerator.new do |element| # list - объект класса Enumerator
      n = @input.to_i
      (0..n).cycle(1) do |x| # метод примеси Enumerable
        element << [x, x*x] if palindrome?(x.to_s) && palindrome?((x*x).to_s)
      end
    end
    @result = list
  end

  private

  def palindrome?(n)
    return true if n == n.reverse
    return false
  end

  def set_input
    @input = params[:number]
  end

  def check_input
    # if @input&.match
    begin
      return if @input.match?(/^\d+$/)
    rescue NoMethodError
      @result = 'EmptyInputError'
  end

    redirect_to(root_path, notice:
      'Введены некорректные данные! Повторите ввод')
  end
end