class Prinseq < Formula
  homepage "http://prinseq.sourceforge.net"
  url "https://downloads.sourceforge.net/project/prinseq/standalone/prinseq-lite-0.20.4.tar.gz"
  version "0.20.4"
  sha1 "b8560cdc059e9b4cbb1bab5142de29bde5d33f61"

  patch do
    url "https://raw.githubusercontent.com/mscook/homebrew-BanzaiNGS/master/patches/prinseq-lite-Declare-perl-env-properly.patch"
    sha256 "5ff4a5266f79d2b71168cb0ed8f22b8d3e55e6a10e56dbea7061421c747dc44d"
  end

  depends_on "Getopt::Long" => :perl
  depends_on "Pod::Usage" => :perl
  depends_on "File::Temp qw(tempfile)" => :perl
  depends_on "Fcntl qw(:flock SEEK_END)" => :perl
  depends_on "Cwd" => :perl
  depends_on "JSON" => :perl
  depends_on "Cairo"  => :perl
  #depends_on "Statistics::PCA" => :perl
  depends_on "MIME::Base64" => :perl

  def install
    system "chmod +x *.pl"  
    system "mkdir bin"
    system "cp *.pl bin"
    # Note still end up with *.pl as default
    # Quast has an example of how to do this
    system "ln -s bin/prinseq-graphs-noPCA.pl bin/prinseq-graphs-noPCA"
    system "ln -s bin/prinseq-graphs.pl bin/prinseq-graphs"
    system "ln -s bin/prinseq-lite.pl bin/prinseq-lite"
    prefix.install Dir["*"]
  end

  def caveats
    <<-EOS.undent
      NOTES:
        * CPAN installation of cairo perl seems to fail with brew cairo. Solved using 'sudo apt-get install libcairo2-dev'
        * The PRINSEQ Perl executables end up with .pl extensions
        * We don't do PCA version (perl is shit)
    EOS
  end

  test do
    assert_match "Usage:", shell_output("prinseq-lite.pl 2>&1", 1)
  end
end
