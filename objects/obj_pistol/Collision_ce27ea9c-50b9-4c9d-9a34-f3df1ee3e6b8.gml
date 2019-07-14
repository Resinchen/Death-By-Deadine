obj_player.sprite_pack = PlayerSprites.Pistol;
obj_player.has_pistol = true;
obj_player.equip_weapon = "pistol";
scr_show_dialog("<Q> - переключение оружия", "");
instance_destroy();