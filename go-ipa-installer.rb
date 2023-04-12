class GoIpaInstaller < Formula
  desc "Go IPA Installer service for installing iOS apps over HTTP"
  homepage "https://github.com/pandaleecn/go_ipa_installer" # Replace 'pandaleecn' with your actual GitHub username
  url "https://github.com/pandaleecn/go_ipa_installer/archive/refs/tags/v1.0.1.tar.gz" # Replace with the correct URL to the tarball of the release
  sha256 "bf391aaea092f8f877cfdd61af8457f963c603a8184b62b6f0d9d51653f4aee3"
  license "MIT"

  depends_on "go" => :build
  depends_on "libimobiledevice"
  depends_on "ideviceinstaller"

  def install
    system "go", "build", "-o", "go_ipa_installer", "main.go" # Add this line to build the binary
    bin.install "go_ipa_installer"
  end

  # Removed plist_options and plist method, replaced with service block
  service do
    run opt_bin/"go_ipa_installer"
    keep_alive true
  end
end
