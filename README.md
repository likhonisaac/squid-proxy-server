# Squid Proxy Server 🦑

A fully automated setup script for a **Squid Proxy Server** that configures Squid to use a specific IP address, enforces basic authentication, and outputs the necessary credentials for connecting.

## 🚀 Features
- Installs and configures **Squid** on Ubuntu systems.
- Sets up **basic authentication** with a username and password.
- Configures Squid to use a specified **IP address** for outbound traffic.
- **Logs minimal data** for better performance.
- Outputs connection details for easy proxy access.

## 🔧 Requirements
- An Ubuntu-based server.
- Root or `sudo` access.

## 📝 Setup Instructions
1. Clone this repository:
    ```bash
    git clone https://github.com/likhonisaac/squid-proxy-server.git
    cd squid-proxy-server
    ```

2. Make the script executable:
    ```bash
    chmod +x setup_squid_proxy.sh
    ```

3. Run the setup script:
    ```bash
    sudo ./setup_squid_proxy.sh
    ```

Once the script completes, it will print the details needed to connect to the proxy server.


