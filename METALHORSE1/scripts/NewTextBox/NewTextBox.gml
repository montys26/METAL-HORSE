
function NewTextBox(){

var _obj;
if(instance_exists(oText2)) _obj = oTextQueued; else _obj = oText2
with (instance_create_layer(0,0, "Instances", _obj))
{
	msg = argument[0];
	if (instance_exists(other)) originInstance = other.id else originInstance = noone;
	if (argument_count > 1) background = argument[1]; else background = 1;
	if (argument_count > 2) 
	{
		 // trim markers from responses
		 responses = argument[2];
		 for (var i = 0; i < array_length(responses); i++)
		 {
			 var _markerPosition = string_pos(":", responses[i]);
			 responseScripts[i] = string_copy(responses[i],1,_markerPosition-1);
			 responseScripts[i] = real(responseScripts[i]);
			 responses[i] = string_delete(responses[i],1,_markerPosition);
		 }
		
	}
	else {
		responses = [-1];
		responseScripts = [-1];
		
	}
}




}