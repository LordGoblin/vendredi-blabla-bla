require 'csv'
require 'google/apis/gmail_v1'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'fileutils'
require 'mime'
include MIME



  OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'.freeze
  APPLICATION_NAME = 'Gmail API Ruby Quickstart'.freeze
  CREDENTIALS_PATH = 'credentials.json'.freeze

  TOKEN_PATH = 'token.yaml'.freeze
  SCOPE = Google::Apis::GmailV1::AUTH_SCOPE

class MailBot

  attr_accessor :database , :subject ,:mailcontent

  def initialize
    @database ='db/mail_database.csv'
    # @subject = sujet
    # @content = contenu
  end

  def authorize
    client_id = Google::Auth::ClientId.from_file(CREDENTIALS_PATH)
    token_store = Google::Auth::Stores::FileTokenStore.new(file: TOKEN_PATH)
    authorizer = Google::Auth::UserAuthorizer.new(client_id, SCOPE, token_store)
    user_id = 'default'
    credentials = authorizer.get_credentials(user_id)
    if credentials.nil?
      url = authorizer.get_authorization_url(base_url: OOB_URI)
      puts 'Open the following URL in the browser and enter the ' \
           "resulting code after authorization:\n" + url
      code = gets
      credentials = authorizer.get_and_store_credentials_from_code(
        user_id: user_id, code: code, base_url: OOB_URI
      )
    end
    credentials
  end

def mail_spamming (sujet,contenu)

  # Initialize the API
  service = Google::Apis::GmailV1::GmailService.new
  service.client_options.application_name = APPLICATION_NAME
  service.authorization = authorize

  csv = CSV.read(@database, :headers=>true)
  arrmail = csv['mail']

  arrmail.each do |e|

  # Création du contenu du message

  msg = Mail.new
  msg.date = Time.now
  msg.subject = sujet
  msg.body = Text.new( contenu , 'plain', 'charset' => 'us-ascii')
  msg.from = {'kookina.com' => 'Rastamail'}
  msg.to   = {  "#{e}"=> nil  }

  puts "email \"#{msg.subject}\" envoyé à #{e}"

  message = Google::Apis::GmailV1::Message.new(raw: msg.to_s)

  service.send_user_message('me', message)
  end

end


end

 #db_str ='mail_database.csv'
