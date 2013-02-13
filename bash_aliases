alias fmusic="find -type f ! -iname '*.flac' -a ! -iname '*.mp3' -a ! -iname '*.ogg'"

# South Migration Helper
function mig(){
	python manage.py schemamigration "$@" --auto;
	python manage.py migrate "$@";
}

# radeon gpu power management
alias profilepm='sudo bash -c "echo profile > /sys/class/drm/card0/device/power_method"'
alias auto='profilepm && sudo bash -c "echo auto > /sys/class/drm/card0/device/power_profile"'
alias low='profilepm && sudo bash -c "echo low > /sys/class/drm/card0/device/power_profile"'
alias mid='profilepm && sudo bash -c "echo mid > /sys/class/drm/card0/device/power_profile"'
alias high='profilepm && sudo bash -c "echo high > /sys/class/drm/card0/device/power_profile"'
alias dynpm='sudo bash -c "echo dynpm > /sys/class/drm/card0/device/power_method"'
alias gpu="sudo cat /sys/kernel/debug/dri/0/radeon_pm_info /sys/class/drm/card0/device/power_method"
