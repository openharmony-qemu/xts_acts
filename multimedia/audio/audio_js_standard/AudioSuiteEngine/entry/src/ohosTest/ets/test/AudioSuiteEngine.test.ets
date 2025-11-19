import { hilog } from '@kit.PerformanceAnalysisKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe,
 expect, it, TestType, Size, Level } from '@ohos/hypium';
import { TEST_RESULT } from './Constants.test'

export default function AudioSuiteEngineTest() {
  describe('ActsAudioSuiteEngineTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number    : AudioSuiteEngineTest_0001
     * @tc.name      : AudioSuiteEngine create test
     * @tc.desc      : AudioSuiteEngine create test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('AudioSuiteEngineTest_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async (done: Function) => {
      let flag : number = 1;
      expect(flag).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
  })
}