class Snd < Formula
  desc "Snd is a sound editor modelled loosely after Emacs"
  homepage "https://ccrma.stanford.edu/software/snd/"
  url "https://ccrma.stanford.edu/software/snd/snd-20.7.tar.gz"
  sha256 "92376d582389f9bd6e3e49244fff7d146146afe324dcf1502596a29fa710a4cd"

  # depends_on :x11
  depends_on "pkg-config" => :build
  depends_on "portaudio"
  depends_on "openmotif"
  depends_on "fftw"

  def install
    system "ruby tools/make-config-pc.rb > ./ruby.pc"
    ENV["PKG_CONFIG_PATH"] += ":."
    system "./configure", "--with-motif",
                          "--with-gl",
                          "--with-gl2ps",
                          "--with-ruby",
                          "--with-portaudio",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/snd", "--help"
  end

end
