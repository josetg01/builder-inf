#!/bin/bash

sudo apt purge -y \
  xfburn \
  gnome-sudoku \
  quadrapassel \
  gnome-mines \
  gnome-mahjongg \
  remmina \
  pitivi \
  aisleriot \
  gnome-tour
sudo apt autoremove -y && sudo apt update && sudo apt upgrade -y
