import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium';
import testNapi from 'libentry.so';
export default function abilityTest() {
  describe('ActsAbilityTest', () => {
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
     * @tc.name   testHicollieSubthreadCode0600
     * @tc.number SUB_DFX_DFR_Hicollie_Subthread_Code_0600
     * @tc.desc   testHicollieSubthreadCode0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHicollieSubthreadCode0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let code = testNapi.TestHiCollieSetFreezeCallback();
        expect(code == 0).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHicollieSubthreadCode0600 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testHicollieSubthreadCode0700
     * @tc.number SUB_DFX_DFR_Hicollie_Subthread_Code_0700
     * @tc.desc   testHicollieSubthreadCode0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHicollieSubthreadCode0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let code = testNapi.TestHiCollieAssociateProcessReport();
        expect(code == 0).assertTrue();
        done();
      } catch (err) {
        console.error(`====> testHicollieSubthreadCode0700 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })
    
  })
}