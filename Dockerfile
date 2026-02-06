# Multi-stage build for Mission Control (Next.js + SQLite)
FROM node:20-slim AS builder

ENV NEXT_TELEMETRY_DISABLED=1
WORKDIR /app

# System deps for better-sqlite3
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    python3 \
  && rm -rf /var/lib/apt/lists/*

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build

FROM node:20-slim AS runner

ENV NODE_ENV=production
ENV NEXT_TELEMETRY_DISABLED=1
WORKDIR /app

# Lightweight init for signal handling
RUN apt-get update && apt-get install -y --no-install-recommends dumb-init \
  && rm -rf /var/lib/apt/lists/*

# Copy runtime artifacts
COPY --from=builder /app /app

# Install production deps only
RUN npm ci --omit=dev

EXPOSE 3000

CMD ["dumb-init", "npm", "run", "start"]
