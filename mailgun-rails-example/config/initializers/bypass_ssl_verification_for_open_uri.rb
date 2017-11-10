require 'openssl'
# TODO note why we disabled verification
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
