# Use Debian-based Node image
FROM node:20

WORKDIR /app

# Copy dependency files first
COPY package*.json ./

# Install system libraries and dependencies
RUN apt-get update && apt-get install -y python3 make g++ \
  && npm install \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Copy app source code
COPY . .

# Build Strapi admin panel
RUN npm run build

EXPOSE 1337

CMD ["npm", "start"]
