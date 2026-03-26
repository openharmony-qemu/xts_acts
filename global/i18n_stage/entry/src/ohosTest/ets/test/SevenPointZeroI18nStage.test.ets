import { hilog } from '@kit.PerformanceAnalysisKit';
import { i18n, intl } from '@kit.LocalizationKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

export default function SevenPointZeroI18nStageTest() {
  describe('SevenPointZeroI18nStageTest', () => {
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
     * @tc.name SUB_GLOBAL_detectEncoding_test_0100
     * @tc.number SUB_GLOBAL_detectEncoding_test_0100
     * @tc.desc with detectEncoding
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_test_0100', Level.LEVEL2, () => {
      let uint8Array = new Uint8Array([0xE4,0xB8, 0xE5, 0x9B, 0xBD]);
      let info = i18n.Unicode.detectEncoding(uint8Array);
      console.log('SUB_GLOBAL_detectEncoding_test_0100 value:', info.encodingName);
      console.log('SUB_GLOBAL_detectEncoding_test_0100 value:', info.confidence);
      expect(info.encodingName).assertEqual('UTF-8');
      expect(info.confidence).assertEqual(80);
    })

    /**
     * @tc.name SUB_GLOBAL_detectEncoding_test_0200
     * @tc.number SUB_GLOBAL_detectEncoding_test_0200
     * @tc.desc with detectEncoding
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_test_0200', Level.LEVEL2, () => {
      let uint8Array = new Uint8Array([0x44,0x65, 0x72, 0x43, 0x6F, 0x64, 0x65]);
      let info = i18n.Unicode.detectEncoding(uint8Array);
      console.log('SUB_GLOBAL_detectEncoding_test_0200 value:', info.encodingName);
      console.log('SUB_GLOBAL_detectEncoding_test_0200 value:', info.confidence);
      expect(info.encodingName).assertEqual('ISO-8859-1');
      expect(info.confidence).assertEqual(75);
    })

    /**
     * @tc.name SUB_GLOBAL_detectEncoding_test_0300
     * @tc.number SUB_GLOBAL_detectEncoding_test_0300
     * @tc.desc with detectEncoding
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_test_0300', Level.LEVEL2, () => {
      let uint8Array = new Uint8Array([0xC2,0xC8]);
      let info = i18n.Unicode.detectEncoding(uint8Array);
      console.log('SUB_GLOBAL_detectEncoding_test_0300 value:', info.encodingName);
      console.log('SUB_GLOBAL_detectEncoding_test_0300 value:', info.confidence);
      expect(info.encodingName).assertEqual('GB18030');
      expect(info.confidence).assertEqual(10);
    })

    /**
     * @tc.name SUB_GLOBAL_detectEncoding_test_0400
     * @tc.number SUB_GLOBAL_detectEncoding_test_0400
     * @tc.desc with detectEncoding
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_test_0400', Level.LEVEL2, () => {
      let uint8Array = new Uint8Array([0xD6,0xD0, 0xCE, 0xC4]);
      let info = i18n.Unicode.detectEncoding(uint8Array);
      console.log('SUB_GLOBAL_detectEncoding_test_0400 value:', info.encodingName);
      console.log('SUB_GLOBAL_detectEncoding_test_0400 value:', info.confidence);
      expect(info.encodingName).assertEqual('UTF-16BE');
      expect(info.confidence).assertEqual(10);
    })

    /**
     * @tc.name SUB_GLOBAL_detectEncoding_test_0500
     * @tc.number SUB_GLOBAL_detectEncoding_test_0500
     * @tc.desc with detectEncoding
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_test_0500', Level.LEVEL2, () => {
      let uint8Array = new Uint8Array([0x00,0x00, 0x4E, 0x2D]);
      let info = i18n.Unicode.detectEncoding(uint8Array);
      console.log('SUB_GLOBAL_detectEncoding_test_0500 value:', info.encodingName);
      console.log('SUB_GLOBAL_detectEncoding_test_0500 value:', info.confidence);
      expect(info.encodingName).assertEqual('UTF-32BE');
      expect(info.confidence).assertEqual(80);
    })

    /**
     * @tc.name SUB_GLOBAL_detectEncoding_test_0600
     * @tc.number SUB_GLOBAL_detectEncoding_test_0600
     * @tc.desc with detectEncoding
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_test_0600', Level.LEVEL2, () => {
      let uint8Array = new Uint8Array([0xC4,0xEA, 0xCC, 0xE5]);
      let info = i18n.Unicode.detectEncoding(uint8Array);
      console.log('SUB_GLOBAL_detectEncoding_test_0600 value:', info.encodingName);
      console.log('SUB_GLOBAL_detectEncoding_test_0600 value:', info.confidence);
      expect(info.encodingName).assertEqual('ISO-8859-7');
      expect(info.confidence).assertEqual(60);
    })

    /**
     * @tc.name SUB_GLOBAL_detectEncoding_test_0700
     * @tc.number SUB_GLOBAL_detectEncoding_test_0700
     * @tc.desc with detectEncoding
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_test_0700', Level.LEVEL2, () => {
      let uint8Array = new Uint8Array([0xF0,0xF4, 0xF6]);
      let info = i18n.Unicode.detectEncoding(uint8Array);
      console.log('SUB_GLOBAL_detectEncoding_test_0700 value:', info.encodingName);
      console.log('SUB_GLOBAL_detectEncoding_test_0700 value:', info.confidence);
      expect(info.encodingName).assertEqual('');
      expect(info.confidence).assertEqual(0);
    })

    /**
     * @tc.name SUB_GLOBAL_detectEncoding_test_0800
     * @tc.number SUB_GLOBAL_detectEncoding_test_0800
     * @tc.desc with detectEncoding
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_test_0800', Level.LEVEL2, () => {
      let uint8Array1 = new Uint8Array([0x44,0x65, 0x72, 0x43, 0x6F, 0x64, 0x65]);
      let uint8Array2 = new Uint8Array([0x44,0x65]);
      let info1 = i18n.Unicode.detectEncoding(uint8Array1);
      let info2 = i18n.Unicode.detectEncoding(uint8Array2);
      console.log('SUB_GLOBAL_detectEncoding_test_0800 value:', info1.confidence);
      console.log('SUB_GLOBAL_detectEncoding_test_0800 value:', info2.confidence);
      expect(info1.confidence < info2.confidence).assertTrue();
    })

    /**
     * @tc.name SUB_GLOBAL_detectEncoding_test_0900
     * @tc.number SUB_GLOBAL_detectEncoding_test_0900
     * @tc.desc with detectEncoding
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_test_0900', Level.LEVEL2, () => {
      let uint8Array1 = new Uint8Array([0xC4,0xEA, 0xCC, 0xE5]);
      let uint8Array2 = new Uint8Array([0xC4,0xEA, 0xCC, 0xE5, 0x1111111111, 0x1111111111, 0x1111111111]);
      let info1 = i18n.Unicode.detectEncoding(uint8Array1);
      let info2 = i18n.Unicode.detectEncoding(uint8Array2);
      console.log('SUB_GLOBAL_detectEncoding_test_0900 value:', info1.confidence);
      console.log('SUB_GLOBAL_detectEncoding_test_0900 value:', info2.confidence);
      expect(info1.confidence > info2.confidence).assertTrue();
    })

    /**
     * @tc.name SUB_GLOBAL_detectEncoding_test_1000
     * @tc.number SUB_GLOBAL_detectEncoding_test_1000
     * @tc.desc with detectEncoding
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_test_1000', Level.LEVEL2, () => {
      let uint8Array = new Uint8Array();
      let info = i18n.Unicode.detectEncoding(uint8Array);
      console.log('SUB_GLOBAL_detectEncoding_test_1000 value:', info.encodingName);
      console.log('SUB_GLOBAL_detectEncoding_test_1000 value:', info.confidence);
      expect(info.encodingName).assertEqual('');
      expect(info.confidence).assertEqual(0);
    })

    /**
     * @tc.name SUB_GLOBAL_detectEncoding_test_1000
     * @tc.number SUB_GLOBAL_detectEncoding_test_1000
     * @tc.desc with detectEncoding
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL2
     */
    it('SUB_GLOBAL_detectEncoding_test_1000', Level.LEVEL2, () => {
      let uint8Array = new Uint8Array(0x000000000);
      let info = i18n.Unicode.detectEncoding(uint8Array);
      console.log('SUB_GLOBAL_detectEncoding_test_1000 value:', info.encodingName);
      console.log('SUB_GLOBAL_detectEncoding_test_1000 value:', info.confidence);
      expect(info.encodingName).assertEqual('');
      expect(info.confidence).assertEqual(0);
    })

  })
}