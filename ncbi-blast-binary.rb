class NcbiBlastBinary < Formula
  homepage "http://blast.ncbi.nlm.nih.gov/Blast.cgi?PAGE_TYPE=BlastDocs&DOC_TYPE=Download"
  url "ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.2.30/ncbi-blast-2.2.30+-x64-linux.tar.gz"
  version "2.2.30"
  sha1 "2528f99daf6af16869d6eea669f7fce3f7671993"

  depends_on "List::MoreUtils" => :perl 

  def install
    prefix.install Dir["*"]
  end

  test do
    assert_match "BLAST query/options error", shell_output("blastn 2>&1", 1)
  end
end
