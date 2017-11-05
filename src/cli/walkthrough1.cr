require "file_utils"

class WTOne
  def go
    "walkthrough 1/5" >> "Where do you want to store your Crystal project?"
    "walkthrough 1/5" >> "This is where your beeline configuration will live."
    "walkthrough 1/5" >> "Suggestions: ~/.beeline/, ~/projects/beeline"

    destination = "               ".gets
    destination = destination.gsub("~", ENV["HOME"])

    "walkthrough 1/5" >> "You've selected #{destination}"
    the_destination_exists = Dir.exists?(destination)
    if the_destination_exists
      "warning        " >> "It seems like there's already a project here."
      "warning        " >> "Please remove the directory and re-run this tool."
      "exit           " >> "Good-bye."
      exit 1
    end

    they_havent_answered = true
    while they_havent_answered
      "walkthrough 1/5" >> "Do you want to continue creating the project?" unless the_destination_exists
      answer = "               ".gets

      they_havent_answered = false
      case answer.downcase
      when "y", "yes", "yeah", "definitely", "of course"
        they_want_to_proceed_creating_the_project = true
      when "n", "no", "nope", "no way", "absolutely not"
        they_want_to_proceed_creating_the_project = false
      else
        they_havent_answered = true
      end
    end

    unless they_want_to_proceed_creating_the_project
      "exit           " >> "Good-bye."
      exit 1
    end

    "walkthrough 1/5" >> "Creating the project."
    FileUtils.mkdir_p(destination)
    "walkthrough 1/5" >> "Directory created."

    FileUtils.cd(destination) do
      FileUtils.touch("shard.yml")
      FileUtils.mkdir("src")
      FileUtils.touch("src/mybeeline.cr")
      "walkthrough 1/5" >> "Project created."
    end

    "               " >> ""
    return destination
  end
end
