local m= {
	startFrame = ProtoField.uint64("fco.startFrame", "startFrame", base.HEX), -- uint64 because it is 8 byte
	crc = ProtoField.uint32("fco.crc", "crc", base.HEX),  
	protocol = ProtoField.uint32("fco.protocol", "protocol", base.HEX),  
	packetLength = ProtoField.uint32("fco.packetLength", "packetLength", base.HEX),  
	timetag = ProtoField.uint32("fco.timetag", "timetag", base.HEX)  ,
	msgtype = ProtoField.uint16("fco.msgtype", "msgtype", base.HEX) ,
	targetport = ProtoField.uint16("fco.targetport", "targetport", base.HEX)  ,
	targettip = ProtoField.uint64("fco.targettip", "targettip", base.HEX)  
}

function m.get_fields()
	local fields = {
		startFrame=m.startFrame,
		crc=m.crc,
		protocol=m.protocol,
		packetLength=m.packetLength,
		timetag=m.timetag,
		msgtype=m.msgtype,
		targetport=m.targetport,
		targettip=m.targettip
	}
	
	return fields
end

function m.parse(headerSubtree , buffer)
    headerSubtree:add_le(m.startFrame, buffer(0,8))
    headerSubtree:add_le(m.crc, buffer(8,4))
    headerSubtree:add_le( m.protocol, buffer(12,4))
    headerSubtree:add_le( m.packetLength, buffer(16,4))
    headerSubtree:add_le( m.timetag, buffer(20,4))
    headerSubtree:add_le( m.msgtype, buffer(24,4))
    headerSubtree:add_le( m.targetport, buffer(28,2))
    headerSubtree:add_le( m.targettip, buffer(30,6))
end

return m 
