import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import hidebug from '@ohos.hidebug';
import testNapi from 'libentry.so';

export function asyncSleep(time: number): Promise<Object> {
  return new Promise(resolve => setTimeout(resolve, time));
};

export default function ActsHiDebugHiProfilerTest() {
  describe('ActsHiDebugHiProfilerTest', () => {
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
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0100
     * @tc.name testHidebugHiprofilerInterface01
     * @tc.desc 验证OH_HiDebug_StartProfiler接口config参数传入nullptr，返回值11400410
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0100 start");
      try {
        let res = testNapi.startProfilerNull(0);
        expect(res == 11400410).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0100 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0100 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0200
     * @tc.name testHidebugHiprofilerInterface02
     * @tc.desc 验证OH_HiDebug_StartProfiler接口config参数maxDuration传入0，返回值11400411
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0200 start");
      try {
        let res = testNapi.startProfiler(0, 0, 1, 30, 1, 384);
        expect(res == 11400411).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0200 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0200 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0300
     * @tc.name testHidebugHiprofilerInterface03
     * @tc.desc 验证OH_HiDebug_StartProfiler接口config参数maxDuration传入3601，返回值11400411
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0300 start");
      try {
        let res = testNapi.startProfiler(0, 3601, 1, 30, 1, 384);
        expect(res == 11400411).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0300 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0300 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0400
     * @tc.name testHidebugHiprofilerInterface04
     * @tc.desc 验证OH_HiDebug_StartProfiler接口config参数filterSize传入0，返回值11400412
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0400 start");
      try {
        let res = testNapi.startProfiler(0, 30, 0, 30, 1, 384);
        expect(res == 11400412).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0400 success");
        testNapi.stopProfiler();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0400 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0400 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0500
     * @tc.name testHidebugHiprofilerInterface05
     * @tc.desc 验证OH_HiDebug_StartProfiler接口config参数filterSize传入4294967296，返回值11400412
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0500 start");
      try {
        let res = testNapi.startProfiler(0, 30, 4294967296, 30, 1, 384);
        expect(res == 11400412).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0500 success");
        testNapi.stopProfiler();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0500 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0500 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0600
     * @tc.name testHidebugHiprofilerInterface06
     * @tc.desc 验证OH_HiDebug_StartProfiler接口config参数maxStackDepth传入-1，返回值11400413
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0600 start");
      try {
        let res = testNapi.startProfiler(0, 30, 1, -1, 1, 384);
        expect(res == 11400413).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0600 success");
        testNapi.stopProfiler();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0600 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0600 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0700
     * @tc.name testHidebugHiprofilerInterface07
     * @tc.desc 验证OH_HiDebug_StartProfiler接口config参数maxStackDepth传入31，返回值11400413
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0700 start");
      try {
        let res = testNapi.startProfiler(0, 30, 1, 31, 1, 384);
        expect(res == 11400413).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0700 success");
        testNapi.stopProfiler();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0700 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0700 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0800
     * @tc.name testHidebugHiprofilerInterface08
     * @tc.desc 验证OH_HiDebug_StartProfiler接口config参数statisticsInterval传入-1，返回值11400414
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0800 start");
      try {
        let res = testNapi.startProfiler(0, 30, 1, 30, -1, 384);
        expect(res == 11400414).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0800 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0800 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0800 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0900
     * @tc.name testHidebugHiprofilerInterface09
     * @tc.desc 验证OH_HiDebug_StartProfiler接口config参数statisticsInterval传入3601，返回值11400414
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0900 start");
      try {
        let res = testNapi.startProfiler(0, 30, 1, 30, 3601, 384);
        expect(res == 11400414).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0900 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0900 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_0900 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1000
     * @tc.name testHidebugHiprofilerInterface10
     * @tc.desc 验证OH_HiDebug_StartProfiler接口config参数sampleInterval传入383，返回值11400415
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1000 start");
      try {
        let res = testNapi.startProfiler(0, 30, 1, 30, 1, 383);
        expect(res == 11400415).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1000 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1000 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1000 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1100
     * @tc.name testHidebugHiprofilerInterface11
     * @tc.desc 验证OH_HiDebug_StartProfiler接口config参数sampleInterval传入4294967296，返回值11400415
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1100 start");
      try {
        let res = testNapi.startProfiler(0, 30, 1, 30, 1, 4294967296);
        expect(res == 11400415).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1100 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1100 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1200
     * @tc.name testHidebugHiprofilerInterface12
     * @tc.desc 验证OH_HiDebug_StartProfiler接口type参数传入无效参数，返回值11400416
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugHiprofilerInterface12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1200 start");
      try {
        let res = testNapi.startProfiler(5, 30, 1, 30, 1, 384);
        expect(res == 11400416).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1200 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_HiProfiler_Interface_1200 end");
    })
  })
}