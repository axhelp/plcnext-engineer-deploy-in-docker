# All files and directories
chown -R plcnext_firmware /opt/plcnext/projects/PCWE
# Only /opt/plcnext/projects/PCWE
chown admin /opt/plcnext/projects/PCWE

# All directories
find /opt/plcnext/projects/PCWE -type d -exec chmod 775 {} \;

# All files
find /opt/plcnext/projects/PCWE -type f -exec chmod 664 {} \;
