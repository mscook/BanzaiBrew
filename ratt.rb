class Ratt < Formula
  homepage 'http://www.gpsbabel.org'
  url "https://svn.code.sf.net/p/ratt/code/", :revision => "18"
  # version will be SVN revision
  version "0.18.0"
  
  head 'https://svn.code.sf.net/p/ratt/code/'
  
  patch do
    url "https://raw.githubusercontent.com/mscook/homebrew-BanzaiNGS/master/patches/RATT-Structure-like-a-package-Declare-perl-env-properly.patch"
    sha256 "56d8b7e744768a84856aefd868f31bfcae1a278c2fde4f50b0aaecc54dab24dc"
  end

  depends_on "mummer"

  def install
    system "echo 'export RATT_HOME=#{HOMEBREW_PREFIX}/bin' >> ~/.bashrc"
    #system "echo 'export PERL5LIB=$MUGSY_INSTALL/perllibs' >> ~/.bashrc"
    system "mkdir bin"
    system "mv *.pl *.sh bin/"
    prefix.install Dir["*"]
  end
end

