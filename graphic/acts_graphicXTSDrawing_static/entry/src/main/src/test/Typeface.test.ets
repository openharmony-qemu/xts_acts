/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from "../../../hypium/index";
import drawing from '@ohos.graphics.drawing';
import { BusinessError } from '@ohos.base';

export default function typefaceTest() {
  describe('DrawingTsTypeFaceTest', () => {
    const DEFAULT = 0;
    const FONT_PATH = "/system/fonts/Harmon" + "yOS_Sans_Italic.ttf";

    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {

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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_STATIC_0100
     * @tc.name      : testTypeFaceGetFamilyNameNormalStatic
     * @tc.desc      : Test for testTypeFaceGetFamilyNameNormalStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testTypeFaceGetFamilyNameNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testTypeFaceGetFamilyNameNormalStatic';
      try {
        let font = new drawing.Font();
        let typeface = font.getTypeface();
        if(typeface){
          typeface.getFamilyName();
          console.info(msg + ' getFamilyName successed');
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getFamilyName errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_STATIC_0102
     * @tc.name      : testTypeFaceGetFamilyNameMultipleCallsStatic
     * @tc.desc      : Test for testTypeFaceGetFamilyNameMultipleCallsStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTypeFaceGetFamilyNameMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testTypeFaceGetFamilyNameMultipleCallsStatic';

      let font = new drawing.Font();
      let typeface = font.getTypeface();
      if(typeface){
        for (let i = 0; i < 20; i++) {
          try {
            typeface.getFamilyName();
            console.info(msg + ' getFamilyName successed');
          } catch (e) {
            e = e as BusinessError;
            console.info(msg + ` getFamilyName errorCode is:  ${e.code} + errormsg is: ${e.message}`);
            expect().assertFail();
          }
        }
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_STATIC_0200
     * @tc.name      : testTypeFaceMakeFromFileNormalStatic
     * @tc.desc      : testTypeFaceMakeFromFileNormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testTypeFaceMakeFromFileNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const msg = 'testTypeFaceMakeFromFileNormalStatic';
      let font = new drawing.Font();
      try {
        let str = FONT_PATH;
        let mytypeface = drawing.Typeface.makeFromFile(str);
        mytypeface = drawing.Typeface.makeFromFile("");
        console.info(msg + ' test succeeded.');
      } catch (e: BusinessError) {
        console.info(msg + ` test failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_STATIC_0202
     * @tc.name      : testTypeFaceMakeFromFileMultipleCallsStatic
     * @tc.desc      : testTypeFaceMakeFromFileMultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTypeFaceMakeFromFileMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const msg = 'testTypeFaceMakeFromFileMultipleCallsStatic';
      let font = new drawing.Font();
      try {
        for (let i = 0; i < 20; i += 1) {
          let str = FONT_PATH;
          const mytypeface = drawing.Typeface.makeFromFile(str);
        }
        console.info(msg + ' test succeeded.');
      } catch (e: BusinessError) {
        console.info(msg + ` test failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_STATIC_0203
     * @tc.name      : testTypeFaceMakeFromFileAbnormalStatic
     * @tc.desc      : testTypeFaceMakeFromFileAbnormal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTypeFaceMakeFromFileAbnormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const msg = 'testTypeFaceMakeFromFileAbnormalStatic';
      try {
        const mytypeface = drawing.Typeface.makeFromFile("hello_world");
        console.info(msg + ' test failed.');
      } catch (e: BusinessError) {
        console.info(msg + ` test succeeded, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
      try {
        const mytypeface = drawing.Typeface.makeFromFile("/system/fonts/FakePath.ttf");
        console.info(msg + ' test failed.');
      } catch (e: BusinessError) {
        console.info(msg + ` test succeeded, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_STATIC_0302
     * @tc.name      : testTypeFaceMakeFromRawFileAbNormalStatic
     * @tc.desc      : testTypeFaceMakeFromRawFileAbNormalStatic
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTypeFaceMakeFromRawFileAbNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testTypeFaceMakeFromRawFileAbNormalStatic';
      try {
        const mytypeface: drawing.Typeface | undefined = drawing.Typeface.makeFromRawFile($rawfile('image.png'));
        console.info(msg + ' makeFromRawFile image.png success' + JSON.stringify(mytypeface));
        expect(mytypeface == null).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` makeFromRawFile image.png errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_STATIC_0301
     * @tc.name      : testTypeFaceMakeFromRawFileMultipleCallsStatic
     * @tc.desc      : testTypeFaceMakeFromRawFileMultipleCallsStatic
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTypeFaceMakeFromRawFileMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testTypeFaceMakeFromRawFileMultipleCallsStatic';
      try {
        for (let i = 0; i < 20; i += 1) {
          let mytypeface: drawing.Typeface | undefined =
            drawing.Typeface.makeFromRawFile($rawfile('HarmonyOS_Sans_Condensed.ttf'));
          console.info(msg + ' makeFromRawFile HarmonyOS_Sans_Condensed.ttf success' + JSON.stringify(mytypeface));
          if (mytypeface) {
            expect(!!mytypeface).assertTrue();
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeFromRawFile HarmonyOS_Sans_Condensed.ttf errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACE_STATIC_0300
     * @tc.name      : testTypeFaceMakeFromRawFileNormalStatic
     * @tc.desc      : testTypeFaceMakeFromRawFileNormalStatic
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTypeFaceMakeFromRawFileNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testTypeFaceMakeFromRawFileNormalStatic';
      try {
        let mytypeface: drawing.Typeface | undefined =
          drawing.Typeface.makeFromRawFile($rawfile('HarmonyOS_Sans_Condensed.ttf'));
        console.info(msg + ' makeFromRawFile HarmonyOS_Sans_Condensed.ttf success' + JSON.stringify(mytypeface));
        if (mytypeface) {
          expect(!!mytypeface).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeFromRawFile HarmonyOS_Sans_Condensed.ttf errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let mytypeface2: drawing.Typeface | undefined = drawing.Typeface.makeFromRawFile($rawfile('ttf/HarmonyOS_Sans_Condensed.ttf'));
        console.info(msg + ' makeFromRawFile ttf/HarmonyOS_Sans_Condensed.ttf success' + JSON.stringify(mytypeface2));
        if (mytypeface2) {
          expect(!!mytypeface2).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg +
          ` makeFromRawFile ttf/HarmonyOS_Sans_Condensed.ttf errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
  })
}