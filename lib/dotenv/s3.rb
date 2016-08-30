require 'dotenv/s3/version'
require 'dotenv/s3/rails'
require 'base64'
require 'aws-sdk'
require 'tempfile'

module Dotenv
  module S3
    class << self
      def load(bucket: nil, filename: nil, base64_encoded: false, kms_key_id: nil)
        dotenv_body = s3_client.get_object(bucket: bucket, key: filename).body.read

        if kms_key_id
          blob = decode64(dotenv_body)
          dotenv_body = decrypt_by_kms(blob)
        end

        dotenv_body = decode64(dotenv_body) if base64_encoded

        if block_given?
          create_tempfile(dotenv_body) do |f|
            yield f
          end
        else
          create_dotenv(dotenv_body)
        end
      end

      def s3_client
        Aws::S3::Client.new(
          access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
          secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
          region:            ENV['AWS_REGION']
        )
      end

      def kms_client
        Aws::KMS::Client.new(
          access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
          secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
          region:            ENV['AWS_REGION']
        )
      end

      def decode64(body)
        Base64.decode64(body)
      end

      private

      def decrypt_by_kms(body)
        kms_client.decrypt(ciphertext_blob: body).plaintext
      end

      def create_tempfile(body, &block)
        Tempfile.create("s3-dotenv") do |f|
          f.write(body)
          f.rewind
          yield f
        end
      end

      def create_dotenv(body)
        File.open('.env', 'w') do |f|
          f.write(body)
        end
      end
    end
  end
end
