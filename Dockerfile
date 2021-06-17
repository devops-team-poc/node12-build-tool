FROM reactnativecommunity/react-native-android
RUN echo fs.inotify.max_user_watches=524288 | tee -a /etc/sysctl.conf && sysctl -p
RUN mkdir -p /root/.android && touch /root/.android/repositories.cfg
RUN echo yes | $ANDROID_HOME/tools/bin/sdkmanager --channel=0 --verbose "system-images;android-27;default;x86_64"          
RUN echo no | $ANDROID_HOME/tools/bin/avdmanager --verbose create avd --force --name "My_Test_Emulator" --package "system-images;android-27;default;x86_64" --sdcard 200M --device 11
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
