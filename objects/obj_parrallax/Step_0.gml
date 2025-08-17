var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);
var i = 0;
var lay_arr = layer_get_all();
layer_x("Backgrounds_1", _cam_x * global.bgparalaxx);
layer_y("Backgrounds_1", _cam_y * global.bgparalaxy);
layer_x("Backgrounds_bitch", _cam_x * 0.15);
layer_x("Backgrounds_2", _cam_x * 0.15);
layer_y("Backgrounds_2", _cam_y * 0.15);
layer_x("Backgrounds_3", _cam_x * 0.05);
layer_y("Backgrounds_3", _cam_y * 0.05);
layer_x("Foregrounds_0", -_cam_x * 0.5);
layer_x("Backgrounds_BIG", _cam_x * 0.05);
var lay = lay_arr[i];
var lay_name = layer_get_name(lay);

switch (lay_name)
{
    case "Backgrounds_stillZH1":
        bg_ZH1_x += bg_ZH1_speed;
        bg_ZH1_y = Wave(-bg_ZH1_offset, bg_ZH1_offset, 4, 10);
        layer_x(lay, (_cam_x * 0.35) + bg_ZH1_x + bg_ZH1_xoffset);
        layer_y(lay, _cam_y * 1);
        break;
}
