# Select the base image
FROM node:lts-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json before other files
# Utilise Docker cache to save re-installing dependencies if unchanged
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all files
COPY . .

# Build app for production
RUN npm run build

# Expose the app port
EXPOSE 3000

# Run the app
CMD [ "npm", "run", "dev" ]
