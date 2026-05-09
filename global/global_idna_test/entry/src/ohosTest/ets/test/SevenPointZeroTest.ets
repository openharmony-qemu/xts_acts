import { hilog } from '@kit.PerformanceAnalysisKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import testNapi from 'libentry.so'
import { i18n, intl } from '@kit.LocalizationKit';

export default function SevenPointZeroTest() {
  describe('SevenPointZeroTest', () => {
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
     * @tc.name   testUCNV_FROM_U_CALLBACK_SUBSTITUTE_0100
     * @tc.number SUB_GLOBAL_UCNV_ConversionErrorCode_0100
     * @tc.desc   UCNV with UCNV_FROM_U_CALLBACK_SUBSTITUTE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUCNV_FROM_U_CALLBACK_SUBSTITUTE_0100', Level.LEVEL2, () => {
      expect(testNapi.testUCNV_FROM_U_CALLBACK_SUBSTITUTE()).assertTrue();
    })

    /**
     * @tc.name   testUCNV_FROM_U_CALLBACK_STOP_0100
     * @tc.number SUB_GLOBAL_UCNV_ConversionErrorCode_0200
     * @tc.desc   UCNV with UCNV_FROM_U_CALLBACK_SUBSTITUTE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUCNV_FROM_U_CALLBACK_STOP_0100', Level.LEVEL2, () => {
      expect(testNapi.testUCNV_FROM_U_CALLBACK_STOP()).assertTrue();
    })

    /**
     * @tc.name   testUCNV_TO_U_CALLBACK_STOP_0100
     * @tc.number SUB_GLOBAL_UCNV_ConversionErrorCode_0300
     * @tc.desc   UCNV with UCNV_TO_U_CALLBACK_STOP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUCNV_TO_U_CALLBACK_STOP_0100', Level.LEVEL2, () => {
      expect(testNapi.testUCNV_TO_U_CALLBACK_STOP()).assertTrue();
    })

    /**
     * @tc.name   testUCNV_FROM_U_CALLBACK_SKIP_0100
     * @tc.number SUB_GLOBAL_UCNV_ConversionErrorCode_0400
     * @tc.desc   UCNV with UCNV_FROM_U_CALLBACK_SKIP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUCNV_FROM_U_CALLBACK_SKIP_0100', Level.LEVEL2, () => {
      expect(testNapi.testUCNV_FROM_U_CALLBACK_SKIP()).assertTrue();
    })

    /**
     * @tc.name   testUCNV_TO_U_CALLBACK_SKIP_0100
     * @tc.number SUB_GLOBAL_UCNV_ConversionErrorCode_0500
     * @tc.desc   UCNV with UCNV_TO_U_CALLBACK_SKIP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUCNV_TO_U_CALLBACK_SKIP_0100', Level.LEVEL2, () => {
      expect(testNapi.testUCNV_TO_U_CALLBACK_SKIP()).assertTrue();
    })

    /**
     * @tc.name   testUCNV_TO_U_CALLBACK_SUBSTITUTE_0100
     * @tc.number SUB_GLOBAL_UCNV_ConversionErrorCode_0600
     * @tc.desc   UCNV with UCNV_TO_U_CALLBACK_SUBSTITUTE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUCNV_TO_U_CALLBACK_SUBSTITUTE_0100', Level.LEVEL2, () => {
      expect(testNapi.testUCNV_TO_U_CALLBACK_SUBSTITUTE()).assertTrue();
    })

    /**
     * @tc.name   testUCNV_FROM_U_CALLBACK_ESCAPE_0100
     * @tc.number SUB_GLOBAL_UCNV_ConversionErrorCode_0700
     * @tc.desc   UCNV with UCNV_FROM_U_CALLBACK_ESCAPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUCNV_FROM_U_CALLBACK_ESCAPE_0100', Level.LEVEL2, () => {
      expect(testNapi.testUCNV_FROM_U_CALLBACK_ESCAPE()).assertTrue();
    })


  })
}