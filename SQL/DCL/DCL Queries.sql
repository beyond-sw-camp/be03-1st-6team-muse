create user 'user_viewpoint'@'%';
create user 'admin_viewpoint'@'%';

grant select on muse.* to 'admin_viewpoint'@'%';
grant update on muse.* to 'admin_viewpoint'@'%';
grant insert on muse.* to 'admin_viewpoint'@'%';
grant delete on muse.* to 'admin_viewpoint'@'%';
grant exectue on procedure muse.press_like to 'admin_viewpoint'@'%';
grant exectue on procedure muse.playlist_rename to 'admin_viewpoint'@'%';
grant exectue on procedure muse.playlist_on_off_set to 'admin_viewpoint'@'%';
grant exectue on procedure muse.playlist_music_insert to 'admin_viewpoint'@'%';
grant exectue on procedure muse.press_image_change to 'admin_viewpoint'@'%';
grant exectue on procedure muse.delete_playlist to 'admin_viewpoint'@'%';
flush privileges;

grant select on muse.* to 'user_viewpoint'@'%';
grant exectue on procedure muse.press_like to 'user_viewpoint'@'%';
grant exectue on procedure muse.playlist_rename to 'user_viewpoint'@'%';
grant exectue on procedure muse.playlist_on_off_set to 'user_viewpoint'@'%';
grant exectue on procedure muse.playlist_music_insert to 'user_viewpoint'@'%';
grant exectue on procedure muse.press_image_change to 'user_viewpoint'@'%';
grant exectue on procedure muse.delete_playlist to 'user_viewpoint'@'%';
flush privileges;