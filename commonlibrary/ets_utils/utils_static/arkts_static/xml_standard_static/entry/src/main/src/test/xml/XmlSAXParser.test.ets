'use static';
/*
  * Copyright (c) 2026 Huawei Device Co., Ltd.
  * Licensed under the Apache License, Version 2.0 (the "License");
  * you may not use this file except in compliance with the License.
  * You may obtain a copy of the License at
  *
  *     http://www.apache.org/licenses/LICENSE-2.0
  *
  * Unless required by applicable law or agreed to in writing, software
  * distributed under the License is distributed on an "AS IS" BASIS,
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  */
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import xml from '@ohos.xml'
import util from '@ohos.util'
import stream from '@ohos.util.stream'
import { BusinessError } from '@ohos.base';
import Utils from '../Util.test';


class TestReadable extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: int) {
  }
}

export default function XmlSAXParserTest(): void {
  describe('XmlSAXParserTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
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
     * @tc.name   testXmlSAXParser0001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLSAX_0100
     * @tc.desc   test xml SAXParser method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXmlSAXParser0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const inputStream = new TestReadable();
      const saxParser = new xml.XmlSAXParser(inputStream);

      expect(saxParser instanceof xml.XmlSAXParser).assertTrue();
    })

    /**
     * @tc.name   testXmlSAXParser0002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLSAX_0200
     * @tc.desc   test xml SAXParser method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXmlSAXParser0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const inputStream = new TestReadable();
      const saxParser = new xml.XmlSAXParser(inputStream,'utf-8');

      expect(saxParser instanceof xml.XmlSAXParser).assertTrue();
    })

    /**
     * @tc.name   testXmlSAXParser0003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLSAX_0300
     * @tc.desc   test xml SAXParser method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXmlSAXParser0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      try {
        const inputStream = new TestReadable();
        const saxParser = new xml.XmlSAXParser(inputStream, 'gbk');
        expect().assertFail();
      } catch (err) {
        expect(err instanceof BusinessError).assertTrue()
        expect(err.code).assertEqual(401);
        expect(err.name).assertEqual('BusinessError');
      }
    })

    /**
     * @tc.name   testXmlSAXParser0004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLSAX_0400
     * @tc.desc   test xml SAXParser method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXmlSAXParser0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let startDocumentCalled = false;
      let endDocumentCalled = false;
      let startElementCalled = false;
      let endElementCalled = false;
      let charactersCalled = false;

      const saxHandler: xml.XmlSAXHandler = {
        startDocument() {
          startDocumentCalled = true;
        },
        endDocument() {
          endDocumentCalled = true;
        },
        startElement(elementName: string, namespaceURI?: string,
          qName?: string, attributes?: Map<string, string>) {
          startElementCalled = true;
        },
        endElement(elementName: string, namespaceURI?: string,
          qName?: string) {
          endElementCalled = true;
        },
        characters(content: string) {
          charactersCalled = true;
        }
      };

      const testData = '<?xml version="1.0" encoding="UTF-8"?><root><child>Text</child></root>';
      const inputStream = new TestReadable();
      const saxParser = new xml.XmlSAXParser(inputStream);

      saxParser.parse(saxHandler);
      inputStream.push(testData);
      inputStream.push(null);

      await Utils.msSleep(50);

      expect(startDocumentCalled).assertTrue();
      expect(endDocumentCalled).assertTrue();
      expect(startElementCalled).assertTrue();
      expect(endElementCalled).assertTrue();
      expect(charactersCalled).assertTrue();
    })

    /**
     * @tc.name   testXmlSAXParser0005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLSAX_0500
     * @tc.desc   test xml SAXParser method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXmlSAXParser0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let receivedElementName : string | undefined = '';
      let receivedNamespaceURI : string | undefined = '';
      let receivedQName : string | undefined = '';
      let receivedAttributes: Map<string, string> | undefined;

      const saxHandler: xml.XmlSAXHandler = {
        startDocument() {
        },
        endDocument() {
        },
        startElement(elementName: string, namespaceURI?: string,
          qName?: string, attributes?: Map<string, string>) {
          receivedElementName = elementName;
          receivedNamespaceURI = namespaceURI;
          receivedQName = qName;
          receivedAttributes = attributes;
        },
        endElement(elementName: string, namespaceURI?: string,
          qName?: string) {
        },
        characters(content: string) {
        }
      };

      const testData = '<?xml version="1.0" encoding="UTF-8"?>' +
        '<root xmlns:ns1="http://example.com/ns1">' +
        '<ns1:child ns1:attr1="value1" attr2="value2">' +
        'Text</ns1:child></root>';
      const inputStream = new TestReadable();
      const saxParser = new xml.XmlSAXParser(inputStream);

      saxParser.parse(saxHandler);
      inputStream.push(testData);
      inputStream.push(null);

      await Utils.msSleep(50);

      expect(receivedElementName).assertEqual('child');
      expect(receivedNamespaceURI).assertEqual('http://example.com/ns1');
      expect(receivedQName).assertEqual('ns1:child');
      expect(receivedAttributes).assertInstanceOf('Map');
    })

    /**
     * @tc.name   testXmlSAXParser0006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLSAX_0600
     * @tc.desc   test xml SAXParser method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXmlSAXParser0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let elementCount = 0;
      const elementNames: string[] = [];

      const saxHandler: xml.XmlSAXHandler = {
        startDocument() {
        },
        endDocument() {
        },
        startElement(elementName: string, namespaceURI?: string,
          qName?: string, attributes?: Map<string, string>) {
          elementCount++;
          elementNames.push(elementName);
        },
        endElement(elementName: string, namespaceURI?: string,
          qName?: string) {
        },
        characters(content: string) {
        }
      };

      const testData = '<?xml version="1.0" encoding="UTF-8"?>' +
        '<root><item1>Text1</item1><item2>Text2</item2>' +
        '<item3>Text3</item3></root>';
      const inputStream = new TestReadable();
      const saxParser = new xml.XmlSAXParser(inputStream);

      saxParser.parse(saxHandler);
      inputStream.push(testData);
      inputStream.push(null);

      await Utils.msSleep(50);

      expect(elementCount).assertEqual(4);
      expect(elementNames.includes('root')).assertTrue();
      expect(elementNames.includes('item1')).assertTrue();
      expect(elementNames.includes('item2')).assertTrue();
      expect(elementNames.includes('item3')).assertTrue();
    })

    /**
     * @tc.name   testXmlSAXParser0007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLSAX_0700
     * @tc.desc   test xml SAXParser method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXmlSAXParser0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let attributesReceived = false;
      let attrValue1 : string | undefined = '';
      let attrValue2 : string | undefined = '';

      const saxHandler: xml.XmlSAXHandler = {
        startDocument() {
        },
        endDocument() {
        },
        startElement(elementName: string, namespaceURI?: string,
          qName?: string, attributes?: Map<string, string>) {
          if (attributes && attributes.size > 0) {
            attributesReceived = true;
            attrValue1 = attributes.get('id') || '';
            attrValue2 = attributes.get('name') || '';
          }
        },
        endElement(elementName: string, namespaceURI?: string,
          qName?: string) {
        },
        characters(content: string) {
        }
      };

      const testData = '<?xml version="1.0" encoding="UTF-8"?>' +
        '<root id="123" name="test">Content</root>';
      const inputStream = new TestReadable();
      const saxParser = new xml.XmlSAXParser(inputStream);

      saxParser.parse(saxHandler);
      inputStream.push(testData);
      inputStream.push(null);

      await Utils.msSleep(50);

      expect(attributesReceived).assertTrue();
      expect(attrValue1).assertEqual('123');
      expect(attrValue2).assertEqual('test');
    })

    /**
     * @tc.name   testXmlSAXParser0008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLSAX_0800
     * @tc.desc   test xml SAXParser method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXmlSAXParser0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let parseSuccess = false;

      const saxHandler: xml.XmlSAXHandler = {
        startDocument() {
        },
        endDocument() {
          parseSuccess = true;
        },
        startElement(elementName: string, namespaceURI?: string,
          qName?: string, attributes?: Map<string, string>) {
        },
        endElement(elementName: string, namespaceURI?: string,
          qName?: string) {
        },
        characters(content: string) {
        }
      };

      const testData = '<?xml version="1.0" encoding="UTF-8"?>' +
        '<root>测试中文</root>';
      const inputStream = new TestReadable();
      const saxParser = new xml.XmlSAXParser(inputStream, 'utf-8');

      saxParser.parse(saxHandler);
      inputStream.push(testData);
      inputStream.push(null);

      await Utils.msSleep(50);

      expect(parseSuccess).assertTrue();
    })

    /**
     * @tc.name   testXmlSAXParser0009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_XMLSAX_0900
     * @tc.desc   test xml SAXParser method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testXmlSAXParser0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let maxDepth = 0;
      let currentDepth = 0;

      const saxHandler: xml.XmlSAXHandler = {
        startDocument() {
        },
        endDocument() {
        },
        startElement(elementName: string, namespaceURI?: string,
          qName?: string, attributes?: Map<string, string>) {
          currentDepth++;
          if (currentDepth > maxDepth) {
            maxDepth = currentDepth;
          }
        },
        endElement(elementName: string, namespaceURI?: string,
          qName?: string) {
          currentDepth--;
        },
        characters(content: string) {
        }
      };

      const testData = '<?xml version="1.0" encoding="UTF-8"?><a><b><c><d><e>Deep</e></d></c></b></a>';
      const inputStream = new TestReadable();
      const saxParser = new xml.XmlSAXParser(inputStream);

      saxParser.parse(saxHandler);
      inputStream.push(testData);
      inputStream.push(null);

      await Utils.msSleep(50);

      expect(maxDepth).assertEqual(5);
      expect(currentDepth).assertEqual(0);
    })

  })
}
