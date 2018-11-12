Calculator Setup

1) Prerequisite:
- CPAN and CPANM installed
- Mojolicious is up and running
  curl -L https://cpanmin.us | perl - -M https://cpan.metacpan.org -n Mojolicious

2) Steps to run the project
- Unzip the project under your home directory
  unzip my_app.zip
- Run the web application
  cd my_app
  morbo script/my_app   # Server available at http://127.0.0.1:3000
- Run test cases on different terminal
  prove -lv t

3) Web APIs

http://localhost:3000/add?leftoperand={d}&rightoperand={d}
http://localhost:3000/minus?leftoperand={d}&rightoperand={d}
http://localhost:3000/multiply?leftoperand={d}&rightoperand={d}
http://localhost:3000/divide?leftoperand={d}&rightoperand={d}
http://localhost:3000/factorize?leftoperand={d}
