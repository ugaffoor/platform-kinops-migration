require "json"

space_name = "Test School"
space_slug = "testschool"
server = "https://testschool.gbmembers.net"
username = "unus@uniqconsulting.com.au"
password = "gbfms@2021"

data = {
   "agent" => {
     "component_type" => "agent",
     "bridge_api" => "/app/api/v1/bridges",
     "bridge_path" => "/app/api/v1/bridges/bridges/kinetic-core",
     "bridge_slug" => "kinetic-core",
     "filestore_api" => "/app/api/v1/filestores"
   },
   "core" => {
     "api" => "#{server}/app/api/v1",
     "agent_api" => "#{server}/app/components/agent/app/api/v1",
     "proxy_url" => "#{server}/app/components",
     "server" => "#{server}",
     "space_slug" => "#{space_slug}",
     "space_name" => "#{space_name}",
     "service_user_username" => "#{username}",
     "service_user_password" => "#{password}",
     "task_api_v1" => "#{server}/app/components/task/app/api/v1",
     "task_api_v2" => "#{server}/app/components/task/app/api/v2",
   },
   "discussions" => {
     "api" => "#{server}/app/discussions/api/v1",
     "server" => "#{server}/app/discussions",
     "space_slug" => "#{space_slug}"
   },
   "task" => {
     "api" => "#{server}/kinetic-task/app/api/v1",
     "api_v2" => "#{server}/kinetic-task/app/api/v2",
     "component_type" => "task",
     "server" => "#{server}/kinetic-task",
     "space_slug" => "#{space_slug}",
     "signature_secret" => "1234asdf5678jkl;"
   },
   "http_options" => {
     "log_level" => "info",
     "log_output" => "stderr",
     "gateway_retry_limit" => 5,
     "gateway_retry_delay" => 1.0,
     "ssl_ca_file" => "/app/ssl/tls.crt",
     "ssl_verify_mode" => "none"
   },
   "data" => {
     "requesting_user" => {
       "username" => "joe.user",
       "displayName" => "Joe User",
       "email" => "joe.user@google.com",
     },
     "users" => [
       {
         "username" => "joe.user"
       }
     ],
     "space" => {
       "attributesMap" => {
         "Platform Host URL" => [ "http://localhost:8080" ]
       }
     },
     "handlers" => {
       "kinetic_core_system_api_v1" => {
         "api_username" => "#{username}",
         "api_password" => "#{password}",
         "api_location" => "#{server}/app/api/v1"
       }
     },
     "smtp" => {
       "server" => "smtp-relay.sendinblue.com",
       "port" => "587",
       "tls" => "true",
       "username" => "support.oceania@graciebarra.com",
       "password" => "xsmtpsib-2b01492ca1394d1fea406eaf708e8edcea81d6a25e034c4e58b6708f503b528e-T0gHVU91xtZGkdcr",
       "update_read_count_url" => "https://gbbilling.com.au:8443/billingservice/getCampaignImage"
     }
   },
   "aws" => {
     "AWSAccessKeyId" => "AKIAUJCBQQFD3YNUALWP",
     "AWSSecretKey" => "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",
     "Region" => "us-east-2"
   },
   "billingService" => {
     "url" => "https://gbbilling.com.au:8443/billingservice"
   }
}

#puts "data:#{data}"
puts "Importing #{space_slug}"
`ruby install.rb #{data.to_json.inspect}`
