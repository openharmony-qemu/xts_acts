'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from '@ohos/hypium-binary/src/main/indexStatic';
import { util, xml } from '@kit.ArkTS';
import Utils from '../Util.test';

let  str = "";
let  isXml = false
// Reset the global str variable to avoid contamination between test cases
beforeEach(() => {
  str = "";
  isXml = false
});

//0001
function func(name: string, value: string) {
  str = name + value;
  console.info(str);
  return true;
}

//Output with attribute names
function funcA(name: string, value: string) {
  str += (`name: ${name}  value: ${value}`)
  return true;
}

//Direct output
function funcB(name: string, value: string) {
  str += (`${name} ${value}`)
  return true;
}

export default function XmlTest_08(): void {
  describe('XmlTest_08', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await Utils.msSleep(30);
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASEDATE_PARSEINFO_ISWHITESPACE_0600
     * @tc.name      IsWhitespaceTest0006
     * @tc.desc      Check if attribute value is blank
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('IsWhitespaceTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'IsWhitespaceTest0006';
        console.log(TAG + ' start');
        const xmlData = `<node attr="  \t"/>`;
        const parser = new xml.XmlPullParser(
          new util.TextEncoder().encodeInto(xmlData).buffer as ArrayBuffer
        );
        let attributeIsWhitespace: boolean | undefined;
        parser.parseXml({
          attributeValueCallbackFunction: (name, value) => {
            attributeIsWhitespace = value.trim().length === 0;
            expect(attributeIsWhitespace === true &&
              name === 'attr').assertTrue();
            return true;
          }
        });
        expect(attributeIsWhitespace !== undefined &&
          attributeIsWhitespace === true).assertTrue();

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASEDATE_PARSEINFO_ISWHITESPACE_0700
     * @tc.name      IsWhitespaceTest0007
     * @tc.desc      Whitespace between self-closing tags
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('IsWhitespaceTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'IsWhitespaceTest0007';
        console.log(TAG + ' start')
        const xmlData = `<a><b/>\n\t<c/></a>`;
        const parser = new xml.XmlPullParser(
          new util.TextEncoder().encodeInto(xmlData).buffer as ArrayBuffer
        );
        parser.parseXml({
          tokenValueCallbackFunction: (eventType, token) => {
            if (eventType === xml.EventType.TEXT) {
              expect(eventType === xml.EventType.TEXT &&
              token.isWhitespace()).assertTrue();
              isXml = true
            }
            return true;
          }
        });
        expect(isXml).assertTrue();

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASEDATE_PARSEINFO_ISWHITESPACE_0800
     * @tc.name      IsWhitespaceTest0008
     * @tc.desc      Pure visible character verification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('IsWhitespaceTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'IsWhitespaceTest0008';
        console.log(TAG + ' start');

          const xmlData = `<root>VisibleText</root>`;
          new xml.XmlPullParser(
            new util.TextEncoder().encodeInto(xmlData).buffer as ArrayBuffer
          ).parseXml({
            tokenValueCallbackFunction: (t, i) => {
              if (t === xml.EventType.TEXT) {
                expect(i.isWhitespace()).assertFalse();
                isXml = true
              }
              return true;
            }
          });
          expect(isXml).assertTrue()

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASEDATE_PARSEINFO_ISWHITESPACE_0900
     * @tc.name      IsWhitespaceTest0009
     * @tc.desc      Mixed whitespace and visible characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('IsWhitespaceTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'IsWhitespaceTest0009';
        console.log(TAG + ' start');

          const xmlData = `<doc>\n  Text\tContent</doc>`;
          new xml.XmlPullParser(
            new util.TextEncoder().encodeInto(xmlData).buffer as ArrayBuffer
          ).parseXml({
            tokenValueCallbackFunction: (t, i) => {
              if (t === xml.EventType.TEXT) {
                expect(i.isWhitespace()).assertFalse();
                isXml = true
              }
              return true;
            }
          });
          expect(isXml).assertTrue()

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASEDATE_PARSEINFO_ISWHITESPACE_1000
     * @tc.name      IsWhitespaceTest0010
     * @tc.desc      Text node containing visible characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('IsWhitespaceTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'IsWhitespaceTest0010';
        console.log(TAG + ' start');

          const xmlData = `<root>Hello World</root>`;
          new xml.XmlPullParser(
            new util.TextEncoder().encodeInto(xmlData).buffer as ArrayBuffer
          ).parseXml({
            tokenValueCallbackFunction: (t, i) => {
              if (t === xml.EventType.TEXT) {
                expect(i.isWhitespace()).assertFalse();
                isXml = true
              }
              return true;
            }
          });

          expect(isXml).assertTrue()

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASEDATE_PARSEINFO_ISWHITESPACE_1100
     * @tc.name      IsWhitespaceTest0011
     * @tc.desc      The processing command contains valid content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('IsWhitespaceTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'IsWhitespaceTest0011';
        console.log(TAG + ' start');
        const xmlData = `<?xml-stylesheet href="style.css"?>`;
        const encodedBuffer = new util.TextEncoder().encodeInto(xmlData).buffer as ArrayBuffer;
        const parser = new xml.XmlPullParser(encodedBuffer);
        parser.parseXml({
          tokenValueCallbackFunction: (tokenType, tokenInfo) => {
            if (tokenType === xml.EventType.ENTITY_REFERENCE) {
              expect(tokenInfo.isWhitespace()).assertTrue();
              isXml = true
            }
            return true;
          }
        });
        expect(isXml).assertTrue();

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASEDATE_PARSEINFO_ISWHITESPACE_1600
     * @tc.name      IsWhitespaceTest0016
     * @tc.desc      Text nodes in mixed content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('IsWhitespaceTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'IsWhitespaceTest0016';
        console.log(TAG + ' start');
          const xmlData = `<mix>
<!-- Mixed Content Annotation -->
Core business data: 10001
<sub>Sub element</sub>
</mix>`;
          const encoder = new util.TextEncoder();
          const xmlBuffer = encoder.encodeInto(xmlData).buffer as ArrayBuffer;
          new xml.XmlPullParser(xmlBuffer, 'UTF-8').parseXml({
            tokenValueCallbackFunction: (t, i) => {
              if (t === xml.EventType.TEXT) {
                const text = i.getText();
                if (text.includes('Core business data')) {
                  expect(i.isWhitespace()).assertFalse();
                  isXml = true;
                }
              }
              return true;
            }
          });
          expect(isXml).assertTrue()

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASEDATE_PARSEINFO_ISWHITESPACE_1700
     * @tc.name      IsWhitespaceTest0017
     * @tc.desc      Text nodes in empty elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('IsWhitespaceTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'IsWhitespaceTest0017';
        console.log(TAG + ' start');
          const xmlData = `<container>
  <empty-node />
  non-empty-text
</container>`;
          const encoder = new util.TextEncoder();
          const xmlBuffer = encoder.encodeInto(xmlData).buffer as ArrayBuffer;

          new xml.XmlPullParser(xmlBuffer, 'UTF-8').parseXml({
            tokenValueCallbackFunction: (t, i) => {
              if (t === xml.EventType.TEXT && i.getText().trim() !== '') {
                expect(i.isWhitespace()).assertFalse();
                isXml = true
              }
              return true;
            }
          });
          expect(isXml).assertTrue()

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASEDATE_PARSEINFO_ISWHITESPACE_1800
     * @tc.name      IsWhitespaceTest0018
     * @tc.desc      Pure visible character verification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('IsWhitespaceTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'IsWhitespaceTest0018';
        console.log(TAG + ' start');
          const xmlData = `<root>TextWith\u00A0NonBreakingSpace</root>`;
          new xml.XmlPullParser(
            new util.TextEncoder().encodeInto(xmlData).buffer as ArrayBuffer
          ).parseXml({
            tokenValueCallbackFunction: (t, i) => {
              if (t === xml.EventType.TEXT) {
                expect(i.isWhitespace()).assertFalse();
                isXml = true
              }
              return true;
            }
          });
        expect(isXml).assertTrue()

      });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASEDATE_PARSEINFO_ISWHITESPACE_1900
     * @tc.name      IsWhitespaceTest0019
     * @tc.desc      Empty element (self-closing)  Leading whitespace  Trailing non-whitespace text combination
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('IsWhitespaceTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'IsWhitespaceTest0019';
        console.log(TAG + ' start');
          const xmlData = `<container>
                            \n
                            <empty-elem />
                            Post non blank text005
                          </container>`;
          new xml.XmlPullParser(
            new util.TextEncoder().encodeInto(xmlData).buffer as ArrayBuffer
          ).parseXml({
            tokenValueCallbackFunction: (t, i) => {
              if (t === xml.EventType.TEXT && i.getText().trim() === '' && i.getDepth() === 2) {
                expect(i.isWhitespace()).assertTrue();
                isXml = true
              }
              if (t === xml.EventType.TEXT && i.getText().trim() === 'Post non blank text005') {
                expect(i.isWhitespace()).assertFalse();
                isXml = true
              }
              return true;
            }
          });
        expect(isXml).assertTrue()

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASEDATE_PARSEINFO_ISWHITESPACE_2000
     * @tc.name      IsWhitespaceTest0020
     * @tc.desc      Effectively process instructions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('IsWhitespaceTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'IsWhitespaceTest0020';
        console.log(TAG + ' start');
          const xmlData = `<a>  <b>\n\t</b>  </a>`;
          new xml.XmlPullParser(
            new util.TextEncoder().encodeInto(xmlData).buffer as ArrayBuffer
          ).parseXml({
            tokenValueCallbackFunction: (t, i) => {
              if (t === xml.EventType.TEXT) {
                const isWhitespaceExpected = i.getText().trim().length === 0;
                expect(i.isWhitespace()).assertEqual(isWhitespaceExpected);
                isXml = true
              }
              return true;
            }
          });
        expect(isXml).assertTrue()

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASEDATE_PARSEINFO_ISWHITESPACE_2100
     * @tc.name      IsWhitespaceTest0021
     * @tc.desc      Valid comment content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('IsWhitespaceTest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'IsWhitespaceTest0021';
        console.log(TAG + ' start');
        const xmlData = `<root>  5  </root>`;
        new xml.XmlPullParser(
          new util.TextEncoder().encodeInto(xmlData).buffer as ArrayBuffer
        ).parseXml({
          tokenValueCallbackFunction: (t, i) => {
            if (t === xml.EventType.TEXT) {
              expect(i.isWhitespace()).assertFalse();
              isXml = true
            }
            return true;
          }
        });
        expect(isXml).assertTrue()

      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASEDATE_PARSEINFO_ISWHITESPACE_2400
     * @tc.name      IsWhitespaceTest0024
     * @tc.desc      Namespace declaration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('IsWhitespaceTest0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'IsWhitespaceTest0024';
        console.log(TAG + ' start');
          const xmlData = `<root attr=" value "/>`;
          const encoder = new util.TextEncoder();
          const xmlBuffer = encoder.encodeInto(xmlData).buffer as ArrayBuffer;
          new xml.XmlPullParser(xmlBuffer, 'UTF-8').parseXml({
            attributeValueCallbackFunction: (name, value) => {
              const trimLength = value.trim().length;
              expect(trimLength > 0).assertTrue();
              isXml = true
              return true;
            }
          });
          expect(isXml).assertTrue()

      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEDATE_PARSEINFO_GETATTRIBUTECOUNT_0100
     * @tc.name getAttributeCountTest0001
     * @tc.desc Element with no attributes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('getAttributeCountTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getAttributeCountTest0001';
        console.log(TAG + ' start');
        const xmlStr = `<root></root>`;
        let textEncoder = new util.TextEncoder();
        let uint8 = textEncoder.encodeInto(xmlStr);
        let that = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);
        let attrCount: int = -1;

        that.parseXml({
          tokenValueCallbackFunction: (event: xml.EventType, info: xml.ParseInfo): boolean => {
            if (event === xml.EventType.START_TAG && info.getName() === 'root') {
              attrCount = info.getAttributeCount();
            }
            return true;
          }
        });

        expect(attrCount).assertEqual(0);

      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEDATE_PARSEINFO_GETATTRIBUTECOUNT_0200
     * @tc.name getAttributeCountTest0002
     * @tc.desc Single-attribute element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('getAttributeCountTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getAttributeCountTest0002';
        console.log(TAG + ' start');

        const xmlStr = `<user name="Alice"></user>`;
        let textEncoder = new util.TextEncoder();
        let uint8 = textEncoder.encodeInto(xmlStr);
        let that = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);
        let attrCount: int = -1;

        that.parseXml({
          tokenValueCallbackFunction: (event: xml.EventType, info: xml.ParseInfo): boolean => {
            if (event === xml.EventType.START_TAG && info.getName() === 'user') {
              attrCount = info.getAttributeCount();
            }
            return true;
          }
        });

        expect(attrCount).assertEqual(1);

      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEDATE_PARSEINFO_GETATTRIBUTECOUNT_0300
     * @tc.name getAttributeCountTest0003
     * @tc.desc Multi-attribute element (3 attributes)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('getAttributeCountTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getAttributeCountTest0003';
        console.log(TAG + ' start');

        const xmlStr = `<book id="101" title="XML Tutorial" price="39.9"></book>`;
        let textEncoder = new util.TextEncoder();
        let uint8 = textEncoder.encodeInto(xmlStr);
        let that = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);
        let attrCount: int = -1;

        that.parseXml({
          tokenValueCallbackFunction: (event: xml.EventType, info: xml.ParseInfo): boolean => {
            if (event === xml.EventType.START_TAG && info.getName() === 'book') {
              attrCount = info.getAttributeCount();
            }
            return true;
          }
        });

        expect(attrCount).assertEqual(3);

      });


     /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEDATE_PARSEINFO_GETATTRIBUTECOUNT_0400
     * @tc.name getAttributeCountTest0004
     * @tc.desc Attribute count of nested elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('getAttributeCountTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getAttributeCountTest0004';
        console.log(TAG + ' start');
        const xmlStr = `<root><child a="x" b="y"></child><child2></child2></root>`;
        let textEncoder = new util.TextEncoder();
        let uint8 = textEncoder.encodeInto(xmlStr);
        let that = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);
        let childCount: int = -1;
        let child2Count: int = -1;

        that.parseXml({
          tokenValueCallbackFunction: (event: xml.EventType, info: xml.ParseInfo): boolean => {
            if (event === xml.EventType.START_TAG) {
              if (info.getName() === 'child') {
                childCount = info.getAttributeCount();
              } else if (info.getName() === 'child2') {
                child2Count = info.getAttributeCount();
              }
            }
            return true;
          }
        });

        expect(childCount).assertEqual(2);
        expect(child2Count).assertEqual(0);

      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEDATE_PARSEINFO_GETATTRIBUTECOUNT_0500
     * @tc.name getAttributeCountTest0005
     * @tc.desc Called in a text node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('getAttributeCountTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getAttributeCountTest0005';
        console.log(TAG + ' start');

        const xmlStr = `<root attr="val">Text content</root>`;
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(xmlStr);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
        let rootAttrCount: int = -1;
        let textAttrCount: int = -1;

        that.parseXml({
          tokenValueCallbackFunction: (event: xml.EventType, info: xml.ParseInfo): boolean => {
            if (event === xml.EventType.START_TAG && info.getName() === 'root') {
              rootAttrCount = info.getAttributeCount();
            }
            if (event === xml.EventType.TEXT) {
              textAttrCount = info.getAttributeCount();
            }
            return true;
          }
        });

        expect(rootAttrCount).assertEqual(1);
        expect(textAttrCount).assertEqual(0);

      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEDATE_PARSEINFO_GETATTRIBUTECOUNT_0600
     * @tc.name getAttributeCountTest0006
     * @tc.desc Called in the comment node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('getAttributeCountTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getAttributeCountTest0006';
        console.log(TAG + ' start');

        const xmlStr = `<!-- This is a comment --><root></root>`;
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(xmlStr);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
        let commentAttrCount: int = -1;
        let rootAttrCount: int = -1;

        that.parseXml({
          tokenValueCallbackFunction: (event: xml.EventType, info: xml.ParseInfo): boolean => {
            if (event === xml.EventType.COMMENT) {
              commentAttrCount = info.getAttributeCount();
            }
            if (event === xml.EventType.START_TAG && info.getName() === 'root') {
              rootAttrCount = info.getAttributeCount();
            }
            return true;
          }
        });

        expect(commentAttrCount).assertEqual(0);
        expect(rootAttrCount).assertEqual(0);

      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEDATE_PARSEINFO_GETATTRIBUTECOUNT_0700
     * @tc.name getAttributeCountTest0007
     * @tc.desc Called in DOCTYPE declaration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('getAttributeCountTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getAttributeCountTest0007';
        console.log(TAG + ' start');

        const xmlStr = `<?xml version="1.0"?><!DOCTYPE html><root attr="val"></root>`;
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(xmlStr);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
        let rootAttrCount: int = -1;

        that.parseXml({
          tokenValueCallbackFunction: (event: xml.EventType, info: xml.ParseInfo): boolean => {
            if (event === xml.EventType.START_TAG && info.getName() === 'root') {
              rootAttrCount = info.getAttributeCount();
            }
            return true;
          }
        });

        expect(rootAttrCount).assertEqual(1);

      });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASEDATE_PARSEINFO_GETATTRIBUTECOUNT_0800
     * @tc.name  getAttributeCountTest0008
     * @tc.desc  Call getAttributeCount after parsing is interrupted
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level  Level 2
     */
    it('getAttributeCountTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getAttributeCountTest0008';
        console.log(`${TAG}  start`);
        const xmlStr = `<root a="1" b="2">`;
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(xmlStr);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
        let attrCount: int = -1;

        that.parseXml({
          tokenValueCallbackFunction: (event: xml.EventType, info: xml.ParseInfo): boolean => {
            if (event === xml.EventType.START_TAG && info.getName() === 'root') {
              attrCount = info.getAttributeCount();
            }
            return true;
          }
        });

        expect(attrCount).assertEqual(2);

      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEDATE_PARSEINFO_GETATTRIBUTECOUNT_0900
     * @tc.name getAttributeCountTest0009
     * @tc.desc Comparison of Attribute Counts Between Parent and Child Elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('getAttributeCountTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const TAG = 'getAttributeCountTest0009';
        console.log(TAG + ' start');
        const xmlStr = `<parent p1="v1" p2="v2"><child c1="v3"></child><empty></empty></parent>`;
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(xmlStr);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
        let parentCount: int = -1;
        let childCount: int = -1;
        let emptyCount: int = -1;

        that.parseXml({
          tokenValueCallbackFunction: (event: xml.EventType, info: xml.ParseInfo): boolean => {
            if (event === xml.EventType.START_TAG) {
              if (info.getName() === 'parent') {
                parentCount = info.getAttributeCount();
              } else if (info.getName() === 'child') {
                childCount = info.getAttributeCount();
              } else if (info.getName() === 'empty') {
                emptyCount = info.getAttributeCount();
              }
            }
            return true;
          }
        });

        expect(parentCount).assertEqual(2);
        expect(childCount).assertEqual(1);
        expect(emptyCount).assertEqual(0);

      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEDATE_PARSEINFO_GETATTRIBUTECOUNT_1000
     * @tc.name getAttributeCountTest0010
     * @tc.desc Attribute Count Attribute Value Retrieval Combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('getAttributeCountTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'getAttributeCountTest0010';
        console.log(TAG + ' start');

        const xmlStr = `<user id="100" name="Charlie" age="30"></user>`;
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(xmlStr);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
        let attrCount: int = -1;

        that.parseXml({
          tokenValueCallbackFunction: (event: xml.EventType, info: xml.ParseInfo): boolean => {
            if (event === xml.EventType.START_TAG && info.getName() === 'user') {
              attrCount = info.getAttributeCount();
            }
            return true;
          }
        });

        expect(attrCount).assertEqual(3);

      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEDATE_PARSEINFO_GETATTRIBUTECOUNT_1100
     * @tc.name getAttributeCountTest0011
     * @tc.desc Conditional Analysis (Count Specific Elements Only)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('getAttributeCountTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'getAttributeCountTest0011';
        console.log(TAG + ' start');
        const xmlStr = `<data><item type="num" value="10"></item><item type="str" value="hello"></item><item></item></data>`;
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(xmlStr);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
        let counts: number[] = [];

        that.parseXml({
          tokenValueCallbackFunction: (event: xml.EventType, info: xml.ParseInfo): boolean => {
            if (event === xml.EventType.START_TAG && info.getName() === 'item') {
              counts.push(info.getAttributeCount());
            }
            return true;
          }
        });

        expect(counts.length).assertEqual(3);
        expect(counts[0]).assertEqual(2);
        expect(counts[1]).assertEqual(2);
        expect(counts[2]).assertEqual(0);

      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEDATE_PARSEINFO_GETATTRIBUTECOUNT_1200
     * @tc.name getAttributeCountTest0012
     * @tc.desc Correct analysis and incorrect analysis mixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('getAttributeCountTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const TAG = 'getAttributeCountTest0012';
        console.log(TAG + ' start');
        const xmlStr = `<root><valid a="1" b="2"></valid></root>`;
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(xmlStr);
        let that = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer);
        let validCount: int = -1;

        that.parseXml({
          tokenValueCallbackFunction: (event: xml.EventType, info: xml.ParseInfo): boolean => {
            if (event === xml.EventType.START_TAG && info.getName() === 'valid') {
              validCount = info.getAttributeCount();
            }
            return true;
          }
        });

        expect(validCount).assertEqual(2);

      });
  })
}
