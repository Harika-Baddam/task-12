# Use an official Node image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Install pg (PostgreSQL driver) only if needed
# RUN npm install pg

# Copy rest of the app
COPY . .

# Build the app (for Strapi)
RUN npm run build

EXPOSE 1337
CMD ["npm", "start"]
