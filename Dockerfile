# Use Debian-based Node image
FROM node:20

WORKDIR /app

# Copy dependency files first
COPY package*.json ./

# Install Strapi dependencies
RUN npm install strapi@latest --legacy-peer-deps


# Copy app source code
COPY . .

# Build Strapi admin panel
RUN npm run build

EXPOSE 1337

CMD ["npm", "start"]
