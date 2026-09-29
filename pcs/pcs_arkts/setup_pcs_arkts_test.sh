#!/bin/sh
echo "[DEBUG] setup_pcs_arkts_test.sh started"
BUNDLE_NAME=com.acts.pcs.arktstest

# 清理无效目录
for garbage in /data/app/el2/*/base/${BUNDLE_NAME}; do
  if [ -d "$garbage" ]; then
    REST=${garbage#/data/app/el2/}
    GID=${REST%%/*}
    if [ -n "$GID" ]; then
      case "$GID" in
        [0-9][0-9][0-9]*) ;;
        *) echo "[DEBUG] cleaning garbage dir: $garbage (invalid userId=$GID)"; rm -rf "$garbage" ;;
      esac
    fi
  fi
done

USERID=""
for dir in /data/app/el2/*/base/${BUNDLE_NAME}; do
  if [ -d "$dir" ]; then
    REST=${dir#/data/app/el2/}
    ID=${REST%%/*}
    echo "[DEBUG] found dir: $dir, ID=$ID"
    if [ -n "$ID" ] && [ -d "$dir/haps/entry" ]; then
      USERID=$ID
      echo "[DEBUG] selected uid=$USERID (has haps/entry)"
      break
    fi
  fi
done

# Fallback: 若未找到含 haps/entry 的目录, 取最大 uid
if [ -z "$USERID" ]; then
  for dir in /data/app/el2/*/base/${BUNDLE_NAME}; do
    if [ -d "$dir" ]; then
      REST=${dir#/data/app/el2/}
      ID=${REST%%/*}
      if [ -n "$ID" ]; then
        if [ -z "$USERID" ] || [ "$ID" -gt "$USERID" ]; then
          USERID=$ID
        fi
      fi
    fi
  done
fi

echo "[DEBUG] collected uid=$USERID"
if [ -z "$USERID" ]; then
  echo "[ERROR] failed to get uid, no sandbox dir found for ${BUNDLE_NAME}" >&2
  ls -la /data/app/el2/ >&2
  exit 1
fi

TARGET=/data/app/el2/${USERID}/base/${BUNDLE_NAME}/haps/entry/files
echo "[DEBUG] TARGET=$TARGET"

mkdir -p "$TARGET"
cp /data/local/tmp/bundle_fifth.hap "$TARGET"/ && echo "[DEBUG] cp bundle_fifth.hap DONE" || echo "[DEBUG] cp bundle_fifth.hap FAILED"
cp /data/local/tmp/Believer.wav "$TARGET"/ && echo "[DEBUG] cp Believer.wav DONE" || echo "[DEBUG] cp Believer.wav FAILED"
cp /data/local/tmp/common_event.txt "$TARGET"/ && echo "[DEBUG] cp common_event.txt DONE" || echo "[DEBUG] cp common_event.txt FAILED"

chmod 777 -R /data/app/el2/${USERID}/base/${BUNDLE_NAME}/haps/entry
echo "[DEBUG] done, list target:"
ls -la "$TARGET"/
