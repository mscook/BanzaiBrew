class PrinseqLite < Formula
  homepage "http://prinseq.sourceforge.net"
  url "https://downloads.sourceforge.net/project/prinseq/standalone/prinseq-lite-0.20.4.tar.gz"
  version "0.20.4"
  sha1 "b8560cdc059e9b4cbb1bab5142de29bde5d33f61"

  patch do
    url "https://raw.githubusercontent.com/mscook/homebrew-BanzaiNGS/master/patches/prinseq-lite-Declare-perl-env-properly.patch"
    sha256 "1fd60e73ff635aa9748cd6135ea3bbcdf6ba7500"
  end

  def install
    system "chmod +x *.pl"  
    system "mkdir bin"
    system "cp *.pl bin"
    system "ln -s bin/prinseq-graphs-noPCA.pl bin/prinseq-graphs-noPCA"
    system "ln -s bin/prinseq-graphs.pl bin/prinseq-graphs"
    system "ln -s bin/prinseq-lite.pl bin/prinseq-lite"
    prefix.install Dir["*"]
  end

  test do
    assert_match "Usage:", shell_output("prinseq-lite.pl 2>&1", 1)
  end
end
