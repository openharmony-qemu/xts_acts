import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import nativeFunc from 'libentry.so';

export default function nativeModuleLoadTest() {
  describe('NativeModuleLoadTest', () => {
    /**
     * @tc.name SUB_ARKWEB_CAPI_NATIVE_MODULE_LOAD_0100
     * @tc.number SUB_ARKWEB_CAPI_NATIVE_MODULE_LOAD_0100
     * @tc.desc Verify that the Test HAP can load libentry.so and invoke its N-API export.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('SUB_ARKWEB_CAPI_NATIVE_MODULE_LOAD_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        const engineVersion = nativeFunc.TestNativeArkWeb_GetActiveWebEngineVersion();
        expect(typeof engineVersion).assertEqual('number');
        done();
      });
  });
}
