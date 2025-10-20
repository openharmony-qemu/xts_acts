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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  TestType,
  Size,
  Level
} from "../../../hypium/index";
import drawing from '@ohos.graphics.drawing';
import FaultLogger from '@ohos.faultLogger';
import { getRandomNumber } from './Util.test';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function fontPart3Test() {
  describe('DrawingTsFontPart3Test', () => {
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
//----用例报错----待和开发确认
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_2000
     * @tc.name      : testFontTextToGlyphsNormalStatic
     * @tc.desc      : Test for testFontTextToGlyphsNormalStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testFontTextToGlyphsNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testFontTextToGlyphsNormalStatic';
      let font = new drawing.Font();

      try {
        let glyphs: int[] | undefined = font.textToGlyphs('奇8龍@Fly#龘2023!*你好');
        if (glyphs) {
          expect(glyphs.length == 17).assertTrue();
          console.info(msg + ' textToGlyphs1 successed,glyphs:' + glyphs.length);
        }
      } catch (e: BusinessError) {
        console.info(msg + ` textToGlyphs1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let resultNumber: int = font.countText('奇8龍@Fly#龘2023!*你好');
        console.info(msg + " textToGlyphs2 count text number: " + resultNumber);
        let glyphs: int[] | undefined = font.textToGlyphs('奇8龍@Fly#龘2023!*你好', resultNumber);
        if (glyphs) {
          expect(glyphs.length == 17).assertTrue();
          console.info(msg + ' textToGlyphs2 successed,glyphs:' + glyphs.length);
        }
      } catch (e: BusinessError) {
        console.info(msg + ` textToGlyphs2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let resultNumber: int = font.countText("");
        console.info(msg + " textToGlyphs5 count text number: " + resultNumber);
        let glyphs: int[] | undefined = font.textToGlyphs("", resultNumber);
        if (glyphs) {
          console.info(msg + ' textToGlyphs5 successed,glyphs:' + glyphs);
          expect(glyphs.length == 0).assertEqual(true);
        }
      } catch (e: BusinessError) {
        console.info(msg + ` textToGlyphs5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_2001
     * @tc.name      : testFontTextToGlyphsNullStatic
     * @tc.desc      : Test for testFontTextToGlyphsNullStatic
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontTextToGlyphsNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testFontTextToGlyphsNullStatic';
      let font = new drawing.Font();
      try {
        font.textToGlyphs('奇8龍@Fly#龘2023!*你好', undefined);
        console.info(msg + ' textToGlyphs succeeded');
      } catch (e: BusinessError) {
        console.info(msg + ` textToGlyphs errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });
//---用例报错---待和开发确认
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_2003
     * @tc.name      : testFontTextToGlyphsMultipleCallsStatic
     * @tc.desc      : Test for testFontTextToGlyphsMultipleCallsStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontTextToGlyphsMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testFontTextToGlyphsMultipleCallsStatic';
      let font = new drawing.Font();
      const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

      for (let i = 0; i < 20; i++) {
        let randomString = ''
        for (let j = 0; j < 10; j++) {
          randomString += characters.charAt(Math.floor(Math.random() * characters.length).toInt())+ '';
        }
        try {
          let resultNumber: int = font.countText(randomString);
          console.info(msg + " count text number: " + resultNumber);
          let glyphs: int[] | undefined = font.textToGlyphs(randomString, resultNumber);
          if (glyphs) {
            expect(glyphs.length == 10).assertTrue();
            console.info(msg + ' textToGlyphs successed,glyphs:' + glyphs.length);
          }
        } catch (e: BusinessError) {
          console.info(msg + ` textToGlyphs errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_2004
     * @tc.name      : testFontTextToGlyphsAbNormalStatic
     * @tc.desc      : Test for testFontTextToGlyphsAbNormalStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontTextToGlyphsAbNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testFontTextToGlyphsAbNormalStatic';
      let font = new drawing.Font();

      try {
        let glyphs: int[] | undefined = font.textToGlyphs('奇8龍@Fly#龘2023!*你好', 15);
        console.info(msg + ' textToGlyphs succeeded');
      } catch (e: BusinessError) {
        console.info(msg + ` textToGlyphs errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let glyphs: int[] | undefined = font.textToGlyphs('奇8龍@Fly#龘2023!*你好', 20);
        console.info(msg + ' textToGlyphs succeeded');
      } catch (e: BusinessError) {
        console.info(msg + ` textToGlyphs errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let glyphs: int[] | undefined = font.textToGlyphs("", -1);
        console.info(msg + ' textToGlyphs succeeded');
      } catch (e: BusinessError) {
        console.info(msg + ` textToGlyphs errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_2100
     * @tc.name      : testFontGetWidthsNormalStatic
     * @tc.desc      : Test for testFontGetWidthsNormalStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testFontGetWidthsNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testFontGetWidthsNormalStatic';
      let font = new drawing.Font();

      try {
        let widths: number[] | undefined = font.getWidths([0]);
        if (widths) {
          expect(widths.length == 1).assertTrue();
          console.info(msg + ' getWidths successed,widths:' + widths.length);
        }
      } catch (e: BusinessError) {
        console.info(msg + ` getWidths errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let widths: number[] | undefined = font.getWidths([]);
        expect(widths == undefined).assertTrue();
        console.info(msg + ' getWidths successed,widths:' + widths);
      } catch (e: BusinessError) {
        console.info(msg + ` getWidths errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_2103
     * @tc.name      : testFontGetWidthsMultipleCallsStatic
     * @tc.desc      : Test for testFontGetWidthsMultipleCallsStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontGetWidthsMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testFontGetWidthsMultipleCallsStatic';
      let font = new drawing.Font();

      for (let i = 0; i < 20; i++) {
        try {
          font.getWidths([getRandomNumber(1, 100).toInt()]);
          console.info(msg + ' getWidths successed');
        } catch (e: BusinessError) {
          console.info(msg + ` getWidths errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_2200
     * @tc.name      : testFontGetBoundsNormalStatic
     * @tc.desc      : Test for testFontGetBoundsNormalStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testFontGetBoundsNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testFontGetWidthsNormalStatic';
      let font = new drawing.Font();

      try {
        let bounds: common2D.Rect[] | undefined = font.getBounds([0]);
        if (bounds) {
          expect(bounds.length == 1).assertTrue();
          console.info(msg + ' getBounds successed,bounds:' + bounds.length);
        }
      } catch (e: BusinessError) {
        console.info(msg + ` getBounds errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let bounds: common2D.Rect[] | undefined = font.getBounds([(Number.MAX_VALUE).toInt()]);
        if (bounds) {
          expect(bounds.length == 1).assertTrue();
          console.info(msg + ' getBounds successed,bounds:' + bounds.length);
        }
      } catch (e: BusinessError) {
        console.info(msg + ` getBounds errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let bounds: common2D.Rect[] | undefined = font.getBounds([(Number.MIN_VALUE).toInt()]);
        if (bounds) {
          expect(bounds.length == 1).assertTrue();
          console.info(msg + ' getBounds successed,bounds:' + bounds.length);
        }
      } catch (e: BusinessError) {
        console.info(msg + ` getBounds errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let bounds: common2D.Rect[] | undefined = font.getBounds([]);
      } catch (e: BusinessError) {
        console.info(msg + ` getBounds errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_2203
     * @tc.name      : testFontGetBoundsMultipleCallsStatic
     * @tc.desc      : Test for testFontGetBoundsMultipleCallsStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontGetBoundsMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testFontGetBoundsMultipleCallsStatic';
      let font = new drawing.Font();

      for (let i = 0; i < 20; i++) {
        try {
          let bounds: common2D.Rect[] | undefined = font.getBounds([getRandomNumber(1, 100).toInt()]);
          if (bounds) {
            expect(bounds.length == 1).assertTrue();
            console.info(msg + ' getBounds successed');
          }
        } catch (e: BusinessError) {
          console.info(msg + ` getBounds errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
//----用例报错---待和开发确认
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_2300
     * @tc.name      : testFontCreatePathForGlyphNormalStatic
     * @tc.desc      : Test for testFontCreatePathForGlyphNormalStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testFontCreatePathForGlyphNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testFontCreatePathForGlyphNormalStatic';
      let font = new drawing.Font();

      try {
        let glyphs: int[] | undefined = font.textToGlyphs('hello');
        if (glyphs) {
          let path: drawing.Path | undefined = font.createPathForGlyph(glyphs[0]);
          if (path) {
            expect(path.getLength(false) > 0).assertTrue();
            console.info(msg + ' createPathForGlyph successed,path length:' + path.getLength(false));
          }
        }
      } catch (e: BusinessError) {
        console.info(msg + ` createPathForGlyph errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let glyphs: int[] | undefined = font.textToGlyphs(' ');
        if (glyphs) {
          let path: drawing.Path | undefined = font.createPathForGlyph(glyphs[0]);
          if (path) {
            let result = path.getLength(false);
            expect(path.getLength(false) == 0).assertTrue();
            console.info(msg + ' createPathForGlyph successed,path length:' + result);
          }
        }
      } catch (e: BusinessError) {
        console.info(msg + ` createPathForGlyph errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let path: drawing.Path | undefined = font.createPathForGlyph((Number.MAX_VALUE).toInt());
        console.info(msg + ` createPathForGlyph Number.MAX_VALUE path is:  ${path}`);
        expect(path != undefined).assertTrue();
      } catch (e: BusinessError) {
        console.info(msg + ` createPathForGlyph errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let path: drawing.Path | undefined = font.createPathForGlyph((Number.MIN_VALUE).toInt());
        console.info(msg + ` createPathForGlyph Number.MIN_VALUE path is:  ${path}`);
        expect(path != undefined).assertTrue();
      } catch (e: BusinessError) {
        console.info(msg + ` createPathForGlyph errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let path: drawing.Path | undefined = font.createPathForGlyph(65535);
        console.info(msg + ` createPathForGlyph 65535 path is:  ${path}`);
        expect(path == undefined).assertTrue();
      } catch (e: BusinessError) {
        console.info(msg + ` createPathForGlyph errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_2303
     * @tc.name      : testFontCreatePathForGlyphMultipleCallsStatic
     * @tc.desc      : Test for testFontCreatePathForGlyphMultipleCallsStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontCreatePathForGlyphMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testFontCreatePathForGlyphMultipleCallsStatic';
      let font = new drawing.Font();

      for (let i = 0; i < 20; i++) {
        try {
          let path: drawing.Path | undefined = font.createPathForGlyph(getRandomNumber(1, 100).toInt());
          expect(path != undefined).assertTrue();
          console.info(msg + ' createPathForGlyph successed');
        } catch (e: BusinessError) {
          console.info(msg + ` createPathForGlyph errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_2203
     * @tc.name      : testFontSetAndIsThemeFontFollowedMultipleCallsStatic
     * @tc.desc      : Test for testFontSetAndIsThemeFontFollowedMultipleCallsStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontSetAndIsThemeFontFollowedMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testFontSetAndIsThemeFontFollowedMultipleCallsStatic';
      let font = new drawing.Font();
      let followed: boolean = false;
      for (let i = 0; i < 20; i++) {
        followed = !followed;
        font.setThemeFontFollowed(followed);
        let finallyFollowed: boolean = font.isThemeFontFollowed()
        console.info(msg + "font is theme font followed: " + finallyFollowed);
        expect(finallyFollowed).assertEqual(followed);
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_2200
     * @tc.name      : testFontSetAndIsThemeFontFollowedNormalStatic
     * @tc.desc      : Test for testFontSetAndIsThemeFontFollowedNormalStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontSetAndIsThemeFontFollowedNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testFontSetAndIsThemeFontFollowedNormalStatic';
      let font = new drawing.Font();
      let initialFollowed: boolean = font.isThemeFontFollowed()
      console.info(msg + "Initial value font is theme font followed: " + initialFollowed);
      expect(initialFollowed).assertEqual(false);
      font.setThemeFontFollowed(true);
      let followed: boolean = font.isThemeFontFollowed()
      console.info(msg + "followed is: " + followed);
      expect(followed).assertEqual(true);
      font.setThemeFontFollowed(false);
      let followed2: boolean = font.isThemeFontFollowed()
      console.info(msg + "followed2 is: " + followed2);
      expect(followed2).assertEqual(false);
    });
  });
}
