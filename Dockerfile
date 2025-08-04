# Use Debian-based Node image
FROM node:20

WORKDIR /app

# Copy dependency files first
COPY package*.json ./

# Install system libraries and dependencies
RUN apt-get update && apt-get install -y python3 make g++ \
  rm -rf node_modules package-lock.json
 RUN npm install
# Install Strapi dependencies
RUN npm install strapi@latest --legacy-peer-deps


# Copy app source code
COPY . .

# Build Strapi admin panel
RUN npm run build

EXPOSE 1337

CMD ["npm", "start"]
