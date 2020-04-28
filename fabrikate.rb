# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Fabrikate < Formula
    desc "Making GitOps with Kubernetes easier one component at a time"
    homepage "https://github.com/microsoft/fabrikate"
    url "https://github.com/microsoft/fabrikate/archive/0.17.3.tar.gz"
    sha256 "432f3502abe8e85080df8c8b21dc26274ab85b72c0bd88af5df7e0080281dd65"
  
    depends_on "go"
  
    def install
      system "scripts/build", "get-deps"
      system "scripts/build", "build", "fab"
      bin.install "./fab"
    end
  
    test do
      # Run the test with `brew test fabrikate`. Options passed
      system "#{bin}/fab", "find", "prometheus"
      find_output = shell_output("#{bin}/fab find prometheus")
      assert_match "fabrikate-prometheus-grafana", version_output
    end
  end
  