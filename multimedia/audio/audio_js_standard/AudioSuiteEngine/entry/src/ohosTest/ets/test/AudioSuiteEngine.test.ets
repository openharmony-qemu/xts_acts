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
    /**
     * @tc.number    : AudioSuiteEngineCreateTest_0003
     * @tc.name      : AudioSuiteEngineCreate AUDIOSUITE_SUCCESS test
     * @tc.desc      : AudioSuiteEngineCreate AUDIOSUITE_SUCCESS test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : AudioSuiteEngineCreateTest_0004
     * @tc.name      : AudioSuiteEngineCreate AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.desc      : AudioSuiteEngineCreate AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : AudioSuiteEngineCreateTest_0005
     * @tc.name      : AudioSuiteEngineCreate AUDIOSUITE_ERROR_INVALID_STATE test
     * @tc.desc      : AudioSuiteEngineCreate AUDIOSUITE_ERROR_INVALID_STATE test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : AudioSuiteEngineDestroyTest_0001
     * @tc.name      : AudioSuiteEngineDestroy AUDIOSUITE_SUCCESS test
     * @tc.desc      : AudioSuiteEngineDestroy AUDIOSUITE_SUCCESS test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : AudioSuiteEngineDestroyTest_0002
     * @tc.name      : AudioSuiteEngineDestroy AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.desc      : AudioSuiteEngineDestroy AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : AudioSuiteEngineDestroyTest_0003
     * @tc.name      : AudioSuiteEngineDestroy AUDIOSUITE_ERROR_INVALID_STATE test
     * @tc.desc      : AudioSuiteEngineDestroy AUDIOSUITE_ERROR_INVALID_STATE test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : AudioSuiteNodeBuilderSetNodeTypeTest_0001
     * @tc.name      : AudioSuitNodeBuilderSetNodeTypeTest AUDIOSUITE_SUCCESS test
     * @tc.desc      : AudioSuitNodeBuilderSetNodeTypeTest AUDIOSUITE_SUCCESS test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : AudioSuiteNodeBuilderSetNodeTypeTest_0002
     * @tc.name      : AudioSuitNodeBuilderSetNodeTypeTest AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.desc      : AudioSuitNodeBuilderSetNodeTypeTest AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : AudioSuiteNodeBuilderSetFormatTest_0001
     * @tc.name      : AudioSuitInputNodeBuilderSetFormatTest single track test
     * @tc.desc      : AudioSuitInputNodeBuilderSetFormatTest single track test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : AudioSuiteNodeBuilderSetFormatTest_0002
     * @tc.name      : AudioSuitInputNodeBuilderSetFormatTest double track test
     * @tc.desc      : AudioSuitInputNodeBuilderSetFormatTest double track test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : AudioSuiteNodeBuilderSetFormatTest_0003
     * @tc.name      : AudioSuitInputNodeBuilderSetFormatTest AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.desc      : AudioSuitInputNodeBuilderSetFormatTest AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : AudioSuiteNodeBuilderSetFormatTest_0004
     * @tc.name      : AudioSuitInputNodeBuilderSetFormatTest AUDIOSUITE_ERROR_INVALID_STATE test
     * @tc.desc      : AudioSuitInputNodeBuilderSetFormatTest AUDIOSUITE_ERROR_INVALID_STATE test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : AudioSuiteNodeBuilderSetFormatTest_0005
     * @tc.name      : AudioSuitOutputNodeBuilderSetFormatTest single track test
     * @tc.desc      : AudioSuitOutputNodeBuilderSetFormatTest single track test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : AudioSuiteNodeBuilderSetFormatTest_0006
     * @tc.name      : AudioSuitOutputNodeBuilderSetFormatTest double track test
     * @tc.desc      : AudioSuitOutputNodeBuilderSetFormatTest double track test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : AudioSuiteNodeBuilderSetFormatTest_0007
     * @tc.name      : AudioSuitOutputNodeBuilderSetFormatTest AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.desc      : AudioSuitOutputNodeBuilderSetFormatTest AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : AudioSuiteNodeBuilderSetFormatTest_0008
     * @tc.name      : AudioSuitOutputNodeBuilderSetFormatTest AUDIOSUITE_ERROR_INVALID_STATE test
     * @tc.desc      : AudioSuitOutputNodeBuilderSetFormatTest AUDIOSUITE_ERROR_INVALID_STATE test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : InputNodeRequestDataCallbackTest_0001
     * @tc.name      : InputNodeRequestDataCallbackTest AUDIOSUITE_SUCCESS test
     * @tc.desc      : InputNodeRequestDataCallbackTest AUDIOSUITE_SUCCESS test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : InputNodeRequestDataCallbackTest_0002
     * @tc.name      : InputNodeRequestDataCallbackTest AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.desc      : InputNodeRequestDataCallbackTest AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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