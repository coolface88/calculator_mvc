Calculator CLI Setup

1) Prerequisite:
- CPAN and CPANM installed
- Mojolicious is up and running
  curl -L https://cpanmin.us | perl - -M https://cpan.metacpan.org -n Mojolicious
- MooseX::App module is installed
  cpanm MooseX::app
- Mojo::UserAgent module is installed (should be ok if Mojolicious already installed)


2) Steps to run the project
- Unzip the project calc_cli.zip and my_app.zip under your home directory
  unzip my_app.zip
  unzip calc_cli.zip
- Run the backend
  cd my_app
  morbo script/my_app   # Server available at http://127.0.0.1:3000
- The server is up and running -> Execute the CLI against the Server
  cd calc_cli
  perl -I directory_to_my_cli_project calc.pm [command] [param] [param] [options]

  Example:
  perl -I /Users/ME664JA/Projects/Perl/calc_cli/ calc.pm add -h

  usage:
    calc.pm add <l_operand> <r_operand> [long options...]
    calc.pm help
    calc.pm add --help

  parameters:
    l_operand  left operand value [Required; Number]
    r_operand  right oprand value [Required; Number]

  options:
    --config              Path to command config file
    --help -h --usage -?  Prints this usage information. [Flag]

  available subcommands:
    help  Prints this usage information

- Run test cases on different terminal
  prove -lv t


3) Web APIs

http://localhost:3000/add?leftoperand={d}&rightoperand={d}
http://localhost:3000/minus?leftoperand={d}&rightoperand={d}
http://localhost:3000/multiply?leftoperand={d}&rightoperand={d}
http://localhost:3000/divide?leftoperand={d}&rightoperand={d}
http://localhost:3000/factorize?leftoperand={d}
