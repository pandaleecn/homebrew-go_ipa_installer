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
    bin.install "go_ipa_installer"
  end

  plist_options startup: true, manual: "go_ipa_installer"

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{opt_bin}/go_ipa_installer</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
      </dict>
      </plist>
    EOS
  end
end
