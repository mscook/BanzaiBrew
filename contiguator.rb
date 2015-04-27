class Contiguator < Formula
  homepage "http://contiguator.sourceforge.net"
  url "https://github.com/combogenomics/CONTIGuator/archive/v2.7.5.tar.gz"
  version "2.7.5"
  sha1 "868b17d34ad0e69fe332b4452abd0e54b06e842d"

  patch do
    url "https://raw.githubusercontent.com/mscook/homebrew-BanzaiNGS/master/patches/CONTIGuator-Declare-python-env-properly.patch"
    sha256 "3a1749e8d7fa9112ca54f02440bb71c1b498f7dcb514d6508e1ac3a6e911b8a0"
  end


  depends_on "ncbi-blast-binary"


  resource "numpy" do
    url "https://pypi.python.org/packages/source/n/numpy/numpy-1.9.2.tar.gz"
    sha1 "86b4414cd01c4244141c59ea476ca8fdad8e9be2"
  end

  resource "biopython" do
    url "https://pypi.python.org/packages/source/b/biopython/biopython-1.65.tar.gz"
    sha1 "16dc84622a707118b3cd48c09807810de61d2321"
  end


  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
    %w[numpy matplotlib].each do |r|
      resource(r).stage do
        system "python", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end
    
    system "mkdir bin"
    system "mv CONTIGuator.py bin"
    bin.install_symlink "CONTIGuator.py" => "CONTIGuator"
    prefix.install Dir["*"]
  end


  def caveats
    <<-EOS.undent
    
       Could have also installed -
         * ABACAS (abacas.sourceforge.net) (optional)
         * MUMmer (mummer.sourceforge.net) (optional)
         * Primer3 (primer3.sourceforge.net) (optional)
         * ACT
    EOS
  end


  test do
  end
end
