




# Manual Installation Guide

## 1. Prerequisites

Make sure you have the following installed on your system:
- **Node.js** (v20 or higher)
- **npm** (v6 or higher)

## 2. Clone the Repository

Open your terminal and run:

```bash
mkdir /opt/cookiecms && cd /opt/cookiecms
git clone https://github.com/Cookie-cms/cookiecms-js.git
git clone https://github.com/Cookie-cms/frontend.git
```

This will clone the project into a folder named `your-project`.

[setup .npmrc file here instructions](/package)


## 3. Install Dependencies

Navigate to the project directory and install the required npm packages:

```bash
cd cookiecms-js
npm install
```
```bash
cd frontend
npm install
```

## 4. Initialize the Application

Run the initialization script which sets up the environment and prepares the project:

```bash
cp .env.example .env
nano .env
```
or use your preferred text editor to modify the `.env` file with your configuration settings.

## 5. Start the backend

Launch the application by running:

```bash
npm run start
```

## 6. Start the frontend
Navigate to the frontend directory and start the frontend application:

```bash
cd frontend
nano .env
```

```bash
NEXT_PUBLIC_API_URL=
NEXT_PUBLIC_PRODUCTION=PROD # PROD, DEMO
NEXT_PUBLIC_ADMIN_LEVEL=3
NEXT_PUBLIC_API_KEY=
```

Then run
```bash
npm run build
npm run start
```
---

## Additional Tips

- **Environment Variables:**  
  Ensure you have created and configured your `.env` file based on the `.env.example` provided in the repository for proper application settings.

- **Reverse Proxy (Optional):**  
  If you need to expose your application to the internet with a domain name, consider setting up Nginx as a reverse proxy. You can use the provided Nginx configuration snippet in the repository as a reference.

- **SSL/HTTPS:**  
  For a secure connection, install Certbot and follow the instructions to obtain and install SSL certificates.

That's it! Your manual installation of CookieCMS is now complete.
