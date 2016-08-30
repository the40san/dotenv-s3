module Dotenv
  module S3
    class Railtie < Rails::Railtie
      config.before_configuration { load_from_tempfile }

      def self.load_from_tempfile
        if ENV["ENABLE_S3_ENVFILE"]
          Dotenv::S3.load(
            bucket:         ENV["ENVFILE_BUCKET_NAME"],
            filename:       ENV["ENVFILE_FILE_NAME"],
            base64_encoded: ENV["ENVFILE_BASE64ENCODE"].present?,
            kms_key_id:     ENV["ENVFILE_KMS_KEY_ID"]
          ) do |tempfile|
            Dotenv.load(tempfile.path)
          end
        end
      end
    end
  end
end
