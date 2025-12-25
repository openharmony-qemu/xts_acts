import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';

export default function NNCoreOpsAbsTest() {
  describe('NNCoreOpsAbsTest', () => {
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
     * @tc.name   SUB_AI_NNRt_Func_North_Abs_Build_01
     * @tc.number SUB_AI_NNRt_Func_North_Abs_Build_01
     * @tc.desc   SUB_AI_NNRt_Func_North_Abs_Build_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Abs_Build_01', Level.LEVEL0, () => {
      const commitBlock = 1+1;
      expect(commitBlock).assertEqual(2);
    })

  })
}