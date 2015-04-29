 class EaUtils < Formula
 homepage "https://code.google.com/p/ea-utils/"
  url "https://ea-utils.googlecode.com/files/ea-utils.1.1.2-537.tar.gz"
  version "1.1.2-537"
  sha1 "688bddb1891ed186be0070d0d581816a35f7eb4e"

  def install
    system "make"
    system "mv fastq-clipper fastq-join fastq-mcf fastq-multx fastq-stats sam-stats varcall bin"
    prefix.install Dir["*"]
  end

  def caveats
    <<-EOS.undent
      
      Requires GSL. On Ubuntu - "sudo apt-get install libgsl0-dev"
    EOS
  end

  test do
    assert_match "usage: fastq-clipper", shell_output("fastq-clipper 2>&1", 1)
    assert_match "usage: fastq-join", shell_output("fastq-join 2>&1", 1)
    assert_match "usage: fastq-mcf", shell_output("fastq-mcf 2>&1", 1)
    assert_match "Usage: fastq-multx", shell_output("fastq-multx 2>&1", 1)
    assert_match "Usage: fastq-stats", shell_output("fastq-stats -h 2>&1 ", 1)
    assert_match "Usage: sam-stats", shell_output("sam-stats -h 2>&1", 1)
    assert_match "Usage: varcall", shell_output("varcall 2>&1", 1)
  end
end
