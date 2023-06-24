#!/usr/bin/env bash

rm -f /tmp/cloudeagle
curl -Lo /tmp/cloudeagle_Linux_x86_64.tar.gz https://github.com/taylormonacelli/cloudeagle/releases/latest/download/cloudeagle_Linux_x86_64.tar.gz
tar xzf /tmp/cloudeagle_Linux_x86_64.tar.gz -C /tmp
install --mode 0755 --group root --owner root /tmp/cloudeagle /usr/local/bin/cloudeagle
