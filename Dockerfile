FROM node:16 as builder

WORKDIR /app

RUN git clone https://github.com/klembot/twinejs.git /app

RUN npm install
RUN npm run build:web

FROM lipanski/docker-static-website:latest

COPY --from=builder /app/dist/web .