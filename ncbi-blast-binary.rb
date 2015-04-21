# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class NCBIBlastBinary  < Formula
  homepage "http://blast.ncbi.nlm.nih.gov/Blast.cgi?PAGE_TYPE=BlastDocs&DOC_TYPE=Download"
  url "ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.2.30/ncbi-blast-2.2.30+-x64-linux.tar.gz"
  version "2.2.30"
  sha1 "2528f99daf6af16869d6eea669f7fce3f7671993"

  def install
    prefix.install Dir["*"]
  end

  test do
    assert_match "BLAST query/options error", shell_output("blastn 2>&1", 1)
  end
end
