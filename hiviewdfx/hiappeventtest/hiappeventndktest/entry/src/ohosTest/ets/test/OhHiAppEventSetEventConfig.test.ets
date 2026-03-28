import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import hiappevent from 'libentry.so'

export default function OhHiAppEventSetEventConfig() {
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
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_001
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_001
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig1();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig2();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_003',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig3();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_004',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig4();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_005',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig5();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_001
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_001
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_006',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig6();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_007',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig7();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_008',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig8();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_009',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig9();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_010',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig10();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_001
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_001
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_011',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig11();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_012',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig12();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_013',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig13();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_014',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig14();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_015',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig15();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_001
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_001
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_016',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig16();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_017',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig17();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_018',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig18();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_019',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig19();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_020',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig20();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_001
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_001
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_021',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig21();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_022',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig22();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_023',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig23();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_024',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig24();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_025',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig25();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_026',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig26();
      expect(result).assertEqual(2);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_027',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig27();
      expect(result).assertEqual(2);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_028',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig28();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_029',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig29();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_030',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig30();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_031',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig31();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_032',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig32();
      expect(result).assertEqual(2);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_033',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig33();
      expect(result).assertEqual(2);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_034',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig34();
      expect(result).assertEqual(2);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_035',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig35();
      expect(result).assertEqual(2);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_036',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig36();
      expect(result).assertEqual(2);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_037',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig37();
      expect(result).assertEqual(2);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_038',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig38();
      expect(result).assertEqual(2);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_039',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig39();
      expect(result).assertEqual(2);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_040',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig40();
      expect(result).assertEqual(2);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_041',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig41();
      expect(result).assertEqual(2);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_042',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig42();
      expect(result).assertEqual(2);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_043',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig43();
      expect(result).assertEqual(2);
      done();
    });


  })
}