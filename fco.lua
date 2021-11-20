package.prepend_path("plugins/fco")

local helpers = require("helpers")
local header =require("header")
local metadata=require("metadata")


fco_protocol= Proto("fco", "fco protocol")

local header_fields = header.get_fields()
local metadata_fields =metadata.get_fields()

helpers.merge_tables(header_fields, fco_protocol.fields)
helpers.merge_tables(metadata_fields, fco_protocol.fields)

function fco_protocol.dissector(buffer, pinfo, tree)
	length=buffer:len()
	if length == 0 then return end

	pinfo.cols.protocol = fco_protocol.name

	local subtree  = tree:add(fco_protocol, buffer() ,"fco protocol data")
	local headerSubtree  = subtree:add(fco_protocol, buffer() ,"header")
	local metadataSubtree  = subtree:add(fco_protocol, buffer() ,"metadata")

	header.parse(headerSubtree, buffer)
	metadata.parse(metadataSubtree, buffer)

end

local udp_port = DissectorTable.get("udp.port")
udp_port:add(47426, fco_protocol)
udp_port:add(63847, fco_protocol)