# typed: false
# frozen_string_literal: true

# :nodoc:
class Gyb < Formula
  desc "\"Generate Your Boilerplate\""
  homepage "https://nshipster.com/swift-gyb/"
  url "https://raw.githubusercontent.com/apple/swift/2193c250c1bb15f2efe74e999c6e718bfb7c70fe/utils/gyb"
  version "2022-03-29"
  sha256 "5647355be7d91007cc4c849da79bea235a7d7f97871384f0d12f639402d53190"

  depends_on xcode: ["10.0", :build]

  resource "gyb.py" do
    url "https://raw.githubusercontent.com/apple/swift/2193c250c1bb15f2efe74e999c6e718bfb7c70fe/utils/gyb.py"
    sha256 "5965040b4c04528191d392d57282b1c5970fb8c3fedf1fb64bf6412173d6ac72"
    version "2022-03-29"
  end
  depends_on "python@2" if MacOS.version <= :snow_leopard

  def install
    resource("gyb.py").stage { bin.install "gyb.py" }
    bin.install "gyb"
    chmod 0755, bin/"gyb"
  end

  test do
    system bin/"gyb", "--help"
  end
end
