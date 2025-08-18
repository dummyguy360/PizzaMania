/// @description Initialize Discord.

#macro DISCORD_APP_ID "1376316632447713432"

ready = false;

if (!np_initdiscord(DISCORD_APP_ID, true, np_steam_app_id_empty))
{
    show_message("If you tried to fix NekoPresence, then congrats. I'm not sure how to do it.");
    instance_destroy();
}

largeimage = "";
moretexta = "";
moretextb = "";
state = "";
details = "";
smallimage = "";
