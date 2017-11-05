class WTTwo
  def go(destination)
    "walkthrough 2/5" >> "Adding base shards.yml contents."
    shard_yml = File.open(destination + "/shard.yml", mode = "w")
    shard_yml << <<-SHARD
name: mybeeline
version: 1.0.0

targets:
  beeline:
    main: src/mybeeline.cr

crystal: 0.23.1

license: MIT

SHARD

    "walkthrough 2/5" >> "Adding beeline as a dependency."
    shard_yml << <<-DEPENDENCY
dependencies:
  beeline:
    github: willamin/beeline
DEPENDENCY

    shard_yml.close
    "               " >> ""
  end
end
