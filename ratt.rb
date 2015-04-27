class Ratt < Formula
  homepage 'http://www.gpsbabel.org'
  url "https://svn.code.sf.net/p/ratt/code/", :revision => "18"
  # version will be SVN revision
  version "0.18.0"
  
  head 'https://svn.code.sf.net/p/ratt/code/'
  
  patch do
    url "https://raw.githubusercontent.com/mscook/homebrew-BanzaiNGS/master/patches/prinseq-lite-Declare-perl-env-properly.patch"
    sha256 "5ff4a5266f79d2b71168cb0ed8f22b8d3e55e6a10e56dbea7061421c747dc44d"
  end


  depends_on "mummer"

  def install
  end
end

