'use static';
/**
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
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";

import { BusinessError } from '@ohos.base';
import text from "@ohos.graphics.text";
import image from '@ohos.multimedia.image';
import drawing from '@ohos.graphics.drawing';

async function buildAndGetStrutStyle(strutStyle: text.StrutStyle): Promise<text.StrutStyle | undefined> {
  let paragraphStyle: text.ParagraphStyle = {
    strutStyle: strutStyle
  };
  let fontCollection: text.FontCollection = new text.FontCollection();
  let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
  paragraphBuilder.addText('Hello World');
  let paragraph: text.Paragraph = paragraphBuilder.build();
  await paragraph.layout(500);
  let resultStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
  console.info('====www data==== getParagraphStyle return ParagraphStyle: ' + JSON.stringify(resultStyle));
  let resultStrutStyle: text.StrutStyle | undefined = resultStyle.strutStyle;
  console.info('====www data==== getParagraphStyle return strutStyle: ' + JSON.stringify(resultStrutStyle));
  return resultStrutStyle;
}

async function buildAndGetTextTab(textTab: text.TextTab): Promise<text.TextTab | undefined> {
  let paragraphStyle: text.ParagraphStyle = {
    tab: textTab
  };
  let fontCollection: text.FontCollection = new text.FontCollection();
  let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
  paragraphBuilder.addText('Hello\tWorld');
  let paragraph: text.Paragraph = paragraphBuilder.build();
  await paragraph.layout(500);
  let resultStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
  console.info('====www data==== getParagraphStyle return ParagraphStyle: ' + JSON.stringify(resultStyle));
  let resultTab: text.TextTab | undefined = resultStyle.tab;
  console.info('====www data==== getParagraphStyle return tab: ' + JSON.stringify(resultTab));
  return resultTab;
}

export default function GraphicStrutStyle() {
  describe('GraphicStrutStyle', () => {

    /**
     * @tc.name   testStrutStyleFontStyleNormalStatic_0100
     * @tc.number SUB_GRAPHIC_StrutStyle_fontStyle_normal_static_0100
     * @tc.desc   Test StrutStyle.fontStyle with FontStyle.NORMAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleFontStyleNormalStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleFontStyleNormalStatic_0100====';
        console.info(msg + ' begin');
        try {
          let strutStyle: text.StrutStyle = {
            enabled: true,
            fontStyle: text.FontStyle.NORMAL
          };
          let result: text.StrutStyle | undefined = await buildAndGetStrutStyle(strutStyle);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle strutStyle.fontStyle=' + result.fontStyle);
            expect(result.fontStyle).assertEqual(text.FontStyle.NORMAL);
            console.info(msg + ' fontStyle=NORMAL passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleFontStyleItalicStatic_0200
     * @tc.number SUB_GRAPHIC_StrutStyle_fontStyle_italic_static_0200
     * @tc.desc   Test StrutStyle.fontStyle with FontStyle.ITALIC.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleFontStyleItalicStatic_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleFontStyleItalicStatic_0200====';
        console.info(msg + ' begin');
        try {
          let strutStyle: text.StrutStyle = {
            enabled: true,
            fontStyle: text.FontStyle.ITALIC
          };
          let result: text.StrutStyle | undefined = await buildAndGetStrutStyle(strutStyle);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle strutStyle.fontStyle=' + result.fontStyle);
            expect(result.fontStyle).assertEqual(text.FontStyle.ITALIC);
            console.info(msg + ' fontStyle=ITALIC passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleFontStyleObliqueStatic_0300
     * @tc.number SUB_GRAPHIC_StrutStyle_fontStyle_oblique_static_0300
     * @tc.desc   Test StrutStyle.fontStyle with FontStyle.OBLIQUE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleFontStyleObliqueStatic_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleFontStyleObliqueStatic_0300====';
        console.info(msg + ' begin');
        try {
          let strutStyle: text.StrutStyle = {
            enabled: true,
            fontStyle: text.FontStyle.OBLIQUE
          };
          let result: text.StrutStyle | undefined = await buildAndGetStrutStyle(strutStyle);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle strutStyle.fontStyle=' + result.fontStyle);
            expect(result.fontStyle).assertEqual(text.FontStyle.ITALIC);
            console.info(msg + ' fontStyle=OBLIQUE passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleFontStyleDefaultStatic_0400
     * @tc.number SUB_GRAPHIC_StrutStyle_fontStyle_default_static_0400
     * @tc.desc   Test StrutStyle.fontStyle with default (not set).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleFontStyleDefaultStatic_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleFontStyleDefaultStatic_0400====';
        console.info(msg + ' begin');
        try {
          let strutStyle: text.StrutStyle = {
            enabled: true
          };
          let result: text.StrutStyle | undefined = await buildAndGetStrutStyle(strutStyle);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle strutStyle.fontStyle=' + result.fontStyle);
            expect(result.fontStyle).assertEqual(text.FontStyle.NORMAL);
            console.info(msg + ' fontStyle=default passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleFontWeightW100Static_0100
     * @tc.number SUB_GRAPHIC_StrutStyle_fontWeight_w100_static_0100
     * @tc.desc   Test StrutStyle.fontWeight with FontWeight.W100.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleFontWeightW100Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleFontWeightW100Static_0100====';
        console.info(msg + ' begin');
        try {
          let strutStyle: text.StrutStyle = {
            enabled: true,
            fontWeight: text.FontWeight.W100
          };
          let result: text.StrutStyle | undefined = await buildAndGetStrutStyle(strutStyle);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle strutStyle.fontWeight=' + result.fontWeight);
            expect(result.fontWeight).assertEqual(text.FontWeight.W100);
            console.info(msg + ' fontWeight=W100 passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleFontWeightW200Static_0200
     * @tc.number SUB_GRAPHIC_StrutStyle_fontWeight_w200_static_0200
     * @tc.desc   Test StrutStyle.fontWeight with FontWeight.W200.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleFontWeightW200Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleFontWeightW200Static_0200====';
        console.info(msg + ' begin');
        try {
          let strutStyle: text.StrutStyle = {
            enabled: true,
            fontWeight: text.FontWeight.W200
          };
          let result: text.StrutStyle | undefined = await buildAndGetStrutStyle(strutStyle);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle strutStyle.fontWeight=' + result.fontWeight);
            expect(result.fontWeight).assertEqual(text.FontWeight.W200);
            console.info(msg + ' fontWeight=W200 passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleFontWeightW300Static_0300
     * @tc.number SUB_GRAPHIC_StrutStyle_fontWeight_w300_static_0300
     * @tc.desc   Test StrutStyle.fontWeight with FontWeight.W300.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleFontWeightW300Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleFontWeightW300Static_0300====';
        console.info(msg + ' begin');
        try {
          let strutStyle: text.StrutStyle = {
            enabled: true,
            fontWeight: text.FontWeight.W300
          };
          let result: text.StrutStyle | undefined = await buildAndGetStrutStyle(strutStyle);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle strutStyle.fontWeight=' + result.fontWeight);
            expect(result.fontWeight).assertEqual(text.FontWeight.W300);
            console.info(msg + ' fontWeight=W300 passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleFontWeightW400Static_0400
     * @tc.number SUB_GRAPHIC_StrutStyle_fontWeight_w400_static_0400
     * @tc.desc   Test StrutStyle.fontWeight with FontWeight.W400.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleFontWeightW400Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleFontWeightW400Static_0400====';
        console.info(msg + ' begin');
        try {
          let strutStyle: text.StrutStyle = {
            enabled: true,
            fontWeight: text.FontWeight.W400
          };
          let result: text.StrutStyle | undefined = await buildAndGetStrutStyle(strutStyle);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle strutStyle.fontWeight=' + result.fontWeight);
            expect(result.fontWeight).assertEqual(text.FontWeight.W400);
            console.info(msg + ' fontWeight=W400 passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleFontWeightW500Static_0500
     * @tc.number SUB_GRAPHIC_StrutStyle_fontWeight_w500_static_0500
     * @tc.desc   Test StrutStyle.fontWeight with FontWeight.W500.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleFontWeightW500Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleFontWeightW500Static_0500====';
        console.info(msg + ' begin');
        try {
          let strutStyle: text.StrutStyle = {
            enabled: true,
            fontWeight: text.FontWeight.W500
          };
          let result: text.StrutStyle | undefined = await buildAndGetStrutStyle(strutStyle);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle strutStyle.fontWeight=' + result.fontWeight);
            expect(result.fontWeight).assertEqual(text.FontWeight.W500);
            console.info(msg + ' fontWeight=W500 passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleFontWeightW600Static_0600
     * @tc.number SUB_GRAPHIC_StrutStyle_fontWeight_w600_static_0600
     * @tc.desc   Test StrutStyle.fontWeight with FontWeight.W600.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleFontWeightW600Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleFontWeightW600Static_0600====';
        console.info(msg + ' begin');
        try {
          let strutStyle: text.StrutStyle = {
            enabled: true,
            fontWeight: text.FontWeight.W600
          };
          let result: text.StrutStyle | undefined = await buildAndGetStrutStyle(strutStyle);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle strutStyle.fontWeight=' + result.fontWeight);
            expect(result.fontWeight).assertEqual(text.FontWeight.W600);
            console.info(msg + ' fontWeight=W600 passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleFontWeightW700Static_0700
     * @tc.number SUB_GRAPHIC_StrutStyle_fontWeight_w700_static_0700
     * @tc.desc   Test StrutStyle.fontWeight with FontWeight.W700.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleFontWeightW700Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleFontWeightW700Static_0700====';
        console.info(msg + ' begin');
        try {
          let strutStyle: text.StrutStyle = {
            enabled: true,
            fontWeight: text.FontWeight.W700
          };
          let result: text.StrutStyle | undefined = await buildAndGetStrutStyle(strutStyle);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle strutStyle.fontWeight=' + result.fontWeight);
            expect(result.fontWeight).assertEqual(text.FontWeight.W700);
            console.info(msg + ' fontWeight=W700 passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleFontWeightW800Static_0800
     * @tc.number SUB_GRAPHIC_StrutStyle_fontWeight_w800_static_0800
     * @tc.desc   Test StrutStyle.fontWeight with FontWeight.W800.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleFontWeightW800Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleFontWeightW800Static_0800====';
        console.info(msg + ' begin');
        try {
          let strutStyle: text.StrutStyle = {
            enabled: true,
            fontWeight: text.FontWeight.W800
          };
          let result: text.StrutStyle | undefined = await buildAndGetStrutStyle(strutStyle);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle strutStyle.fontWeight=' + result.fontWeight);
            expect(result.fontWeight).assertEqual(text.FontWeight.W800);
            console.info(msg + ' fontWeight=W800 passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleFontWeightW900Static_0900
     * @tc.number SUB_GRAPHIC_StrutStyle_fontWeight_w900_static_0900
     * @tc.desc   Test StrutStyle.fontWeight with FontWeight.W900.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleFontWeightW900Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleFontWeightW900Static_0900====';
        console.info(msg + ' begin');
        try {
          let strutStyle: text.StrutStyle = {
            enabled: true,
            fontWeight: text.FontWeight.W900
          };
          let result: text.StrutStyle | undefined = await buildAndGetStrutStyle(strutStyle);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle strutStyle.fontWeight=' + result.fontWeight);
            expect(result.fontWeight).assertEqual(text.FontWeight.W900);
            console.info(msg + ' fontWeight=W900 passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleFontWeightDefaultStatic_1000
     * @tc.number SUB_GRAPHIC_StrutStyle_fontWeight_default_static_1000
     * @tc.desc   Test StrutStyle.fontWeight with default (not set).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleFontWeightDefaultStatic_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleFontWeightDefaultStatic_1000====';
        console.info(msg + ' begin');
        try {
          let strutStyle: text.StrutStyle = {
            enabled: true
          };
          let result: text.StrutStyle | undefined = await buildAndGetStrutStyle(strutStyle);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle strutStyle.fontWeight=' + result.fontWeight);
            expect(result.fontWeight).assertEqual(text.FontWeight.W400);
            console.info(msg + ' fontWeight=default passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleFontSizeNormalStatic_0100
     * @tc.number SUB_GRAPHIC_StrutStyle_fontSize_normal_static_0100
     * @tc.desc   Test StrutStyle.fontSize with normal value 16.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleFontSizeNormalStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleFontSizeNormalStatic_0100====';
        console.info(msg + ' begin');
        try {
          let strutStyle: text.StrutStyle = {
            enabled: true,
            fontSize: 16.0
          };
          let result: text.StrutStyle | undefined = await buildAndGetStrutStyle(strutStyle);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle strutStyle.fontSize=' + result.fontSize);
            expect(result.fontSize).assertEqual(16.0);
            console.info(msg + ' fontSize=16.0 passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleFontSizeZeroStatic_0200
     * @tc.number SUB_GRAPHIC_StrutStyle_fontSize_zero_static_0200
     * @tc.desc   Test StrutStyle.fontSize with boundary value 0.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleFontSizeZeroStatic_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleFontSizeZeroStatic_0200====';
        console.info(msg + ' begin');
        try {
          let strutStyle: text.StrutStyle = {
            enabled: true,
            fontSize: 0.0
          };
          let result: text.StrutStyle | undefined = await buildAndGetStrutStyle(strutStyle);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle strutStyle.fontSize=' + result.fontSize);
            expect(result.fontSize).assertEqual(0.0);
            console.info(msg + ' fontSize=0.0 passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleFontSizeNegativeStatic_0300
     * @tc.number SUB_GRAPHIC_StrutStyle_fontSize_negative_static_0300
     * @tc.desc   Test StrutStyle.fontSize with negative value -1.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleFontSizeNegativeStatic_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleFontSizeNegativeStatic_0300====';
        console.info(msg + ' begin');
        try {
          let strutStyle: text.StrutStyle = {
            enabled: true,
            fontSize: -1.0
          };
          let result: text.StrutStyle | undefined = await buildAndGetStrutStyle(strutStyle);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle strutStyle.fontSize=' + result.fontSize);
            expect(result.fontSize).assertEqual(-1.0);
            console.info(msg + ' fontSize=-1.0 passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleFontSizeExtremeStatic_0400
     * @tc.number SUB_GRAPHIC_StrutStyle_fontSize_extreme_static_0400
     * @tc.desc   Test StrutStyle.fontSize with extreme value 1000.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleFontSizeExtremeStatic_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleFontSizeExtremeStatic_0400====';
        console.info(msg + ' begin');
        try {
          let strutStyle: text.StrutStyle = {
            enabled: true,
            fontSize: 1000.0
          };
          let result: text.StrutStyle | undefined = await buildAndGetStrutStyle(strutStyle);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle strutStyle.fontSize=' + result.fontSize);
            expect(result.fontSize).assertEqual(1000.0);
            console.info(msg + ' fontSize=1000.0 passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleFontSizeDefaultStatic_0500
     * @tc.number SUB_GRAPHIC_StrutStyle_fontSize_default_static_0500
     * @tc.desc   Test StrutStyle.fontSize with default (not set).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleFontSizeDefaultStatic_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleFontSizeDefaultStatic_0500====';
        console.info(msg + ' begin');
        try {
          let strutStyle: text.StrutStyle = {
            enabled: true
          };
          let result: text.StrutStyle | undefined = await buildAndGetStrutStyle(strutStyle);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle strutStyle.fontSize=' + result.fontSize);
            expect(result.fontSize).assertEqual(14);
            console.info(msg + ' fontSize=default passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleHeightNormalStatic_0100
     * @tc.number SUB_GRAPHIC_StrutStyle_height_normal_static_0100
     * @tc.desc   Test StrutStyle.height with normal value 1.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleHeightNormalStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleHeightNormalStatic_0100====';
        console.info(msg + ' begin');
        try {
          let strutStyle: text.StrutStyle = {
            enabled: true,
            height: 1.0
          };
          let result: text.StrutStyle | undefined = await buildAndGetStrutStyle(strutStyle);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle strutStyle.height=' + result.height);
            expect(result.height).assertEqual(1.0);
            console.info(msg + ' height=1.0 passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleHeightDoubleStatic_0200
     * @tc.number SUB_GRAPHIC_StrutStyle_height_double_static_0200
     * @tc.desc   Test StrutStyle.height with normal value 2.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleHeightDoubleStatic_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleHeightDoubleStatic_0200====';
        console.info(msg + ' begin');
        try {
          let strutStyle: text.StrutStyle = {
            enabled: true,
            height: 2.0
          };
          let result: text.StrutStyle | undefined = await buildAndGetStrutStyle(strutStyle);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle strutStyle.height=' + result.height);
            expect(result.height).assertEqual(2.0);
            console.info(msg + ' height=2.0 passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleHeightZeroStatic_0300
     * @tc.number SUB_GRAPHIC_StrutStyle_height_zero_static_0300
     * @tc.desc   Test StrutStyle.height with boundary value 0.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleHeightZeroStatic_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleHeightZeroStatic_0300====';
        console.info(msg + ' begin');
        try {
          let strutStyle: text.StrutStyle = {
            enabled: true,
            height: 0.0
          };
          let result: text.StrutStyle | undefined = await buildAndGetStrutStyle(strutStyle);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle strutStyle.height=' + result.height);
            expect(result.height).assertEqual(0.0);
            console.info(msg + ' height=0.0 passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleHeightNegativeStatic_0400
     * @tc.number SUB_GRAPHIC_StrutStyle_height_negative_static_0400
     * @tc.desc   Test StrutStyle.height with negative value -1.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleHeightNegativeStatic_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleHeightNegativeStatic_0400====';
        console.info(msg + ' begin');
        try {
          let strutStyle: text.StrutStyle = {
            enabled: true,
            height: -1.0
          };
          let result: text.StrutStyle | undefined = await buildAndGetStrutStyle(strutStyle);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle strutStyle.height=' + result.height);
            expect(result.height).assertEqual(-1.0);
            console.info(msg + ' height=-1.0 passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleHeightDefaultStatic_0500
     * @tc.number SUB_GRAPHIC_StrutStyle_height_default_static_0500
     * @tc.desc   Test StrutStyle.height with default (not set).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleHeightDefaultStatic_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleHeightDefaultStatic_0500====';
        console.info(msg + ' begin');
        try {
          let strutStyle: text.StrutStyle = {
            enabled: true
          };
          let result: text.StrutStyle | undefined = await buildAndGetStrutStyle(strutStyle);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle strutStyle.height=' + result.height);
            expect(result.height).assertEqual(1.0);
            console.info(msg + ' height=default passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleEnabledTrueStatic_0100
     * @tc.number SUB_GRAPHIC_StrutStyle_enabled_true_static_0100
     * @tc.desc   Test StrutStyle.enabled with value true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleEnabledTrueStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleEnabledTrueStatic_0100====';
        console.info(msg + ' begin');
        try {
          let strutStyle: text.StrutStyle = {
            enabled: true
          };
          let result: text.StrutStyle | undefined = await buildAndGetStrutStyle(strutStyle);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle strutStyle.enabled=' + result.enabled);
            expect(result.enabled).assertEqual(true);
            console.info(msg + ' enabled=true passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleEnabledFalseStatic_0200
     * @tc.number SUB_GRAPHIC_StrutStyle_enabled_false_static_0200
     * @tc.desc   Test StrutStyle.enabled with value false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleEnabledFalseStatic_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleEnabledFalseStatic_0200====';
        console.info(msg + ' begin');
        try {
          let strutStyle: text.StrutStyle = {
            enabled: false
          };
          let result: text.StrutStyle | undefined = await buildAndGetStrutStyle(strutStyle);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle strutStyle.enabled=' + result.enabled);
            expect(result.enabled).assertEqual(false);
            console.info(msg + ' enabled=false passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleEnabledDefaultStatic_0300
     * @tc.number SUB_GRAPHIC_StrutStyle_enabled_default_static_0300
     * @tc.desc   Test StrutStyle.enabled with default (not set).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleEnabledDefaultStatic_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleEnabledDefaultStatic_0300====';
        console.info(msg + ' begin');
        try {
          let strutStyle: text.StrutStyle = {};
          let result: text.StrutStyle | undefined = await buildAndGetStrutStyle(strutStyle);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle strutStyle.enabled=' + result.enabled);
            expect(result.enabled).assertFalse();
            console.info(msg + ' enabled=default passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleHalfLeadingTrueStatic_0100
     * @tc.number SUB_GRAPHIC_StrutStyle_halfLeading_true_static_0100
     * @tc.desc   Test StrutStyle.halfLeading with value true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleHalfLeadingTrueStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleHalfLeadingTrueStatic_0100====';
        console.info(msg + ' begin');
        try {
          let strutStyle: text.StrutStyle = {
            enabled: true,
            halfLeading: true
          };
          let result: text.StrutStyle | undefined = await buildAndGetStrutStyle(strutStyle);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle strutStyle.halfLeading=' + result.halfLeading);
            expect(result.halfLeading).assertEqual(true);
            console.info(msg + ' halfLeading=true passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleHalfLeadingFalseStatic_0200
     * @tc.number SUB_GRAPHIC_StrutStyle_halfLeading_false_static_0200
     * @tc.desc   Test StrutStyle.halfLeading with value false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleHalfLeadingFalseStatic_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleHalfLeadingFalseStatic_0200====';
        console.info(msg + ' begin');
        try {
          let strutStyle: text.StrutStyle = {
            enabled: true,
            halfLeading: false
          };
          let result: text.StrutStyle | undefined = await buildAndGetStrutStyle(strutStyle);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle strutStyle.halfLeading=' + result.halfLeading);
            expect(result.halfLeading).assertEqual(false);
            console.info(msg + ' halfLeading=false passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleHalfLeadingDefaultStatic_0300
     * @tc.number SUB_GRAPHIC_StrutStyle_halfLeading_default_static_0300
     * @tc.desc   Test StrutStyle.halfLeading with default (not set).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleHalfLeadingDefaultStatic_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleHalfLeadingDefaultStatic_0300====';
        console.info(msg + ' begin');
        try {
          let strutStyle: text.StrutStyle = {
            enabled: true
          };
          let result: text.StrutStyle | undefined = await buildAndGetStrutStyle(strutStyle);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle strutStyle.halfLeading=' + result.halfLeading);
            expect(result.halfLeading).assertFalse();
            console.info(msg + ' halfLeading=default passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleTextTabAlignmentLeftStatic_0100
     * @tc.number SUB_GRAPHIC_StrutStyle_textTab_alignment_left_static_0100
     * @tc.desc   Test TextTab.alignment with TextAlign.LEFT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleTextTabAlignmentLeftStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleTextTabAlignmentLeftStatic_0100====';
        console.info(msg + ' begin');
        try {
          let textTab: text.TextTab = {
            alignment: text.TextAlign.LEFT,
            location: 100
          };
          let result: text.TextTab | undefined = await buildAndGetTextTab(textTab);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle tab.alignment=' + result.alignment);
            expect(result.alignment).assertEqual(text.TextAlign.LEFT);
            console.info(msg + ' alignment=LEFT passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleTextTabAlignmentRightStatic_0200
     * @tc.number SUB_GRAPHIC_StrutStyle_textTab_alignment_right_static_0200
     * @tc.desc   Test TextTab.alignment with TextAlign.RIGHT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleTextTabAlignmentRightStatic_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleTextTabAlignmentRightStatic_0200====';
        console.info(msg + ' begin');
        try {
          let textTab: text.TextTab = {
            alignment: text.TextAlign.RIGHT,
            location: 200
          };
          let result: text.TextTab | undefined = await buildAndGetTextTab(textTab);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle tab.alignment=' + result.alignment);
            expect(result.alignment).assertEqual(text.TextAlign.RIGHT);
            console.info(msg + ' alignment=RIGHT passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleTextTabAlignmentCenterStatic_0300
     * @tc.number SUB_GRAPHIC_StrutStyle_textTab_alignment_center_static_0300
     * @tc.desc   Test TextTab.alignment with TextAlign.CENTER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleTextTabAlignmentCenterStatic_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleTextTabAlignmentCenterStatic_0300====';
        console.info(msg + ' begin');
        try {
          let textTab: text.TextTab = {
            alignment: text.TextAlign.CENTER,
            location: 200
          };
          let result: text.TextTab | undefined = await buildAndGetTextTab(textTab);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle tab.alignment=' + result.alignment);
            expect(result.alignment).assertEqual(text.TextAlign.CENTER);
            console.info(msg + ' alignment=CENTER passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleTextTabAlignmentStartStatic_0400
     * @tc.number SUB_GRAPHIC_StrutStyle_textTab_alignment_start_static_0400
     * @tc.desc   Test TextTab.alignment with TextAlign.START (unlisted, treated as left).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleTextTabAlignmentStartStatic_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleTextTabAlignmentStartStatic_0400====';
        console.info(msg + ' begin');
        try {
          let textTab: text.TextTab = {
            alignment: text.TextAlign.START,
            location: 100
          };
          let result: text.TextTab | undefined = await buildAndGetTextTab(textTab);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle tab.alignment=' + result.alignment);
            expect(result.alignment).assertEqual(text.TextAlign.START);
            console.info(msg + ' alignment=START passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleTextTabLocationMinStatic_0500
     * @tc.number SUB_GRAPHIC_StrutStyle_textTab_location_min_static_0500
     * @tc.desc   Test TextTab.location with minimum value 1.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleTextTabLocationMinStatic_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleTextTabLocationMinStatic_0500====';
        console.info(msg + ' begin');
        try {
          let textTab: text.TextTab = {
            alignment: text.TextAlign.LEFT,
            location: 1.0
          };
          let result: text.TextTab | undefined = await buildAndGetTextTab(textTab);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle tab.location=' + result.location);
            expect(result.location).assertEqual(1.0);
            console.info(msg + ' location=1.0 passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleTextTabLocationLessThanMinStatic_0600
     * @tc.number SUB_GRAPHIC_StrutStyle_textTab_location_lessThanMin_static_0600
     * @tc.desc   Test TextTab.location with value 0.5 (less than 1.0, tab replaced with space).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleTextTabLocationLessThanMinStatic_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleTextTabLocationLessThanMinStatic_0600====';
        console.info(msg + ' begin');
        try {
          let textTab: text.TextTab = {
            alignment: text.TextAlign.LEFT,
            location: 0.5
          };
          let result: text.TextTab | undefined = await buildAndGetTextTab(textTab);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle tab.location=' + result.location);
            expect(result.location).assertEqual(0.5);
            console.info(msg + ' location=0.5 passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleTextTabLocationNegativeStatic_0700
     * @tc.number SUB_GRAPHIC_StrutStyle_textTab_location_negative_static_0700
     * @tc.desc   Test TextTab.location with negative value -1.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleTextTabLocationNegativeStatic_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleTextTabLocationNegativeStatic_0700====';
        console.info(msg + ' begin');
        try {
          let textTab: text.TextTab = {
            alignment: text.TextAlign.LEFT,
            location: -1.0
          };
          let result: text.TextTab | undefined = await buildAndGetTextTab(textTab);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle tab.location=' + result.location);
            expect(result.location).assertEqual(-1.0);
            console.info(msg + ' location=-1.0 passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleTextTabLocationExtremeStatic_0800
     * @tc.number SUB_GRAPHIC_StrutStyle_textTab_location_extreme_static_0800
     * @tc.desc   Test TextTab.location with extreme value 1000.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleTextTabLocationExtremeStatic_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleTextTabLocationExtremeStatic_0800====';
        console.info(msg + ' begin');
        try {
          let textTab: text.TextTab = {
            alignment: text.TextAlign.LEFT,
            location: 1000.0
          };
          let result: text.TextTab | undefined = await buildAndGetTextTab(textTab);
          expect(result != undefined).assertTrue();
          if (result != undefined) {
            console.info(msg + ' getParagraphStyle tab.location=' + result.location);
            expect(result.location).assertEqual(1000.0);
            console.info(msg + ' location=1000.0 passed');
          }
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleParagraphStyleTabDefaultStatic_0900
     * @tc.number SUB_GRAPHIC_StrutStyle_paragraphStyle_tab_default_static_0900
     * @tc.desc   Test ParagraphStyle.tab with default (not set).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleParagraphStyleTabDefaultStatic_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleParagraphStyleTabDefaultStatic_0900====';
        console.info(msg + ' begin');
        try {
          let paragraphStyle: text.ParagraphStyle = {};
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('Hello\tWorld');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(500);
          let resultStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msg + ' getParagraphStyle return ParagraphStyle: ' + JSON.stringify(resultStyle));
          let resultTab: text.TextTab | undefined = resultStyle.tab;
          console.info(msg + ' getParagraphStyle return tab: ' + JSON.stringify(resultTab));
          expect(resultTab?.alignment).assertEqual(text.TextAlign.LEFT);
          expect(resultTab?.location).assertEqual(-1);
          console.info(msg + ' tab=undefined(default) passed');
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testStrutStyleRunMetricsStatic_0100
     * @tc.number SUB_GRAPHIC_StrutStyle_runMetrics_textStyle_fontMetrics_static_0100
     * @tc.desc   Test RunMetrics.textStyle and RunMetrics.fontMetrics from getLineMetrics.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyleRunMetricsStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg: string = '====www data testStrutStyleRunMetricsStatic_0100====';
        console.info(msg + ' begin');
        try {
          let myTextStyle: text.TextStyle = {
            fontSize: 30
          };
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle
          };
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('Hello World');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(500);
          let lineMetrics: Array<text.LineMetrics> = paragraph.getLineMetrics();
          console.info(msg + ' getLineMetrics length: ' + lineMetrics.length);
          expect(lineMetrics.length > 0).assertTrue();
          let runMetrics: Map<int, text.RunMetrics> = lineMetrics[0].runMetrics;
          console.info(msg + ' runMetrics size: ' + runMetrics.size);
          expect(runMetrics.size > 0).assertTrue();
          runMetrics.forEach((value: text.RunMetrics, key: int) => {
            let textStyle: text.TextStyle = value.textStyle;
            console.info(msg + ' runMetrics textStyle: ' + JSON.stringify(textStyle));
            expect(textStyle != undefined).assertTrue();
            expect(textStyle.fontSize).assertEqual(30);
            let fontMetrics: drawing.FontMetrics = value.fontMetrics;
            console.info(msg + ' runMetrics fontMetrics: ' + JSON.stringify(fontMetrics));
            expect(fontMetrics != undefined).assertTrue();
            console.info(msg + ' fontMetrics.ascent=' + fontMetrics.ascent);
            console.info(msg + ' fontMetrics.descent=' + fontMetrics.descent);
            expect(fontMetrics.ascent != undefined).assertTrue();
            expect(fontMetrics.descent != undefined).assertTrue();
          });
          console.info(msg + ' end');
          done();
        } catch (err) {
          console.error(msg + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

  })
}
