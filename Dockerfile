# syntax=docker/dockerfile:1
FROM node:20-alpine
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY server.mjs ./
ENV MCP_VARIANT=diagnostic \
    MCP_PORT=8000
EXPOSE 8000
ENTRYPOINT ["node", "server.mjs"]
