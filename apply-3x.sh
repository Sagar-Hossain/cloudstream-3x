#!/usr/bin/env bash
set -e
P=app/src/main/java/com/lagradost/cloudstream3/ui/player
patch() {
  sed -i "$2" "$1"
  grep -q "$3" "$1" || { echo "PATCH FAILED: $1"; exit 1; }
}
patch $P/PlayerGestureHelper.kt 's/setPlaybackSpeed(2\.0f)/setPlaybackSpeed(3.0f)/' 'setPlaybackSpeed(3.0f)'
patch $P/FullScreenPlayer.kt 's/coerceIn(0\.1f, 2\.0f)/coerceIn(0.1f, 3.0f)/' 'coerceIn(0.1f, 3.0f)'
patch $P/FullScreenPlayer.kt 's/+ 0\.1f), 2\.0f)/+ 0.1f), 3.0f)/' '+ 0.1f), 3.0f)'
patch app/src/main/res/layout/speed_dialog.xml 's/android:valueTo="2\.0"/android:valueTo="3.0"/' 'valueTo="3.0"'
echo "3x patch applied"
