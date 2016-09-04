require 'oauth'
require 'json'
require './zaim_value.rb'

class Zaim
 include Z
end

CONSUMER_KEY = Zaim.new.c_key
CONSUMER_SECRET = Zaim.new.c_sec
ACCESS_TOKEN = Zaim.new.a_tok
ACCESS_TOKEN_SECRET = Zaim.new.a_sec
API_URL = 'https://api.zaim.net/v2/'

consumer = OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET,
                              site: 'https://api.zaim.net',
                              request_token_path: '/v2/auth/request',
                              authorize_url: 'https://auth.zaim.net/users/auth',
                              access_token_path: '/v2/auth/access')
access_token = OAuth::AccessToken.new(consumer, ACCESS_TOKEN, ACCESS_TOKEN_SECRET)

# 認証できているかを確認
p "認証の確認"
verify = access_token.get("#{API_URL}home/user/verify")
p JSON.parse(verify.body)

=begin
# カテゴリの取得
p "カテゴリの取得"
categories = access_token.get("#{API_URL}home/category")
p JSON.parse(categories.body)
=end

