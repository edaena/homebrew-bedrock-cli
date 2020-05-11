class BedrockCli < Formula
    desc "The CLI for Bedrock"
    homepage "https://microsoft.github.io/bedrock-cli/commands/"
    url "https://github.com/edaena/bedrock-cli/releases/download/v0.6.7/dist.tar.gz", :using => :curl
    sha256 "05bd034323c508725e052dfa56041ea75859abbf2f3ab02ee9fa6f97955ae080"
  
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