class BedrockCli < Formula
    desc "The CLI for Bedrock"
    homepage "https://microsoft.github.io/bedrock-cli/commands/"
    url "https://github.com/edaena/bedrock-cli/releases/download/v0.6.6/dist.tar.gz", :using => :curl
    sha256 "2e04d8fe8c2f2778ec69a7950ec1607fa7ebd0e55b52bcb1d9a56c5243e215f8"
  
    depends_on "terraform"
    depends_on "helm" => "2.16.3"
    depends_on "azure-cli"
    depends_on "kubectl"
    
    def install
      if OS.mac?
        mv "./bedrock-macos", "./bedrock"
      elsif OS.linux?
        mv "./bedrock-linux", "./bedrock"
      end
      bin.install "./bedrock"
    end 

    test do
      # Run the test with `brew test bedrock-cli`.
      system "#{bin}/bedrock", "project", "init"
      assert File.file?("bedrock.yaml")
    end
  end