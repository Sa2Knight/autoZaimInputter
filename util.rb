require 'json'
class Util

  KEYSFILE = "keys.json"

  # APIキーを取得
  def self.get_api_key
    File.open(KEYSFILE) do |f|
      keys = JSON.load(f)
    end
  end

  # GET用のURLを生成する
  def self.make_url(url , params)
    params.each do |k , v|
      if url.index('?').nil?
        url += "?#{k}=#{v}"
      else
        url += "&#{k}=#{v}"
      end
    end
    url_escape = URI.escape(url)
    return url_escape
  end

end
