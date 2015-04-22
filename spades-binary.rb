class SpadesBinary < Formula
  homepage "http://bioinf.spbau.ru/spades"
  url "http://spades.bioinf.spbau.ru/release3.5.0/SPAdes-3.5.0-Linux.tar.gz"
  version "3.5.0"
  sha1 "993fd0f8a11b6997bc271f13a1ff02c0c252f00c"

  def install
    prefix.install Dir["*"]
  end

  test do
    assert_match "SPAdes genome assembler v.3.5.0", shell_output("spades.py -h 2>&1", 1)
  end
end
