# Input method in-app proxy capacity fixture

This test-only native resource creates real Linux child processes. Each child
initializes its own IMF/Binder client, owns a real WMS window, obtains actual
focus and invokes the production `RegisterInAppProxyIme` implementation.
The native worker does not invoke the HAP's callback or modify service state.
The ArkTS tests must observe their own public `onUnregister` callbacks.

The HAP suite depends on `:capacity_resources`. Its PushKit
pushes `ActsInputMethodInAppProxyCapacityWorker` from the testcases directory.
The device orchestrator copies it to a unique directory named
`/data/local/tmp/acts-inapp-proxy-capacity-<run-id>/worker` before starting it.
No production partition or system executable is modified.

Start the resource with `worker --fork-server <directory>`. The parent must
still have one thread and no initialized IMF/Binder/WMS client. The device
orchestrator creates each `w<index>` directory and `control` FIFO, then sends
`SPAWN <index>` to the parent's standard input. Each child reads commands from
its own FIFO and writes actual results to `w<index>/events.log`:

| Command | Behavior |
| --- | --- |
| `REGISTER` | Create/focus a real window, register, then destroy the fixture window while keeping the process/registration alive. |
| `REGISTER_HOLD` | Register with real focus and retain the window until a later command or cleanup. |
| `QUIT` | Unregister and destroy any retained window, then exit. |

Required evidence includes unique PID/starttime, parent PID, the actual FIFO
at `/proc/<pid>/fd/0`, `FOCUS_CONFIRMED` / `FOCUS_AFTER`, successful
registration and successful cleanup of every owned child and the fork parent.
The `EVICTED` line records a genuine native listener notification, and cannot
substitute for observing the victim HAP's public ArkTS callback.

Idle client pages are reclaimed with `MADV_PAGEOUT` only in the same child.
The fixture does not discard live data or change global VM parameters.
Resource exhaustion is a fixture failure; tests must not replace the real
load with synthetic PIDs or directly invoked callbacks.

The native resource uses platform internal IMF/WMS/RS interfaces, while the
test victim exercises the public SDK. Build and run it against the same source
baseline as the target image. A coherent IMF/ArkUI runtime is required.

The worker links the production shared `imf:inputmethod_ability` inner kit.
`RegisterOptions` is a Parcelable value type with hidden serializer/vtable
symbols in that shared library's version script. The fixture therefore also
compiles the unmodified production
`frameworks/native/inputmethod_controller/src/input_method_utils.cpp`.
It does not link or copy the static IMF service/ability implementation.

Human-readable diagnostics use the `====> ` payload prefix, including the
extension JSON records, capacity requests/replies, worker error diagnostics,
shell phase summaries and every line displayed by the HAP's console logger.
The extension reader starts parsing at the first `{`; the capacity readers
match the existing `token=... mode=... status=...` envelope after the prefix.

Machine protocol data retains its original spelling and field positions.
These records include worker `READY`, `REGISTERED`, `REGISTER_MEASUREMENT`,
`FOCUS_CONFIRMED`, `FOCUS_AFTER`, `EVICTED`, `CLEANUP`, window/fork lifecycle
and memory measurements, plus the shell's `REGISTER_OK <index> <pid>` rows.
Anchored consumers read those raw records from the resource files. The log
bridge prefixes their human-readable presentation without changing the data.
FIFO commands, PID/starttime files and captured kernel identity data are also
protocol data; adding a log prefix to them would corrupt the actual process
identity and control checks. No synthetic records replace native results.
