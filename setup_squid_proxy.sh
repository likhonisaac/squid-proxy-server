#!/bin/bash

# 🎯 Variables
PROXY_IP="157.240.22.35"  # The IP address for outbound traffic
SQUID_PORT=3128           # Squid default port
USERNAME="proxyuser"      # Proxy username
PASSWORD="proxypass"      # Proxy password

# 📦 Step 1: Update system and install Squid + utilities for user management
echo "🔄 Updating system and installing Squid..."
sudo apt update -y && sudo apt install squid apache2-utils -y

# 🔒 Step 2: Create Squid configuration backup
echo "🔒 Backing up original Squid configuration..."
sudo cp /etc/squid/squid.conf /etc/squid/squid.conf.bak

# 🧑‍💻 Step 3: Create authentication password file for Squid
sudo touch /etc/squid/passwd
sudo chown proxy:proxy /etc/squid/passwd

# 👤 Step 4: Create a user for proxy authentication
echo "👤 Creating user for proxy authentication..."
sudo htpasswd -b -c /etc/squid/passwd "$USERNAME" "$PASSWORD"

# ⚙️ Step 5: Update Squid configuration to use custom IP and authentication
echo "⚙️ Configuring Squid proxy to use IP $PROXY_IP and require authentication..."

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

# 🔄 Step 6: Restart Squid to apply changes
echo "🔄 Restarting Squid service..."
sudo systemctl restart squid

# 🚀 Step 7: Enable Squid to start on boot
sudo systemctl enable squid

# 📝 Step 8: Output the connection details for the proxy server
echo ""
echo "==========================================="
echo "✅ Squid Proxy Server setup completed!"
echo "📝 Use the following details to connect:"
echo "-------------------------------------------"
echo "🌐 Proxy Server: $PROXY_IP"
echo "🔌 Port: $SQUID_PORT"
echo "👤 Username: $USERNAME"
echo "🔑 Password: $PASSWORD"
echo "==========================================="
