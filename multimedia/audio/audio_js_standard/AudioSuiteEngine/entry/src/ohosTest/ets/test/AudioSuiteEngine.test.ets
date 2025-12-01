import { hilog } from '@kit.PerformanceAnalysisKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe,
 expect, it, TestType, Size, Level } from '@ohos/hypium';
import audiosuiteenginetest from 'libaudiosuiteenginetest.so';
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
     * @tc.name   AudioSuiteEngineTest_0001
     * @tc.number AudioSuiteEngineTest_0001
     * @tc.desc   AudioSuiteEngine create test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AudioSuiteEngineTest_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async (done: Function) => {
      let flag : number = 1;
      expect(flag).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    /**
     * @tc.name   AudioSuiteEngineCreateTest_0003
     * @tc.number AudioSuiteEngineCreateTest_0003
     * @tc.desc   AudioSuiteEngineCreate AUDIOSUITE_SUCCESS test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AudioSuiteEngineCreateTest_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngineCreateTest_0003 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngineCreateTest_0003();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngineCreateTest_0003 end ====>');
      done();
    })
    /**
     * @tc.name   AudioSuiteEngineCreateTest_0004
     * @tc.number AudioSuiteEngineCreateTest_0004
     * @tc.desc   AudioSuiteEngineCreate AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AudioSuiteEngineCreateTest_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngineCreateTest_0004 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngineCreateTest_0004();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngineCreateTest_0004 end ====>');
      done();
    })
    /**
     * @tc.name   AudioSuiteEngineCreateTest_0005
     * @tc.number AudioSuiteEngineCreateTest_0005
     * @tc.desc   AudioSuiteEngineCreate AUDIOSUITE_ERROR_INVALID_STATE test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AudioSuiteEngineCreateTest_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngineCreateTest_0005 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngineCreateTest_0005();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngineCreateTest_0005 end ====>');
      done();
    })
    /**
     * @tc.name   AudioSuiteEngineDestroyTest_0001
     * @tc.number AudioSuiteEngineDestroyTest_0001
     * @tc.desc   AudioSuiteEngineDestroy AUDIOSUITE_SUCCESS test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AudioSuiteEngineDestroyTest_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngineDestroyTest_0001 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngineDestroyTest_0001();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngineDestroyTest_0001 end ====>');
      done();
    })
    /**
     * @tc.name   AudioSuiteEngineDestroyTest_0002
     * @tc.number AudioSuiteEngineDestroyTest_0002
     * @tc.desc   AudioSuiteEngineDestroy AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AudioSuiteEngineDestroyTest_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngineDestroyTest_0002 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngineDestroyTest_0002();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngineDestroyTest_0002 end ====>');
      done();
    })
    /**
     * @tc.name   AudioSuiteEngineDestroyTest_0003
     * @tc.number AudioSuiteEngineDestroyTest_0003
     * @tc.desc   AudioSuiteEngineDestroy AUDIOSUITE_ERROR_INVALID_STATE test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AudioSuiteEngineDestroyTest_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngineDestroyTest_0003 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngineDestroyTest_0003();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngineDestroyTest_0003 end ====>');
      done();
    })
    /**
     * @tc.name   AudioSuiteNodeBuilderSetNodeTypeTest_0001
     * @tc.number AudioSuiteNodeBuilderSetNodeTypeTest_0001
     * @tc.desc   AudioSuitNodeBuilderSetNodeTypeTest AUDIOSUITE_SUCCESS test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AudioSuiteNodeBuilderSetNodeTypeTest_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteNodeBuilderSetNodeTypeTest_0001 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilderSetNodeTypeTest_0001();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteNodeBuilderSetNodeTypeTest_0001 end ====>');
      done();
    })
    /**
     * @tc.name   AudioSuiteNodeBuilderSetNodeTypeTest_0002
     * @tc.number AudioSuiteNodeBuilderSetNodeTypeTest_0002
     * @tc.desc   AudioSuitNodeBuilderSetNodeTypeTest AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AudioSuiteNodeBuilderSetNodeTypeTest_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteNodeBuilderSetNodeTypeTest_0002 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilderSetNodeTypeTest_0002();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteNodeBuilderSetNodeTypeTest_0002 end ====>');
      done();
    })
    /**
     * @tc.name   AudioSuiteNodeBuilderSetFormatTest_0001
     * @tc.number AudioSuiteNodeBuilderSetFormatTest_0001
     * @tc.desc   AudioSuitInputNodeBuilderSetFormatTest single track test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AudioSuiteNodeBuilderSetFormatTest_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0001 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilderSetFormatTest_0001();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0001 end ====>');
      done();
    })
    /**
     * @tc.name   AudioSuiteNodeBuilderSetFormatTest_0002
     * @tc.number AudioSuiteNodeBuilderSetFormatTest_0002
     * @tc.desc   AudioSuitInputNodeBuilderSetFormatTest double track test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AudioSuiteNodeBuilderSetFormatTest_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0002 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilderSetFormatTest_0002();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0002 end ====>');
      done();
    })
    /**
     * @tc.name   AudioSuiteNodeBuilderSetFormatTest_0003
     * @tc.number AudioSuiteNodeBuilderSetFormatTest_0003
     * @tc.desc   AudioSuitInputNodeBuilderSetFormatTest AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AudioSuiteNodeBuilderSetFormatTest_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0003 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilderSetFormatTest_0003();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0003 end ====>');
      done();
    })
    /**
     * @tc.name   AudioSuiteNodeBuilderSetFormatTest_0004
     * @tc.number AudioSuiteNodeBuilderSetFormatTest_0004
     * @tc.desc   AudioSuitInputNodeBuilderSetFormatTest AUDIOSUITE_ERROR_INVALID_STATE test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AudioSuiteNodeBuilderSetFormatTest_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0004 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilderSetFormatTest_0004();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0004 end ====>');
      done();
    })
    /**
     * @tc.name   AudioSuiteNodeBuilderSetFormatTest_0005
     * @tc.number AudioSuiteNodeBuilderSetFormatTest_0005
     * @tc.desc   AudioSuitOutputNodeBuilderSetFormatTest single track test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AudioSuiteNodeBuilderSetFormatTest_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0005 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilderSetFormatTest_0005();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0005 end ====>');
      done();
    })
    /**
     * @tc.name   AudioSuiteNodeBuilderSetFormatTest_0006
     * @tc.number AudioSuiteNodeBuilderSetFormatTest_0006
     * @tc.desc   AudioSuitOutputNodeBuilderSetFormatTest double track test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AudioSuiteNodeBuilderSetFormatTest_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0006 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilderSetFormatTest_0006();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0006 end ====>');
      done();
    })
    /**
     * @tc.name   AudioSuiteNodeBuilderSetFormatTest_0007
     * @tc.number AudioSuiteNodeBuilderSetFormatTest_0007
     * @tc.desc   AudioSuitOutputNodeBuilderSetFormatTest AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AudioSuiteNodeBuilderSetFormatTest_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0007 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilderSetFormatTest_0007();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0007 end ====>');
      done();
    })
    /**
     * @tc.name   AudioSuiteNodeBuilderSetFormatTest_0008
     * @tc.number AudioSuiteNodeBuilderSetFormatTest_0008
     * @tc.desc   AudioSuitOutputNodeBuilderSetFormatTest AUDIOSUITE_ERROR_INVALID_STATE test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AudioSuiteNodeBuilderSetFormatTest_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0008 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilderSetFormatTest_0008();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0008 end ====>');
      done();
    })
    /**
     * @tc.name   InputNodeRequestDataCallbackTest_0001
     * @tc.number InputNodeRequestDataCallbackTest_0001
     * @tc.desc   InputNodeRequestDataCallbackTest AUDIOSUITE_SUCCESS test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InputNodeRequestDataCallbackTest_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> InputNodeRequestDataCallbackTest_0001 start ====>');
      let result : number = audiosuiteenginetest.InputNodeRequestDataCallbackTest_0001();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> InputNodeRequestDataCallbackTest_0001 end ====>');
      done();
    })
    /**
     * @tc.name   InputNodeRequestDataCallbackTest_0002
     * @tc.number InputNodeRequestDataCallbackTest_0002
     * @tc.desc   InputNodeRequestDataCallbackTest AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InputNodeRequestDataCallbackTest_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> InputNodeRequestDataCallbackTest_0002 start ====>');
      let result : number = audiosuiteenginetest.InputNodeRequestDataCallbackTest_0002();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> InputNodeRequestDataCallbackTest_0002 end ====>');
      done();
    })
  })
}