local m = {
	DataSource = ProtoField.string("fco.DataSource", "DataSource", base.NONE),
	RefreshPeriod = ProtoField.uint32("fco.RefreshPeriod", "RefreshPeriod", base.HEX),
	a429speed = ProtoField.uint8("fco.a429speed", "a429speed", base.HEX),
	slewrate = ProtoField.uint8("fco.slewrate", "slewrate", base.HEX),
	count = ProtoField.uint16("fco.count", "count", base.HEX)
}
function m.get_fields()
	local fields = {
		DataSource=m.DataSource,
		RefreshPeriod=m.RefreshPeriod,
		a429speed=m.a429speed,
		slewrate =m.slewrate,
		count =m.count
	}
		
	return fields
end

function m.parse(metadataSubtree ,buffer)
	metadataSubtree:add_le( m.DataSource, buffer(36,16))
    	metadataSubtree:add_le( m.RefreshPeriod , buffer(52,4))
   	metadataSubtree:add_le( m.a429speed , buffer(56,1))
    	metadataSubtree:add_le( m.slewrate  , buffer(57,1))
 	metadataSubtree:add_le( m.count , buffer(58,2))
end 

return m