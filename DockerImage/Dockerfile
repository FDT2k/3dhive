FROM octoprint/octoprint

USER root

RUN groupadd -g 14 serial
RUN usermod -a -G serial octoprint

USER octoprint
