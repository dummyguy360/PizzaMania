function Wave(argument0, argument1, argument2, argument4)
{
	if (argument4 == undefined)
	    argument4 = -4;

	var a4 = (argument1 - argument0) * 0.5;
	var t = current_time;

	if (argument4 != -4)
	    t = argument4;

	return argument0 + a4 + (sin((((t * 0.001) + (argument2 * argument3)) / argument2) * (2 * pi)) * a4);
}