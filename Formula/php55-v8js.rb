require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php55V8js < AbstractPhp55Extension
  init
  desc "PHP extension for Google's V8 Javascript engine"
  homepage "http://pecl.php.net/package/v8js"
  url "http://pecl.php.net/get/v8js-0.4.0.tgz"
  sha256 "0d52b999c12f9f74a0642f6c3f349002a39355295187e0b50344ea0ec64ae0bd"
  revision 2

  bottle do
  end

  depends_on "v8"

  def install
    Dir.chdir "v8js-#{version}" unless build.head?

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig
    system "make"
    prefix.install "modules/v8js.so"
    write_config_file if build.with? "config-file"
  end
end
