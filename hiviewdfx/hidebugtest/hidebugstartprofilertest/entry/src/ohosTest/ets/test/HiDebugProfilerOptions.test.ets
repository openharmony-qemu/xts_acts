import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import testNapi from 'libentry.so';

export function asyncSleep(time: number): Promise<Object> {
  return new Promise(resolve => setTimeout(resolve, time));
};

export default function ActsHiDebugProfilerOptionsTest() {
  describe('ActsHiDebugProfilerOptionsTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {

    })
    afterAll(() => {
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0100
     * @tc.name testProfilerOptionsInterface01
     * @tc.desc 验证OH_HiDebug_CreateProfilerOptions接口正常创建ProfilerOptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0100 start");
      try {
        let res = testNapi.testCreateProfilerOptions();
        expect(res == 1).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0100 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0100 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0200
     * @tc.name testProfilerOptionsInterface02
     * @tc.desc 验证OH_HiDebug_DestroyProfilerOptions接口传入nullptr不崩溃
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0200 start");
      try {
        let res = testNapi.testDestroyProfilerOptionsNull();
        expect(res == 1).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0200 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0200 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0300
     * @tc.name testProfilerOptionsInterface03
     * @tc.desc 验证OH_HiDebug_SetMaxAsyncNestingDepth接口传入有效值1，返回HIDEBUG_SUCCESS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0300 start");
      try {
        let res = testNapi.testSetMaxAsyncNestingDepth(1);
        expect(res == 0).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0300 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0300 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0400
     * @tc.name testProfilerOptionsInterface04
     * @tc.desc 验证OH_HiDebug_SetMaxAsyncNestingDepth接口传入有效值16，返回HIDEBUG_SUCCESS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0400 start");
      try {
        let res = testNapi.testSetMaxAsyncNestingDepth(16);
        expect(res == 0).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0400 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0400 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0400 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0500
     * @tc.name testProfilerOptionsInterface05
     * @tc.desc 验证OH_HiDebug_SetMaxAsyncNestingDepth接口传入超范围值0，返回11400431
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0500 start");
      try {
        let res = testNapi.testSetMaxAsyncNestingDepth(0);
        expect(res == 11400431).assertTrue();  // succsess  =0
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0500 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0500 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0500 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0600
     * @tc.name testProfilerOptionsInterface06
     * @tc.desc 验证OH_HiDebug_SetMaxAsyncNestingDepth接口传入超范围值17，返回11400431
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0600 start");
      try {
        let res = testNapi.testSetMaxAsyncNestingDepth(17);
        expect(res == 11400431).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0600 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0600 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0600 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0700
     * @tc.name testProfilerOptionsInterface07
     * @tc.desc 验证OH_HiDebug_SetMaxAsyncTaskStackDepth接口传入有效值1，返回HIDEBUG_SUCCESS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0700 start");
      try {
        let res = testNapi.testSetMaxAsyncTaskStackDepth(1);
        expect(res == 0).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0700 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0700 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0700 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0800
     * @tc.name testProfilerOptionsInterface08
     * @tc.desc 验证OH_HiDebug_SetMaxAsyncTaskStackDepth接口传入有效值256，返回HIDEBUG_SUCCESS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0800 start");
      try {
        let res = testNapi.testSetMaxAsyncTaskStackDepth(256);
        expect(res == 0).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0800 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0800 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0800 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0900
     * @tc.name testProfilerOptionsInterface09
     * @tc.desc 验证OH_HiDebug_SetMaxAsyncTaskStackDepth接口传入超范围值0，返回11400432
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0900 start");
      try {
        let res = testNapi.testSetMaxAsyncTaskStackDepth(0); // 最小值为1， 不用改
        expect(res == 11400432).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0900 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0900 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_0900 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1000
     * @tc.name testProfilerOptionsInterface10
     * @tc.desc 验证OH_HiDebug_SetMaxAsyncTaskStackDepth接口传入超范围值257，返回11400432
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1000 start");
      try {
        let res = testNapi.testSetMaxAsyncTaskStackDepth(257);
        expect(res == 11400432).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1000 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1000 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1000 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1100
     * @tc.name testProfilerOptionsInterface11
     * @tc.desc 验证OH_HiDebug_SetSampleIntervalBytes接口传入有效值384，返回HIDEBUG_SUCCESS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1100 start");
      try {
        let res = testNapi.testSetSampleIntervalBytes(384);
        expect(res == 0).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1100 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1100 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1200
     * @tc.name testProfilerOptionsInterface12
     * @tc.desc 验证OH_HiDebug_SetSampleIntervalBytes接口传入有效值4294967295(UINT32_MAX)，返回HIDEBUG_SUCCESS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1200 start");
      try {
        let res = testNapi.testSetSampleIntervalBytes(4294967295);
        expect(res == 0).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1200 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1200 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1300
     * @tc.name testProfilerOptionsInterface13
     * @tc.desc 验证OH_HiDebug_SetSampleIntervalBytes接口传入超范围值383，返回11400415
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1300 start");
      try {
        let res = testNapi.testSetSampleIntervalBytes(383);
        expect(res == 11400415).assertTrue(); //11400415  新增 ，本周合入dev
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1300 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1300 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1400
     * @tc.name testProfilerOptionsInterface14
     * @tc.desc 验证OH_HiDebug_SetStatisticsIntervalSec接口传入有效值0，返回HIDEBUG_SUCCESS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1400 start");
      try {
        let res = testNapi.testSetStatisticsIntervalSec(0);
        expect(res == 0).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1400 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1400 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1400 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1500
     * @tc.name testProfilerOptionsInterface15
     * @tc.desc 验证OH_HiDebug_SetStatisticsIntervalSec接口传入有效值3600，返回HIDEBUG_SUCCESS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1500 start");
      try {
        let res = testNapi.testSetStatisticsIntervalSec(3600);
        expect(res == 0).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1500 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1500 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1500 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1600
     * @tc.name testProfilerOptionsInterface16
     * @tc.desc 验证OH_HiDebug_SetStatisticsIntervalSec接口传入超范围值3601，返回11400414
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1600 start");
      try {
        let res = testNapi.testSetStatisticsIntervalSec(3601);
        expect(res == 11400414).assertTrue(); // 11400414  本周合入
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1600 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1600 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1600 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1700
     * @tc.name testProfilerOptionsInterface17
     * @tc.desc 验证OH_HiDebug_SetMaxStackDepth接口传入有效值0，返回HIDEBUG_SUCCESS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface17', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1700 start");
      try {
        let res = testNapi.testSetMaxStackDepth(0);
        expect(res == 0).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1700 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1700 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1700 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1800
     * @tc.name testProfilerOptionsInterface18
     * @tc.desc 验证OH_HiDebug_SetMaxStackDepth接口传入有效值30，返回HIDEBUG_SUCCESS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface18', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1800 start");
      try {
        let res = testNapi.testSetMaxStackDepth(30);
        expect(res == 0).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1800 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1800 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1800 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1900
     * @tc.name testProfilerOptionsInterface19
     * @tc.desc 验证OH_HiDebug_SetMaxStackDepth接口传入超范围值31，返回11400413
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface19', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1900 start");
      try {
        let res = testNapi.testSetMaxStackDepth(31);
        expect(res == 11400413).assertTrue();  //11400413  本周合入
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1900 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1900 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_1900 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2000
     * @tc.name testProfilerOptionsInterface20
     * @tc.desc 验证OH_HiDebug_SetFilterSize接口传入有效值1，返回HIDEBUG_SUCCESS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface20', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2000 start");
      try {
        let res = testNapi.testSetFilterSize(1);
        expect(res == 0).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2000 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2000 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2000 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2100
     * @tc.name testProfilerOptionsInterface21
     * @tc.desc 验证OH_HiDebug_SetFilterSize接口传入有效值4294967295(UINT32_MAX)，返回HIDEBUG_SUCCESS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface21', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2100 start");
      try {
        let res = testNapi.testSetFilterSize(4294967295);
        expect(res == 0).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2100 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2100 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2200
     * @tc.name testProfilerOptionsInterface22
     * @tc.desc 验证OH_HiDebug_SetFilterSize接口传入超范围值0，返回11400412
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface22', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2200 start");
      try {
        let res = testNapi.testSetFilterSize(0);
        expect(res == 11400412).assertTrue(); //11400412
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2200 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2200 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2300
     * @tc.name testProfilerOptionsInterface23
     * @tc.desc 验证OH_HiDebug_SetMaxDurationSec接口传入有效值1，返回HIDEBUG_SUCCESS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface23', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2300 start");
      try {
        let res = testNapi.testSetMaxDurationSec(1);
        expect(res == 0).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2300 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2300 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2400
     * @tc.name testProfilerOptionsInterface24
     * @tc.desc 验证OH_HiDebug_SetMaxDurationSec接口传入有效值3600，返回HIDEBUG_SUCCESS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface24', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2400 start");
      try {
        let res = testNapi.testSetMaxDurationSec(3600);
        expect(res == 0).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2400 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2400 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2400 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2500
     * @tc.name testProfilerOptionsInterface25
     * @tc.desc 验证OH_HiDebug_SetMaxDurationSec接口传入超范围值0，返回11400411
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface25', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2500 start");
      try {
        let res = testNapi.testSetMaxDurationSec(0);
        expect(res == 11400411).assertTrue();//11400411
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2500 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2500 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2500 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2600
     * @tc.name testProfilerOptionsInterface26
     * @tc.desc 验证OH_HiDebug_SetMaxDurationSec接口传入超范围值3601，返回11400411
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface26', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2600 start");
      try {
        let res = testNapi.testSetMaxDurationSec(3601);
        expect(res == 11400411).assertTrue(); //11400411
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2600 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2600 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2600 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2700
     * @tc.name testProfilerOptionsInterface27
     * @tc.desc 验证OH_HiDebug_StartProfilerWithOptions接口opts传入nullptr，返回11400410
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface27', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2700 start");
      try {
        let res = testNapi.testStartProfilerWithOptionsNullOpts(0);
        expect(res == 11400410).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2700 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2700 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2700 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2800
     * @tc.name testProfilerOptionsInterface28
     * @tc.desc 验证OH_HiDebug_StartProfilerWithOptions接口type参数传入无效值5(原为无效，现为OH_RES_TYPE_DMA有效值)，返回非11400410
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface28', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2800 start");
      try {
        let res = testNapi.testStartProfilerWithOptions(5, 10);
        await asyncSleep(1000);
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2800",res);
        expect(res != 11400410).assertTrue();
        testNapi.stopProfiler();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2800 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2800 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2800 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2900
     * @tc.name testProfilerOptionsInterface29
     * @tc.desc 验证各Setter接口opts传入nullptr返回11400410
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface29', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2900 start");
      try {  //本周合入 ，尚未实现
        let res1 = testNapi.testSetMaxAsyncNestingDepthNull();
        expect(res1 == 11400410).assertTrue();
        let res2 = testNapi.testSetMaxAsyncTaskStackDepthNull();
        expect(res2 == 11400410).assertTrue();
        let res3 = testNapi.testSetSampleIntervalBytesNull();
        expect(res3 == 11400410).assertTrue();
        let res4 = testNapi.testSetStatisticsIntervalSecNull();
        expect(res4 == 11400410).assertTrue();
        let res5 = testNapi.testSetMaxStackDepthNull();
        expect(res5 == 11400410).assertTrue();
        let res6 = testNapi.testSetFilterSizeNull();
        expect(res6 == 11400410).assertTrue();
        let res7 = testNapi.testSetMaxDurationSecNull();
        expect(res7 == 11400410).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2900 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2900 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_2900 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3000
     * @tc.name testProfilerOptionsInterface30
     * @tc.desc 验证Create和Destroy ProfilerOptions正常生命周期，并设置所有选项
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface30', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3000 start");
      try {
        let res = testNapi.testCreateAndDestroyProfilerOptions();
        expect(res == 1).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3000 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3000 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3000 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3100
     * @tc.name testProfilerOptionsInterface31
     * @tc.desc 验证所有Setter接口设置有效上限值均返回HIDEBUG_SUCCESS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface31', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3100 start");
      try {
        let res = testNapi.testSetAllOptionsBoundary();
        expect(res.maxAsyncNestingDepth == 0).assertTrue();
        expect(res.maxAsyncTaskStackDepth == 0).assertTrue();
        expect(res.sampleIntervalBytes == 0).assertTrue();
        expect(res.statisticsIntervalSec == 0).assertTrue();
        expect(res.maxStackDepth == 0).assertTrue();
        expect(res.filterSize == 0).assertTrue();
        expect(res.maxDurationSec == 0).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3100 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3100 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3200
     * @tc.name testProfilerOptionsInterface32
     * @tc.desc 验证OH_HiDebug_SetMaxDurationSec接口传入0(通过StartProfilerWithOptions间接设置)，Setter返回11400411，opts保持默认值900，StartProfilerWithOptions使用默认值启动
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface32', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3200 start");
      try {
        let res = testNapi.testStartProfilerWithOptions(0, 0);
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3200",res);
        expect(res != 11400410).assertTrue();
        testNapi.stopProfiler();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3200 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3200 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3300
     * @tc.name testProfilerOptionsInterface33
     * @tc.desc 验证OH_HiDebug_SetMaxDurationSec接口传入3601(通过StartProfilerWithOptions间接设置)，Setter返回11400411，opts保持默认值900，StartProfilerWithOptions使用默认值启动
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface33', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3300 start");
      try {
        let res = testNapi.testStartProfilerWithOptions(0, 3601);
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3300",res);
        expect(res != 11400410).assertTrue();
        testNapi.stopProfiler();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3300 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3300 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3400
     * @tc.name testProfilerOptionsInterface34
     * @tc.desc 验证OH_HiDebug_SetSampleIntervalBytes接口传入超范围值0，返回11400415
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface34', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3400 start");
      try {
        let res = testNapi.testSetSampleIntervalBytes(0);
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3400",res);
        expect(res == 11400415).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3400 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3400 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3400 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3500
     * @tc.name testProfilerOptionsInterface35
     * @tc.desc 验证OH_HiDebug_SetStatisticsIntervalSec接口传入有效值1800(中间值)，返回HIDEBUG_SUCCESS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface35', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3500 start");
      try {
        let res = testNapi.testSetStatisticsIntervalSec(1800);
        expect(res == 0).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3500 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3500 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3500 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3600
     * @tc.name testProfilerOptionsInterface36
     * @tc.desc 验证OH_HiDebug_DestroyProfilerOptions接口传入nullptr返回HIDEBUG_RES_PROF_INVALID_ARG(11400410)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface36', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3600 start");
      try {
        let res = testNapi.testDestroyProfilerOptionsNullReturnCode();
        expect(res == 11400410).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3600 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3600 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3600 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3700
     * @tc.name testProfilerOptionsInterface37
     * @tc.desc 验证OH_HiDebug_StartProfilerWithOptions接口callback传入nullptr，返回HIDEBUG_RES_PROF_INVALID_ARG(11400410)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface37', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3700 start");
      try {
        let res = testNapi.testStartProfilerWithOptionsNullCallback(0, 30);
        expect(res == 11400410).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3700 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3700 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3700 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3800
     * @tc.name testProfilerOptionsInterface38
     * @tc.desc 验证OH_HiDebug_SetMaxDurationSec接口传入0和3601，均返回HIDEBUG_RES_PROF_INVALID_MAX_DURATION(11400411)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface38', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3800 start");
      try {
        let res = testNapi.testSetMaxDurationSecInvalidReturn();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3800", JSON.stringify(res));
        expect(res.zero == 11400411).assertTrue();
        expect(res.overMax == 11400411).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3800 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3800 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3800 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3900
     * @tc.name testProfilerOptionsInterface39
     * @tc.desc 验证OH_HiDebug_CreateProfilerOptions创建后默认值正确(maxDuration=900,filterSize=1024,maxStackDepth=30,statisticsInterval=10,sampleInterval=384,maxAsyncNestingDepth=1,maxAsyncStackDepth=16)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface39', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3900 start");
      try {
        let res = testNapi.testGetProfilerOptionsDefaults();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3900", JSON.stringify(res));
        expect(res.maxDuration == 900).assertTrue();
        expect(res.filterSize == 1024).assertTrue();
        expect(res.maxStackDepth == 30).assertTrue();
        expect(res.statisticsInterval == 10).assertTrue();
        expect(res.sampleInterval == 384).assertTrue();
        expect(res.maxAsyncNestingDepth == 1).assertTrue();
        expect(res.maxAsyncStackDepth == 16).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3900 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3900 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_3900 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4000
     * @tc.name testProfilerOptionsInterface40
     * @tc.desc 验证OH_HiDebug_StartProfilerWithOptions接口ResourceType传入OH_RES_TYPE_FD(0)，返回非11400410
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface40', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4000 start");
      try {
        let res = testNapi.testStartProfilerWithOptions(0, 10);
        await asyncSleep(1000);
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4000", res);
        expect(res != 11400410).assertTrue();
        testNapi.stopProfiler();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4000 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4000 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4000 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4100
     * @tc.name testProfilerOptionsInterface41
     * @tc.desc 验证OH_HiDebug_StartProfilerWithOptions接口ResourceType传入OH_RES_TYPE_THREAD(1)，返回非11400410
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface41', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4100 start");
      try {
        let res = testNapi.testStartProfilerWithOptions(1, 10);
        await asyncSleep(1000);
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4100", res);
        expect(res != 11400410).assertTrue();
        testNapi.stopProfiler();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4100 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4100 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4200
     * @tc.name testProfilerOptionsInterface42
     * @tc.desc 验证OH_HiDebug_StartProfilerWithOptions接口ResourceType传入OH_RES_TYPE_NATIVE(2)，返回非11400410
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface42', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4200 start");
      try {
        let res = testNapi.testStartProfilerWithOptions(2, 10);
        await asyncSleep(1000);
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4200", res);
        expect(res != 11400410).assertTrue();
        testNapi.stopProfiler();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4200 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4200 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4300
     * @tc.name testProfilerOptionsInterface43
     * @tc.desc 验证OH_HiDebug_StartProfilerWithOptions接口ResourceType传入OH_RES_TYPE_GPU(3)，返回非11400410
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface43', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4300 start");
      try {
        let res = testNapi.testStartProfilerWithOptions(3, 10);
        await asyncSleep(10000);
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4300", res);
        expect(res != 11400410).assertTrue();
        testNapi.stopProfiler();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4300 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4300 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4500
     * @tc.name testProfilerOptionsInterface45
     * @tc.desc 验证OH_HiDebug_StartProfilerWithOptions接口opts和callback同时为nullptr，返回HIDEBUG_RES_PROF_INVALID_ARG(11400410)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface45', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4500 start");
      try {
        let res = testNapi.testStartProfilerWithOptionsNullOpts(0);
        expect(res == 11400410).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4500 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4500 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4500 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4600
     * @tc.name testProfilerOptionsInterface46
     * @tc.desc 验证OH_HiDebug_StartProfilerWithOptions接口ResourceType传入OH_RES_TYPE_GLOBAL_HANDLE(4)，返回非11400410
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface46', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4600 start");
      try {
        let res = testNapi.testStartProfilerWithOptions(4, 10);
        await asyncSleep(1000);
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4600", res);
        expect(res != 11400410).assertTrue();
        testNapi.stopProfiler();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4600 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4600 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4600 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4700
     * @tc.name testProfilerOptionsInterface47
     * @tc.desc 验证OH_HiDebug_StartProfilerWithOptions接口ResourceType传入OH_RES_TYPE_DMA(5)，返回非11400410
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface47', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4700 start");
      try {
        let res = testNapi.testStartProfilerWithOptions(5, 10);
        await asyncSleep(1000);
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4700", res);
        expect(res != 11400410).assertTrue();
        testNapi.stopProfiler();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4700 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4700 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4700 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4800
     * @tc.name testProfilerOptionsInterface48
     * @tc.desc 验证OH_HiDebug_StartProfilerWithOptions接口ResourceType传入OH_RES_TYPE_ASHMEM(6)，返回非11400410
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface48', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4800 start");
      try {
        let res = testNapi.testStartProfilerWithOptions(6, 10);
        await asyncSleep(1000);
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4800", res);
        expect(res != 11400410).assertTrue();
        testNapi.stopProfiler();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4800 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4800 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4800 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4900
     * @tc.name testProfilerOptionsInterface49
     * @tc.desc 验证OH_HiDebug_StartProfilerWithOptions接口ResourceType传入OH_RES_TYPE_COMPOSITE_HEAP(7)，返回非11400410
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface49', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4900 start");
      try {
        let res = testNapi.testStartProfilerWithOptions(7, 10);
        await asyncSleep(1000);
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4900", res);
        expect(res != 11400410).assertTrue();
        testNapi.stopProfiler();
        testNapi.stopProfiler();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4900 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4900 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_4900 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_5000
     * @tc.name testProfilerOptionsInterface50
     * @tc.desc 验证OH_HiDebug_StartProfilerWithOptions接口ResourceType传入无效值-1，返回HIDEBUG_RES_PROF_INVALID_RESOURCE_TYPE(11400416)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface50', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_5000 start");
      try {
        let res = testNapi.testStartProfilerWithOptions(-1, 10);
        await asyncSleep(1000);
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_5000", res);
        expect(res == 11400416 || res == 11400421).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_5000 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_5000 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_5000 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_5100
     * @tc.name testProfilerOptionsInterface51
     * @tc.desc 验证OH_HiDebug_StartProfilerWithOptions接口ResourceType传入无效值100，返回HIDEBUG_RES_PROF_INVALID_RESOURCE_TYPE(11400416)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testProfilerOptionsInterface51', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_5100 start");
      try {
        let res = testNapi.testStartProfilerWithOptions(100, 10);
        await asyncSleep(1000);
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_5100", res);
        expect(res == 11400416 || res == 11400421).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_5100 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_5100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_ProfilerOptions_Interface_5100 end");
    })
  })
}
