module Helpers
  def get_token
    2.times do
      js_script = 'return window.localStorage.getItem("default_auth_token");'
      @token = page.execute_script(js_script)
      break if @token != nil
      sleep 1
    end
    @token
  end
end

# Era assim que o modulo era antes, mas dá problema no chrome, no firefox não dá.
# module Helpers
#   def get_token
#     js_script = 'return window.localStorage.getItem("default_auth_token");'
#     page.execute_script(js_script)
#   end
# end
