import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import testNapi from 'libentry.so';

export default function ActsHiDebugRegisterTest() {
  describe('ActsHiDebugRegisterTest', () => {
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
     * @tc.number SUB_DFX_DFR_HiDebug_Register_Interface_0100
     * @tc.name testHidebugRegisterInterface01
     * @tc.desc 验证OH_HiDebug_RegisterMemDumpListener接口name参数传入test_app1，listener参数传入memDumpListenerCallback1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugRegisterInterface01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_0100 start");
      try {
        let res = testNapi.TestHiDebugRegisterMemDumpListener1();
        expect(res == 0).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_Register_Interface_0100 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_Register_Interface_0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_0100 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_Register_Interface_0200
     * @tc.name testHidebugRegisterInterface02
     * @tc.desc 验证OH_HiDebug_RegisterMemDumpListener接口name参数传入test_app2，listener参数传入memDumpListenerCallback2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugRegisterInterface02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_0200 start");
      try {
        let res = testNapi.TestHiDebugRegisterMemDumpListener2();
        expect(res == 0).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_Register_Interface_0200 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_Register_Interface_0200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_0200 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_Register_Interface_0300
     * @tc.name testHidebugRegisterInterface03
     * @tc.desc 验证OH_HiDebug_RegisterMemDumpListener接口name参数传入test_app3，listener参数传入memDumpListenerCallbackFalse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugRegisterInterface03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_0300 start");
      try {
        let res = testNapi.TestHiDebugRegisterMemDumpListener3();
        expect(res == 0).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_Register_Interface_0300 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_Register_Interface_0300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_0300 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_Register_Interface_0400
     * @tc.name testHidebugRegisterInterface04
     * @tc.desc 验证OH_HiDebug_RegisterMemDumpListener接口name参数传入NULL，listener参数传入memDumpListenerCallback1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugRegisterInterface04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_0400 start");
      try {
        let res = testNapi.TestHiDebugRegisterMemDumpListener4();
        expect(res == 401).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_Register_Interface_0400 success");
        testNapi.stopProfiler();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_Register_Interface_0400 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_0400 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_Register_Interface_0500
     * @tc.name testHidebugRegisterInterface05
     * @tc.desc 验证OH_HiDebug_RegisterMemDumpListener接口name参数传入test_app4，listener参数传入NULL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugRegisterInterface05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_0500 start");
      try {
        let res = testNapi.TestHiDebugRegisterMemDumpListener5();
        expect(res == 401).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_Register_Interface_0500 success");
        testNapi.stopProfiler();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_Register_Interface_0500 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_0500 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_Register_Interface_0600
     * @tc.name testHidebugRegisterInterface06
     * @tc.desc 验证OH_HiDebug_RegisterMemDumpListener接口name参数传入""，listener参数传入memDumpListenerCallback1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugRegisterInterface06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_0600 start");
      try {
        let res = testNapi.TestHiDebugRegisterMemDumpListener6();
        expect(res == 401).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_Register_Interface_0600 success");
        testNapi.stopProfiler();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_Register_Interface_0600 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_0600 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_Register_Interface_0700
     * @tc.name testHidebugRegisterInterface07
     * @tc.desc 验证OH_HiDebug_RegisterMemDumpListener接口name参数传入相同值，listener参数传入不同值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugRegisterInterface07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_0700 start");
      try {
        let res = testNapi.TestHiDebugRegisterMemDumpListener7();
        expect(res == 401).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_Register_Interface_0700 success");
        testNapi.stopProfiler();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_Register_Interface_0700 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_0700 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_Register_Interface_0800
     * @tc.name testHidebugRegisterInterface08
     * @tc.desc 验证OH_HiDebug_RegisterMemDumpListener接口name参数传入longName，listener参数传入memDumpListenerCallback1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugRegisterInterface08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_0800 start");
      try {
        let res = testNapi.TestHiDebugRegisterMemDumpListener8();
        expect(res == 0).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_Register_Interface_0800 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_Register_Interface_0800 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_0800 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_Register_Interface_0900
     * @tc.name testHidebugRegisterInterface09
     * @tc.desc 验证OH_HiDebug_RegisterMemDumpListener接口name参数传入英文字符，listener参数传入memDumpListenerCallback1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugRegisterInterface09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_0900 start");
      try {
        let res = testNapi.TestHiDebugRegisterMemDumpListener9();
        expect(res == 0).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_Register_Interface_0900 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_Register_Interface_0900 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_0900 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_Register_Interface_1000
     * @tc.name testHidebugRegisterInterface10
     * @tc.desc 验证OH_HiDebug_RegisterMemDumpListener接口name参数传入中文字符，listener参数传入memDumpListenerCallback1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugRegisterInterface10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_1000 start");
      try {
        let res = testNapi.TestHiDebugRegisterMemDumpListener10();
        expect(res == 0).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_Register_Interface_1000 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_Register_Interface_1000 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_1000 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_Register_Interface_1100
     * @tc.name testHidebugRegisterInterface11
     * @tc.desc 验证OH_HiDebug_MemListenerType类型OH_HIDEBUG_DO_NOTHING
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugRegisterInterface11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_1100 start");
      try {
        let res = testNapi.TestHiDebugMemListenerType1();
        expect(res == 0).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_Register_Interface_1100 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_Register_Interface_1100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_1100 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_Register_Interface_1200
     * @tc.name testHidebugRegisterInterface12
     * @tc.desc 验证OH_HiDebug_MemListenerType类型OH_HIDEBUG_RUNNING_GC
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugRegisterInterface12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_1200 start");
      try {
        let res = testNapi.TestHiDebugMemListenerType2();
        expect(res == 1).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_Register_Interface_1200 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_Register_Interface_1200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_1200 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_Register_Interface_1300
     * @tc.name testHidebugRegisterInterface13
     * @tc.desc 验证OH_HiDebug_MemListenerType类型OH_HIDEBUG_DUMP_SNAPSHOT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugRegisterInterface13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_1300 start");
      try {
        let res = testNapi.TestHiDebugMemListenerType3();
        expect(res == 2).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_Register_Interface_1300 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_Register_Interface_1300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_1300 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_Register_Interface_1400
     * @tc.name testHidebugRegisterInterface14
     * @tc.desc 验证OH_HiDebug_UnregisterMemDumpListener正常注销
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugRegisterInterface14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_1400 start");
      try {
        let res = testNapi.TestHiDebugUnregisterMemDumpListener1();
        expect(res == 0).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_Register_Interface_1400 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_Register_Interface_1400 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_1400 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_Register_Interface_1500
     * @tc.name testHidebugRegisterInterface15
     * @tc.desc 验证OH_HiDebug_UnregisterMemDumpListener异常注销
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugRegisterInterface15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_1500 start");
      try {
        let res = testNapi.TestHiDebugUnregisterMemDumpListener2();
        expect(res == 401).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_Register_Interface_1500 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_Register_Interface_1500 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_1500 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_Register_Interface_1600
     * @tc.name testHidebugRegisterInterface16
     * @tc.desc 验证OH_HiDebug_UnregisterMemDumpListener接口传入NULL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugRegisterInterface16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_1600 start");
      try {
        let res = testNapi.TestHiDebugUnregisterMemDumpListener3();
        expect(res == 401).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_Register_Interface_1600 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_Register_Interface_1600 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_1600 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_Register_Interface_1700
     * @tc.name testHidebugRegisterInterface17
     * @tc.desc 验证OH_HiDebug_UnregisterMemDumpListener接口传入""
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugRegisterInterface17', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_1700 start");
      try {
        let res = testNapi.TestHiDebugUnregisterMemDumpListener4();
        expect(res == 401).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_Register_Interface_1700 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_Register_Interface_1700 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_1700 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_Register_Interface_1800
     * @tc.name testHidebugRegisterInterface18
     * @tc.desc 验证OH_HiDebug_UnregisterMemDumpListener接口传入nullptr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugRegisterInterface18', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_1800 start");
      try {
        let res = testNapi.TestHiDebugUnregisterMemDumpListener5();
        expect(res == 401).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_Register_Interface_1800 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_Register_Interface_1800 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_1800 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_Register_Interface_1900
     * @tc.name testHidebugRegisterInterface19
     * @tc.desc 验证注册test_unregister3，OH_HiDebug_UnregisterMemDumpListener接口注销test_unregister4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHidebugRegisterInterface19', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_1900 start");
      try {
        let res = testNapi.TestHiDebugUnregisterMemDumpListener6();
        expect(res == 401).assertTrue();
        console.info("SUB_DFX_DFR_HiDebug_Register_Interface_1900 success");
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_Register_Interface_1900 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_HiDebug_Register_Interface_1900 end");
    })
  })
}