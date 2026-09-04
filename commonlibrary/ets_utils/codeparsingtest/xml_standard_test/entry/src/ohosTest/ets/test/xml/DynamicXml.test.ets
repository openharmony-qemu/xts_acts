import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { util, xml } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function xmlDynamic1() {
  describe('xmlDynamic1', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
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
     * @tc.name   testDynamicXml0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1010
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let thatSer = new xml.XmlDynamicSerializer("\ud83d\ude0a");
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200066);
        expect(`${err.message}`).assertContain('support utf-8');
      }
    })
    /**
     * @tc.name   testDynamicXml0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1020
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement("note");
      thatSer.setAttributes("importance", "\ud83d\ude0a");
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      let expectedXml = '<note importance="😊"/>';
      expect(result).assertEqual(expectedXml);
      try{
        thatSer.startElement(null);
        expect().assertFail()
      }catch (err) {
        expect(err.code).assertEqual(401);
      }
      try{
        thatSer.startElement(undefined);
        expect().assertFail()
      }catch (err) {
        expect(err.code).assertEqual(401);
      }
      try{
        thatSer.setAttributes('', "\ud83d\ude0a");
        expect().assertFail()
      }catch (err) {
        expect(err.code).assertEqual(10200064);
      }
      try{
        thatSer.setAttributes(null, "\ud83d\ude0a");
        expect().assertFail()
      }catch (err) {
        expect(err.code).assertEqual(401);
      }
      try{
        thatSer.setAttributes(undefined, "\ud83d\ude0a");
        expect().assertFail()
      }catch (err) {
        expect(err.code).assertEqual(401);
      }
      try{
        thatSer.setAttributes('add', "");
        expect().assertFail()
      }catch (err) {
        expect(err.code).assertEqual(10200063);
      }
      try{
        thatSer.setAttributes('add', null);
        expect().assertFail()
      }catch (err) {
        expect(err.code).assertEqual(401);
      }
      try{
        thatSer.setAttributes('add', undefined);
        expect().assertFail()
      }catch (err) {
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testDynamicXml0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1030
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let thatSer = new xml.XmlDynamicSerializer();
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "\ud83d\udc46");
        thatSer.endElement();
        let arrayBuffer = thatSer.getOutput();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let expectedXml = '<note importance="👆"/>';
        expect(result).assertEqual(expectedXml);
      } catch (err) {
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDynamicXml0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1040
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let thatSer = new xml.XmlDynamicSerializer();
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "\ud83d\udc7f");
        thatSer.endElement();
        let arrayBuffer = thatSer.getOutput();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let expectedXml = '<note importance="👿"/>';
        expect(result).assertEqual(expectedXml);
      } catch (err) {
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDynamicXml0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1050
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let thatSer = new xml.XmlDynamicSerializer();
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "\ud83d\udc40");
        thatSer.endElement();
        let arrayBuffer = thatSer.getOutput();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let expectedXml = '<note importance="👀"/>';
        expect(result).assertEqual(expectedXml);
      } catch (err) {
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDynamicXml0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1060
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let thatSer = new xml.XmlDynamicSerializer();
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "\ud83d\udcaf");
        thatSer.endElement();
        let arrayBuffer = thatSer.getOutput();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let expectedXml = '<note importance="💯"/>';
        expect(result).assertEqual(expectedXml);
      } catch (err) {
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDynamicXml0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1070
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let thatSer = new xml.XmlDynamicSerializer();
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "\ud83c\udf85");
        thatSer.endElement();
        let arrayBuffer = thatSer.getOutput();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let expectedXml = '<note importance="🎅"/>';
        expect(result).assertEqual(expectedXml);
      } catch (err) {
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDynamicXml0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1080
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let thatSer = new xml.XmlDynamicSerializer();
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "\ud83d\ude3c");
        thatSer.endElement();
        let arrayBuffer = thatSer.getOutput();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let expectedXml = '<note importance="😼"/>';
        expect(result).assertEqual(expectedXml);
      } catch (err) {
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDynamicXml0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1090
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let thatSer = new xml.XmlDynamicSerializer();
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "\ud83d\udd27");
        thatSer.endElement();
        let arrayBuffer = thatSer.getOutput();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let expectedXml = '<note importance="🔧"/>';
        expect(result).assertEqual(expectedXml);
      } catch (err) {
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDynamicXml0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1100
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let thatSer = new xml.XmlDynamicSerializer();
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "\ud83d\udc87");
        thatSer.endElement();
        let arrayBuffer = thatSer.getOutput();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let expectedXml = '<note importance="💇"/>';
        expect(result).assertEqual(expectedXml);
      } catch (err) {
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDynamicXml0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1110
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let thatSer = new xml.XmlDynamicSerializer();
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "\ud83e\udd3c\u200d\u2642\ufe0f");
        thatSer.endElement();
        let arrayBuffer = thatSer.getOutput();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let expectedXml = '<note importance="🤼‍♂️"/>';
        expect(result).assertEqual(expectedXml);
      } catch (err) {
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDynamicXml0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1120
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let thatSer = new xml.XmlDynamicSerializer();
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "\ud83d\udee2");
        thatSer.endElement();
        let arrayBuffer = thatSer.getOutput();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let expectedXml = '<note importance="🛢"/>';
        expect(result).assertEqual(expectedXml);
      } catch (err) {
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDynamicXml0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1130
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let thatSer = new xml.XmlDynamicSerializer();
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "\ud83c\udc04");
        thatSer.endElement();
        let arrayBuffer = thatSer.getOutput();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        let expectedXml = '<note importance="🀄"/>';
        expect(result).assertEqual(expectedXml);
      } catch (err) {
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testDynamicXml0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1140
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83d\udc6b";
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement(emoji);
      thatSer.setText("a");
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result.toString()).assertEqual("<👫>a</👫>")
    })
    /**
     * @tc.name   testDynamicXml0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1150
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83c\udc04";
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement(emoji);
      thatSer.setText("a");
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result.toString()).assertEqual("<🀄>a</🀄>")
    })
    /**
     * @tc.name   testDynamicXml0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1160
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83e\udd3c\u200d\u2642\ufe0f";
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement(emoji);
      thatSer.setText("a");
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result.toString()).assertEqual("<🤼‍♂️>a</🤼‍♂️>")
    })
    /**
     * @tc.name   testDynamicXml0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1170
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83d\udc40";
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement(emoji);
      thatSer.setText("a");
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result.toString()).assertEqual("<👀>a</👀>")
    })
    /**
     * @tc.name   testDynamicXml0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1180
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83c\udf85";
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement(emoji);
      thatSer.setText("a");
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result.toString()).assertEqual("<🎅>a</🎅>")
    })
    /**
     * @tc.name   testDynamicXml0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1190
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83c\udc04\ud83d\udd27";
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement(emoji);
      thatSer.setText("a");
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result.toString()).assertEqual("<🀄🔧>a</🀄🔧>")
    })
    /**
     * @tc.name   testDynamicXml0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1200
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83c\udc04\ud83d\udc46";
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement(emoji);
      thatSer.setText("a");
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result.toString()).assertEqual("<🀄👆>a</🀄👆>")
    })
    /**
     * @tc.name   testDynamicXml0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1210
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83c";
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement(emoji);
      thatSer.setText("a");
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result.toString()))
        .assertEqual("%3C%EF%BF%BD%EF%BF%BD%EF%BF%BD%3Ea%3C/%EF%BF%BD%EF%BF%BD%EF%BF%BD%3E")
    })
    /**
     * @tc.name   testDynamicXml0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1220
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement("note");
      thatSer.setAttributes("importance", "\ud83c");
      thatSer.endElement();
      let arrayBuffer = thatSer.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3Cnote%20importance=%22%EF%BF%BD%EF%BF%BD%EF%BF%BD%22/%3E");
    })
    /**
     * @tc.name   testDynamicXml0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1230
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83c\udc04\ud83d\udc46";
      let that = new xml.XmlDynamicSerializer();
      that.setComment(emoji);
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<!--🀄👆-->')
    })
    /**
     * @tc.name   testDynamicXml0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1240
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83d\udc87";
      let that = new xml.XmlDynamicSerializer();
      that.setComment(emoji);
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<!--💇-->')
    })
    /**
     * @tc.name   testDynamicXml0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1250
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83c\udc04";
      let that = new xml.XmlDynamicSerializer();
      that.setComment(emoji);
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<!--🀄-->')
    })
    /**
     * @tc.name   testDynamicXml0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1260
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83e\udd3c\u200d\u2642\ufe0f";
      let that = new xml.XmlDynamicSerializer();
      that.setComment(emoji);
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<!--🤼‍♂️-->')
    })
    /**
     * @tc.name   testDynamicXml0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1270
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83d\ude3c";
      let that = new xml.XmlDynamicSerializer();
      that.setComment(emoji);
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<!--😼-->')
    })
    /**
     * @tc.name   testDynamicXml0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1280
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83c\udf85";
      let that = new xml.XmlDynamicSerializer();
      that.setComment(emoji);
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<!--🎅-->')
    })
    /**
     * @tc.name   testDynamicXml0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1290
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83d\udc40";
      let that = new xml.XmlDynamicSerializer();
      that.setComment(emoji);
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<!--👀-->')
    })
    /**
     * @tc.name   testDynamicXml0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1300
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83d\udc7f";
      let that = new xml.XmlDynamicSerializer();
      that.setComment(emoji);
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<!--👿-->')
    })
    /**
     * @tc.name   testDynamicXml0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1310
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\udc7f";
      let that = new xml.XmlDynamicSerializer();
      that.setComment(emoji);
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual('%3C!--%EF%BF%BD%EF%BF%BD%EF%BF%BD--%3E')
    })
    /**
     * @tc.name   testDynamicXml0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1320
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83d\udc7f\ud83d\udc7f";
      let that = new xml.XmlDynamicSerializer();
      that.setCdata(emoji);
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<![CDATA[👿👿]]>')
    })
    /**
     * @tc.name   testDynamicXml0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1330
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83d\udc7f";
      let that = new xml.XmlDynamicSerializer();
      that.setCdata(emoji);
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<![CDATA[👿]]>')
    })
    /**
     * @tc.name   testDynamicXml0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1340
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83d\udc7f\ud83d\udcaf";
      let that = new xml.XmlDynamicSerializer();
      that.setCdata(emoji);
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<![CDATA[👿💯]]>')
    })
    /**
     * @tc.name   testDynamicXml0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1350
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83d\ude3c";
      let that = new xml.XmlDynamicSerializer();
      that.setCdata(emoji);
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<![CDATA[😼]]>')
    })
    /**
     * @tc.name   testDynamicXml0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1360
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83d\udd27";
      let that = new xml.XmlDynamicSerializer();
      that.setCdata(emoji);
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<![CDATA[🔧]]>')
    })
    /**
     * @tc.name   testDynamicXml0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1370
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83e\udd3c\u200d\u2642\ufe0f";
      let that = new xml.XmlDynamicSerializer();
      that.setCdata(emoji);
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<![CDATA[🤼‍♂️]]>')
    })
    /**
     * @tc.name   testDynamicXml0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1380
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83d\udee2";
      let that = new xml.XmlDynamicSerializer();
      that.setCdata(emoji);
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<![CDATA[🛢]]>')
    })
    /**
     * @tc.name   testDynamicXml0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1390
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83c\udff4";
      let that = new xml.XmlDynamicSerializer();
      that.setCdata(emoji);
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<![CDATA[🏴]]>')
    })
    /**
     * @tc.name   testDynamicXml0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1400
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83c\udff4";
      let that = new xml.XmlDynamicSerializer();
      that.setCdata(emoji);
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual('%3C!%5BCDATA%5B%F0%9F%8F%B4%5D%5D%3E')
    })
    /**
     * @tc.name   testDynamicXml0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1410
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83c\udff4";
      let that = new xml.XmlDynamicSerializer();
      that.startElement(emoji);
      that.setAttributes(emoji, emoji);
      that.setText(emoji);
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<🏴 🏴="🏴">🏴</🏴>')
    })
    /**
     * @tc.name   testDynamicXml0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1420
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83e\udd3c\u200d\u2642\ufe0f";
      let that = new xml.XmlDynamicSerializer();
      that.startElement(emoji);
      that.setAttributes(emoji, emoji);
      that.setText(emoji);
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<🤼‍♂️ 🤼‍♂️="🤼‍♂️">🤼‍♂️</🤼‍♂️>')

    })
    /**
     * @tc.name   testDynamicXml0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1430
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83c\udff4\ud83d\udd27";
      let that = new xml.XmlDynamicSerializer();
      that.startElement(emoji);
      that.setAttributes(emoji, emoji);
      that.setText(emoji);
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<🏴🔧 🏴🔧="🏴🔧">🏴🔧</🏴🔧>')
    })
    /**
     * @tc.name   testDynamicXml0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1440
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83d\ude3c";
      let that = new xml.XmlDynamicSerializer();
      that.startElement(emoji);
      that.setAttributes(emoji, emoji);
      that.setText(emoji);
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<😼 😼="😼">😼</😼>')
    })
    /**
     * @tc.name   testDynamicXml0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1450
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83d\udcaf";
      let that = new xml.XmlDynamicSerializer();
      that.startElement(emoji);
      that.setAttributes(emoji, emoji);
      that.setText(emoji);
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<💯 💯="💯">💯</💯>')
    })
    /**
     * @tc.name   testDynamicXml0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1460
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83d\udc40";
      let that = new xml.XmlDynamicSerializer();
      that.startElement(emoji);
      that.setAttributes(emoji, emoji);
      that.setText(emoji);
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<👀 👀="👀">👀</👀>')
    })
    /**
     * @tc.name   testDynamicXml0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1470
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83d\udc7f";
      let that = new xml.XmlDynamicSerializer();
      that.startElement(emoji);
      that.setAttributes(emoji, emoji);
      that.setText(emoji);
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<👿 👿="👿">👿</👿>')
    })
    /**
     * @tc.name   testDynamicXml0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1480
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83d\udc46";
      let that = new xml.XmlDynamicSerializer();
      that.startElement(emoji);
      that.setAttributes(emoji, emoji);
      that.setText(emoji);
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<👆 👆="👆">👆</👆>')
    })
    /**
     * @tc.name   testDynamicXml0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1490
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\udc46";
      let that = new xml.XmlDynamicSerializer();
      that.startElement(emoji);
      that.setAttributes(emoji, emoji);
      that.setText(emoji);
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual('%3C%EF%BF%BD%EF%BF%BD%EF%BF%BD%20%EF%BF%BD%EF%BF%BD%EF%BF%BD' +
        '=%22%EF%BF%BD%EF%BF%BD%EF%BF%BD%22%3E%EF%BF%BD%EF%BF%BD%EF%BF%BD%3C/%EF%BF%BD%EF%BF%BD%EF%BF%BD%3E')
    })
    /**
     * @tc.name   testDynamicXml0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1500
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83d\udc7f";
      let that = new xml.XmlDynamicSerializer();
      that.setDocType(emoji);
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<!DOCTYPE 👿>')
    })
    /**
     * @tc.name   testDynamicXml0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1510
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83d\udc46";
      let that = new xml.XmlDynamicSerializer();
      that.setDocType(emoji);
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<!DOCTYPE 👆>')
    })
    /**
     * @tc.name   testDynamicXml0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1520
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83d\udc46\ud83d\udee2";
      let that = new xml.XmlDynamicSerializer();
      that.setDocType(emoji);
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<!DOCTYPE 👆🛢>')
    })
    /**
     * @tc.name   testDynamicXml0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1530
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83d\udc40";
      let that = new xml.XmlDynamicSerializer();
      that.setDocType(emoji);
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<!DOCTYPE 👀>')
    })
    /**
     * @tc.name   testDynamicXml0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1540
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83c\udf85";
      let that = new xml.XmlDynamicSerializer();
      that.setDocType(emoji);
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<!DOCTYPE 🎅>')
    })
    /**
     * @tc.name   testDynamicXml0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1550
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83d\udd27";
      let that = new xml.XmlDynamicSerializer();
      that.setDocType(emoji);
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<!DOCTYPE 🔧>')
    })
    /**
     * @tc.name   testDynamicXml0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1560
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83d\udc87";
      let that = new xml.XmlDynamicSerializer();
      that.setDocType(emoji);
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<!DOCTYPE 💇>')
    })
    /**
     * @tc.name   testDynamicXml0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1570
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83e\udd3c\u200d\u2642\ufe0f";
      let that = new xml.XmlDynamicSerializer();
      that.setDocType(emoji);
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(result).assertEqual('<!DOCTYPE 🤼‍♂️>')
    })
    /**
     * @tc.name   testDynamicXml0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1580
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = "\ud83e";
      let that = new xml.XmlDynamicSerializer();
      that.setDocType(emoji);
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual('%3C!DOCTYPE%20%EF%BF%BD%EF%BF%BD%EF%BF%BD%3E');
    })
    /**
     * @tc.name   testDynamicXml0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1590
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.startElement("note");
      that.setAttributes("importance", 'abc\b');
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3Cnote%20importance=%22abc%08%22/%3E")
    })
    /**
     * @tc.name   testDynamicXml0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1600
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.startElement("note");
      that.setAttributes("importance", 'abc\f');
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3Cnote%20importance=%22abc%0C%22/%3E")
    })
    /**
     * @tc.name   testDynamicXml0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1610
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.startElement("note");
      that.setAttributes("importance", 'abc\n');
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3Cnote%20importance=%22abc%0A%22/%3E")
    })
    /**
     * @tc.name   testDynamicXml0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1620
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.startElement("note");
      that.setAttributes("importance", 'abc\r');
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3Cnote%20importance=%22abc%0D%22/%3E")
    })
    /**
     * @tc.name   testDynamicXml0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1630
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.startElement("note");
      that.setAttributes("importance", 'abc\t');
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3Cnote%20importance=%22abc%09%22/%3E")
    })
    /**
     * @tc.name   testDynamicXml0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1640
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.startElement("note");
      that.setAttributes("importance", 'abc\x24');
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3Cnote%20importance=%22abc$%22/%3E")
    })
    /**
     * @tc.name   testDynamicXml0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1650
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.startElement("note");
      that.setAttributes("importance", 'abc\开');
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3Cnote%20importance=%22abc%E5%BC%80%22/%3E")
    })
    /**
     * @tc.name   testDynamicXml0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1660
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.startElement("note");
      that.setAttributes("importance", 'abc\💇');
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3Cnote%20importance=%22abc%F0%9F%92%87%22/%3E")
    })
    /**
     * @tc.name   testDynamicXml0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1670
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.startElement("note");
      that.setAttributes("importance", 'abc\0');
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3Cnote%20importance=%22abc%00%22/%3E")
    })
    /**
     * @tc.name   testDynamicXml0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1680
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.startElement("note");
      that.setAttributes("importance", 'abc\\b');
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3Cnote%20importance=%22abc%5Cb%22/%3E")
    })
    /**
     * @tc.name   testDynamicXml0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1690
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.addEmptyElement('\b')
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C%08/%3E")
      try{
        that.addEmptyElement("")
        expect().assertFail()
      }catch (err) {
        expect(err.code).assertEqual(10200064);
      }
      try{
        that.addEmptyElement(null)
        expect().assertFail()
      }catch (err) {
        expect(err.code).assertEqual(401);
      }
      try{
        that.addEmptyElement(undefined)
        expect().assertFail()
      }catch (err) {
        expect(err.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testDynamicXml0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1700
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.addEmptyElement('\f')
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C%0C/%3E")
    })
    /**
     * @tc.name   testDynamicXml0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1710
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.addEmptyElement('\n')
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C%0A/%3E")
    })
    /**
     * @tc.name   testDynamicXml0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1720
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.addEmptyElement('\r')
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C%0D/%3E")
    })
    /**
     * @tc.name   testDynamicXml0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1730
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.addEmptyElement('\t')
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C%09/%3E")
    })
    /**
     * @tc.name   testDynamicXml0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1740
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.addEmptyElement('\v')
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C%0B/%3E")
    })
    /**
     * @tc.name   testDynamicXml0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1750
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.addEmptyElement('\x24')
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C$/%3E")
    })
    /**
     * @tc.name   testDynamicXml0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1760
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.addEmptyElement('\开')
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C%E5%BC%80/%3E")
    })
    /**
     * @tc.name   testDynamicXml0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1770
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.addEmptyElement('\💇')
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C%F0%9F%92%87/%3E")
    })
    /**
     * @tc.name   testDynamicXml0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1780
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.addEmptyElement('\0')
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C%00/%3E")
    })
    /**
     * @tc.name   testDynamicXml0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1790
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.addEmptyElement('\\b')
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C%5Cb/%3E")
    })
    /**
     * @tc.name   testDynamicXml0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1800
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setNamespace('\b', "a");
      that.startElement("note");
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%0D%0A%3C%08:note%20xmlns:%08=%22a%22/%3E")
      try{
        that.setNamespace('', "\ud83d\ude0a");
        expect().assertFail()
      }catch (err) {
        expect(err.code).assertEqual(10200064);
      }
      try{
        that.setNamespace(null, "\ud83d\ude0a");
        expect().assertFail()
      }catch (err) {
        expect(err.code).assertEqual(401);
      }
      try{
        that.setNamespace(undefined, "\ud83d\ude0a");
        expect().assertFail()
      }catch (err) {
        expect(err.code).assertEqual(401);
      }
      try{
        that.setNamespace('a','');
        expect().assertFail()
      }catch (err) {
        expect(err.code).assertEqual(10200064);
      }
      try{
        that.setNamespace('a', null);
        expect().assertFail()
      }catch (err) {
        expect(err.code).assertEqual(401);
      }
      try{
        that.setNamespace('a', undefined);
        expect().assertFail()
      }catch (err) {
        expect(err.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testDynamicXml0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1810
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setNamespace('\f', "a");
      that.startElement("note");
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%0D%0A%3C%0C:note%20xmlns:%0C=%22a%22/%3E")
    })
    /**
     * @tc.name   testDynamicXml0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1820
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setNamespace('\n', "a");
      that.startElement("note");
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%0D%0A%3C%0A:note%20xmlns:%0A=%22a%22/%3E")
    })
    /**
     * @tc.name   testDynamicXml0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1830
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setNamespace('\r', "a");
      that.startElement("note");
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%0D%0A%3C%0D:note%20xmlns:%0D=%22a%22/%3E")
    })
    /**
     * @tc.name   testDynamicXml0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1840
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setNamespace('\t', "a");
      that.startElement("note");
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%0D%0A%3C%09:note%20xmlns:%09=%22a%22/%3E")
    })
    /**
     * @tc.name   testDynamicXml0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1850
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setNamespace('\v', "a");
      that.startElement("note");
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%0D%0A%3C%0B:note%20xmlns:%0B=%22a%22/%3E")
    })
    /**
     * @tc.name   testDynamicXml0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1860
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setNamespace('\x24', "a");
      that.startElement("note");
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%0D%0A%3C$:note%20xmlns:$=%22a%22/%3E")
    })
    /**
     * @tc.name   testDynamicXml0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1870
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setNamespace('\开', "a");
      that.startElement("note");
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%0D%0A%3C%E5%BC%80:note%20xmlns:%E5%BC%80=%22a%22/%3E")
    })
    /**
     * @tc.name   testDynamicXml0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1880
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setNamespace('\💇', "a");
      that.startElement("note");
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%0D%0A%3C%F0%9F%92%87:note%20xmlns:%F0%9F%92%87=%22a%22/%3E");
    })
    /**
     * @tc.name   testDynamicXml0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1890
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setNamespace('\0', "a");
      that.startElement("note");
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%0D%0A%3C%00:note%20xmlns:%00=%22a%22/%3E");
    })
    /**
     * @tc.name   testDynamicXml0090
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1900
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setNamespace('\\b', "a");
      that.startElement("note");
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%0D%0A%3C%5Cb:note%20xmlns:%5Cb=%22a%22/%3E");
    })
    /**
     * @tc.name   testDynamicXml0091
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1910
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setComment('\b');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!--%08--%3E");
      try{
        that.setComment('');
        expect().assertFail()
      }catch (err) {
        expect(err.code).assertEqual(10200064);
      }
      try{
        that.setComment(null);
        expect().assertFail()
      }catch (err) {
        expect(err.code).assertEqual(401);
      }
      try{
        that.setComment(undefined);
        expect().assertFail()
      }catch (err) {
        expect(err.code).assertEqual(401);
      }

    })
    /**
     * @tc.name   testDynamicXml0092
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1920
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setComment('\f');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!--%0C--%3E");
    })
    /**
     * @tc.name   testDynamicXml0093
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1930
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setComment('\n');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!--%0A--%3E");
    })
    /**
     * @tc.name   testDynamicXml0094
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1940
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setComment('\r');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!--%0D--%3E");
    })
    /**
     * @tc.name   testDynamicXml0095
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1950
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setComment('\t');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!--%09--%3E");
    })
    /**
     * @tc.name   testDynamicXml0096
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1960
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setComment('\v');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!--%0B--%3E");
    })
    /**
     * @tc.name   testDynamicXml0097
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1970
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setComment('\x24');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!--$--%3E");
    })
    /**
     * @tc.name   testDynamicXml0098
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1980
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setComment('\开');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!--%E5%BC%80--%3E");
    })
    /**
     * @tc.name   testDynamicXml0099
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_1990
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setComment('\💇');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!--%F0%9F%92%87--%3E");
    })
    /**
     * @tc.name   testDynamicXml0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2000
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setComment('\0');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!--%00--%3E");
    })
    /**
     * @tc.name   testDynamicXml0101
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2010
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setComment('\\b');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!--%5Cb--%3E");
    })
    /**
     * @tc.name   testDynamicXml0102
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2020
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setCdata('\b');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!%5BCDATA%5B%08%5D%5D%3E");
      try{
        that.setCdata("")
        expect().assertFail()
      }catch (err) {
        expect(err.code).assertEqual(10200064);
      }
      try{
        that.setCdata(null)
        expect().assertFail()
      }catch (err) {
        expect(err.code).assertEqual(401);
      }
      try{
        that.setCdata(undefined)
        expect().assertFail()
      }catch (err) {
        expect(err.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testDynamicXml0103
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2030
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setCdata('\f');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!%5BCDATA%5B%0C%5D%5D%3E");
    })
    /**
     * @tc.name   testDynamicXml0104
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2040
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setCdata('\n');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!%5BCDATA%5B%0A%5D%5D%3E");
    })
    /**
     * @tc.name   testDynamicXml0105
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2050
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setCdata('\r');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!%5BCDATA%5B%0D%5D%5D%3E");
    })
    /**
     * @tc.name   testDynamicXml0106
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2060
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setCdata('\t');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!%5BCDATA%5B%09%5D%5D%3E");
    })
    /**
     * @tc.name   testDynamicXml0107
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2070
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setCdata('\v');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!%5BCDATA%5B%0B%5D%5D%3E");
    })
    /**
     * @tc.name   testDynamicXml0108
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2080
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setCdata('\x24');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!%5BCDATA%5B$%5D%5D%3E");
    })
    /**
     * @tc.name   testDynamicXml0109
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2090
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setCdata('\开');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!%5BCDATA%5B%E5%BC%80%5D%5D%3E");
    })
    /**
     * @tc.name   testDynamicXml0110
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2100
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setCdata('\💇');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!%5BCDATA%5B%F0%9F%92%87%5D%5D%3E");
    })
    /**
     * @tc.name   testDynamicXml0111
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2110
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setCdata('\0');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!%5BCDATA%5B%00%5D%5D%3E");
    })
    /**
     * @tc.name   testDynamicXml0112
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2120
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setCdata('\\b');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!%5BCDATA%5B%5Cb%5D%5D%3E");
    })
    /**
     * @tc.name   testDynamicXml0113
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2130
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setDocType('\b');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!DOCTYPE%20%08%3E");
    })
    /**
     * @tc.name   testDynamicXml0114
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2140
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setDocType('\f');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!DOCTYPE%20%0C%3E");
    })
    /**
     * @tc.name   testDynamicXml0115
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2150
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setDocType('\n');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!DOCTYPE%20%0A%3E");
    })
    /**
     * @tc.name   testDynamicXml0116
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2160
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setDocType('\r');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!DOCTYPE%20%0D%3E");
    })
    /**
     * @tc.name   testDynamicXml0117
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2170
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setDocType('\t');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!DOCTYPE%20%09%3E");
    })
    /**
     * @tc.name   testDynamicXml0118
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2180
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setDocType('\v');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!DOCTYPE%20%0B%3E");
    })
    /**
     * @tc.name   testDynamicXml0119
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2190
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setDocType('\x24');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!DOCTYPE%20$%3E");
    })
    /**
     * @tc.name   testDynamicXml0120
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2200
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setDocType('\开');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!DOCTYPE%20%E5%BC%80%3E");
    })
    /**
     * @tc.name   testDynamicXml0121
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2210
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setDocType('\💇');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!DOCTYPE%20%F0%9F%92%87%3E");
    })
    /**
     * @tc.name   testDynamicXml0122
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2220
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setDocType('\0');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!DOCTYPE%20%00%3E");
    })
    /**
     * @tc.name   testDynamicXml0123
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2230
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      that.setDocType('\\b');
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3C!DOCTYPE%20%5Cb%3E");
    })
    /**
     * @tc.name   testDynamicXml0124
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2240
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      let str = '\b';
      that.startElement("note");
      that.setText(str);
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3Cnote%3E%08%3C/note%3E");
      try{
        that.setText("")
        expect().assertFail()
      }catch (err) {
        expect(err.code).assertEqual(10200064);
      }
      try{
        that.setText(null)
        expect().assertFail()
      }catch (err) {
        expect(err.code).assertEqual(401);
      }
      try{
        that.setText(undefined)
        expect().assertFail()
      }catch (err) {
        expect(err.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testDynamicXml0125
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2250
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      let str = '\f';
      that.startElement("note");
      that.setText(str);
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3Cnote%3E%0C%3C/note%3E");
    })
    /**
     * @tc.name   testDynamicXml0126
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2260
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      let str = '\n';
      that.startElement("note");
      that.setText(str);
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3Cnote%3E%0A%3C/note%3E");
    })
    /**
     * @tc.name   testDynamicXml0127
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2270
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      let str = '\r';
      that.startElement("note");
      that.setText(str);
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3Cnote%3E%0D%3C/note%3E");
    })
    /**
     * @tc.name   testDynamicXml0128
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2280
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      let str = '\t';
      that.startElement("note");
      that.setText(str);
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3Cnote%3E%09%3C/note%3E");
    })
    /**
     * @tc.name   testDynamicXml0129
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2290
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      let str = '\v';
      that.startElement("note");
      that.setText(str);
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3Cnote%3E%0B%3C/note%3E");
    })
    /**
     * @tc.name   testDynamicXml0130
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2300
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      let str = '\x24';
      that.startElement("note");
      that.setText(str);
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3Cnote%3E$%3C/note%3E");
    })
    /**
     * @tc.name   testDynamicXml0131
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2310
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      let str = '\开';
      that.startElement("note");
      that.setText(str);
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3Cnote%3E%E5%BC%80%3C/note%3E");
    })
    /**
     * @tc.name   testDynamicXml0132
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2320
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      let str = '\💇';
      that.startElement("note");
      that.setText(str);
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3Cnote%3E%F0%9F%92%87%3C/note%3E");
    })
    /**
     * @tc.name   testDynamicXml0133
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2330
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      let str = '\0';
      that.startElement("note");
      that.setText(str);
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3Cnote%3E%00%3C/note%3E");
    })
    /**
     * @tc.name   testDynamicXml0134
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2340
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new xml.XmlDynamicSerializer();
      let str = '\\b';
      that.startElement("note");
      that.setText(str);
      that.endElement();
      let arrayBuffer = that.getOutput();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = util.TextDecoder.create().decodeToString(uint8);
      expect(encodeURI(result)).assertEqual("%3Cnote%3E%5Cb%3C/note%3E");
    })
    /**
     * @tc.name   testDynamicXml0135
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2350
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let that = new xml.XmlDynamicSerializer('utf-16');
      } catch (err) {
        expect(err.code).assertEqual(10200066);
      }

    })
    /**
     * @tc.name   testDynamicXml0136
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2360
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let falg = false;
      let MAX = 100000;
      let longstr = new Array(MAX).join('a');
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement('note1');
      falg = true;
      try {
        thatSer.setAttributes(longstr, longstr);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200062);
        expect(falg).assertTrue();
      }
    })
    /**
     * @tc.name   testDynamicXml0137
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2370
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let thatSer = new xml.XmlDynamicSerializer();
      try {
        thatSer.setAttributes("100", "100");
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200063);
      }
    })
    /**
     * @tc.name   testDynamicXml0138
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2380
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let falg = false;
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement('note');
      thatSer.endElement();
      falg = true;
      try {
        thatSer.setAttributes("", "")
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200064);
        expect(falg).assertTrue();
      }
    })
    /**
     * @tc.name   testDynamicXml0139
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2390
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const MAX = 100001;
      let longstr = new Array(MAX).join("1");
      let thatSer = new xml.XmlDynamicSerializer();
      try {
        thatSer.addEmptyElement(longstr);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200062);
      }
    })
    /**
     * @tc.name   testDynamicXml0140
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2400
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let thatSer = new xml.XmlDynamicSerializer();
      try {
        thatSer.addEmptyElement("");
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200064);
      }
    })
    /**
     * @tc.name   testDynamicXml0141
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2410
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      try {
        let thatSer = new xml.XmlDynamicSerializer();
        thatSer.setDeclaration();
        flag = true;
        thatSer.setDeclaration();
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200063);
        expect(flag).assertTrue();
      }
    })
    /**
     * @tc.name   testDynamicXml0142
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2420
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        const MAX = 100001;
        let longstr = new Array(MAX).join("1");
        let thatSer = new xml.XmlDynamicSerializer();
        thatSer.startElement(longstr);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200062);
      }
    })
    /**
     * @tc.name   testDynamicXml0143
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2430
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let thatSer = new xml.XmlDynamicSerializer();
        thatSer.startElement("");
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200064);
      }
    })
    /**
     * @tc.name   testDynamicXml0144
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2440
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {

      const MAX = 99999;
      let longstr = new Array(MAX).join("1");
      let thatSer = new xml.XmlDynamicSerializer();
      thatSer.startElement(longstr);
      try {
        thatSer.endElement();
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200062);
      }
    })
    /**
     * @tc.name   testDynamicXml0145
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2450
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      try {
        let thatSer = new xml.XmlDynamicSerializer();
        thatSer.startElement("note");
        thatSer.endElement();
        flag = true;
        thatSer.endElement();
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200065);
        expect(flag).assertTrue();
      }
    })
    /**
     * @tc.name   testDynamicXml0146
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2460
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      try {
        let MAX = 100000;
        let longstr = new Array(MAX).join("a");
        let thatSer = new xml.XmlDynamicSerializer();
        thatSer.startElement("note");
        flag = true;
        thatSer.setText(longstr);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200062);
        expect(flag).assertTrue();
      }
    })
    /**
     * @tc.name   testDynamicXml0147
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2470
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let thatSer = new xml.XmlDynamicSerializer();
        thatSer.setText("");
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200064);
      }
    })
    /**
     * @tc.name   testDynamicXml0148
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2480
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag = false;
      try {
        let MAX = 100000;
        let longStr = new Array(MAX).join("1");
        let thatSer = new xml.XmlDynamicSerializer();
        thatSer.startElement(longStr);
        flag = true;
        thatSer.setNamespace("h", "www.test.com");
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200062);
        expect(flag).assertTrue();
      }
    })
    /**
     * @tc.name   testDynamicXml0149
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2490
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let MAX = 100001;
        let longStr = new Array(MAX).join("A");
        let thatSer = new xml.XmlDynamicSerializer();
        thatSer.setComment(longStr);
        expect().assertFail()
      } catch (err) {
        expect(err.code).assertEqual(10200062);
      }
    })
    /**
     * @tc.name   testDynamicXml0150
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2500
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let MAX = 100001;
      let longStr = new Array(MAX).join("a");
      let thatSer = new xml.XmlDynamicSerializer();
      try {
        thatSer.setDocType(longStr);
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200062);
      }
      try{
        thatSer.setDocType("")
        expect().assertFail()
      }catch (err) {
        expect(err.code).assertEqual(10200064);
      }
      try{
        thatSer.setDocType(null)
        expect().assertFail()
      }catch (err) {
        expect(err.code).assertEqual(401);
      }
      try{
        thatSer.setDocType(undefined)
        expect().assertFail()
      }catch (err) {
        expect(err.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testDynamicXml0151
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2510
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let thatSer = new xml.XmlDynamicSerializer();
        thatSer.setDocType("");
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(10200064);
      }
    })
    /**
     * @tc.name   testDynamicXml0152
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2520
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let MAX = 100001;
        let longStr = new Array(MAX).join("a");
        let thatSer = new xml.XmlDynamicSerializer();
        thatSer.setCdata(longStr);
        expect().assertFail()
      } catch (err) {
        expect(err.code).assertEqual(10200062);
      }
    })
    /**
     * @tc.name   testDynamicXml0153
     * @tc.number SUB_COMMONLIBRARY_UTIL_DYNAMICXML1_2530
     * @tc.desc   Testing the DynamicXml interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDynamicXml0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let thatSer = new xml.XmlDynamicSerializer();
        thatSer.setCdata("");
      } catch (err) {
        expect(err.code).assertEqual(10200064);
      }
    })
  })
}
