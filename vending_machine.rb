# irb　(プロジェクトのディレクトリ上で)
# require './vending_machine'
# require './submit_step3'
class VendingMachine
  # 自販機に投入できる硬貨を規定(.freezeによって書き換えを防止(チェリー本p255~256))
  MONEY = [10, 50, 100, 500, 1000].freeze
  def initialize
    # 最初の自動販売機に入っている金額は0円
    @slot_money = 0
    @sales = 0
  end
  # 投入金額の総計を取得できる。
  def current_slot_money
    # 自動販売機に入っているお金を表示する
    puts "現在#{@slot_money}円が投入されています"
  end
  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  # 投入は複数回できる。
  def slot_money(money)
    # 想定外のもの（１円玉や５円玉。千円札以外のお札、そもそもお金じゃないもの（数字以外のもの）など）
    # が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
    puts "#{money}円は存在しない硬貨または紙幣です" unless MONEY.include?(money)
    return false unless MONEY.include?(money)
    # 自動販売機にお金を入れる
    @slot_money += money
    current_slot_money
  end
  # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
  def return_money
    # 返すお金の金額を表示する
    puts "#{@slot_money}円を返却します"
    # 自動販売機に入っているお金を0円に戻す
    @slot_money = 0
    current_slot_money
  end
  def buy(drink)
    if drink.price < @slot_money && drink.stock > 0
      drink.stock -= 1
      @slot_money -= drink.price
      @sales += drink.price
      puts "#{drink.name}を購入しました"
    # else
    #   puts "購入できませんでした"
    end
    puts "#{drink.name}の在庫は#{drink.stock}個です"
    current_slot_money
  end
  def comfirm_sales
    puts "#{@sales}円の売上があります"
  end
end

class Drink
  attr_accessor :name, :price, :stock
  def initialize
    @name = "coke"
    @price = 120
    @stock = 5
  end
  def display
    puts "商品名：#{@name}"
    puts "価格：#{@price}"
    puts "在庫：#{@stock}"
  end
end
