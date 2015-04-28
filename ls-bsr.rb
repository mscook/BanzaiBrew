class LsBsr < Formula
  homepage "https://github.com/jasonsahl/LS-BSR"
  url "https://github.com/jasonsahl/LS-BSR/archive/master.zip"
  # Version, M.DDYY of clone
  version "1.4.2815"
  sha1 "4077a992dfc519f3bd6a73fe76e4b90eb5ccc705"

  depends_on "blast-legacy"
  depends_on "blat"
  depends_on "prodigal"

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
    %w[numpy biopython].each do |r|
      resource(r).stage do
        system "python", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end

    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
    system "python", *Language::Python.setup_install_args(libexec)

    bin.install Dir["#{libexec}/bin/*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  
  
    (share / "tools").install Dir["contrib/*"]
  end


  def caveats
    <<-EOS.undent
      
      USEARCH is a dependency and requires a licence. Install it manually and place it in your PATH 
    EOS
  end


  test do
    system "#{bin}/nesoni", "clip"
  end
end
