import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import testNapi from 'libentry.so';

const DOMAIN = 0x0000;
const TAG = 'RegisterExternalLogMgr';

export default function RegisterExternalLogMgr() {
  describe('RegisterExternalLogMgr', () => {
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
     * @tc.name RegisterExternalLogMgrNull001
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_RegisterExternalLogMgrNull_0100
     * @tc.desc Test OH_HiAppEvent_RegExternalLogCapacityReachedCallback - Null case
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('RegisterExternalLogMgrNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let code = testNapi.RegisterExternalLogMgrNull();
        expect(code == -9).assertTrue();
        done();
      } catch (err) {
        console.error(`====>testTag RegisterExternalLogMgrNull001 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name RegisterExternalLogMgrnullptr001
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_RegisterExternalLogMgrnullptr_0100
     * @tc.desc Test OH_HiAppEvent_RegExternalLogCapacityReachedCallback - nullptr case
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('RegisterExternalLogMgrnullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let code = testNapi.RegisterExternalLogMgrnullptr();
        expect(code == -9).assertTrue();
        done();
      } catch (err) {
        console.error(`====>testTag RegisterExternalLogMgrnullptr > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name RegisterExternalLogMgrFalse001
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_RegisterExternalLogMgrFalse_0100
     * @tc.desc Test OH_HiAppEvent_RegExternalLogCapacityReachedCallback - false case
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('RegisterExternalLogMgrFalse001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let code = testNapi.RegisterExternalLogMgrFalse();
        expect(code == -100).assertTrue();
        done();
      } catch (err) {
        console.error(`====>testTag RegisterExternalLogMgrFalse001 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name CheckHiAppEventSysEventAppCRASH001
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_HiAppEventSysEvent_0100
     * @tc.desc Test OH_HiAppEvent_RegExternalLogCapacityReachedCallback - Enum case
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('CheckHiAppEventSysEventAppCRASH001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_HIVIEWDFX_HIAPPEVENT_HiAppEventSysEvent_0100 start");
      try {
        expect(testNapi.CheckHiAppEventSysEventAppCRASH() == true).assertTrue();
        console.info("SUB_HIVIEWDFX_HIAPPEVENT_HiAppEventSysEvent_0100 success");
        done();
      } catch (err) {
        console.error(`SUB_HIVIEWDFX_HIAPPEVENT_HiAppEventSysEvent_0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_HIVIEWDFX_HIAPPEVENT_HiAppEventSysEvent_0100 end");
    })

    /**
     * @tc.name CheckHiAppEventSysEventAppFreeze001
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_HiAppEventSysEvent_0200
     * @tc.desc Test OH_HiAppEvent_RegExternalLogCapacityReachedCallback - Enum case
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('CheckHiAppEventSysEventAppFreeze001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_HIVIEWDFX_HIAPPEVENT_HiAppEventSysEvent_0200 start");
      try {
        expect(testNapi.CheckHiAppEventSysEventAppFreeze() == true).assertTrue();
        console.info("SUB_HIVIEWDFX_HIAPPEVENT_HiAppEventSysEvent_0200 success");
        done();
      } catch (err) {
        console.error(`SUB_HIVIEWDFX_HIAPPEVENT_HiAppEventSysEvent_0200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_HIVIEWDFX_HIAPPEVENT_HiAppEventSysEvent_0200 end");
    })

    /**
     * @tc.name CheckHiAppEventSysEventResourceOverLimmit001
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_HiAppEventSysEvent_0300
     * @tc.desc Test OH_HiAppEvent_RegExternalLogCapacityReachedCallback - Enum case
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('CheckHiAppEventSysEventResourceOverLimmit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_HIVIEWDFX_HIAPPEVENT_HiAppEventSysEvent_0300 start");
      try {
        expect(testNapi.CheckHiAppEventSysEventResourceOverLimmit() == true).assertTrue();
        console.info("SUB_HIVIEWDFX_HIAPPEVENT_HiAppEventSysEvent_0300 success");
        done();
      } catch (err) {
        console.error(`SUB_HIVIEWDFX_HIAPPEVENT_HiAppEventSysEvent_0300 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_HIVIEWDFX_HIAPPEVENT_HiAppEventSysEvent_0300 end");
    })

    /**
     * @tc.name CheckHiAppEventSysEventAddress001
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_HiAppEventSysEvent_0400
     * @tc.desc Test OH_HiAppEvent_RegExternalLogCapacityReachedCallback - Enum case
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('CheckHiAppEventSysEventAddress001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_HIVIEWDFX_HIAPPEVENT_HiAppEventSysEvent_0400 start");
      try {
        expect(testNapi.CheckHiAppEventSysEventAddress() == true).assertTrue();
        console.info("SUB_HIVIEWDFX_HIAPPEVENT_HiAppEventSysEvent_0400 success");
        done();
      } catch (err) {
        console.error(`SUB_HIVIEWDFX_HIAPPEVENT_HiAppEventSysEvent_0400 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_HIVIEWDFX_HIAPPEVENT_HiAppEventSysEvent_0400 end");
    })

    /**
     * @tc.name CheckHiAppEventSysEventAppHicollte001
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_HiAppEventSysEvent_0500
     * @tc.desc Test OH_HiAppEvent_RegExternalLogCapacityReachedCallback - Enum case
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('CheckHiAppEventSysEventAppHicollte001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_HIVIEWDFX_HIAPPEVENT_HiAppEventSysEvent_0500 start");
      try {
        expect(testNapi.CheckHiAppEventSysEventAppHicollte() == true).assertTrue();
        console.info("SUB_HIVIEWDFX_HIAPPEVENT_HiAppEventSysEvent_0500 success");
        done();
      } catch (err) {
        console.error(`SUB_HIVIEWDFX_HIAPPEVENT_HiAppEventSysEvent_0500 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_HIVIEWDFX_HIAPPEVENT_HiAppEventSysEvent_0500 end");
    })

    /**
     * @tc.name CheckHiAppEventSysEventAppCpuUsageHigh001
     * @tc.number SUB_HIVIEWDFX_HIAPPEVENT_HiAppEventSysEvent_0600
     * @tc.desc Test OH_HiAppEvent_RegExternalLogCapacityReachedCallback - Enum case
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('CheckHiAppEventSysEventAppCpuUsageHigh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_HIVIEWDFX_HIAPPEVENT_HiAppEventSysEvent_0600 start");
      try {
        expect(testNapi.CheckHiAppEventSysEventAppHicollte() == true).assertTrue();
        console.info("SUB_HIVIEWDFX_HIAPPEVENT_HiAppEventSysEvent_0600 success");
        done();
      } catch (err) {
        console.error(`SUB_HIVIEWDFX_HIAPPEVENT_HiAppEventSysEvent_0600 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_HIVIEWDFX_HIAPPEVENT_HiAppEventSysEvent_0600 end");
    })

  })
}
