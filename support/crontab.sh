#!/usr/bin/env sh

set -euo pipefail
IFS=$'\n\t'

echo "   * Adding auto-update to crontab"
cron_cmd="DOTFILES_PATH=. ./support/update.sh"
cronjob="0 * * * * $cron_cmd"
echo "     crontab was:"
echo "$(crontab -l)"
( crontab -l 2>/dev/null | grep -v -F "$croncmd" ; echo "$cronjob" ) | crontab -
echo "     crontab changed to:"
echo "$(crontab -l)"
