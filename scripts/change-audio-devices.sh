#!/bin/bash

#speakers="alsa_output.pci-0000_06_00.1.hdmi-stereo-extra3"
speakers="alsa_output.pci-0000_08_00.1.hdmi-stereo"
headphones1="alsa_output.usb-Schiit_Audio_I_m_Fulla_Schiit-00.iec958-stereo"
headphones2="alsa_output.usb-Schiit_Audio_I_m_Fulla_Schiit-00.iec958-stereo.2"

swap_to_speakers() {
	pactl set-default-sink $speakers
}

swap_to_headphones() {
	if ! pactl list | grep -i $headphones2; then
		echo "swapping to $headphones1"
		pactl set-default-sink $headphones1
	else
		echo "swapping to $headphones2"
		pactl set-default-sink $headphones2	
	fi
}

$1 $2
