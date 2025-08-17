function object_get_depth(argument0)
{
	var objID = argument0;
	var ret = 0;

	if (objID >= obj_solid && objID < array_length_1d(global.__objectID2Depth))
	    ret = global.__objectID2Depth[objID];

	return ret;
}