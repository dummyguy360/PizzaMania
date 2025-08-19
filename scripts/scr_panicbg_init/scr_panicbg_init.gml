function scr_panicbg_init()
{
	//DDP Initialize wavy panic background whenever timer starts or room changes
	var layers, layernum = 0;

	// Check for all layers that exist
	for (i = 0; i < 3; i++)
	{
	    var layername = "Backgrounds_" + string(i + 1);
    
	    if (layer_exists(layername))
	    {
	        layers[layernum] = layername;
	        layernum++;
	    }
	}

	// No backgrounds found, or backgrounds had wrong names
	if !layernum
	    return;

	// Change to panic shader on top layer, reset on bottom layer
	var bottom_id = layer_get_id(layers[0]);
	var top_id = layer_get_id(layers[layernum - 1]);
	layer_script_begin(bottom_id, scr_panicbg_start);
	layer_script_end(top_id, scr_panicbg_end);
}