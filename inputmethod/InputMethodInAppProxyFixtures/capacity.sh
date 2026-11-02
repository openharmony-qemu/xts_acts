#!/system/bin/sh
# Copyright (c) 2026 Huawei Device Co., Ltd.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
set -eu
mode="$1"
RESOURCE=/data/local/tmp/ActsInputMethodInAppProxyFixtures
identity_starttime() (
  trap - EXIT
  IFS= read -r identity_line <"$1" || exit 1
  set -- ${identity_line##*) }
  [ "$#" -ge 20 ] || exit 1
  shift 19
  printf '%s\n' "$1"
)
script_process_matches() (
  trap - EXIT
  identity_pid="$1"; identity_start="$2"; identity_mode="$3"; identity_root="${4-}"
  case "$identity_pid:$identity_start" in *[!0-9:]*|:|*:|:*) exit 1;; esac
  [ -r "/proc/$identity_pid/stat" ] || exit 1
  [ "$(identity_starttime "/proc/$identity_pid/stat")" = "$identity_start" ] || exit 1
  exec 3<"/proc/$identity_pid/cmdline" || exit 1
  IFS= read -r -d "" identity_arg0 <&3 || exit 1
  IFS= read -r -d "" identity_arg1 <&3 || exit 1
  IFS= read -r -d "" identity_arg2 <&3 || exit 1
  [ "$identity_arg0" = sh ] && [ "$identity_arg1" = "$RESOURCE/capacity.sh" ] || exit 1
  [ "$identity_arg2" = "$identity_mode" ] || exit 1
  if [ "$identity_mode" != serve ]; then
    IFS= read -r -d "" identity_arg3 <&3 || exit 1
    [ "$identity_arg3" = "$identity_root" ] || exit 1
  fi
  if IFS= read -r -d "" identity_extra <&3; then exit 1; fi
  [ -z "$identity_extra" ] || exit 1
  exec 3<&-
  [ -r "/proc/$identity_pid/stat" ] || exit 1
  [ "$(identity_starttime "/proc/$identity_pid/stat")" = "$identity_start" ]
)
if [ "$mode" = stop-server ]; then
  if [ -s "$RESOURCE/server.pid" ] && [ -s "$RESOURCE/server.stat" ]; then
    pid=$(cat "$RESOURCE/server.pid")
    expected_start=$(cat "$RESOURCE/server.stat")
    if script_process_matches "$pid" "$expected_start" serve; then
      kill -TERM "$pid"
    fi
  fi
  sh "$0" cleanup-all
  exit 0
fi
if [ "$mode" = serve ]; then
  identity_starttime /proc/$$/stat >"$RESOURCE/server.stat"
  echo $$ >"$RESOURCE/server.pid"
  started=$(date +%s)
  handled="$RESOURCE/handled-$started"
  mkdir -m 700 "$handled"
  while [ "$(cat "$RESOURCE/server.pid")" = "$$" ]; do
    hilog -x -T XtsCapacityRequest |
      sed -n 's/^[^ ]* [^ ]* *\([0-9]*\) .*token=\([0-9]*\) mode=\(prepare\|evict\|cleanup\)$/\1 \2 \3/p' \
      >"$RESOURCE/requests"
    while read request_pid token phase; do
      case "$request_pid" in ''|*[!0-9]*) continue;; esac
      allowed_pids=$(pidof com.acts.inputmethod.inappproxy || true)
      case " $allowed_pids " in *" $request_pid "*) ;; *) continue;; esac
      case "$token" in ''|*[!0-9]*) continue;; esac
      seconds="${token%???}"
      [ "$seconds" -ge "$started" ] && [ "$seconds" -le "$(($(date +%s)+300))" ] || continue
      [ ! -f "$handled/$token-$phase" ] || continue
      root="/data/local/tmp/acts-inapp-proxy-capacity-$token"
      if [ "$phase" = prepare ]; then mkdir -m 700 "$root"; fi
      result=FAIL
      if sh "$0" "$phase" "$root" >"$root/$phase.log" 2>&1; then result=DONE; fi
      "$RESOURCE/ActsInputMethodInAppProxyCapacityWorker" --emit-log "$token" "$phase" "$result" "$root/$phase.log"
      : >"$handled/$token-$phase"
    done <"$RESOURCE/requests"
    sleep 0.1
  done
fi
if [ "$mode" = cleanup-all ]; then
  for directory in /data/local/tmp/acts-inapp-proxy-capacity-*; do
    [ -d "$directory" ] || continue
    sh "$0" cleanup "$directory"
  done
  exit 0
fi
root="$2"
case "$root" in /data/local/tmp/acts-inapp-proxy-capacity-*) ;; *) exit 90;; esac
suffix="${root#/data/local/tmp/acts-inapp-proxy-capacity-}"
case "$suffix" in ''|*[!0-9]*) exit 91;; esac
[ -d "$root" ] && [ ! -L "$root" ] || exit 92
set -eu
R="$root"
trap 'echo "====> JOB_FAILED"; exit 21' EXIT
proc_starttime() {
  [ -r "$1" ] || return 1
  IFS= read -r proc_line <"$1" || return 1
  set -- ${proc_line##*) }
  [ "$#" -ge 20 ] || return 1
  shift 19
  printf '%s\n' "$1"
}
is_owned_worker() {
  check_dir="$1"
  [ -f "$check_dir/pid" ] || return 1
  IFS= read -r check_pid <"$check_dir/pid" || return 1
  case "$check_pid" in ''|*[!0-9]*) return 1;; esac
  [ -r "/proc/$check_pid/cmdline" ] || return 1
  grep -Fq "$R/worker" "/proc/$check_pid/cmdline" || return 1
  [ "$(readlink "/proc/$check_pid/fd/0")" = "$check_dir/control" ] || return 1
  if [ -s "$check_dir/kernel-stat" ]; then
    expected_start=$(proc_starttime "$check_dir/kernel-stat") || return 1
    actual_start=$(proc_starttime "/proc/$check_pid/stat") || return 1
    [ "$expected_start" = "$actual_start" ] || return 1
  fi
}
send_quit() {
  # RDWR opens cannot hang if the owned worker exits between the identity check and write.
  ( exec 4<>"$1/control"; printf 'QUIT\n' >&4 )
}
create_worker() (
  trap - EXIT
  n="$1"; d="$R/w$n"
  avail=0; reclaim_wait=0
  while :; do
    while read key value unit; do
      if [ "$key" = MemAvailable: ]; then avail="$value"; break; fi
    done </proc/meminfo
    [ "$avail" -ge 160000 ] && break
    if [ "$reclaim_wait" -ge 30 ]; then echo "====> RESOURCE_BLOCKED" available_kb="$avail"; exit 30; fi
    echo "====> RESOURCE_WAIT" available_kb="$avail" second="$reclaim_wait"
    reclaim_wait=$((reclaim_wait+1)); sleep 1
  done
  mkdir -m 700 "$d"; mkfifo "$d/control"
  broker=$(cat "$R/fork-server-pid")
  [ "$(proc_starttime "$R/fork-server-stat")" = "$(proc_starttime "/proc/$broker/stat")" ]
  [ "$(readlink "/proc/$broker/fd/0")" = "$R/spawn-control" ]
  ( exec 4<>"$R/spawn-control"; printf 'SPAWN %s\n' "$n" >&4 )
  tries=0
  until grep -q '^READY ' "$d/events.log" 2>/dev/null; do
    if ! kill -0 "$broker" 2>/dev/null || [ "$tries" -ge 200 ]; then
      cat "$R/fork-server-events.log" "$d/events.log"; exit 31
    fi
    tries=$((tries+1)); sleep 0.05
  done
  p=$(cat "$d/pid")
  cat "/proc/$p/stat" >"$d/kernel-stat"
  grep -E '^(Pid|Uid|VmRSS):' "/proc/$p/status" >"$d/kernel-identity"
  grep -E '^(MemAvailable|SwapFree):' /proc/meminfo >"$d/resource-after-create"
  base64 "/proc/$p/cmdline" >"$d/kernel-argv-base64"
  readlink "/proc/$p/fd/0" >"$d/kernel-control-fd0"
  echo "====> CREATED" "$n" "$p"
)
retire_worker() (
  trap - EXIT
  n="$1"; d="$R/w$n"; p=$(cat "$d/pid")
  is_owned_worker "$d"
  send_quit "$d"
  tries=0
  while is_owned_worker "$d"; do
    if [ "$tries" -ge 200 ]; then exit 32; fi
    tries=$((tries+1)); sleep 0.05
  done
  grep -q "^CLEANUP pid=$p ret=0" "$d/events.log"
  if grep -q '^REGISTERED ' "$d/events.log"; then
    grep -q "^WINDOW_DESTROYED pid=$p window=[0-9]* ret=0$" "$d/events.log"
  fi
  : >"$d/retired"
  echo "====> RETIRED" "$n" "$p"
)

wait_log() {
  file="$1"; pattern="$2"; tries=0
  until grep -q "$pattern" "$file" 2>/dev/null; do
    [ "$tries" -lt 200 ] || { cat "$file" 2>/dev/null; return 1; }
    tries=$((tries+1)); sleep 0.05
  done
}
if [ "$mode" != cleanup ]; then
  proc_starttime /proc/$$/stat >"$R/$mode.stat"
  echo $$ >"$R/$mode.pid"
fi
case "$mode" in
prepare)
  cp /data/local/tmp/ActsInputMethodInAppProxyFixtures/ActsInputMethodInAppProxyCapacityWorker "$R/worker"
  chmod 700 "$R/worker"
  mkfifo "$R/spawn-control"
  ( exec 3<>"$R/spawn-control"; exec "$R/worker" --fork-server "$R" <&3 >"$R/fork-server-events.log" 2>&1 ) &
  echo $! >"$R/fork-server-pid"
  wait_log "$R/fork-server-events.log" '^FORK_SERVER_READY pid=[0-9]* threads=1$'
  broker=$(cat "$R/fork-server-pid")
  cat "/proc/$broker/stat" >"$R/fork-server-stat"
  [ "$(readlink "/proc/$broker/fd/0")" = "$R/spawn-control" ]
  grep -q '^Threads:[[:space:]]*1$' "/proc/$broker/status"
  i=0
  while [ "$i" -lt 100 ]; do create_worker "$i"; i=$((i+1)); done
  echo "====> POOL_READY" 100
  ;;
evict)
  i=0
  while [ "$i" -lt 100 ]; do
    d="$R/w$i"; is_owned_worker "$d"; p=$(cat "$d/pid")
    [ "$(grep -c '^REGISTERED ' "$d/events.log" || true)" -eq 0 ]
    ( exec 4<>"$d/control"; printf 'REGISTER\n' >&4 )
    wait_log "$d/events.log" "^WINDOW_RELEASED pid=$p ret=0$"
    grep -q "^REGISTERED pid=$p focused=$p ret=0$" "$d/events.log"
    grep -q "^FOCUS_CONFIRMED pid=$p focused=$p .* samples=6$" "$d/events.log"
    set -- $(grep '^FOCUS_AFTER ' "$d/events.log" | tail -1)
    [ "$2" = "pid=$p" ] && [ "$3" = "focused=$p" ]
    [ "${4#window=}" = "${5#actual_window=}" ]
    echo REGISTER_OK "$i" "$p"
    i=$((i+1))
  done
  i=0
  while [ "$i" -lt 100 ]; do is_owned_worker "$R/w$i"; i=$((i+1)); done
  echo "====> EVICTION_LOAD_COMPLETE" 100
  ;;
cleanup)
  for name in prepare evict; do
    if [ -s "$R/$name.pid" ] && [ -s "$R/$name.stat" ]; then
      job=$(cat "$R/$name.pid")
      expected_start=$(cat "$R/$name.stat")
      if script_process_matches "$job" "$expected_start" "$name" "$R"; then
        kill -TERM "$job"
      fi
    fi
  done
  i=0
  while [ "$i" -lt 100 ]; do
    d="$R/w$i"
    if is_owned_worker "$d"; then send_quit "$d"; fi
    i=$((i+1))
  done
  i=0
  while [ "$i" -lt 100 ]; do
    d="$R/w$i"; tries=0
    if [ -s "$d/pid" ]; then p=$(cat "$d/pid"); else p=0; fi
    while [ -s "$d/kernel-stat" ] && [ -r "/proc/$p/stat" ] && \
      [ "$(proc_starttime "/proc/$p/stat")" = "$(proc_starttime "$d/kernel-stat")" ]; do
      [ "$tries" -lt 1200 ] || exit 93
      tries=$((tries+1)); sleep 0.05
    done
    if [ -s "$d/pid" ]; then
      p=$(cat "$d/pid")
      grep -q "^CLEANUP pid=$p ret=0$" "$d/events.log"
      if grep -q '^REGISTERED ' "$d/events.log"; then
        grep -q "^WINDOW_DESTROYED pid=$p window=[0-9]* ret=0$" "$d/events.log"
      fi
    fi
    i=$((i+1))
  done
  if [ -s "$R/fork-server-stat" ]; then
    broker=$(cat "$R/fork-server-pid")
    if [ -r "/proc/$broker/stat" ] &&
      [ "$(proc_starttime "/proc/$broker/stat")" = "$(proc_starttime "$R/fork-server-stat")" ]; then
      [ "$(readlink "/proc/$broker/fd/0")" = "$R/spawn-control" ]
      ( exec 4<>"$R/spawn-control"; printf 'QUIT\n' >&4 )
      wait_log "$R/fork-server-events.log" "^FORK_SERVER_EXIT pid=$broker$"
      tries=0
      while [ -r "/proc/$broker/stat" ] &&
        [ "$(proc_starttime "/proc/$broker/stat")" = "$(proc_starttime "$R/fork-server-stat")" ]; do
        [ "$tries" -lt 1200 ] || exit 94
        tries=$((tries+1)); sleep 0.05
      done
    fi
  fi
  echo "====> CLEANUP_PASS"
  ;;
*) exit 95;;
esac
trap - EXIT
