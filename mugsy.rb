class Mugsy < Formula
  homepage "http://mugsy.sourceforge.net"
  version "1.2.3"
  url "https://downloads.sourceforge.net/project/mugsy/mugsy_x86-64-v1r2.3.tgz"
  sha1 "fab41ab20c5e8753c14c89502f9d54752acb57c9"


  patch do
    url "https://raw.githubusercontent.com/mscook/homebrew-BanzaiNGS/master/patches/mugsy-Declare-perl-env-properly.patch"
    # Update: sha256 "5ff4a5266f79d2b71168cb0ed8f22b8d3e55e6a10e56dbea7061421c747dc44d"
  end


  def install
    system "export MUGSY_INSTALL=#{HOMEBREW_PREFIX}/bin"
    system "export PATH=$MUGSY_INSTALL:$MUGSY_INSTALL/mapping:$PATH"
    system "export PERL5LIB=$MUGSY_INSTALL/perllibs"
    system "echo 'export MUGSY_INSTALL=#{HOMEBREW_PREFIX}/bin > ~/.bashrc'"
    system "echo 'export PATH=$MUGSY_INSTALL:$MUGSY_INSTALL/mapping:$PATH > ~/.bashrc'"
    system "echo 'export PERL5LIB=$MUGSY_INSTALL/perllibs > ~/.bashrc'"
    system "mkdir bin"
    system "mv MUMmer3.20 *.pl *.sh mugsy mugsyWGA synchain-mugsy bin/"
  end


  test do
    end
end
