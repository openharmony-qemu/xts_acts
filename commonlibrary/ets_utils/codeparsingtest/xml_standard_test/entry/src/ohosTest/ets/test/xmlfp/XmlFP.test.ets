/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import xml from '@ohos.xml';
import {
  testNodeName001,
  testNodeName002,
  testParse001,
  testParse002,
  testParse003,
  testParse004,
  testParse005,
  testParse006,
  testParse007,
  testParse008,
  testParse009,
  testParse010,
  testParse011,
  testParse012,
  testParse013,
  testParse014,
  testParse015,
  testParseXml001,
  testParseXml002,
  testParseXml003,
  testParseXml004,
  testParseXml005,
  testParseXml006,
  testParseXml007,
  testParseXml008,
  testParseXml009,
  testParseXml010,
  testParseXml011,
  testParseXml012,
  testParseXml013,
  testParseXml014,
  testParseXml015,
  testParseXml016,
  testParseXml017,
  testParseXml018,
  testParseXml019,
  testParseXml020,
  testParseXml021,
  testParseXml022,
  testParseXml023,
  testXmlBusinessError001,
  testXmlBusinessError002,
  testXmlBusinessError003,
  testXmlBusinessError004,
  testXmlBusinessError005,
  testXmlBusinessError006,
  testXmlBusinessError007,
  testXmlBusinessError008,
  testXmlBusinessError009,
  testXmlBusinessError010,
  testXmlBusinessError011,
  testXmlBusinessError012,
  testXmlBusinessError013,
  testXmlBusinessError014,
  testXmlBusinessError015
} from './XmlResource';

export default function XmlSerializerXmlPullParserTest() {
  describe('XmlSerializerXmlPullParserTest', () => {

    /**
     * @tc.name   testSetDeclaration001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0010
     * @tc.desc   Writes xml declaration with encoding. For example: <?xml version="1.0" encoding="utf-8"?>.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetDeclaration001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arrayBuffer = new ArrayBuffer(2048);
      let thatSer = new xml.XmlSerializer(arrayBuffer, "utf-8");
      thatSer.setDeclaration();
      let result = '<?xml version="1.0" encoding="utf-8"?>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetDeclaration002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0020
     * @tc.desc   Writes xml declaration with encoding. For example: <?xml version="1.0" encoding="utf-8"?>.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetDeclaration002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arrayBuffer = new ArrayBuffer(2048);
      let thatSer = new xml.XmlSerializer(arrayBuffer, "utf-8");
      thatSer.setDeclaration();
      let result = '<?xml version="1.0" encoding="utf-8"?>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetDeclaration003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0030
     * @tc.desc   Writes xml declaration with encoding. For example: <?xml version="1.0" encoding="utf-8"?>.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetDeclaration003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arrayBuffer = new ArrayBuffer(2048);
      let thatSer = new xml.XmlSerializer(arrayBuffer, "utf-8");
      thatSer.setDeclaration();
      let result = '<?xml version="1.0" encoding="utf-8"?>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetDeclaration004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0040
     * @tc.desc   Writes xml declaration with encoding. For example: <?xml version="1.0" encoding="utf-8"?>.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetDeclaration004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arrayBuffer = new ArrayBuffer(2048);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setDeclaration();
      let result = '<?xml version="1.0" encoding="utf-8"?>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetDeclaration005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0050
     * @tc.desc   Writes xml declaration with encoding. For example: <?xml version="1.0" encoding="utf-8"?>.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetDeclaration005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arrayBuffer = new ArrayBuffer(2048);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setDeclaration();
      let result = '<?xml version="1.0" encoding="utf-8"?>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testStartElement001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0060
     * @tc.desc   Writes an elemnet start tag with the given name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStartElement001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note1");
      thatSer.endElement();
      let result = '<note1/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testStartElement002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0070
     * @tc.desc   Writes an elemnet start tag with the given name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStartElement002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note1");
      thatSer.endElement();
      thatSer.startElement("note2");
      thatSer.endElement();
      let result = '<note1/>\r\n<note2/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testStartElement003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0080
     * @tc.desc   Writes an elemnet start tag with the given name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStartElement003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note1");
      thatSer.startElement("note2");
      thatSer.endElement();
      thatSer.endElement();
      let result = '<note1>\r\n  <note2/>\r\n</note1>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testStartElement004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0090
     * @tc.desc   Writes an elemnet start tag with the given name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStartElement004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note1");
      thatSer.startElement("note2");
      thatSer.startElement("note3");
      thatSer.endElement();
      thatSer.endElement();
      thatSer.endElement();
      let result = '<note1>\r\n  <note2>\r\n    <note3/>\r\n  </note2>\r\n</note1>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testStartElement005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0100
     * @tc.desc   Writes an elemnet start tag with the given name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStartElement005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note1");
      thatSer.startElement("note2");
      thatSer.endElement();
      thatSer.startElement("note3");
      thatSer.endElement();
      thatSer.endElement();
      let result = '<note1>\r\n  <note2/>\r\n  <note3/>\r\n</note1>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetAttributes001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0110
     * @tc.desc   Write an attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetAttributes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance1", "high1");
      thatSer.endElement();
      let result = '<note importance1="high1"/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetAttributes002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0120
     * @tc.desc   Write an attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetAttributes002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance1", "high1");
      thatSer.setAttributes("importance2", "high2");
      thatSer.endElement();
      let result = '<note importance1="high1" importance2="high2"/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetAttributes003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0130
     * @tc.desc   Write an attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetAttributes003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance1", "high1");
      thatSer.setAttributes("importance2", "high2");
      thatSer.setAttributes("importance3", "high3");
      thatSer.endElement();
      let result = '<note importance1="high1" importance2="high2" importance3="high3"/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetAttributes004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0140
     * @tc.desc   Write an attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetAttributes004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance1", "high1");
      thatSer.setAttributes("importance2", "high2");
      thatSer.setAttributes("importance3", "high3");
      thatSer.setAttributes("importance4", "high4");
      thatSer.endElement();
      let result = '<note importance1="high1" importance2="high2" importance3="high3" importance4="high4"/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetAttributes005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0150
     * @tc.desc   Write an attribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetAttributes005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance1", "high1");
      thatSer.setAttributes("importance2", "high2");
      thatSer.setAttributes("importance3", "high3");
      thatSer.setAttributes("importance5", "high5");
      thatSer.endElement();
      let result = '<note importance1="high1" importance2="high2" importance3="high3" importance5="high5"/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testEndElement001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0160
     * @tc.desc   Writes end tag of the element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEndElement001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.endElement();
      let result = '<note/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testEndElement002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0170
     * @tc.desc   Writes end tag of the element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEndElement002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance", "high");
      thatSer.endElement();
      let result = '<note importance="high"/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testEndElement003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0180
     * @tc.desc   Writes end tag of the element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEndElement003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("impo", "hi");
      thatSer.endElement();
      let result = '<note impo="hi"/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testEndElement004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0190
     * @tc.desc   Writes end tag of the element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEndElement004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note1");
      thatSer.startElement("note2");
      thatSer.endElement();
      thatSer.endElement();
      let result = '<note1>\r\n  <note2/>\r\n</note1>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testEndElement005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0200
     * @tc.desc   Writes end tag of the element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEndElement005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note2");
      thatSer.setAttributes("importance", "high");
      thatSer.endElement();
      let result = '<note2 importance="high"/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetText001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0210
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetText001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance", "high");
      thatSer.setText("Happy1");
      thatSer.endElement();
      let result = '<note importance="high">Happy1</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetText002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0220
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetText002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance", "high");
      thatSer.setText("Happy2");
      thatSer.endElement();
      let result = '<note importance="high">Happy2</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetText003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0230
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetText003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance", "high");
      thatSer.setText("Happy3");
      thatSer.endElement();
      let result = '<note importance="high">Happy3</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetText004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0240
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetText004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance", "high");
      thatSer.setText("Happy4");
      thatSer.endElement();
      let result = '<note importance="high">Happy4</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetText005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0250
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetText005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance", "high");
      thatSer.setText("Happy5");
      thatSer.endElement();
      let result = '<note importance="high">Happy5</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testAddEmptyElement001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0260
     * @tc.desc   Add an empty element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddEmptyElement001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.addEmptyElement("a");
      thatSer.endElement();
      let result = '<note>\r\n  <a/>\r\n</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testAddEmptyElement002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0270
     * @tc.desc   Add an empty element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddEmptyElement002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.endElement();
      thatSer.addEmptyElement("b");
      let result = '<note/>\r\n<b/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testAddEmptyElement003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0280
     * @tc.desc   Add an empty element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddEmptyElement003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.addEmptyElement("c");
      thatSer.startElement("note");
      thatSer.endElement();
      let result = '<c/>\r\n<note/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testAddEmptyElement004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0290
     * @tc.desc   Add an empty element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddEmptyElement004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.addEmptyElement("d");
      let result = '<d/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testAddEmptyElement005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0300
     * @tc.desc   Add an empty element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddEmptyElement005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.addEmptyElement("c");
      thatSer.addEmptyElement("d");
      thatSer.endElement();
      let result = '<note>\r\n  <c/>\r\n  <d/>\r\n</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetNamespace001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0310
     * @tc.desc   Writes the namespace of the current element tag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetNamespace001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setDeclaration();
      thatSer.setNamespace("h", "http://www.w3.org/TR/html4/");
      thatSer.startElement("note");
      thatSer.endElement();
      let result = '<?xml version="1.0" encoding="utf-8"?>\r\n<h:note xmlns:h="http://www.w3.org/TR/html4/"/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetNamespace002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0320
     * @tc.desc   Writes the namespace of the current element tag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetNamespace002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setDeclaration();
      thatSer.setNamespace("b", "http://www.w3.org/TR/html4/");
      thatSer.startElement("note");
      thatSer.endElement();
      let result = '<?xml version="1.0" encoding="utf-8"?>\r\n<b:note xmlns:b="http://www.w3.org/TR/html4/"/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetNamespace003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0330
     * @tc.desc   Writes the namespace of the current element tag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetNamespace003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setDeclaration();
      thatSer.setNamespace("h", "http://www.111/");
      thatSer.startElement("note");
      thatSer.endElement();
      let result = '<?xml version="1.0" encoding="utf-8"?>\r\n<h:note xmlns:h="http://www.111/"/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetNamespace004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0340
     * @tc.desc   Writes the namespace of the current element tag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetNamespace004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setDeclaration();
      thatSer.setNamespace("h", "http://www.w3.org/TR/html4/");
      thatSer.startElement("note1");
      thatSer.startElement("note2");
      thatSer.endElement();
      thatSer.endElement();
      let result = '<?xml version="1.0" encoding="utf-8"?>\r\n<h:note1 xmlns:h="http://www.w3.org/TR/html4/">' +
        '\r\n  <h:note2/>\r\n</h:note1>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetNamespace005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0350
     * @tc.desc   Writes the namespace of the current element tag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetNamespace005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setDeclaration();
      thatSer.setNamespace("h", "http://www.w3.org/TR/html4/");
      thatSer.startElement("note1");
      thatSer.startElement("note2");
      thatSer.endElement();
      thatSer.endElement();
      let result = '<?xml version="1.0" encoding="utf-8"?>\r\n<h:note1 xmlns:h="http://www.w3.org/TR/html4/">' +
        '\r\n  <h:note2/>\r\n</h:note1>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetComment001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0360
     * @tc.desc   Writes the comment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetComment001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setComment("Hi!");
      thatSer.endElement();
      let result = '<note>\r\n  <!--Hi!-->\r\n</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetComment002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0370
     * @tc.desc   Writes the comment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetComment002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setComment("Hello, World!");
      thatSer.endElement();
      let result = '<note>\r\n  <!--Hello, World!-->\r\n</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetComment003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0380
     * @tc.desc   Writes the comment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetComment003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setComment("Hello, World!");
      let result = '<!--Hello, World!-->';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetComment004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0390
     * @tc.desc   Writes the comment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetComment004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setComment("Hello, World!");
      let result = '<!--Hello, World!-->';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetComment005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0400
     * @tc.desc   Writes the comment.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetComment005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setComment("Hello, World!");
      thatSer.startElement("note");
      thatSer.endElement();
      let result = '<!--Hello, World!-->\r\n<note/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetDocType001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0410
     * @tc.desc   Writes the DOCTYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetDocType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setDocType('root SYSTEM');
      let result = '<!DOCTYPE root SYSTEM>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetDocType002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0420
     * @tc.desc   Writes the DOCTYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetDocType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setDocType('root SYSTEM "http://www.test.org/test.dtd"');
      let result = '<!DOCTYPE root SYSTEM "http://www.test.org/test.dtd">';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetDocType003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0430
     * @tc.desc   Writes the DOCTYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetDocType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.endElement();
      thatSer.setDocType('root SYSTEM "http://www.test.org/test.dtd"');
      let result = '<note/>\r\n<!DOCTYPE root SYSTEM "http://www.test.org/test.dtd">';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetDocType004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0440
     * @tc.desc   Writes the DOCTYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetDocType004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setDocType('root SYSTEM "http://www.test.org/test.dtd"');
      thatSer.startElement("note");
      thatSer.endElement();
      let result = '<!DOCTYPE root SYSTEM "http://www.test.org/test.dtd">\r\n<note/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetDocType005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0450
     * @tc.desc   Writes the DOCTYPE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetDocType005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setDocType('root SYSTEM "http://www.test.org/test.dtd"');
      thatSer.endElement();
      let result = '<note>\r\n  <!DOCTYPE root SYSTEM "http://www.test.org/test.dtd">\r\n</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetCDATA001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0460
     * @tc.desc   Writes the CDATA.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetCDATA001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setCDATA('root SYSTEM')
      let result = '<![CDATA[root SYSTEM]]>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetCDATA002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0470
     * @tc.desc   Writes the CDATA.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetCDATA002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setCDATA('root SYSTEM "http://www.test.org/test.dtd"')
      let result = '<![CDATA[root SYSTEM "http://www.test.org/test.dtd"]]>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetCDATA003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0480
     * @tc.desc   Writes the CDATA.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetCDATA003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.endElement();
      thatSer.setCDATA('root SYSTEM "http://www.test.org/test.dtd"')
      let result = '<note/>\r\n<![CDATA[root SYSTEM "http://www.test.org/test.dtd"]]>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetCDATA004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0490
     * @tc.desc   Writes the CDATA.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetCDATA004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.setCDATA('root SYSTEM "http://www.test.org/test.dtd"')
      thatSer.startElement("note");
      thatSer.endElement();
      let result = '<![CDATA[root SYSTEM "http://www.test.org/test.dtd"]]>\r\n<note/>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testSetCDATA005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0500
     * @tc.desc   Writes the CDATA.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetCDATA005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setCDATA('root SYSTEM "http://www.test.org/test.dtd"')
      thatSer.endElement();
      let result = '<note>\r\n  <![CDATA[root SYSTEM "http://www.test.org/test.dtd"]]>\r\n</note>';
      let view = new Uint8Array(arrayBuffer);
      let view1 = "";
      for (let i = 0; i < result.length; ++i) {
        view1 = view1 + String.fromCodePoint(view[i]);
      }
      expect(view1).assertEqual(result);
    })

    /**
     * @tc.name   testEventType001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0510
     * @tc.desc   Gets the START_DOCUMENT of EventType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEventType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let event = xml.EventType.START_DOCUMENT;
      expect(event).assertEqual(0)
    })

    /**
     * @tc.name   testEventType002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0520
     * @tc.desc   Gets the END_DOCUMENT of EventType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEventType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let event = xml.EventType.END_DOCUMENT;
      expect(event).assertEqual(1)
    })

    /**
     * @tc.name   testEventType003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0530
     * @tc.desc   Gets the START_TAG of EventType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEventType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let event = xml.EventType.START_TAG;
      expect(event).assertEqual(2)
    })

    /**
     * @tc.name   testEventType004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0540
     * @tc.desc   Gets the END_TAG of EventType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEventType004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let event = xml.EventType.END_TAG;
      expect(event).assertEqual(3)
    })

    /**
     * @tc.name   testEventType005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0550
     * @tc.desc   Gets the TEXT of EventType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEventType005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let event = xml.EventType.TEXT;
      expect(event).assertEqual(4)
    })

    /**
     * @tc.name   testEventType006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0560
     * @tc.desc   Gets the CDSECT of EventType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEventType006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let event = xml.EventType.CDSECT;
      expect(event).assertEqual(5)
    })

    /**
     * @tc.name   testEventType007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0570
     * @tc.desc   Gets the COMMENT of EventType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEventType007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let event = xml.EventType.COMMENT;
      expect(event).assertEqual(6)
    })

    /**
     * @tc.name   testEventType008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0580
     * @tc.desc   Gets the DOCDECL of EventType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEventType008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let event = xml.EventType.DOCDECL;
      expect(event).assertEqual(7)
    })

    /**
     * @tc.name   testEventType009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0590
     * @tc.desc   Gets the INSTRUCTION of EventType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEventType009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let event = xml.EventType.INSTRUCTION;
      expect(event).assertEqual(8)
    })

    /**
     * @tc.name   testEventType010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0600
     * @tc.desc   Gets the ENTITY_REFERENCE of EventType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEventType010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let event = xml.EventType.ENTITY_REFERENCE;
      expect(event).assertEqual(9)
    })

    /**
     * @tc.name   testEventType011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0610
     * @tc.desc   Gets the WHITESPACE of EventType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEventType011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let event = xml.EventType.WHITESPACE;
      expect(event).assertEqual(10)
    })

    /**
     * @tc.name   testSetText006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0620
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetText006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 1024;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance", "high");
      thatSer.setText("Hello>World");
      thatSer.endElement();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = '<note importance="high">Hello&gt;World</note>';
      let view = "";
      for (let i = 0; i < result.length; ++i) {
        view = view + String.fromCodePoint(uint8[i]);
      }
      expect(view).assertEqual(result);
    })

    /**
     * @tc.name   testSetText007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0630
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetText007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 1024;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance", "high");
      thatSer.setText("Hello<World");
      thatSer.endElement();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = '<note importance="high">Hello&lt;World</note>';
      let view = "";
      for (let i = 0; i < result.length; ++i) {
        view = view + String.fromCodePoint(uint8[i]);
      }
      expect(view).assertEqual(result);
    })

    /**
     * @tc.name   testSetText008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0640
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetText008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 1024;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance", "high");
      thatSer.setText("Hello&World");
      thatSer.endElement();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = '<note importance="high">Hello&amp;World</note>';
      let view = "";
      for (let i = 0; i < result.length; ++i) {
        view = view + String.fromCodePoint(uint8[i]);
      }
      expect(view).assertEqual(result);
    })

    /**
     * @tc.name   testSetText009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0650
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetText009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 1024;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance", "high");
      thatSer.setText("Hello'World");
      thatSer.endElement();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = '<note importance="high">Hello&apos;World</note>';
      let view = "";
      for (let i = 0; i < result.length; ++i) {
        view = view + String.fromCodePoint(uint8[i]);
      }
      expect(view).assertEqual(result);
    })

    /**
     * @tc.name   testSetText010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0660
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetText010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 1024;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let thatSer = new xml.XmlSerializer(arrayBuffer);
      thatSer.startElement("note");
      thatSer.setAttributes("importance", "high");
      thatSer.setText("Hello\"World");
      thatSer.endElement();
      let uint8 = new Uint8Array(arrayBuffer);
      let result = '<note importance="high">Hello&quot;World</note>';
      let view = "";
      for (let i = 0; i < result.length; ++i) {
        view = view + String.fromCodePoint(uint8[i]);
      }
      expect(view).assertEqual(result);
    })

    /**
     * @tc.name   testSetAttributes006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0670
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetAttributes006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 1024;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let serializer = new xml.XmlSerializer(arrayBuffer);
      serializer.startElement('note');
      serializer.setAttributes('importance', 'Hello>World');
      serializer.setText('high');
      serializer.endElement();
      let uint8 = new Uint8Array(arrayBuffer);
      let xmlStr = '<note importance="Hello&gt;World">high</note>';
      let result = '';
      for (let i = 0; i < xmlStr.length; ++i) {
        result = result + String.fromCodePoint(uint8[i]);
      }
      expect(result).assertEqual(xmlStr);
    })

    /**
     * @tc.name   testSetAttributes007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0680
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetAttributes007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 1024;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let serializer = new xml.XmlSerializer(arrayBuffer);
      serializer.startElement('note');
      serializer.setAttributes('importance', 'Hello<World');
      serializer.setText('high');
      serializer.endElement();
      let uint8 = new Uint8Array(arrayBuffer);
      let xmlStr = '<note importance="Hello&lt;World">high</note>';
      let result = '';
      for (let i = 0; i < xmlStr.length; ++i) {
        result = result + String.fromCodePoint(uint8[i]);
      }
      expect(result).assertEqual(xmlStr);
    })

    /**
     * @tc.name   testSetAttributes008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0690
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetAttributes008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 1024;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let serializer = new xml.XmlSerializer(arrayBuffer);
      serializer.startElement('note');
      serializer.setAttributes('importance', 'Hello&World');
      serializer.setText('high');
      serializer.endElement();
      let uint8 = new Uint8Array(arrayBuffer);
      let xmlStr = '<note importance="Hello&amp;World">high</note>';
      let result = '';
      for (let i = 0; i < xmlStr.length; ++i) {
        result = result + String.fromCodePoint(uint8[i]);
      }
      expect(result).assertEqual(xmlStr);
    })

    /**
     * @tc.name   testSetAttributes009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0700
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetAttributes009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 1024;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let serializer = new xml.XmlSerializer(arrayBuffer);
      serializer.startElement('note');
      serializer.setAttributes('importance', 'Hello\'World');
      serializer.setText('high');
      serializer.endElement();
      let uint8 = new Uint8Array(arrayBuffer);
      let xmlStr = '<note importance="Hello&apos;World">high</note>';
      let result = '';
      for (let i = 0; i < xmlStr.length; ++i) {
        result = result + String.fromCodePoint(uint8[i]);
      }
      expect(result).assertEqual(xmlStr);
    })

    /**
     * @tc.name   testSetAttributes010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0710
     * @tc.desc   Writes the text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetAttributes010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 1024;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let serializer = new xml.XmlSerializer(arrayBuffer);
      serializer.startElement('note');
      serializer.setAttributes('importance', 'Hello"World');
      serializer.setText('high');
      serializer.endElement();
      let uint8 = new Uint8Array(arrayBuffer);
      let xmlStr = '<note importance="Hello&quot;World">high</note>';
      let result = '';
      for (let i = 0; i < xmlStr.length; ++i) {
        result = result + String.fromCodePoint(uint8[i]);
      }
      expect(result).assertEqual(xmlStr);
    })

    /**
     * @tc.name   testSetCDATA006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0720
     * @tc.desc   Writes the CDATA.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetCDATA006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let serializer = new xml.XmlSerializer(arrayBuffer);
      serializer.startElement("note");
      serializer.setCDATA(']]>')
      serializer.endElement();
      let xmlStr = '<note>\r\n  <![CDATA[]]]]><![CDATA[>]]>\r\n</note>';
      let uint8 = new Uint8Array(arrayBuffer);
      let result = "";
      for (let i = 0; i < xmlStr.length; ++i) {
        result += String.fromCodePoint(uint8[i]);
      }
      expect(result).assertEqual(xmlStr);
    })

    /**
     * @tc.name   testSetCDATA007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0730
     * @tc.desc   Writes the CDATA.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetCDATA007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let serializer = new xml.XmlSerializer(arrayBuffer);
      serializer.startElement("note");
      serializer.setCDATA('<![CDATA[]]>')
      serializer.endElement();
      let xmlStr = '<note>\r\n  <![CDATA[<![CDATA[]]]]><![CDATA[>]]>\r\n</note>';
      let uint8 = new Uint8Array(arrayBuffer);
      let result = "";
      for (let i = 0; i < xmlStr.length; ++i) {
        result += String.fromCodePoint(uint8[i]);
      }
      expect(result).assertEqual(xmlStr);
    })

    /**
     * @tc.name   testSetCDATA008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0740
     * @tc.desc   Writes the CDATA.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetCDATA008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let serializer = new xml.XmlSerializer(arrayBuffer);
      serializer.startElement("note");
      serializer.setCDATA('fun() {if (a < b) return;}')
      serializer.endElement();
      let xmlStr = '<note>\r\n  <![CDATA[fun() {if (a < b) return;}]]>\r\n</note>';
      let uint8 = new Uint8Array(arrayBuffer);
      let result = "";
      for (let i = 0; i < xmlStr.length; ++i) {
        result += String.fromCodePoint(uint8[i]);
      }
      expect(result).assertEqual(xmlStr);
    })

    /**
     * @tc.name   testSetCDATA009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0750
     * @tc.desc   Writes the CDATA.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetCDATA009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let serializer = new xml.XmlSerializer(arrayBuffer);
      serializer.startElement("note");
      serializer.setCDATA('fun() {if (a && b) return;}')
      serializer.endElement();
      let xmlStr = '<note>\r\n  <![CDATA[fun() {if (a && b) return;}]]>\r\n</note>';
      let uint8 = new Uint8Array(arrayBuffer);
      let result = "";
      for (let i = 0; i < xmlStr.length; ++i) {
        result += String.fromCodePoint(uint8[i]);
      }
      expect(result).assertEqual(xmlStr);
    })

    /**
     * @tc.name   testSetCDATA0010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0760
     * @tc.desc   Writes the CDATA.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetCDATA0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myMAX = 2048;
      let arrayBuffer = new ArrayBuffer(myMAX);
      let serializer = new xml.XmlSerializer(arrayBuffer);
      serializer.startElement("note");
      serializer.setCDATA('fun() {if (a == \'xml\') return;}')
      serializer.endElement();
      let xmlStr = '<note>\r\n  <![CDATA[fun() {if (a == \'xml\') return;}]]>\r\n</note>';
      let uint8 = new Uint8Array(arrayBuffer);
      let result = "";
      for (let i = 0; i < xmlStr.length; ++i) {
        result += String.fromCodePoint(uint8[i]);
      }
      expect(result).assertEqual(xmlStr);
    })
    /**
     * @tc.name   testParse002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0770
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParse002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParse002())
        .assertEqual('  note [\n<!ENTITY foo "baa">] note      ' +
          '\\r\\nfuncrion matchwo(a,6)\\r\\n{\\r\\nreturn 1;\\r\\n}\\r\\n      Hello, World!      company John ' +
          '& Hans company      title Happy title      title Happy title      lens Work lens      ' +
          'lens Play lens      go there      a b b a      h:table          h:tr              h:td Apples h:td' +
          '              h:td Bananas h:td          h:tr      h:table note  ')
    })

    /**
     * @tc.name   testParse003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0780
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParse003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParse003())
        .assertEqual('key:0 value:1  key:2 value:77  key:10 value:81  key:2 value:88  key:4 value:93  ' +
          'key:3 value:101  key:10 value:105  key:2 value:111  key:4 value:115  key:3 value:122  key:10 value:126  ' +
          'key:2 value:132  key:4 value:136  key:3 value:143  key:3 value:150  key:1 value:150  ')
    })

    /**
     * @tc.name   testParse004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0790
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParse004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParse004())
        .assertEqual('key:0 value:0  key:2 value:1  key:10 value:1  key:2 value:2  key:4 value:2  key:3 value:2  ' +
          'key:10 value:1  key:2 value:2  key:4 value:2  key:3 value:2  key:10 value:1  key:2 value:2  ' +
          'key:4 value:2  key:3 value:2  key:3 value:1  key:1 value:0  ')
    })

    /**
     * @tc.name   testParse005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0800
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParse005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParse005())
        .assertEqual('key:0 value:1  key:2 value:1  key:10 value:1  key:2 value:1  key:4 value:1  key:3 value:1  ' +
          'key:10 value:1  key:2 value:1  key:4 value:1  key:3 value:1  key:10 value:1  key:2 value:1  ' +
          'key:4 value:1  key:3 value:1  key:3 value:1  key:1 value:1  ')
    })

    /**
     * @tc.name   testParse006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0810
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParse006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParse006())
        .assertEqual('key:0 value:  key:2 value:note  key:10 value:  key:2 value:title  key:4 value:  ' +
          'key:3 value:title  key:10 value:  key:2 value:todo  key:4 value:  key:3 value:todo  key:10 value:  ' +
          'key:2 value:todo  key:4 value:  key:3 value:todo  key:3 value:note  key:1 value:  ')
    })

    /**
     * @tc.name   testParse007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0820
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParse007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParse007())
        .assertEqual('key:0 value:  key:2 value:  key:10 value:  key:2 value:  key:4 value:  key:3 value:  ' +
          'key:10 value:  key:2 value:  key:4 value:  key:3 value:  key:10 value:  key:2 value:  key:4 value:  ' +
          'key:3 value:  key:3 value:  key:1 value:  ')
    })

    /**
     * @tc.name   testParse008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0830
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParse008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParse008())
        .assertEqual('key:0 value:  key:2 value:  key:10 value:  key:2 value:  key:4 value:  key:3 value:  ' +
          'key:10 value:  key:2 value:  key:4 value:  key:3 value:  key:10 value:  key:2 value:  key:4 value:  ' +
          'key:3 value:  key:3 value:  key:1 value:  ')
    })

    /**
     * @tc.name   testParse009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0840
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParse009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParse009())
        .assertEqual('key:0 value:  key:2 value:  key:10 value:      key:2 value:  key:4 value:Happy  ' +
          'key:3 value:  key:10 value:      key:2 value:  key:4 value:Work  key:3 value:  key:10 value:      ' +
          'key:2 value:  key:4 value:Play  key:3 value:  key:3 value:  key:1 value:  ')
    })

    /**
     * @tc.name   testParse010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0850
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParse010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParse010())
        .assertEqual('key:0 value:false  key:2 value:false  key:10 value:false  key:2 value:false  ' +
          'key:4 value:false  key:3 value:false  key:10 value:false  key:2 value:false  key:4 value:false  ' +
          'key:3 value:false  key:10 value:false  key:2 value:false  key:4 value:false  key:3 value:false  ' +
          'key:3 value:false  key:1 value:false  ')
    })

    /**
     * @tc.name   testParse011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0860
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParse011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParse011())
        .assertEqual('key:0 value:true  key:2 value:false  key:10 value:true  key:2 value:true  ' +
          'key:4 value:false  key:3 value:true  key:10 value:true  key:2 value:true  key:4 value:false  ' +
          'key:3 value:true  key:10 value:true  key:2 value:true  key:4 value:false  key:3 value:true  ' +
          'key:3 value:true  key:1 value:true  ')
    })

    /**
     * @tc.name   testParse012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0870
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParse012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParse012())
        .assertEqual('key:0 value:0  key:2 value:2  key:10 value:0  key:2 value:0  key:4 value:0  ' +
          'key:3 value:0  key:10 value:0  key:2 value:0  key:4 value:0  key:3 value:0  key:10 value:0  ' +
          'key:2 value:0  key:4 value:0  key:3 value:0  key:3 value:0  key:1 value:0  ')
    })

    /**
     * @tc.name   testParse013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0880
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParse013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParse013()).assertEqual('This is a \\r CDATA\\n section')
    })

    /**
     * @tc.name   testParse014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0890
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParse014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParse014()).assertEqual('Hello\nWorld\nWork\nThis is a \\r\\n CDATA section')
    })

    /**
     * @tc.name   testParse015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0900
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParse015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = ' note      title Hello>World\' title      todo Wo"rk todo note  ';
      let resAttr = 'importance, hi&gh logged, <true ';
      expect(testParse015()[0]).assertEqual(result)
      expect(testParse015()[1]).assertEqual(resAttr)
    })

    /**
     * @tc.name   testParse001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0910
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParse001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParse001()).assertEqual('importance:highlogged:truexmlns:h:http://www.w3.org/TR/html4/')
    })

    /**
     * @tc.name   testXmlBusinessError001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0920
     * @tc.desc   To XML text to JavaScript object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlBusinessError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testXmlBusinessError001()).assertEqual("BusinessError: Parameter error.The type of 123 must be object")
    })

    /**
     * @tc.name   testXmlBusinessError002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0930
     * @tc.desc   To XML text to JavaScript object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlBusinessError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testXmlBusinessError002()).assertEqual("BusinessError: Parameter error.The type of 123 must be string")
    })

    /**
     * @tc.name   testXmlBusinessError003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0940
     * @tc.desc   To XML text to JavaScript object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlBusinessError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testXmlBusinessError003()).assertEqual("BusinessError: Parameter error.The type of 111 must be string")
    })

    /**
     * @tc.name   testXmlBusinessError004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0950
     * @tc.desc   To XML text to JavaScript object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlBusinessError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testXmlBusinessError004()).assertEqual("BusinessError: Parameter error.The type of 111 must be string")
    })

    /**
     * @tc.name   testXmlBusinessError005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0960
     * @tc.desc   To XML text to JavaScript object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlBusinessError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testXmlBusinessError005()).assertEqual("BusinessError: Parameter error.The type of 111 must be string")
    })

    /**
     * @tc.name   testXmlBusinessError006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0970
     * @tc.desc   To XML text to JavaScript object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlBusinessError006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testXmlBusinessError006()).assertEqual("BusinessError: Parameter error.The type of 111 must be string")
    })

    /**
     * @tc.name   testXmlBusinessError007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0980
     * @tc.desc   To XML text to JavaScript object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlBusinessError007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testXmlBusinessError007()).assertEqual("BusinessError: Parameter error.The type of 111 must be string")
    })

    /**
     * @tc.name   testXmlBusinessError008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_0990
     * @tc.desc   To XML text to JavaScript object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlBusinessError008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testXmlBusinessError008()).assertEqual("BusinessError: Parameter error.The type of 111 must be string")
    })

    /**
     * @tc.name   testXmlBusinessError009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1000
     * @tc.desc   To XML text to JavaScript object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlBusinessError009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testXmlBusinessError009()).assertEqual("BusinessError: Parameter error.The type of 111 must be string")
    })

    /**
     * @tc.name   testXmlBusinessError010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1010
     * @tc.desc   To XML text to JavaScript object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlBusinessError010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testXmlBusinessError010()).assertEqual("BusinessError: Parameter error.The type of 111 must be string")
    })

    /**
     * @tc.name   testXmlBusinessError011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1020
     * @tc.desc   To XML text to JavaScript object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlBusinessError011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testXmlBusinessError011()).assertEqual("BusinessError: Parameter error.The type of 111 must be string")
    })

    /**
     * @tc.name   testXmlBusinessError012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1030
     * @tc.desc   To XML text to JavaScript object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlBusinessError012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testXmlBusinessError012()).assertEqual("BusinessError: Parameter error.The type of 111 must be string")
    })

    /**
     * @tc.name   testXmlBusinessError013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1040
     * @tc.desc   To XML text to JavaScript object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlBusinessError013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testXmlBusinessError013()).assertEqual("BusinessError: Parameter error.The type of 111 must be object")
    })

    /**
     * @tc.name   testXmlBusinessError014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1050
     * @tc.desc   To XML text to JavaScript object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlBusinessError014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testXmlBusinessError014()).assertEqual("BusinessError: Parameter error.The type of 111 must be string")
    })

    /**
     * @tc.name   testXmlBusinessError015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1060
     * @tc.desc   To XML text to JavaScript object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testXmlBusinessError015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testXmlBusinessError015()).assertEqual("BusinessError: Parameter error.The type of 111 must be object")
    })

    /**
     * @tc.name   testNodeName001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1070
     * @tc.desc   Writes a wrong node name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testNodeName001()).assertEqual(401)
    })

    /**
     * @tc.name   testNodeName002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1080
     * @tc.desc   Writes a wrong node name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNodeName002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testNodeName002()).assertEqual(401)
    })

    /**
     * @tc.name   testParseXml001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1090
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseXml001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParseXml001()).assertEqual('importance:high logged:true xmlns:h:http://www.w3.org/TR/html4/')
    })

    /**
     * @tc.name   testParseXml002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1100
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseXml002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParseXml002())
        .assertEqual('note    funcrion \n matchwo(a,6)    Hello, World!    companyJohn & Hanscompany    ' +
          'titleHappytitle    lensPlaylens    go therenote')
    })

    /**
     * @tc.name   testParseXml003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1110
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseXml003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParseXml003())
        .assertEqual('key:0 value:1  key:2 value:63  key:10 value:67  key:2 value:74  key:4 value:79  ' +
          'key:3 value:87  key:10 value:91  key:2 value:97  key:4 value:101  key:3 value:108  ' +
          'key:3 value:115  key:1 value:115')
    })

    /**
     * @tc.name   testParseXml004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1120
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseXml004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParseXml004())
        .assertEqual('key:0 value:0  key:2 value:1  key:10 value:1  key:2 value:2  key:4 value:2  ' +
          'key:3 value:2  key:10 value:1  key:2 value:2  key:4 value:2  key:3 value:2  ' +
          'key:10 value:1  key:2 value:2  key:4 value:2  key:3 value:2  key:3 value:1  key:1 value:0')
    })

    /**
     * @tc.name   testParseXml005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1130
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseXml005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParseXml005())
        .assertEqual('key:0 value:1  key:2 value:1  key:10 value:1  key:2 value:1  key:4 value:1  ' +
          'key:3 value:1  key:10 value:1  key:2 value:1  key:4 value:1  key:3 value:1  ' +
          'key:10 value:1  key:2 value:1  key:4 value:1  key:3 value:1  key:3 value:1  key:1 value:1')
    })

    /**
     * @tc.name   testParseXml006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1140
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseXml006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParseXml006())
        .assertEqual('key:2 value:note  key:2 value:title  key:3 value:title  ' +
          'key:2 value:todo  key:3 value:todo  key:3 value:note')
    })

    /**
     * @tc.name   testParseXml007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1150
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseXml007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParseXml007())
        .assertEqual('key:2 value:  key:2 value:html4  key:2 value:html4  key:2 value:html4  ' +
          'key:3 value:html4  key:3 value:html4  key:3 value:html4  key:3 value:')
    })

    /**
     * @tc.name   testParseXml008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1160
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseXml008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParseXml008())
        .assertEqual('key:2 value:  key:2 value:h  key:2 value:h  key:2 value:h  ' +
          'key:3 value:h  key:3 value:h  key:3 value:h  key:3 value:')
    })

    /**
     * @tc.name   testParseXml009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1170
     * @tc.desc   Starts parsing he XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseXml009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParseXml009()).assertEqual('key:4 value:Happy  key:4 value:Work  key:4 value:Play')
    })

    /**
     * @tc.name   testParseXml010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1180
     * @tc.desc   Starts parsing he XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseXml010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParseXml010()).assertEqual('key:2 value:false  key:2 value:true  key:2 value:false  key:2 value:true')
    })

    /**
     * @tc.name   testParseXml011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1190
     * @tc.desc   Starts parsing he XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseXml011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParseXml011()).assertEqual('key:2 value:2  key:2 value:0  key:2 value:0  key:2 value:0')
    })

    /**
     * @tc.name   testParseXml012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1200
     * @tc.desc   Starts parsing he XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseXml012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParseXml012()).assertEqual('Hello\nWorld Work\n This is a \n CDATA section')
    })

    /**
     * @tc.name   testParseXml013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1210
     * @tc.desc   Starts parsing he XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseXml013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str = 'Hello>World\' Wo"rk';
      let strAttr = 'importance, hi&gh logged, <true';
      expect(testParseXml013()[0]).assertEqual(str)
      expect(testParseXml013()[1]).assertEqual(strAttr)
    })

    /**
     * @tc.name   testParseXml014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1220
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseXml014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParseXml014()).assertEqual(401)
    })

    /**
     * @tc.name   testParseXml015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1230
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseXml015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParseXml015()).assertEqual(401)
    })

    /**
     * @tc.name   testParseXml016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1240
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseXml016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParseXml016()).assertEqual(401)
    })

    /**
     * @tc.name   testParseXml017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1250
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseXml017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParseXml017()).assertEqual(401)
    })

    /**
     * @tc.name   testParseXml018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1260
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseXml018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParseXml018()).assertEqual(401)
    })

    /**
     * @tc.name   testParseXml019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1270
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseXml019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParseXml019()).assertEqual('category')
    })

    /**
     * @tc.name   testParseXml020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1280
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseXml020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParseXml020()).assertEqual('column name Giana value integer 1')
    })

    /**
     * @tc.name   testParseXml021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1290
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseXml021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParseXml021()).assertEqual('name Giana integer 1')
    })

    /**
     * @tc.name   testParseXml022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1300
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseXml022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParseXml022()).assertEqual('column name Giana value integer 1 column name category value Boolean true')
    })

    /**
     * @tc.name   testParseXml023
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLFP_1310
     * @tc.desc   Starts parsing the XML file.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testParseXml023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(testParseXml023()).assertEqual('name Giana integer 1 name category Boolean true')
    })


  })
}