//start waves


if (triggered == false)
{
	//close doors and stop from retriggering
	with (oDoor) closed = true;
	triggered = true;
	
	//number of waves and enemies oper wave
	total_waves = -1;
	for (var i = 0; i < ds_list_size(waves); i++)
	{
		var thisentry = ds_list_find_value(waves, i);
		if (thisentry[_WAVE] > total_waves)
		{
			total_waves ++
			remaining[total_waves] = 0;
		}
		remaining[total_waves]++;
		
	}
		
	}