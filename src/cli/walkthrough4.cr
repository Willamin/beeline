class WTFour
  def go(destination)
    "walkthrough 4/5" >> "Compiling your crystal program."
    FileUtils.cd(destination) do
      unless system("shards build --release")
        "error          " >> "Shards build failed."
        "info           " >> "You may need to complete the installation manually."
        exit 3
      end
    end
    "walkthrough 4/5" >> "Making your compiled crystal program executable."
    File.chmod(
      destination + "/bin/beeline",
      File.stat(destination + "/bin/beeline").perm | 0o0111
    )
    "               " >> ""
  end
end
