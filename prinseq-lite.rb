class PrinseqLite < Formula
  homepage "http://prinseq.sourceforge.net"
  url "https://downloads.sourceforge.net/project/prinseq/standalone/prinseq-lite-0.20.4.tar.gz"
  version "0.20.4"
  sha1 "b8560cdc059e9b4cbb1bab5142de29bde5d33f61"

  def install
    system "chmod +x prinseq-graphs-noPCA.pl"  
    system "chmod +x prinseq-graphs.pl"
    system "chmod +x prinseq-lite.pl"
    prefix.install Dir["*"]
  end

  test do
    assert_match "Usage:", shell_output("prinseq-lite.pl 2>&1", 1)
  end
end
