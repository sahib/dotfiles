#!/bin/sh

source ~/bin/setup/util.sh

install_package acpid

echo "-- Enabling acpid:"
sudo systemctl enable acpid.service
sudo systemctl start  acpid.service

echo "-- Copying configuration to /etc/acpi/handler.sh"
sudo cp ~/dotfiles/acpi_handlers.sh /etc/acpi/handler.sh
