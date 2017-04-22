require 'oauth'
require 'json'
require_relative "util"
class Zaim

  API_BASE = 'https://api.zaim.net/v2/'
  API_PAYMENT = API_BASE + 'home/money/payment'
  API_INCOME  = API_BASE + 'home/money/income'

  # ZaimAPIへのアクセストークンを生成する
  def initialize
    api_key = Util.get_api_key
    oauth_params = {
      site: "https://api.zaim.net",
      request_token_path: "/v2/auth/request",
      authorize_url: "https://auth.zaim.net/users/auth",
      access_token_path: "https://api.zaim.net"
    }
    @consumer = OAuth::Consumer.new(api_key["key"], api_key["secret"], oauth_params)
    @access_token = OAuth::AccessToken.new(@consumer, api_key["access_token"], api_key["access_token_secret"])
  end

  # 固定収支をZaimに登録する
  def create_by_template
    template = Util.get_template
    template["income"].each  { |income|  self.create_income(income)  }
    template["payment"].each { |payment| self.create_payment(payment) }
  end

  # 収入を登録する
  def create_income(income)
    income["date"] = Util.get_todays_string
    self.post(API_INCOME, income)
  end

  # 支出を登録する
  def create_payment(payment)
    payment["date"] = Util.get_todays_string
    self.post(API_PAYMENT, payment)
  end

  # ZaimAPIにPOSTする
  def post(url, params)
    @access_token.post(url, params)
  end

end
