import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import hidebug from '@ohos.hidebug';
import testNapi from 'libentry.so';

export function asyncSleep(time: number): Promise<Object> {
  return new Promise(resolve => setTimeout(resolve, time));
};

export function assertNativeMemInfoEqual(nativeMemInfoA: hidebug.NativeMemInfo, nativeMemInfoB: hidebug.NativeMemInfo) {
  expect(nativeMemInfoA.pss == nativeMemInfoB.pss).assertTrue();
  expect(nativeMemInfoA.vss == nativeMemInfoB.vss).assertTrue();
  expect(nativeMemInfoA.rss == nativeMemInfoB.rss).assertTrue();
  expect(nativeMemInfoA.sharedDirty == nativeMemInfoB.sharedDirty).assertTrue();
  expect(nativeMemInfoA.privateDirty == nativeMemInfoB.privateDirty).assertTrue();
  expect(nativeMemInfoA.sharedClean == nativeMemInfoB.sharedClean).assertTrue();
  expect(nativeMemInfoA.privateClean == nativeMemInfoB.privateClean).assertTrue();
};

export function assertNativeMemInfoNotEqual(nativeMemInfoA: hidebug.NativeMemInfo, nativeMemInfoB: hidebug.NativeMemInfo) {
  let result = nativeMemInfoA.pss == nativeMemInfoB.pss &&
    nativeMemInfoA.vss == nativeMemInfoB.vss &&
    nativeMemInfoA.rss == nativeMemInfoB.rss &&
    nativeMemInfoA.sharedDirty == nativeMemInfoB.sharedDirty &&
    nativeMemInfoA.privateDirty == nativeMemInfoB.privateDirty &&
    nativeMemInfoA.sharedClean == nativeMemInfoB.sharedClean &&
    nativeMemInfoA.privateClean == nativeMemInfoB.privateClean
  expect(result).assertFalse();
};

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
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_2500
     * @tc.name testHiprofilerInterface25
     * @tc.desc 验证getAppNativeMemInfoAsync接口调用返回内存值正常
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHiprofilerInterface25', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_2500 start");
      try {
        let nativeMemInfo = await hidebug.getAppNativeMemInfoAsync();
        expect(nativeMemInfo.pss >= 0).assertTrue();
        expect(nativeMemInfo.vss >= 0).assertTrue();
        expect(nativeMemInfo.rss >= 0).assertTrue();
        expect(nativeMemInfo.sharedDirty >= 0).assertTrue();
        expect(nativeMemInfo.privateDirty >= 0).assertTrue();
        expect(nativeMemInfo.sharedClean >= 0).assertTrue();
        expect(nativeMemInfo.privateClean >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_2500 nativeMemInfo:" + "\n"
                      + "pss: " + nativeMemInfo.pss + "\n"
                      + "vss: " + nativeMemInfo.vss + "\n"
                      + "rss: " + nativeMemInfo.rss + "\n"
                      + "sharedDirty: " + nativeMemInfo.sharedDirty + "\n"
                      + "privateDirty: " + nativeMemInfo.privateDirty + "\n"
                      + "sharedClean: " + nativeMemInfo.sharedClean + "\n"
                      + "privateClean: " + nativeMemInfo.privateClean);
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_2500 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_2500 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_2600
     * @tc.name testHiprofilerInterface26
     * @tc.desc 验证getAppNativeMemInfoWithCache接口传入true返回内存值正常
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHiprofilerInterface26', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_2600 start");
      try {
        let nativeMemInfo = hidebug.getAppNativeMemInfoWithCache(true);
        expect(nativeMemInfo.pss >= 0).assertTrue();
        expect(nativeMemInfo.vss >= 0).assertTrue();
        expect(nativeMemInfo.rss >= 0).assertTrue();
        expect(nativeMemInfo.sharedDirty >= 0).assertTrue();
        expect(nativeMemInfo.privateDirty >= 0).assertTrue();
        expect(nativeMemInfo.sharedClean >= 0).assertTrue();
        expect(nativeMemInfo.privateClean >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_2600 nativeMemInfo:" + "\n"
          + "pss: " + nativeMemInfo.pss + "\n"
          + "vss: " + nativeMemInfo.vss + "\n"
          + "rss: " + nativeMemInfo.rss + "\n"
          + "sharedDirty: " + nativeMemInfo.sharedDirty + "\n"
          + "privateDirty: " + nativeMemInfo.privateDirty + "\n"
          + "sharedClean: " + nativeMemInfo.sharedClean + "\n"
          + "privateClean: " + nativeMemInfo.privateClean);
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_2600 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_2600 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_2700
     * @tc.name testHiprofilerInterface27
     * @tc.desc 验证getAppNativeMemInfoWithCache接口传入false返回内存值正常
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHiprofilerInterface27', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_2700 start");
      try {
        let nativeMemInfo = hidebug.getAppNativeMemInfoWithCache(false);
        expect(nativeMemInfo.pss >= 0).assertTrue();
        expect(nativeMemInfo.vss >= 0).assertTrue();
        expect(nativeMemInfo.rss >= 0).assertTrue();
        expect(nativeMemInfo.sharedDirty >= 0).assertTrue();
        expect(nativeMemInfo.privateDirty >= 0).assertTrue();
        expect(nativeMemInfo.sharedClean >= 0).assertTrue();
        expect(nativeMemInfo.privateClean >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_2700 nativeMemInfo:" + "\n"
          + "pss: " + nativeMemInfo.pss + "\n"
          + "vss: " + nativeMemInfo.vss + "\n"
          + "rss: " + nativeMemInfo.rss + "\n"
          + "sharedDirty: " + nativeMemInfo.sharedDirty + "\n"
          + "privateDirty: " + nativeMemInfo.privateDirty + "\n"
          + "sharedClean: " + nativeMemInfo.sharedClean + "\n"
          + "privateClean: " + nativeMemInfo.privateClean);
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_2700 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_2700 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_2800
     * @tc.name testHiprofilerInterface28
     * @tc.desc 验证getAppNativeMemInfoWithCache接口传入undefined值返回错误码401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHiprofilerInterface28', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_2800 start");
      try {
        hidebug.getAppNativeMemInfoWithCache(undefined);
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_2800 undefined");
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_2800 > err code: ${err.code}, err msg: ${err.message}`)
        expect(err.code == "401").assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_2800 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_2900
     * @tc.name testHiprofilerInterface29
     * @tc.desc 验证getAppNativeMemInfoWithCache接口不传参返回内存值正常
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHiprofilerInterface29', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_2900 start");
      try {
        let nativeMemInfo = hidebug.getAppNativeMemInfoWithCache();
        expect(nativeMemInfo.pss >= 0).assertTrue();
        expect(nativeMemInfo.vss >= 0).assertTrue();
        expect(nativeMemInfo.rss >= 0).assertTrue();
        expect(nativeMemInfo.sharedDirty >= 0).assertTrue();
        expect(nativeMemInfo.privateDirty >= 0).assertTrue();
        expect(nativeMemInfo.sharedClean >= 0).assertTrue();
        expect(nativeMemInfo.privateClean >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_2900 nativeMemInfo:" + "\n"
          + "pss: " + nativeMemInfo.pss + "\n"
          + "vss: " + nativeMemInfo.vss + "\n"
          + "rss: " + nativeMemInfo.rss + "\n"
          + "sharedDirty: " + nativeMemInfo.sharedDirty + "\n"
          + "privateDirty: " + nativeMemInfo.privateDirty + "\n"
          + "sharedClean: " + nativeMemInfo.sharedClean + "\n"
          + "privateClean: " + nativeMemInfo.privateClean);
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_2900 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_2900 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_3000
     * @tc.name testHiprofilerInterface30
     * @tc.desc 验证getAppNativeMemInfoWithCache接口连续传入true返回内存值不一致
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHiprofilerInterface30', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_3000 start");
      try {
        let nativeMemInfo1 = hidebug.getAppNativeMemInfoWithCache(true);
        await asyncSleep(50);
        let nativeMemInfo2 = hidebug.getAppNativeMemInfoWithCache(true);
        await asyncSleep(50);
        let nativeMemInfo3 = hidebug.getAppNativeMemInfoWithCache(true);
        assertNativeMemInfoNotEqual(nativeMemInfo1, nativeMemInfo2);
        assertNativeMemInfoNotEqual(nativeMemInfo1, nativeMemInfo3);
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_3000 nativeMemInfo1:" + "\n"
          + "pss: " + nativeMemInfo1.pss + "\n"
          + "vss: " + nativeMemInfo1.vss + "\n"
          + "rss: " + nativeMemInfo1.rss + "\n"
          + "sharedDirty: " + nativeMemInfo1.sharedDirty + "\n"
          + "privateDirty: " + nativeMemInfo1.privateDirty + "\n"
          + "sharedClean: " + nativeMemInfo1.sharedClean + "\n"
          + "privateClean: " + nativeMemInfo1.privateClean);
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_3000 nativeMemInfo2:" + "\n"
          + "pss: " + nativeMemInfo2.pss + "\n"
          + "vss: " + nativeMemInfo2.vss + "\n"
          + "rss: " + nativeMemInfo2.rss + "\n"
          + "sharedDirty: " + nativeMemInfo2.sharedDirty + "\n"
          + "privateDirty: " + nativeMemInfo2.privateDirty + "\n"
          + "sharedClean: " + nativeMemInfo2.sharedClean + "\n"
          + "privateClean: " + nativeMemInfo2.privateClean);
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_3000 nativeMemInfo3:" + "\n"
          + "pss: " + nativeMemInfo3.pss + "\n"
          + "vss: " + nativeMemInfo3.vss + "\n"
          + "rss: " + nativeMemInfo3.rss + "\n"
          + "sharedDirty: " + nativeMemInfo3.sharedDirty + "\n"
          + "privateDirty: " + nativeMemInfo3.privateDirty + "\n"
          + "sharedClean: " + nativeMemInfo3.sharedClean + "\n"
          + "privateClean: " + nativeMemInfo3.privateClean);
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_3000 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_3000 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_3100
     * @tc.name testHiprofilerInterface31
     * @tc.desc 验证getAppNativeMemInfoWithCache接口连续传入false返回内存值一致
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHiprofilerInterface31', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_3100 start");
      try {
        let nativeMemInfo1 = hidebug.getAppNativeMemInfoWithCache(false);
        let nativeMemInfo2 = hidebug.getAppNativeMemInfoWithCache(false);
        let nativeMemInfo3 = hidebug.getAppNativeMemInfoWithCache(false);
        assertNativeMemInfoEqual(nativeMemInfo1, nativeMemInfo2);
        assertNativeMemInfoEqual(nativeMemInfo1, nativeMemInfo3);
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_3100 nativeMemInfo1:" + "\n"
          + "pss: " + nativeMemInfo1.pss + "\n"
          + "vss: " + nativeMemInfo1.vss + "\n"
          + "rss: " + nativeMemInfo1.rss + "\n"
          + "sharedDirty: " + nativeMemInfo1.sharedDirty + "\n"
          + "privateDirty: " + nativeMemInfo1.privateDirty + "\n"
          + "sharedClean: " + nativeMemInfo1.sharedClean + "\n"
          + "privateClean: " + nativeMemInfo1.privateClean);
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_3100 nativeMemInfo2:" + "\n"
          + "pss: " + nativeMemInfo2.pss + "\n"
          + "vss: " + nativeMemInfo2.vss + "\n"
          + "rss: " + nativeMemInfo2.rss + "\n"
          + "sharedDirty: " + nativeMemInfo2.sharedDirty + "\n"
          + "privateDirty: " + nativeMemInfo2.privateDirty + "\n"
          + "sharedClean: " + nativeMemInfo2.sharedClean + "\n"
          + "privateClean: " + nativeMemInfo2.privateClean);
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_3100 nativeMemInfo3:" + "\n"
          + "pss: " + nativeMemInfo3.pss + "\n"
          + "vss: " + nativeMemInfo3.vss + "\n"
          + "rss: " + nativeMemInfo3.rss + "\n"
          + "sharedDirty: " + nativeMemInfo3.sharedDirty + "\n"
          + "privateDirty: " + nativeMemInfo3.privateDirty + "\n"
          + "sharedClean: " + nativeMemInfo3.sharedClean + "\n"
          + "privateClean: " + nativeMemInfo3.privateClean);
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_3100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_3100 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_3300
     * @tc.name testHiprofilerInterface33
     * @tc.desc 验证getAppNativeMemInfoWithCache接口连续传入true稳定性
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiprofilerInterface33', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_3300 start");
      try {
        for (let i = 0; i < 100; i++) {
          let nativeMemInfo = hidebug.getAppNativeMemInfoWithCache(true);
          expect(nativeMemInfo.pss >= 0).assertTrue();
          expect(nativeMemInfo.vss >= 0).assertTrue();
          expect(nativeMemInfo.rss >= 0).assertTrue();
          expect(nativeMemInfo.sharedDirty >= 0).assertTrue();
          expect(nativeMemInfo.privateDirty >= 0).assertTrue();
          expect(nativeMemInfo.sharedClean >= 0).assertTrue();
          expect(nativeMemInfo.privateClean >= 0).assertTrue();
          console.info("SUB_DFX_DFR_Hiprofiler_Interface_3300 nativeMemInfo:" + i + "\n"
            + "pss: " + nativeMemInfo.pss + "\n"
            + "vss: " + nativeMemInfo.vss + "\n"
            + "rss: " + nativeMemInfo.rss + "\n"
            + "sharedDirty: " + nativeMemInfo.sharedDirty + "\n"
            + "privateDirty: " + nativeMemInfo.privateDirty + "\n"
            + "sharedClean: " + nativeMemInfo.sharedClean + "\n"
            + "privateClean: " + nativeMemInfo.privateClean);
        }
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_3300 true 100 times success")
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_3300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_3300 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_3400
     * @tc.name testHiprofilerInterface34
     * @tc.desc 验证getAppNativeMemInfoWithCache接口连续传入false稳定性
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiprofilerInterface34', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_3400 start");
      try {
        for (let i = 0; i < 100; i++) {
          let nativeMemInfo = hidebug.getAppNativeMemInfoWithCache(false);
          expect(nativeMemInfo.pss >= 0).assertTrue();
          expect(nativeMemInfo.vss >= 0).assertTrue();
          expect(nativeMemInfo.rss >= 0).assertTrue();
          expect(nativeMemInfo.sharedDirty >= 0).assertTrue();
          expect(nativeMemInfo.privateDirty >= 0).assertTrue();
          expect(nativeMemInfo.sharedClean >= 0).assertTrue();
          expect(nativeMemInfo.privateClean >= 0).assertTrue();
          console.info("SUB_DFX_DFR_Hiprofiler_Interface_3400 nativeMemInfo:" + i + "\n"
            + "pss: " + nativeMemInfo.pss + "\n"
            + "vss: " + nativeMemInfo.vss + "\n"
            + "rss: " + nativeMemInfo.rss + "\n"
            + "sharedDirty: " + nativeMemInfo.sharedDirty + "\n"
            + "privateDirty: " + nativeMemInfo.privateDirty + "\n"
            + "sharedClean: " + nativeMemInfo.sharedClean + "\n"
            + "privateClean: " + nativeMemInfo.privateClean);
        }
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_3400 false 100 times success")
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_3400 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_3400 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_3500
     * @tc.name testHiprofilerInterface35
     * @tc.desc 验证getAppNativeMemInfoWithCache接口传入true返回内存值正常
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHiprofilerInterface35', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_3500 start");
      try {
        let nativeMemInfo = testNapi.getNativeMemInfoTrue();
        expect(nativeMemInfo.pss >= 0).assertTrue();
        expect(nativeMemInfo.vss >= 0).assertTrue();
        expect(nativeMemInfo.rss >= 0).assertTrue();
        expect(nativeMemInfo.sharedDirty >= 0).assertTrue();
        expect(nativeMemInfo.privateDirty >= 0).assertTrue();
        expect(nativeMemInfo.sharedClean >= 0).assertTrue();
        expect(nativeMemInfo.privateClean >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_3500 nativeMemInfo:" + "\n"
          + "pss: " + nativeMemInfo.pss + "\n"
          + "vss: " + nativeMemInfo.vss + "\n"
          + "rss: " + nativeMemInfo.rss + "\n"
          + "sharedDirty: " + nativeMemInfo.sharedDirty + "\n"
          + "privateDirty: " + nativeMemInfo.privateDirty + "\n"
          + "sharedClean: " + nativeMemInfo.sharedClean + "\n"
          + "privateClean: " + nativeMemInfo.privateClean);
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_3500 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_3500 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_3600
     * @tc.name testHiprofilerInterface36
     * @tc.desc 验证getAppNativeMemInfoWithCache接口传入false返回内存值正常
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHiprofilerInterface36', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_3600 start");
      try {
        let nativeMemInfo = testNapi.getNativeMemInfoFalse();
        expect(nativeMemInfo.pss >= 0).assertTrue();
        expect(nativeMemInfo.vss >= 0).assertTrue();
        expect(nativeMemInfo.rss >= 0).assertTrue();
        expect(nativeMemInfo.sharedDirty >= 0).assertTrue();
        expect(nativeMemInfo.privateDirty >= 0).assertTrue();
        expect(nativeMemInfo.sharedClean >= 0).assertTrue();
        expect(nativeMemInfo.privateClean >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_3600 nativeMemInfo:" + "\n"
          + "pss: " + nativeMemInfo.pss + "\n"
          + "vss: " + nativeMemInfo.vss + "\n"
          + "rss: " + nativeMemInfo.rss + "\n"
          + "sharedDirty: " + nativeMemInfo.sharedDirty + "\n"
          + "privateDirty: " + nativeMemInfo.privateDirty + "\n"
          + "sharedClean: " + nativeMemInfo.sharedClean + "\n"
          + "privateClean: " + nativeMemInfo.privateClean);
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_3600 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_3600 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_3700
     * @tc.name testHiprofilerInterface37
     * @tc.desc 验证getAppNativeMemInfoWithCache接口连续传入true返回内存值不一致
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHiprofilerInterface37', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_3700 start");
      try {
        let nativeMemInfo1 = testNapi.getNativeMemInfoTrue();
        await asyncSleep(50);
        let nativeMemInfo2 = testNapi.getNativeMemInfoTrue();
        await asyncSleep(50);
        let nativeMemInfo3 = testNapi.getNativeMemInfoTrue();
        assertNativeMemInfoNotEqual(nativeMemInfo1, nativeMemInfo2);
        assertNativeMemInfoNotEqual(nativeMemInfo1, nativeMemInfo3);
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_3700 nativeMemInfo1:" + "\n"
          + "pss: " + nativeMemInfo1.pss + "\n"
          + "vss: " + nativeMemInfo1.vss + "\n"
          + "rss: " + nativeMemInfo1.rss + "\n"
          + "sharedDirty: " + nativeMemInfo1.sharedDirty + "\n"
          + "privateDirty: " + nativeMemInfo1.privateDirty + "\n"
          + "sharedClean: " + nativeMemInfo1.sharedClean + "\n"
          + "privateClean: " + nativeMemInfo1.privateClean);
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_3700 nativeMemInfo2:" + "\n"
          + "pss: " + nativeMemInfo2.pss + "\n"
          + "vss: " + nativeMemInfo2.vss + "\n"
          + "rss: " + nativeMemInfo2.rss + "\n"
          + "sharedDirty: " + nativeMemInfo2.sharedDirty + "\n"
          + "privateDirty: " + nativeMemInfo2.privateDirty + "\n"
          + "sharedClean: " + nativeMemInfo2.sharedClean + "\n"
          + "privateClean: " + nativeMemInfo2.privateClean);
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_3700 nativeMemInfo3:" + "\n"
          + "pss: " + nativeMemInfo3.pss + "\n"
          + "vss: " + nativeMemInfo3.vss + "\n"
          + "rss: " + nativeMemInfo3.rss + "\n"
          + "sharedDirty: " + nativeMemInfo3.sharedDirty + "\n"
          + "privateDirty: " + nativeMemInfo3.privateDirty + "\n"
          + "sharedClean: " + nativeMemInfo3.sharedClean + "\n"
          + "privateClean: " + nativeMemInfo3.privateClean);
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_3700 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_3700 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_3800
     * @tc.name testHiprofilerInterface38
     * @tc.desc 验证getAppNativeMemInfoWithCache接口连续传入false返回内存值一致
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHiprofilerInterface38', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_3800 start");
      try {
        let nativeMemInfo1 = testNapi.getNativeMemInfoFalse();
        let nativeMemInfo2 = testNapi.getNativeMemInfoFalse();
        let nativeMemInfo3 = testNapi.getNativeMemInfoFalse();
        assertNativeMemInfoEqual(nativeMemInfo1, nativeMemInfo2);
        assertNativeMemInfoEqual(nativeMemInfo1, nativeMemInfo3);
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_3800 nativeMemInfo1:" + "\n"
          + "pss: " + nativeMemInfo1.pss + "\n"
          + "vss: " + nativeMemInfo1.vss + "\n"
          + "rss: " + nativeMemInfo1.rss + "\n"
          + "sharedDirty: " + nativeMemInfo1.sharedDirty + "\n"
          + "privateDirty: " + nativeMemInfo1.privateDirty + "\n"
          + "sharedClean: " + nativeMemInfo1.sharedClean + "\n"
          + "privateClean: " + nativeMemInfo1.privateClean);
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_3800 nativeMemInfo2:" + "\n"
          + "pss: " + nativeMemInfo2.pss + "\n"
          + "vss: " + nativeMemInfo2.vss + "\n"
          + "rss: " + nativeMemInfo2.rss + "\n"
          + "sharedDirty: " + nativeMemInfo2.sharedDirty + "\n"
          + "privateDirty: " + nativeMemInfo2.privateDirty + "\n"
          + "sharedClean: " + nativeMemInfo2.sharedClean + "\n"
          + "privateClean: " + nativeMemInfo2.privateClean);
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_3800 nativeMemInfo3:" + "\n"
          + "pss: " + nativeMemInfo3.pss + "\n"
          + "vss: " + nativeMemInfo3.vss + "\n"
          + "rss: " + nativeMemInfo3.rss + "\n"
          + "sharedDirty: " + nativeMemInfo3.sharedDirty + "\n"
          + "privateDirty: " + nativeMemInfo3.privateDirty + "\n"
          + "sharedClean: " + nativeMemInfo3.sharedClean + "\n"
          + "privateClean: " + nativeMemInfo3.privateClean);
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_3800 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_3800 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_3900
     * @tc.name testHiprofilerInterface39
     * @tc.desc 验证getAppNativeMemInfoWithCache接口连续传入true稳定性
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiprofilerInterface39', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_3900 start");
      try {
        for (let i = 0; i < 100; i++) {
          let nativeMemInfo = testNapi.getNativeMemInfoTrue();
          expect(nativeMemInfo.pss >= 0).assertTrue();
          expect(nativeMemInfo.vss >= 0).assertTrue();
          expect(nativeMemInfo.rss >= 0).assertTrue();
          expect(nativeMemInfo.sharedDirty >= 0).assertTrue();
          expect(nativeMemInfo.privateDirty >= 0).assertTrue();
          expect(nativeMemInfo.sharedClean >= 0).assertTrue();
          expect(nativeMemInfo.privateClean >= 0).assertTrue();
          console.info("SUB_DFX_DFR_Hiprofiler_Interface_3900 nativeMemInfo:" + i + "\n"
            + "pss: " + nativeMemInfo.pss + "\n"
            + "vss: " + nativeMemInfo.vss + "\n"
            + "rss: " + nativeMemInfo.rss + "\n"
            + "sharedDirty: " + nativeMemInfo.sharedDirty + "\n"
            + "privateDirty: " + nativeMemInfo.privateDirty + "\n"
            + "sharedClean: " + nativeMemInfo.sharedClean + "\n"
            + "privateClean: " + nativeMemInfo.privateClean);
        }
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_3900 true 100 times success")
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_3900 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_3900 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_4000
     * @tc.name testHiprofilerInterface40
     * @tc.desc 验证getAppNativeMemInfoWithCache接口连续传入false稳定性
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiprofilerInterface40', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4000 start");
      try {
        for (let i = 0; i < 100; i++) {
          let nativeMemInfo = testNapi.getNativeMemInfoFalse();
          expect(nativeMemInfo.pss >= 0).assertTrue();
          expect(nativeMemInfo.vss >= 0).assertTrue();
          expect(nativeMemInfo.rss >= 0).assertTrue();
          expect(nativeMemInfo.sharedDirty >= 0).assertTrue();
          expect(nativeMemInfo.privateDirty >= 0).assertTrue();
          expect(nativeMemInfo.sharedClean >= 0).assertTrue();
          expect(nativeMemInfo.privateClean >= 0).assertTrue();
          console.info("SUB_DFX_DFR_Hiprofiler_Interface_4000 nativeMemInfo:" + i + "\n"
            + "pss: " + nativeMemInfo.pss + "\n"
            + "vss: " + nativeMemInfo.vss + "\n"
            + "rss: " + nativeMemInfo.rss + "\n"
            + "sharedDirty: " + nativeMemInfo.sharedDirty + "\n"
            + "privateDirty: " + nativeMemInfo.privateDirty + "\n"
            + "sharedClean: " + nativeMemInfo.sharedClean + "\n"
            + "privateClean: " + nativeMemInfo.privateClean);
        }
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4000 false 100 times success")
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_4000 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4000 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_4100
     * @tc.name testHiprofilerInterface41
     * @tc.desc 验证getAppVMObjectUsedSize接口调用返回内存值正常
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHiprofilerInterface41', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4100 start");
      try {
        let appVMObjectUsed = hidebug.getAppVMObjectUsedSize();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4100 appVMObjectUsed: " + appVMObjectUsed);
        expect(appVMObjectUsed >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4100 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_4100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4100 end");
    });

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_4200
     * @tc.name testHiprofilerInterface42
     * @tc.desc 验证getAppVMObjectUsedSize接口不连续调用测试
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHiprofilerInterface42', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4200 start");
      try {
        let appVMObjectUsed1 = hidebug.getAppVMObjectUsedSize();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4200 appVMObjectUsed1: " + appVMObjectUsed1);
        await asyncSleep(5);
        let appVMObjectUsed2 = hidebug.getAppVMObjectUsedSize();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4200 appVMObjectUsed2: " + appVMObjectUsed2);
        expect(appVMObjectUsed1 >= 0).assertTrue();
        expect(appVMObjectUsed2 >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4200 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_4200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4200 end");
    });

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_4300
     * @tc.name testHiprofilerInterface43
     * @tc.desc 验证getAppVMObjectUsedSize接口连续调用测试
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHiprofilerInterface43', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4300 start");
      try {
        let appVMObjectUsed1 = hidebug.getAppVMObjectUsedSize();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4300 appVMObjectUsed1: " + appVMObjectUsed1);
        let appVMObjectUsed2 = hidebug.getAppVMObjectUsedSize();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4300 appVMObjectUsed2: " + appVMObjectUsed2);
        expect(appVMObjectUsed1 >= 0).assertTrue();
        expect(appVMObjectUsed2 >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4300 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_4300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4300 end");
    });

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_4400
     * @tc.name testHiprofilerInterface44
     * @tc.desc 验证getAppVMObjectUsedSize接口调用稳定性测试
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiprofilerInterface44', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4400 start");
      try {
        for (let i = 0; i < 100; i++) {
          let appVMObjectUsed = hidebug.getAppVMObjectUsedSize();
          expect(appVMObjectUsed >= 0).assertTrue();
          console.info("SUB_DFX_DFR_Hiprofiler_Interface_4400 appVMObjectUsed: " + appVMObjectUsed);
        }
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4400 100 times success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_4400 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4400 end");
    });

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_4500
     * @tc.name testHiprofilerInterface45
     * @tc.desc 验证getGraphicsMemorySummary接口正常入参测试
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHiprofilerInterface45', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4500 start");
      try {
        let graphicsMemorySummary = await hidebug.getGraphicsMemorySummary(5);
        let gl = graphicsMemorySummary.gl
        let graph = graphicsMemorySummary.graph
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4500 graphicsMemorySummary gl: " + gl + " graph: " + graph);
        expect(gl >= 0).assertTrue();
        expect(graph >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4500 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_4500 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4500 end");
    });

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_4600
     * @tc.name testHiprofilerInterface46
     * @tc.desc 验证getGraphicsMemorySummary接口入参下边界值测试
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHiprofilerInterface46', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4600 start");
      try {
        let graphicsMemorySummary = await hidebug.getGraphicsMemorySummary(2);
        let gl = graphicsMemorySummary.gl
        let graph = graphicsMemorySummary.graph
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4600 graphicsMemorySummary gl: " + gl + " graph: " + graph);
        expect(gl >= 0).assertTrue();
        expect(graph >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4600 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_4600 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4600 end");
    });

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_4700
     * @tc.name testHiprofilerInterface47
     * @tc.desc 验证getGraphicsMemorySummary接口入参上边界值测试
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHiprofilerInterface47', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4700 start");
      try {
        let graphicsMemorySummary = await hidebug.getGraphicsMemorySummary(3600);
        let gl = graphicsMemorySummary.gl
        let graph = graphicsMemorySummary.graph
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4700 graphicsMemorySummary gl: " + gl + " graph: " + graph);
        expect(gl >= 0).assertTrue();
        expect(graph >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4700 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_4700 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4700 end");
    });

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_4800
     * @tc.name testHiprofilerInterface48
     * @tc.desc 验证getGraphicsMemorySummary接口入参为空测试
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHiprofilerInterface48', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4800 start");
      try {
        let graphicsMemorySummary = await hidebug.getGraphicsMemorySummary();
        let gl = graphicsMemorySummary.gl
        let graph = graphicsMemorySummary.graph
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4800 graphicsMemorySummary gl: " + gl + " graph: " + graph);
        expect(gl >= 0).assertTrue();
        expect(graph >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4800 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_4800 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4800 end");
    });

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_4900
     * @tc.name testHiprofilerInterface49
     * @tc.desc 验证getGraphicsMemorySummary接口入参下边界以下值测试
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHiprofilerInterface49', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4900 start");
      try {
        let graphicsMemorySummary = await hidebug.getGraphicsMemorySummary(0);
        let gl = graphicsMemorySummary.gl
        let graph = graphicsMemorySummary.graph
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4900 graphicsMemorySummary gl: " + gl + " graph: " + graph);
        expect(gl >= 0).assertTrue();
        expect(graph >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_4900 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_4900 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_4900 end");
    });

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_5000
     * @tc.name testHiprofilerInterface50
     * @tc.desc 验证getGraphicsMemorySummary接口入参上边界以上值测试
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHiprofilerInterface50', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_5000 start");
      try {
        let graphicsMemorySummary = await hidebug.getGraphicsMemorySummary(4000);
        let gl = graphicsMemorySummary.gl
        let graph = graphicsMemorySummary.graph
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_5000 graphicsMemorySummary gl: " + gl + " graph: " + graph);
        expect(gl >= 0).assertTrue();
        expect(graph >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_5000 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_5000 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_5000 end");
    });

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_5100
     * @tc.name testHiprofilerInterface51
     * @tc.desc 验证getGraphicsMemorySummary接口入参为undefined测试
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHiprofilerInterface51', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_5100 start");
      try {
        await hidebug.getGraphicsMemorySummary(undefined);
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_5100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_5100 end");
    });

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_5200
     * @tc.name testHiprofilerInterface52
     * @tc.desc 验证getGraphicsMemorySummary接口入参为null测试
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHiprofilerInterface52', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_5200 start");
      try {
        await hidebug.getGraphicsMemorySummary(null);
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_5200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_5200 end");
    });

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_5300
     * @tc.name testHiprofilerInterface53
     * @tc.desc 验证getGraphicsMemorySummary接口入参为负数测试
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHiprofilerInterface53', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_5300 start");
      try {
        let graphicsMemorySummary = await hidebug.getGraphicsMemorySummary(-5);
        let gl = graphicsMemorySummary.gl
        let graph = graphicsMemorySummary.graph
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_5300 graphicsMemorySummary gl: " + gl + " graph: " + graph);
        expect(gl >= 0).assertTrue();
        expect(graph >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_5300 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_5300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_5300 end");
    });

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_5400
     * @tc.name testHiprofilerInterface54
     * @tc.desc 验证getGraphicsMemorySummary接口调用稳定性测试
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiprofilerInterface54', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_5400 start");
      try {
        for (let i = 0; i < 100; i++) {
          let graphicsMemorySummary = await hidebug.getGraphicsMemorySummary(5);
          let gl = graphicsMemorySummary.gl
          let graph = graphicsMemorySummary.graph
          console.info("SUB_DFX_DFR_Hiprofiler_Interface_5400 graphicsMemorySummary gl: " + gl + " graph: " + graph);
          expect(gl >= 0).assertTrue();
          expect(graph >= 0).assertTrue();
        }
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_5400 100 times success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_5400 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_5400 end");
    });

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_5500
     * @tc.name testHiprofilerInterface55
     * @tc.desc 验证OH_HiDebug_GetGraphicsMemorySummary入参interval为-5测试
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHiprofilerInterface55', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_5500 start");
      try {
        let graphicsMemorySummary = testNapi.getGraphicMemSummaryC(-5);
        let gl = graphicsMemorySummary.gl
        let graph = graphicsMemorySummary.graph
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_5500 graphicsMemorySummary gl: " + gl + " graph: " + graph);
        expect(gl >= 0).assertTrue();
        expect(graph >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_5500 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_5500 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_5500 end");
    });

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_5600
     * @tc.name testHiprofilerInterface56
     * @tc.desc 验证OH_HiDebug_GetGraphicsMemorySummary入参interval为0测试
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHiprofilerInterface56', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_5600 start");
      try {
        let graphicsMemorySummary = testNapi.getGraphicMemSummaryC(0);
        let gl = graphicsMemorySummary.gl
        let graph = graphicsMemorySummary.graph
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_5600 graphicsMemorySummary gl: " + gl + " graph: " + graph);
        expect(gl >= 0).assertTrue();
        expect(graph >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_5600 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_5600 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_5600 end");
    });

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_5700
     * @tc.name testHiprofilerInterface57
     * @tc.desc 验证OH_HiDebug_GetGraphicsMemorySummary入参interval为2测试
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHiprofilerInterface57', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_5700 start");
      try {
        let graphicsMemorySummary = testNapi.getGraphicMemSummaryC(2);
        let gl = graphicsMemorySummary.gl
        let graph = graphicsMemorySummary.graph
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_5700 graphicsMemorySummary gl: " + gl + " graph: " + graph);
        expect(gl >= 0).assertTrue();
        expect(graph >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_5700 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_5700 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_5700 end");
    });

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_5800
     * @tc.name testHiprofilerInterface58
     * @tc.desc 验证OH_HiDebug_GetGraphicsMemorySummary入参interval为5测试
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHiprofilerInterface58', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_5800 start");
      try {
        let graphicsMemorySummary = testNapi.getGraphicMemSummaryC(5);
        let gl = graphicsMemorySummary.gl
        let graph = graphicsMemorySummary.graph
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_5800 graphicsMemorySummary gl: " + gl + " graph: " + graph);
        expect(gl >= 0).assertTrue();
        expect(graph >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_5800 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_5800 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_5800 end");
    });

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_5900
     * @tc.name testHiprofilerInterface59
     * @tc.desc 验证OH_HiDebug_GetGraphicsMemorySummary入参interval为3600测试
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHiprofilerInterface59', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_5900 start");
      try {
        let graphicsMemorySummary = testNapi.getGraphicMemSummaryC(3600);
        let gl = graphicsMemorySummary.gl
        let graph = graphicsMemorySummary.graph
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_5900 graphicsMemorySummary gl: " + gl + " graph: " + graph);
        expect(gl >= 0).assertTrue();
        expect(graph >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_5900 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_5900 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_5900 end");
    });

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_6000
     * @tc.name testHiprofilerInterface60
     * @tc.desc 验证OH_HiDebug_GetGraphicsMemorySummary入参interval为4000测试
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHiprofilerInterface60', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_6000 start");
      try {
        let graphicsMemorySummary = testNapi.getGraphicMemSummaryC(4000);
        let gl = graphicsMemorySummary.gl
        let graph = graphicsMemorySummary.graph
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_6000 graphicsMemorySummary gl: " + gl + " graph: " + graph);
        expect(gl >= 0).assertTrue();
        expect(graph >= 0).assertTrue();
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_6000 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_6000 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_6000 end");
    });

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_6100
     * @tc.name testHiprofilerInterface61
     * @tc.desc 验证OH_HiDebug_GetGraphicsMemorySummary入参interval为5，summary为nullptr测试
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHiprofilerInterface61', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_6100 start");
      try {
        let ret = testNapi.getGraphicMemSummaryC(5, true);
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_6100 ret: " + ret);
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_6100 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_6100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_6100 end");
    });

    /**
     * @tc.number SUB_DFX_DFR_Hiprofiler_Interface_6200
     * @tc.name testHiprofilerInterface62
     * @tc.desc 验证OH_HiDebug_GetGraphicsMemorySummary接口调用稳定性测试
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiprofilerInterface62', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_6200 start");
      try {
        for (let i = 0; i < 100; i++) {
          let graphicsMemorySummary = testNapi.getGraphicMemSummaryC(5);
          let gl = graphicsMemorySummary.gl
          let graph = graphicsMemorySummary.graph
          console.info("SUB_DFX_DFR_Hiprofiler_Interface_6200 graphicsMemorySummary gl: " + gl + " graph: " + graph);
          expect(gl >= 0).assertTrue();
          expect(graph >= 0).assertTrue();
        }
        console.info("SUB_DFX_DFR_Hiprofiler_Interface_6200 100 times success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_Hiprofiler_Interface_6200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_Hiprofiler_Interface_6200 end");
    });
  })
}