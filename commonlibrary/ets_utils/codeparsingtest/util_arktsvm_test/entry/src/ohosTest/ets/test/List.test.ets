import utilGetGlobalHandleCountTest from './util/GetGlobalHandleCount.test';
import trackGlobalRefTest from './util/TrackGlobalRef.test';
import arkTSVMTest from './util/ArkTSVMTest.test';

export default function testsuite() {
  utilGetGlobalHandleCountTest();
  trackGlobalRefTest();
  arkTSVMTest();
}
