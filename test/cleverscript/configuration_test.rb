require 'helper'

describe 'configuration' do
  
  Cleverscript::Configuration::VALID_CONFIG_KEYS.each do |key|
    describe ".#{key}" do
      it 'should return the default value' do
        Cleverscript.send(key).must_equal Cleverscript::Configuration.const_get("DEFAULT_#{key.upcase}")
      end
    end
  end

  after do
    Cleverscript.reset
  end

  describe '.configure' do
    Cleverscript::Configuration::VALID_CONFIG_KEYS.each do |key|
      it "should set the #{key}" do
        Cleverscript.configure do |config|
          config.send("#{key}=", key)
          Cleverscript.send(key).must_equal key
        end
      end
    end
  end
end
