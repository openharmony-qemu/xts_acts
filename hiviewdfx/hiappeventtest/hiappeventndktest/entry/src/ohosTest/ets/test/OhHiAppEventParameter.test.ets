import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import hiappevent from 'libentry.so'

export default function OhHiAppEventParameter() {
  describe('OhHiAppEventParameter', () => {
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
     * @tc.name   SUB_DFX_DFT_OH_HiAppEvent_CreateWatcher_0100
     * @tc.number SUB_DFX_DFT_OH_HiAppEvent_CreateWatcher_0100
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HiAppEvent_CreateWatcher_0100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        for (let i = 1; i < 3; i++){
          let result: number = hiappevent.OhHiappEventSetEventCreateWatcher(i);
          console.error(`====> SUB_DFX_DFT_OH_HiAppEvent_CreateWatcher_0100 i : ==  ${i}, i.result =  ${result}`);
          expect(result).assertEqual(-1);
        }
        for (let i = 3; i < 7; i++){
          let result: number = hiappevent.OhHiappEventSetEventCreateWatcher(i);
          console.error(`====> SUB_DFX_DFT_OH_HiAppEvent_CreateWatcher_0100 i : ==  ${i}, i.result =  ${result}`);
          expect(result).assertEqual(0);
        }
        done();
      } catch (err) {
        console.error(`====> SUB_DFX_DFT_OH_HiAppEvent_CreateWatcher_0100 catch > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HiAppEvent_SetTriggerCondition_0100
     * @tc.number SUB_DFX_DFT_OH_HiAppEvent_SetTriggerCondition_0100
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HiAppEvent_SetTriggerCondition_0100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let code1: number = hiappevent.SetTriggerCondition1();
        console.info(`SUB_DFX_DFT_HiAppEvent_Watcher_Code_0200 code1 : ${code1}`);
        expect(code1 == 0).assertTrue();
        let code2: number = hiappevent.SetTriggerCondition2();
        console.info(`SUB_DFX_DFT_HiAppEvent_Watcher_Code_0200 code1 : ${code2}`);
        expect(code2 == 0).assertTrue();
        let code3: number = hiappevent.SetTriggerCondition3();
        console.info(`SUB_DFX_DFT_HiAppEvent_Watcher_Code_0200 code1 : ${code3}`);
        expect(code3 == 0).assertTrue();
        let code4: number = hiappevent.SetTriggerCondition4();
        console.info(`SUB_DFX_DFT_HiAppEvent_Watcher_Code_0200 code1 : ${code4}`);
        expect(code4 == 0).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFT_HiAppEvent_Watcher_Code_0200 > error code: ${(err as BusinessError).code},
            error msg: ${(err as BusinessError).message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HiAppEvent_TakeWatcherData_0100
     * @tc.number SUB_DFX_DFT_OH_HiAppEvent_TakeWatcherData_0100
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HiAppEvent_TakeWatcherData_0100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let code1: number = hiappevent.OhHiAppEventTakeWatcherData1();
        console.info(`SUB_DFX_DFT_OH_HiAppEvent_TakeWatcherData_0100 code1 : ${code1}`);
        expect(code1 == 0).assertTrue();
        let code2: number = hiappevent.OhHiAppEventTakeWatcherData2();
        console.info(`SUB_DFX_DFT_OH_HiAppEvent_TakeWatcherData_0100 code1 : ${code2}`);
        expect(code2 == 0).assertTrue();
        let code3: number = hiappevent.OhHiAppEventTakeWatcherData3();
        console.info(`SUB_DFX_DFT_OH_HiAppEvent_TakeWatcherData_0100 code1 : ${code3}`);
        expect(code3 == 0).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFT_OH_HiAppEvent_TakeWatcherData_0100 > error code: ${(err as BusinessError).code},
            error msg: ${(err as BusinessError).message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HiAppEvent_SetAppEventFilter_0200
     * @tc.number SUB_DFX_DFT_OH_HiAppEvent_SetAppEventFilter_0200
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HiAppEvent_SetAppEventFilter_0200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let code1: number = hiappevent.OhHiAppEventSetAppEventFilter1();
        console.info(`SUB_DFX_DFT_OH_HiAppEvent_SetAppEventFilter_0200 code1 : ${code1}`);
        expect(code1 == 0).assertTrue();
        let code2: number = hiappevent.OhHiAppEventSetAppEventFilter2();
        console.info(`SUB_DFX_DFT_OH_HiAppEvent_SetAppEventFilter_0200 code1 : ${code1}`);
        expect(code2 == 0).assertTrue();
        let code3: number = hiappevent.OhHiAppEventSetAppEventFilter3();
        console.info(`SUB_DFX_DFT_OH_HiAppEvent_SetAppEventFilter_0200 code1 : ${code1}`);
        expect(code3 == 0).assertTrue();
        let code4: number = hiappevent.OhHiAppEventSetAppEventFilter4();
        console.info(`SUB_DFX_DFT_OH_HiAppEvent_SetAppEventFilter_0200 code1 : ${code1}`);
        expect(code4 == 0).assertTrue();
        let code5: number = hiappevent.OhHiAppEventSetAppEventFilter5();
        console.info(`SUB_DFX_DFT_OH_HiAppEvent_SetAppEventFilter_0200 code1 : ${code1}`);
        expect(code5 == 0).assertTrue();
        let code6: number = hiappevent.OhHiAppEventSetAppEventFilter6();
        console.info(`SUB_DFX_DFT_OH_HiAppEvent_SetAppEventFilter_0200 code1 : ${code1}`);
        expect(code6 == 0).assertTrue();
        let code7: number = hiappevent.OhHiAppEventSetAppEventFilter7();
        console.info(`SUB_DFX_DFT_OH_HiAppEvent_SetAppEventFilter_0200 code1 : ${code1}`);
        expect(code7 == 0).assertTrue();
        let code8: number = hiappevent.OhHiAppEventSetAppEventFilter8();
        console.info(`SUB_DFX_DFT_OH_HiAppEvent_SetAppEventFilter_0200 code1 : ${code1}`);
        expect(code8 == 0).assertTrue();
        let code9: number = hiappevent.OhHiAppEventSetAppEventFilter9();
        console.info(`SUB_DFX_DFT_OH_HiAppEvent_SetAppEventFilter_0200 code1 : ${code1}`);
        expect(code9 == 0).assertTrue();
        let code10: number = hiappevent.OhHiAppEventSetAppEventFilter10();
        console.info(`SUB_DFX_DFT_OH_HiAppEvent_SetAppEventFilter_0200 code1 : ${code1}`);
        expect(code10 == 0).assertTrue();
        let code11: number = hiappevent.OhHiAppEventSetAppEventFilter11();
        console.info(`SUB_DFX_DFT_OH_HiAppEvent_SetAppEventFilter_0200 code1 : ${code1}`);
        expect(code11 == 0).assertTrue();
        let code12: number = hiappevent.OhHiAppEventSetAppEventFilter12();
        console.info(`SUB_DFX_DFT_OH_HiAppEvent_SetAppEventFilter_0200 code1 : ${code1}`);
        expect(code12 == 0).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFT_OH_HiAppEvent_SetAppEventFilter_0200 > error code: ${(err as BusinessError).code},
            error msg: ${(err as BusinessError).message}`);
        expect().assertFail();
        done();
      }
    });

  })
}