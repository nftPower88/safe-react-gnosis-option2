FROM node:14

RUN apt-get update \
    && apt-get install -y libusb-1.0-0 libusb-1.0-0-dev libudev-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /

COPY package.json yarn.lock .

COPY  src/logic/contracts/artifacts ./src/logic/contracts/artifacts

RUN yarn install

COPY . .

EXPOSE 3000

CMD ["yarn", "start"]
