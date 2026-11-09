# Input method in-app proxy API tests

This dynamic ArkTS suite exercises the public input method in-app proxy APIs.
It implements the 127 active case IDs renumbered in customer API_Test_Design(1).md.
The 59 customer-struck IDs are excluded from this revision and are inventoried
separately; historical 186-case reports do not stand in for this execution. Static ArkTS
coverage belongs to a separate suite and is not claimed by these results.

## Build and execution

Build `ActsInputMethodInAppProxyTest` through the normal ACTS build. Its GN
dependency `InputMethodInAppProxyFixtures:capacity_resources` supplies:

- ActsInputMethodInAppProxyCapacityWorker
- ActsInputMethodInAppProxyCapacity.sh

Keep both resources and ActsInputMethodInAppProxyTest.json beside the signed
HAP in the xdevice testcases directory. Run the complete suite with the normal
xdevice command: `run -l ActsInputMethodInAppProxyTest`.

The target must include the matching SDK/runtime implementation of API 26.1.0.
SDK declarations alone do not install runtime support. Current development
validation uses the approved 7.0.0.47 RK3568 image with the separately recorded
customer IMF implementation. The XTS patch does not modify that implementation.
The real-editor cases require both IME Framework and ArkUI Full capabilities.
The single primary XTS syscap does not remove the ArkUI runtime requirement.

A strict minimum26.1 HAP is rejected by the current development image with
"older sdk version in the device". Its compile evidence is kept separately.
The development-image functional variant changes only the private project
minimum to26.0.0; it retains the API declarations and all fixed test assertions.
Its API-availability diagnostics are recorded as a compatibility limitation.
Such a report is not strict26.1 installation acceptance.

## Real test resources and recovery

The test ability owns actual TextInput/TextArea controls. Assertions inspect
real text, caret/selection, editor attributes, callback values and key-event
consumption. Each case is registered directly with Hypium it(). The awaited afterEach hook
releases listener/proxy resources after each case, including failed cases.
Cleanup errors propagate to Hypium. beforeEach also clears earlier state before starting a case.

The functional-key cases observe actual editor onSubmit values. UNSPECIFIED
and NONE do not submit; a subsequent DONE callback witnesses event delivery. Caret
cases compare real index changes, independent editor caret offsets and delegate
coordinates over a 4-to-5-to-4 round trip without fixed screen coordinates.

hideSelf cases capture fresh AceTextField INFO receiver logs within unique
per-call markers in the test process. These logs prove receipt and adaptation
of hidden status, not completion of queued UI work or automatic panel removal.
Missing or filtered receiver evidence fails the case. Raw framework log lines
must not be echoed back as new evidence. Keep full device logs in the report.

IME-extension checks enable the suite's actual InputMethodExtensionAbility,
verify its separate PID, and restore the original IME bundle/mode before
disabling the temporary extension. Run on a dedicated development device;
subtype selection should be checked separately when the original IME offers
multiple subtypes, since the available device CLI only selects a bundle.

The three passive-unregister cases use 100 actual native process clients.
Every load registration independently verifies WMS focus and the real kernel
PID. The victim first releases its real edit binding through the public
controller detach API and verifies12800003 on the old client; active current
clients are protected by the service and are not valid eviction victims. The victim's public ArkTS onUnregister callback is asserted by the HAP;
the fixture never invokes that callback, changes Binder identity, or edits
service registration maps. After cancellation, a fresh live listener proves
that the triggering event actually occurred.

PushKit setup starts the bounded fixture server. The HAP requests only the
prepare/evict/cleanup operations through Hilog, and reads actual native job
results through Hilog. This respects AbilityDelegator shell-command limits;
no unsupported shell command is hidden behind an allowed command. Cleanup
uses PID/start-time/control-FIFO ownership checks, exits the owned processes,
and verifies window destruction. PushKit teardown also cleans up after a
failed test. Native fixture logs are diagnostic evidence, not mocked API results.

## Report acceptance

Attach the complete runner-generated HTML/XML report and logs for this suite.
A passing subset does not establish a full-suite pass. SDK PR36422 exports
ENTER_KEY_TYPE values 0 through 8, including NONE=1; cases 0590 and 0600 reject
9 and -1. Registration case 0190 includes PATTERN_MULTILINE=1 and binds a real
TextArea without registering a second time. Case 1270 checks both new constants.
Case 0220 keeps the customer's confirmed dynamic null-options default behavior.
Do not weaken fixed expectations or skip cases to obtain an all-PASS report.

The current quality/gap revision is compiled but has not been run on a device.
The earlier 127-PASS report belongs to the previous customer runtime snapshot.
Bind the intended device CID and verify component hashes before signing,
installing and running this revision, especially when another board or build
is being used for the preview-text feature.
