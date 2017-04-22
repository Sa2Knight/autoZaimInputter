require 'json'
class Util

  KEYSFILE = "keys.json"

  # APIキーを取得
  def self.get_api_key
    File.open(KEYSFILE) do |f|
      keys = JSON.load(f)
    end
  end

end
