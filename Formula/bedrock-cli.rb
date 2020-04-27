# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class BedrockCli < Formula
    desc "The CLI for Bedrock"
    homepage "https://microsoft.github.io/bedrock-cli/commands/"
    url "https://github.com/microsoft/bedrock-cli/archive/v0.6.4.tar.gz"
    sha256 "e8e3298795217e47a419dffa9d3e163b4c85da5fc57596822ec7d80f99e97519"
  
    # depends_on "terraform" => :build
    depends_on "yarn" => :build
    depends_on "node" => :build
    depends_on "terraform"
    depends_on "helm" => "2.16.3"
    depends_on "azure-cli"
    depends_on "kubectl"
  
    def install
      # ENV.deparallelize  # if your formula fails when building in parallel
      # Remove unrecognized options if warned by configure
      # system "./configure", "--disable-debug",
      #                       "--disable-dependency-tracking",
      #                       "--disable-silent-rules",
      #                       "--prefix=#{prefix}"
      # system "cmake", ".", *std_cmake_args
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
      # `test do` will create, run in and delete a temporary directory.
      #
      # This test will fail and we won't accept that! For Homebrew/homebrew-core
      # this will need to be a test that verifies the functionality of the
      # software. Run the test with `brew test bedrock-cli`. Options passed
      # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
      #
      # The installed folder is not in the path, so use the entire path to any
      # executables being tested: `system "#{bin}/program", "do", "something"`.
      system "false"
    end
  end
  