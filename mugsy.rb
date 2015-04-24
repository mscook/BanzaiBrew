class Mugsy < Formula
  homepage "http://mugsy.sourceforge.net"
  version "1.2.3"
  url "https://downloads.sourceforge.net/project/mugsy/mugsy_x86-64-v1r2.3.tgz"
  sha1 "fab41ab20c5e8753c14c89502f9d54752acb57c9"


  patch do
    url "https://raw.githubusercontent.com/mscook/homebrew-BanzaiNGS/master/patches/mugsy-Declare-perl-env-properly.patch"
    sha256 "3a1749e8d7fa9112ca54f02440bb71c1b498f7dcb514d6508e1ac3a6e911b8a0"
  end


  def install
    system "echo 'export MUGSY_INSTALL=#{HOMEBREW_PREFIX}/bin > ~/.bashrc'"
    system "echo 'export PATH=$MUGSY_INSTALL:$MUGSY_INSTALL/mapping:$PATH > ~/.bashrc'"
    system "echo 'export PERL5LIB=$MUGSY_INSTALL/perllibs > ~/.bashrc'"
    system "mkdir bin"
    system "mv MUMmer3.20 *.pl *.sh mugsy mugsyWGA synchain-mugsy bin/"
  end


  test do
    end
end
