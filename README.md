 # Creating-plugin-for-Wireshark

 My purpose in this project was to parse the data in the pcap files given to me, which
includes the Arinc 429 data and an average of 60 bytes in length, and to make the
Arinc 429 data more readable.
 I split this data into two subtrees named header and metadata. In the header
subtree, I divided it into sub-variables such as target port, message type, packet
length. For example, if the message type data is 0x002, I could understand that we
have an Arinc 429 data and I was showing the variables in the metadata subtree.
 While writing this plugin, I coded 4 lua files. One of them is the main file, two are the
file I created the subtrees, and one is the helpers.lua file that allows me to link these
files together. After writing these files, I uploaded them to C:\Users\Wireshark\plugins
and activated the plugin.
