class Intro
  def go
    they_have_crystal_installed? = system("which crystal")

    unless they_have_crystal_installed?
      "" >> "Beeline requires the Crystal compiler. Visit https://crystal-lang.org for information."
      exit 1
    end

    "welcome        " >> "Welcome to the interactive beeline guide."
    "               " >> ""
    "explain        " >> "Beeline is a powerline alternative designed for use in shells like bash."
    "explain        " >> "It's fully customizable, using the wonderful programming language Crystal."
    "explain        " >> "Because Crystal is a compiled language, beeline runs very quickly and adds almost no overhead to your shell's prompt."
    "               " >> ""
    "steps          " >> "Here's a quick overview of what you'll need to do:"
    "               " >> "1) Create a Crystal project"
    "               " >> "2) Add 'beeline' as a dependency"
    "               " >> "3) Write a small Crystal program to setup your configuration"
    "               " >> "4) Compile your Crystal program"
    "               " >> "5) Update your shell prompt"
    "               " >> ""
    "warning        " >> "You're welcome to do these steps on your own or this tool can guide you through most of the setup."
    "warning        " >> "Use ^C to exit this guide at any time."
    "               " >> ""
  end
end
