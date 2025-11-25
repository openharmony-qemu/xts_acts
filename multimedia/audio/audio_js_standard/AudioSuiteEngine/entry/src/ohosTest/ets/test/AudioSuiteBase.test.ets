import { hilog } from '@kit.PerformanceAnalysisKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe,
 expect, it, TestType, Size, Level } from '@ohos/hypium';
import audiosuiteenginetest from 'libaudiosuiteenginetest.so';
import { TEST_RESULT } from './Constants.test'

export default function AudioSuiteBaseTest() {
  describe('ActsAudioSuiteBaseTest', () => {
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
     * @tc.number    : AudioSuiteEngineCreateTest_0001
     * @tc.name      : AudioSuiteEngine create test
     * @tc.desc      : AudioSuiteEngine create test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('AudioSuiteEngineCreateTest_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineCreateTest_0001();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number    : AudioSuiteEngineCreateTest_0002
     * @tc.name      : AudioSuiteEngine create test
     * @tc.desc      : AudioSuiteEngine create test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('AudioSuiteEngineCreateTest_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngineCreateTest_0002 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngineCreateTest_0002();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngineCreateTest_0002 end ====>');
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
     * @tc.number    : AudioSuiteNodeBuilderSetNodeType_0001
     * @tc.name      : AudioSuitNodeBuilderSetNodeType AUDIOSUITE_SUCCESS test
     * @tc.desc      : AudioSuitNodeBuilderSetNodeType AUDIOSUITE_SUCCESS test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('AudioSuiteNodeBuilderSetNodeType_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteNodeBuilderSetNodeType_0001 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilderSetNodeType_0001();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteNodeBuilderSetNodeType_0001 end ====>');
      done();
    })
    /**
     * @tc.number    : AudioSuiteNodeBuilderSetNodeType_0002
     * @tc.name      : AudioSuitNodeBuilderSetNodeType AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.desc      : AudioSuitNodeBuilderSetNodeType AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('AudioSuiteNodeBuilderSetNodeType_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteNodeBuilderSetNodeType_0002 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilderSetNodeType_0002();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteNodeBuilderSetNodeType_0002 end ====>');
      done();
    })
    /**
     * @tc.number    : AudioSuiteNodeBuilderSetFormat_0001
     * @tc.name      : AudioSuitInputNodeBuilderSetFormat single track test
     * @tc.desc      : AudioSuitInputNodeBuilderSetFormat single track test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('AudioSuiteNodeBuilderSetFormat_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteNodeBuilderSetFormat_0001 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilderSetFormat_0001();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteNodeBuilderSetFormat_0001 end ====>');
      done();
    })
    /**
     * @tc.number    : AudioSuiteNodeBuilderSetFormat_0002
     * @tc.name      : AudioSuitInputNodeBuilderSetFormat double track test
     * @tc.desc      : AudioSuitInputNodeBuilderSetFormat double track test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('AudioSuiteNodeBuilderSetFormat_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteNodeBuilderSetFormat_0002 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilderSetFormat_0002();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteNodeBuilderSetFormat_0002 end ====>');
      done();
    })
    /**
     * @tc.number    : AudioSuiteNodeBuilderSetFormat_0003
     * @tc.name      : AudioSuitInputNodeBuilderSetFormat AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.desc      : AudioSuitInputNodeBuilderSetFormat AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('AudioSuiteNodeBuilderSetFormat_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteNodeBuilderSetFormat_0003 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilderSetFormat_0003();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteNodeBuilderSetFormat_0003 end ====>');
      done();
    })
    /**
     * @tc.number    : AudioSuiteNodeBuilderSetFormat_0004
     * @tc.name      : AudioSuitInputNodeBuilderSetFormat AUDIOSUITE_ERROR_INVALID_STATE test
     * @tc.desc      : AudioSuitInputNodeBuilderSetFormat AUDIOSUITE_ERROR_INVALID_STATE test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('AudioSuiteNodeBuilderSetFormat_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteNodeBuilderSetFormat_0004 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilderSetFormat_0004();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteNodeBuilderSetFormat_0004 end ====>');
      done();
    })
    /**
     * @tc.number    : AudioSuiteNodeBuilderSetFormat_0005
     * @tc.name      : AudioSuitOutputNodeBuilderSetFormat single track test
     * @tc.desc      : AudioSuitOutputNodeBuilderSetFormat single track test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('AudioSuiteNodeBuilderSetFormat_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteNodeBuilderSetFormat_0005 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilderSetFormat_0005();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteNodeBuilderSetFormat_0005 end ====>');
      done();
    })
    /**
     * @tc.number    : AudioSuiteNodeBuilderSetFormat_0006
     * @tc.name      : AudioSuitOutputNodeBuilderSetFormat double track test
     * @tc.desc      : AudioSuitOutputNodeBuilderSetFormat double track test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('AudioSuiteNodeBuilderSetFormat_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteNodeBuilderSetFormat_0006 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilderSetFormat_0006();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteNodeBuilderSetFormat_0006 end ====>');
      done();
    })
    /**
     * @tc.number    : AudioSuiteNodeBuilderSetFormat_0007
     * @tc.name      : AudioSuitOutputNodeBuilderSetFormat AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.desc      : AudioSuitOutputNodeBuilderSetFormat AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('AudioSuiteNodeBuilderSetFormat_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteNodeBuilderSetFormat_0007 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilderSetFormat_0007();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteNodeBuilderSetFormat_0007 end ====>');
      done();
    })
    /**
     * @tc.number    : AudioSuiteNodeBuilderSetFormat_0008
     * @tc.name      : AudioSuitOutputNodeBuilderSetFormat AUDIOSUITE_ERROR_INVALID_STATE test
     * @tc.desc      : AudioSuitOutputNodeBuilderSetFormat AUDIOSUITE_ERROR_INVALID_STATE test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('AudioSuiteNodeBuilderSetFormat_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteNodeBuilderSetFormat_0008 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilderSetFormat_0008();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteNodeBuilderSetFormat_0008 end ====>');
      done();
    })
    /**
     * @tc.number    : InputNodeRequestDataCallback_0001
     * @tc.name      : InputNodeRequestDataCallback AUDIOSUITE_SUCCESS test
     * @tc.desc      : InputNodeRequestDataCallback AUDIOSUITE_SUCCESS test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('InputNodeRequestDataCallback_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> InputNodeRequestDataCallback_0001 start ====>');
      let result : number = audiosuiteenginetest.InputNodeRequestDataCallback_0001();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> InputNodeRequestDataCallback_0001 end ====>');
      done();
    })
    /**
     * @tc.number    : InputNodeRequestDataCallback_0002
     * @tc.name      : InputNodeRequestDataCallback AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.desc      : InputNodeRequestDataCallback AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('InputNodeRequestDataCallback_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> InputNodeRequestDataCallback_0002 start ====>');
      let result : number = audiosuiteenginetest.InputNodeRequestDataCallback_0002();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> InputNodeRequestDataCallback_0002 end ====>');
      done();
    })
  })
}