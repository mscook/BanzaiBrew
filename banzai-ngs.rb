class BanzaiNgs < Formula
  homepage "https://github.com/mscook/Banzai-MicrobialGenomics-Pipeline"
  url "https://github.com/mscook/Banzai-MicrobialGenomics-Pipeline/archive/master.zip"
  version "0.0.5"
  sha1 "4985f10609a0310629a71ef239682f71d696710e"

  ###############################
  # Quality control dependencies
  ###############################
  # Read qualities
  depends_on "fastqc"
  depends_on "prinseq"
  # Contaminants
  depends_on "kraken"
  depends_on "ncbi-blast-binary"
  # Cleaning
  depends_on "nesoni"
  # Inserts/quick map
  depends_on "bwa"
  depends_on "samtools"
  depends_on "vcftools"
  depends_on "picard-tools"


  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
    system "python", *Language::Python.setup_install_args(libexec)

    bin.install Dir["#{libexec}/bin/*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end


  def caveats
    <<-EOS.undent
      TODO
    EOS
  end


  #test do
  #end
end
