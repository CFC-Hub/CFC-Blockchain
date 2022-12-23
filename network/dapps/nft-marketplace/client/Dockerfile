FROM node:18-alpine

ENV NODE_ENV development

WORKDIR /app
# Cache and Install dependencies
COPY package.json .
RUN npm install
# Copy app files
COPY . .
# Expose port
EXPOSE 5001
# Start the app
CMD [ "npm", "start" ]