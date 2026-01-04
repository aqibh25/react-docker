# React Docker Training Application

A React application demonstrating Docker containerization best practices for both development and production environments. The application features hot-reload development setup, automated testing, and a multi-stage production build with Nginx.

## Architecture

The application is built using Docker containerization with the following components:

- **React Frontend**: React 18 application built with Create React App
- **Development Container**: Node.js container with hot-reload enabled via volume mounting
- **Test Container**: Automated testing service with watch mode
- **Production Container**: Multi-stage build with Nginx serving optimized static files

## How It Works

### Development Mode

1. Docker Compose starts the development container with volume mounting
2. Source code is mounted as a volume for live updates
3. React development server runs with hot-reload enabled
4. Changes to source files automatically trigger browser refresh
5. Test service runs in watch mode for continuous testing

### Production Mode

1. Multi-stage Docker build process:
   - Stage 1: Builds the React application using Node.js
   - Stage 2: Serves the optimized build files using Nginx
2. Static files are served efficiently through Nginx
3. Application runs in a lightweight production container

## Prerequisites

- Docker and Docker Compose installed on your system
- Git (for cloning the repository)

## Getting Started

### Development Mode

1. Clone the repository:
   ```bash
   git clone git@github.com:aqibh25/react-docker.git
   cd react-docker
   ```

2. Start the development environment:
   ```bash
   docker-compose -f docker-compose-dev.yml up
   ```

   This will:
   - Build and start the development container with hot-reload enabled
   - Mount your local code as volumes for live updates
   - Expose the application on `http://localhost:3000`
   - Start the test service in watch mode

3. Access the application:
   - Open your browser and navigate to `http://localhost:3000`
   - Make changes to files in `src/` and see them update automatically

### Production Mode

1. Build the production image:
   ```bash
   docker build -t react-docker-training:latest .
   ```

2. Run the production container:
   ```bash
   docker run -p 8080:80 react-docker-training:latest
   ```

   The application will be available on `http://localhost:8080`

## Technologies Used

### Frontend
- React 18.2.0
- React DOM 18.2.0
- React Scripts 5.0.1
- Web Vitals 2.1.4

### Testing
- Testing Library (Jest DOM, React, User Event)

### Infrastructure
- Docker & Docker Compose
- Node.js LTS (Alpine)
- Nginx (Production)

## Development

### Making Changes

In development mode, changes to your code are automatically reflected:
- React app: Changes in `src/` will hot-reload in the browser
- The `WATCHPACK_POLLING` environment variable ensures reliable file watching in Docker
- Node modules are stored in a named volume to improve performance

### Running Tests

Run tests in a Docker container:
```bash
docker-compose -f docker-compose-dev.yml run test
```

Or start the test service with watch mode:
```bash
docker-compose -f docker-compose-dev.yml up test
```

### Stopping the Application

To stop all containers:
```bash
docker-compose -f docker-compose-dev.yml down
```

To stop and remove volumes:
```bash
docker-compose -f docker-compose-dev.yml down -v
```

### Local Development (without Docker)

If you prefer to run the application locally:

1. Install dependencies:
   ```bash
   npm install
   ```

2. Start the development server:
   ```bash
   npm start
   ```

3. Run tests:
   ```bash
   npm test
   ```

4. Build for production:
   ```bash
   npm run build
   ```
