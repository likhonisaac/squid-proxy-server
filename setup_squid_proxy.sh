#!/bin/bash

# 🦑 Squid Proxy Auto-Setup Script with Banner and Telegram Link 🎨
# ==============================================
# Author: RektDevelopers (https://t.me/RektDevelopers)
# ==============================================

# 🖍 Colors
GREEN=$(tput setaf 2)
RED=$(tput setaf 1)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)

# 🎯 Variables
PROXY_IP="157.240.22.35"  # The IP address for outbound traffic
SQUID_PORT=3128           # Squid default port
USERNAME="proxyuser"      # Proxy username
PASSWORD="proxypass"      # Proxy password
TELEGRAM_LINK="https://t.me/RektDevelopers"

# 📦 Function to install necessary packages
install_packages() {
  echo "${BLUE}🔄 Updating system and installing Squid + utilities...${RESET}"
  sudo apt update -y && sudo apt install squid apache2-utils -y
}

# 🔒 Function to back up Squid configuration
backup_squid_config() {
  echo "${YELLOW}🔒 Backing up original Squid configuration...${RESET}"
  sudo cp /etc/squid/squid.conf /etc/squid/squid.conf.bak
}

# 🧑‍💻 Function to create proxy user authentication
create_proxy_user() {
  echo "${GREEN}👤 Creating user for proxy authentication...${RESET}"
  sudo touch /etc/squid/passwd
  sudo chown proxy:proxy /etc/squid/passwd
  sudo htpasswd -b -c /etc/squid/passwd "$USERNAME" "$PASSWORD"
}

# ⚙️ Function to configure Squid with custom IP and auth
configure_squid() {
  echo "${BLUE}⚙️ Configuring Squid proxy with IP $PROXY_IP and authentication...${RESET}"
  sudo bash -c "cat > /etc/squid/squid.conf" <<EOL
# Squid Config File

# Define the IP to use for outbound connections
tcp_outgoing_address $PROXY_IP

# Port for Squid to listen on
http_port $SQUID_PORT

# Enable basic authentication
auth_param basic program /usr/lib/squid/basic_ncsa_auth /etc/squid/passwd
auth_param basic realm proxy
auth_param basic credentialsttl 2 hours
auth_param basic casesensitive on

# Allow authenticated users only
acl authenticated proxy_auth REQUIRED
http_access allow authenticated

# Deny everything else
http_access deny all

# Logging settings (reduce logging for performance)
access_log none
cache_log /var/log/squid/cache.log
EOL
}

# 🖥️ Function to display colorful banner
display_banner() {
  echo "${YELLOW}"
  echo "==========================================="
  echo "   🦑 Welcome to the Squid Proxy Installer 🦑"
  echo "   Setup for your proxy server will begin!"
  echo "==========================================="
  echo "${RESET}"
}

# 🚀 Function to restart and enable Squid
restart_squid() {
  echo "${GREEN}🔄 Restarting Squid service...${RESET}"
  sudo systemctl restart squid
  sudo systemctl enable squid
}

# 📝 Function to print connection details
print_details() {
  echo "${YELLOW}"
  echo "==========================================="
  echo "✅ ${GREEN}Squid Proxy Server setup completed!${RESET}"
  echo "📝 ${BLUE}Use the following details to connect:${RESET}"
  echo "-------------------------------------------"
  echo "🌐 ${BLUE}Proxy Server:${RESET} ${PROXY_IP}"
  echo "🔌 ${BLUE}Port:${RESET} ${SQUID_PORT}"
  echo "👤 ${BLUE}Username:${RESET} ${USERNAME}"
  echo "🔑 ${BLUE}Password:${RESET} ${PASSWORD}"
  echo "==========================================="
  echo "📲 ${GREEN}Telegram Support:${RESET} ${BLUE}${TELEGRAM_LINK}${RESET}"
  echo "${RESET}"
}

# 🏗️ Main setup logic
main() {
  # Display colorful banner
  display_banner

  # Install necessary packages
  install_packages

  # Back up Squid configuration
  backup_squid_config

  # Create user for proxy authentication
  create_proxy_user

  # Configure Squid
  configure_squid

  # Restart Squid service
  restart_squid

  # Output connection details
  print_details
}

# Run the main function
main
