class BedrockCli < Formula
    desc "The CLI for Bedrock"
    homepage "https://microsoft.github.io/bedrock-cli/commands/"
    url "https://github.com/microsoft/bedrock-cli/archive/v0.6.4.tar.gz"
    sha256 "e8e3298795217e47a419dffa9d3e163b4c85da5fc57596822ec7d80f99e97519"
  
    depends_on "yarn" => :build
    depends_on "node" => :build
    depends_on "terraform"
    depends_on "helm" => "2.16.3"
    depends_on "azure-cli"
    depends_on "kubectl"
    depends_on "edaena/core/fabrikate"
  
    def install
      system "yarn", "install"
      system "yarn", "build"
  
      if OS.mac?
        mv "./dist/bedrock-macos", "./dist/bedrock"
        bin.install "./dist/bedrock"
      elsif OS.linux?
        mv "./dist/bedrock-linux", "./dist/bedrock"
        bin.install "./dist/bedrock"
      end
    end

    test do
      # Run the test with `brew test bedrock-cli`.
      system "#{bin}/bedrock", "project", "init"
      assert File.file?("bedrock.yaml")
    end
  end