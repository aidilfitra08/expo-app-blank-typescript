FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies (without nodejs/npm)
RUN apt update && apt install -y \
  curl git unzip openjdk-17-jdk ruby-full build-essential \
  && apt clean

# Install Node.js v22 from NodeSource
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs

# Install expo-cli and eas-cli
RUN npm install --global expo-cli eas-cli

# Install Android SDK
ENV ANDROID_HOME=/opt/android-sdk
RUN mkdir -p $ANDROID_HOME/cmdline-tools
WORKDIR $ANDROID_HOME/cmdline-tools
RUN curl -o sdk.zip https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip && \
  unzip sdk.zip && \
  rm sdk.zip && \
  mv cmdline-tools latest && \
  yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --sdk_root=${ANDROID_HOME} --licenses

RUN yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --sdk_root=${ANDROID_HOME} \
  "platform-tools" "platforms;android-33" "build-tools;33.0.2"

ENV PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"

WORKDIR /app

COPY package.json yarn.lock* ./
RUN yarn install || npm install

COPY . .

CMD [ "bash" ]