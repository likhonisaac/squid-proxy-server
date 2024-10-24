# Squid Proxy Server 🦑

<img align="right" width="180" height="180" src="https://github.com/likhonisaac/squid-proxy-server/blob/main/images/8559182.png?raw=true">

A powerful and automated setup script for a **high-performance Squid Proxy Server**. This script ensures a secure and optimized proxy server configuration, making it easy to deploy on Ubuntu systems.

[![GitHub License](https://img.shields.io/github/license/likhonisaac/squid-proxy-server?color=brightgreen)](https://github.com/likhonisaac/squid-proxy-server/blob/main/LICENSE)

## 🌟 Features
- **One-click Setup**: Installs and configures Squid on Ubuntu servers.
- **Secure Authentication**: Enforces basic HTTP authentication.
- **IP Customization**: Configures Squid to use a custom outbound IP.
- **Minimal Logging**: Optimized for performance with reduced logging.
- **Connection Details**: Provides easy-to-use proxy access credentials.

## 📋 Requirements
- Ubuntu-based server.
- Root or `sudo` privileges.

## 🚀 Setup Instructions
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/squid-proxy-server.git
   cd squid-proxy-server
   ```

2. **Make the Script Executable**:
   ```bash
   chmod +x setup_squid_proxy.sh
   ```

3. **Run the Setup Script**:
   ```bash
   sudo ./setup_squid_proxy.sh
   ```

4. **Connect to the Proxy**:
   Once the script finishes, it will display the proxy connection details:
   ```
   🌐 Proxy Server: 192.0.2.0
   🔌 Port: 3128
   👤 Username: squiduser
   🔑 Password: squidpass
   ```

## 📊 Usage Example

| Proxy Server Details | Value |
| -------------------- | ----- |
| Server IP | 192.0.2.0 |
| Port | 3128 |
| Username | squiduser |
| Password | squidpass |

## 📝 Connecting to the Proxy
To utilize the proxy server, simply configure your device's proxy settings using the provided IP, port, username, and password.

## 🤝 Support and Contact
For any questions, support, or issues, feel free to reach out to our development team:
- Telegram: [RektDevelopers](https://t.me/RektDevelopers)
- Email: [support@rektdevelopers.com](mailto:support@rektdevelopers.com)

## 🤓 About Squid
[Squid](http://www.squid-cache.org/) is a caching and forwarding HTTP web proxy. It has a wide variety of uses, including speeding up a web server by caching repeated requests, caching web, DNS and other computer network lookups for a group of people sharing network resources, and aiding security by filtering traffic.
