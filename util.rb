require 'json'
class Util

  KEYSFILE = "keys.json"
  TEMPLATEFILE = "template.json"

  # JSONファイルを取得
  def self.get_json(path)
    File.open(path) do |f|
      JSON.load(f)
    end
  end

  # APIキーを取得
  def self.get_api_key
    self.get_json(KEYSFILE)
  end

  # 登録テンプレートを取得
  def self.get_template
    self.get_json(TEMPLATEFILE)
  end

  # 本日の日時を文字列で取得
  def self.get_todays_string
    Date.today.strftime('%Y-%m-%d')
  end

end
