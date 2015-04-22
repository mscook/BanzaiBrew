class QuastMpl < Formula
  homepage "http://bioinf.spbau.ru/en/quast"
  url "https://downloads.sourceforge.net/project/quast/quast-2.3.tar.gz"
  sha1 "9bf176f852cf1b77f201b15e7d9262ae29cff727"

  resource "matplotlib" do
    url "https://pypi.python.org/packages/source/m/matplotlib/matplotlib-1.4.3.tar.gz"
    sha1 "8b24472780a23e686135dd08ec1bc5ef88db1979"
  end


  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
    %w[matplotlib].each do |r|
      resource(r).stage do
        system "python", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end

    prefix.install Dir["*"]
    bin.install_symlink "../quast.py", "../metaquast.py",
      "quast.py" => "quast", "metaquast.py" => "metaquast"
  end

  test do
    system "#{bin}/quast"
    cd prefix do
      system "#{bin}/quast", "--test"
      rm_rf "quast_test_output"
    end
  end
end
