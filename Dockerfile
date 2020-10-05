FROM dependabot/dependabot-core

WORKDIR /home/dependabot/dependabot-script

RUN git -c http.sslVerify=false clone --single-branch https://github.com/dependabot/dependabot-script /home/dependabot/dependabot-script

RUN touch ~/.gitconfig

RUN chmod 777 ~/.gitconfig

RUN bundle install -j 3

RUN chmod -R 777 /home/dependabot

ENV HOME /tmp

ENTRYPOINT ruby ./generic-update-script.rb
