class SendGridMailer
  def self.send(subject, from, to, message_text, message_html, options = {})
    begin
      @api_key = "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"
      if @api_key.present? && to.present? && from.present? && subject.present? && message_text.present? && message_html.present?
        url = "https://api.sendgrid.com/v3/mail/send"
        if @proxy.blank?
          http_client = HTTPClient.new(default_header: { "Content-Type" => "application/json", "Authorization" => "Bearer #{@api_key}" })
        else
          http_client = HTTPClient.new("http://#{@proxy.ip_address}:#{@proxy.port}", default_header: { "Content-Type" => "application/json", "Authorization" => "Bearer #{@api_key}" })
          http_client.set_proxy_auth(@proxy.user_name, @proxy.password)
        end
        #email_id = "sendgrid_#{SecureRandom.urlsafe_base64}_#{Time.zone.now.to_i}"
        data = {
          personalizations: [
            {
              to:[
                email: to.to_s
              ]
            }
          ],
          from: { email: from.to_s},
          subject: subject,
          content: [
            {
              type: "text/html",
              value: message_html
            },
            {
              type: "text/text",
              value: message_text
            }
          ]
        }.to_json
        result = http_client.post(url, data)
        if (result.header.status_code.to_s =="200" || result.header.status_code.to_s == "202")
          1
        else
          0
        end
      else
        0
      end
    rescue
      0
    ensure
      true
    end
  end
end