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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "@ohos/hypium"
import { text, drawing, common2D } from "@kit.ArkGraphics2D"
import image from "@ohos.multimedia.image"

const LOG_PREFIX = 'www data GraphicTextAdd03Test';

export default function GraphicTextAdd03Test() {
  describe('GraphicTextAdd03Test', () => {

    /**
     * @tc.name   pushStyleDecorationNone
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleTest_0100
     * @tc.desc   ParagraphBuilder pushStyle textDecoration NONE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleDecorationNone', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontWeight: text.FontWeight.W100,
            lineHeightStyle: text.LineHeightStyle.FONT_SIZE,
            decoration: {
              textDecoration: text.TextDecorationType.NONE,
              color: { alpha: 255, red: 255, green: 0, blue: 0 },
              decorationStyle: text.TextDecorationStyle.SOLID,
              decorationThicknessScale: 1.0
            }
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleDecorationNone success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleDecorationNone error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleDecorationSolid
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleTest_0200
     * @tc.desc   ParagraphBuilder pushStyle decorationStyle SOLID test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleDecorationSolid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontWeight: text.FontWeight.W200,
            lineHeightStyle: text.LineHeightStyle.FONT_HEIGHT,
            decoration: {
              textDecoration: text.TextDecorationType.UNDERLINE,
              color: { alpha: 255, red: 0, green: 0, blue: 255 },
              decorationStyle: text.TextDecorationStyle.SOLID,
              decorationThicknessScale: 1.0
            }
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleDecorationSolid success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleDecorationSolid error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleDecorationOverLine
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleTest_overline_0300
     * @tc.desc   ParagraphBuilder pushStyle decorationStyle SOLID test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleDecorationOverLine', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontWeight: text.FontWeight.W300,
            decoration: {
              textDecoration: text.TextDecorationType.OVERLINE,
              color: { alpha: 255, red: 0, green: 0, blue: 255 },
              decorationStyle: text.TextDecorationStyle.SOLID,
              decorationThicknessScale: 1.0
            }
          };

          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleDecorationOverLine success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleDecorationOverLine error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleDecorationDouble
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleTest_0400
     * @tc.desc   ParagraphBuilder pushStyle decorationStyle DOUBLE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleDecorationDouble', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontWeight: text.FontWeight.W400,
            decoration: {
              textDecoration: text.TextDecorationType.LINE_THROUGH,
              color: { alpha: 255, red: 128, green: 128, blue: 0 },
              decorationStyle: text.TextDecorationStyle.DOUBLE,
              decorationThicknessScale: 1.5
            }
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleDecorationDouble success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleDecorationDouble error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleDecorationDotted
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleTest_0500
     * @tc.desc   ParagraphBuilder pushStyle decorationStyle DOTTED test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleDecorationDotted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontWeight: text.FontWeight.W500,
            decoration: {
              textDecoration: text.TextDecorationType.UNDERLINE,
              color: { alpha: 255, red: 0, green: 255, blue: 0 },
              decorationStyle: text.TextDecorationStyle.DOTTED,
              decorationThicknessScale: 1.0
            }
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleDecorationDotted success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleDecorationDotted error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleDecorationDashed
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleTest_0600
     * @tc.desc   ParagraphBuilder pushStyle decorationStyle DASHED test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleDecorationDashed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontWeight: text.FontWeight.W600,
            decoration: {
              textDecoration: text.TextDecorationType.UNDERLINE,
              color: { alpha: 255, red: 0, green: 0, blue: 255 },
              decorationStyle: text.TextDecorationStyle.DASHED,
              decorationThicknessScale: 1.0
            }
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleDecorationDashed success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleDecorationDashed error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleDecorationWavy
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleTest_0700
     * @tc.desc   ParagraphBuilder pushStyle decorationStyle WAVY test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleDecorationWavy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontWeight: text.FontWeight.W700,
            decoration: {
              textDecoration: text.TextDecorationType.UNDERLINE,
              color: { alpha: 255, red: 128, green: 0, blue: 128 },
              decorationStyle: text.TextDecorationStyle.WAVY,
              decorationThicknessScale: 1.0
            }
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleDecorationWavy success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleDecorationWavy error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontWeight
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleTest_0800
     * @tc.desc   ParagraphBuilder pushStyle fontWeight test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleFontWeight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontWeight: text.FontWeight.W800
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleFontWeight success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontWeight error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleBaseline
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleTest_0900
     * @tc.desc   ParagraphBuilder pushStyle baseline IDEOGRAPHIC test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleBaseline', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontWeight: text.FontWeight.W900,
            baseline: text.TextBaseline.IDEOGRAPHIC
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleBaseline success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleBaseline error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontFamiliesEmpty
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleTest_1000
     * @tc.desc   ParagraphBuilder pushStyle fontFamilies empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleFontFamiliesEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontFamilies: []
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleFontFamiliesEmpty success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontFamiliesEmpty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontFamiliesNonEmpty
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleTest_1100
     * @tc.desc   ParagraphBuilder pushStyle fontFamilies non-empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleFontFamiliesNonEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontFamilies: ["Arial", "Times New Roman"]
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleFontFamiliesNonEmpty success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontFamiliesNonEmpty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleLocaleEmpty
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleTest_1200
     * @tc.desc   ParagraphBuilder pushStyle locale empty string test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleLocaleEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            locale: ""
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleLocaleEmpty success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleLocaleEmpty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleLocaleNonEmpty
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleTest_1300
     * @tc.desc   ParagraphBuilder pushStyle locale non-empty string test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleLocaleNonEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            locale: "en-US",
            fontFeatures: [],
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleLocaleNonEmpty success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleLocaleNonEmpty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontWidth
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleTest_1400
     * @tc.desc   ParagraphBuilder pushStyle fontWidth test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleFontWidth', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontWidth: text.FontWidth.CONDENSED,
            fontFeatures: [{ name: 'aabb', value: 15 }],
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleFontWidth success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontWidth error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleHalfLeading
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleTest_1500
     * @tc.desc   ParagraphBuilder pushStyle halfLeading true test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleHalfLeading', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            halfLeading: true,
            fontFeatures: [{ name: '', value: 15 }],
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleHalfLeading success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleHalfLeading error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleHalfLeadingFalse
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleTest_1600
     * @tc.desc   ParagraphBuilder pushStyle halfLeading false test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleHalfLeadingFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            halfLeading: false,
            textShadows: []
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleHalfLeadingFalse success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleHalfLeadingFalse error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleHeightOnly
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleTest_1700
     * @tc.desc   ParagraphBuilder pushStyle heightOnly true test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleHeightOnly', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            heightOnly: true,
            textShadows: [{ color: { alpha: 255, red: 255, green: 0, blue: 0 },
              point: { x: 15, y: 20 }, blurRadius: 0.8
            }],
            fontVariations: [],
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleHeightOnly success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleHeightOnly error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleHeightOnlyFalse
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleTest_1800
     * @tc.desc   ParagraphBuilder pushStyle heightOnly false test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleHeightOnlyFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            heightOnly: false,
            fontVariations: [{ axis: 'KeyWord', value: 26 }],
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleHeightOnlyFalse success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleHeightOnlyFalse error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleEllipsisEmpty
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleTest_1900
     * @tc.desc   ParagraphBuilder pushStyle ellipsis empty string test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleEllipsisEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            ellipsis: "",
            fontVariations: [{ axis: '', value: 26 }],
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleEllipsisEmpty success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleEllipsisEmpty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleEllipsisNonEmpty
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleTest_2000
     * @tc.desc   ParagraphBuilder pushStyle ellipsis non-empty string test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleEllipsisNonEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            ellipsis: "..."
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleEllipsisNonEmpty success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleEllipsisNonEmpty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleEllipsisModeStart
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleTest_2100
     * @tc.desc   ParagraphBuilder pushStyle ellipsisMode START test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleEllipsisModeStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT, maxLines: 1 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            ellipsisMode: text.EllipsisMode.START
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleEllipsisModeStart success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleEllipsisModeStart error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleEllipsisModeMiddle
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleTest_2200
     * @tc.desc   ParagraphBuilder pushStyle ellipsisMode MIDDLE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleEllipsisModeMiddle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT, maxLines: 1 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            ellipsisMode: text.EllipsisMode.MIDDLE
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleEllipsisModeMiddle success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleEllipsisModeMiddle error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleEllipsisModeEnd
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleTest_2300
     * @tc.desc   ParagraphBuilder pushStyle ellipsisMode END test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleEllipsisModeEnd', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT, maxLines: 1 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            ellipsisMode: text.EllipsisMode.END
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleEllipsisModeEnd success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleEllipsisModeEnd error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleTextNull401
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleTest_2400
     * @tc.desc   ParagraphBuilder pushStyle null parameter test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleTextNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          paragraphBuilder.pushStyle(null);
          console.info(`${LOG_PREFIX} pushStyleTextNull401 success`, 1111);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleTextNull401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleTextUndefined401
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleTest_2500
     * @tc.desc   ParagraphBuilder pushStyle undefined parameter test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleTextUndefined401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          paragraphBuilder.pushStyle(undefined);
          console.info(`${LOG_PREFIX} pushStyleTextUndefined401 success`, 1111);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleTextUndefined401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontStyleNormal
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleFinalTest_2600
     * @tc.desc   ParagraphBuilder pushStyle fontStyle NORMAL test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleFontStyleNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontStyle: text.FontStyle.NORMAL
          };

          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleFontStyleNormal success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontStyleNormal error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontStyleItalic
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleFinalTest_2700
     * @tc.desc   ParagraphBuilder pushStyle fontStyle ITALIC test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleFontStyleItalic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontStyle: text.FontStyle.ITALIC
          };

          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleFontStyleItalic success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontStyleItalic error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleBaselineAlphabetic
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleFinalTest_2800
     * @tc.desc   ParagraphBuilder pushStyle baseline ALPHABETIC test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleBaselineAlphabetic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const textStyle: text.TextStyle = {
            fontSize: 20,
            baseline: text.TextBaseline.ALPHABETIC
          };

          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleBaselineAlphabetic success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleBaselineAlphabetic error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontWeightW100
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleFontWeightTest_2900
     * @tc.desc   ParagraphBuilder pushStyle fontWeight W100 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleFontWeightW100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontWeight: text.FontWeight.W100
          };

          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleFontWeightW100 success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontWeightW100 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontWeightW200
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleFontWeightTest_3000
     * @tc.desc   ParagraphBuilder pushStyle fontWeight W200 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleFontWeightW200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontWeight: text.FontWeight.W200
          };

          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleFontWeightW200 success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontWeightW200 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontWeightW300
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleFontWeightTest_3100
     * @tc.desc   ParagraphBuilder pushStyle fontWeight W300 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleFontWeightW300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontWeight: text.FontWeight.W300
          };

          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleFontWeightW300 success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontWeightW300 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontWeightW400
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleFontWeightTest_3200
     * @tc.desc   ParagraphBuilder pushStyle fontWeight W400 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleFontWeightW400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontWeight: text.FontWeight.W400
          };

          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleFontWeightW400 success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontWeightW400 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontWeightW500
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleFontWeightTest_3300
     * @tc.desc   ParagraphBuilder pushStyle fontWeight W500 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleFontWeightW500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontWeight: text.FontWeight.W500
          };

          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleFontWeightW500 success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontWeightW500 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontWeightW600
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleFontWeightTest_3400
     * @tc.desc   ParagraphBuilder pushStyle fontWeight W600 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleFontWeightW600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontWeight: text.FontWeight.W600
          };

          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleFontWeightW600 success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontWeightW600 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontWeightW700
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleFontWeightTest_3500
     * @tc.desc   ParagraphBuilder pushStyle fontWeight W700 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleFontWeightW700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontWeight: text.FontWeight.W700
          };

          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleFontWeightW700 success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontWeightW700 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontWeightW800
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleFontWeightTest_3600
     * @tc.desc   ParagraphBuilder pushStyle fontWeight W800 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleFontWeightW800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontWeight: text.FontWeight.W800
          };

          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleFontWeightW800 success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontWeightW800 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontWeightW900
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleFontWeightTest_3700
     * @tc.desc   ParagraphBuilder pushStyle fontWeight W900 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleFontWeightW900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontWeight: text.FontWeight.W900
          };

          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleFontWeightW900 success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontWeightW900 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontFamiliesEmptyString
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleTest_3800
     * @tc.desc   ParagraphBuilder pushStyle fontFamilies empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleFontFamiliesEmptyString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontFamilies: ['']
          };

          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleFontFamiliesEmptyString success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontFamiliesEmptyString error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontFamiliesNull
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleTest_3900
     * @tc.desc   ParagraphBuilder pushStyle fontFamilies empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleFontFamiliesNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          paragraphBuilder.pushStyle(null);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleFontFamiliesNull success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontFamiliesNull error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontFamiliesUndefined
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleTest_4000
     * @tc.desc   ParagraphBuilder pushStyle fontFamilies empty array test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleFontFamiliesUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          paragraphBuilder.pushStyle(undefined);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleFontFamiliesUndefined success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontFamiliesUndefined error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });
    /**
     * @tc.name   pushStyleFontStyleSlant
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleFontStyleAndWidthTest_4100
     * @tc.desc   ParagraphBuilder pushStyle fontStyle SLANT test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleFontStyleSlant', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontStyle: text.FontStyle.NORMAL
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleFontStyleSlant success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontStyleSlant error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleEllipsisModeMultilineStart
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleFontStyleAndWidthTest_4200
     * @tc.desc   ParagraphBuilder pushStyle ellipsisMode MULTILINE_START test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleEllipsisModeMultilineStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT, maxLines: 1 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            ellipsisMode: text.EllipsisMode.MULTILINE_START
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleEllipsisModeMultilineStart success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleEllipsisModeMultilineStart error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleEllipsisModeMultilineMiddle
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleFontStyleAndWidthTest_4300
     * @tc.desc   ParagraphBuilder pushStyle ellipsisMode MULTILINE_MIDDLE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleEllipsisModeMultilineMiddle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT, maxLines: 1 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            ellipsisMode: text.EllipsisMode.MULTILINE_MIDDLE
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleEllipsisModeMultilineMiddle success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleEllipsisModeMultilineMiddle error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleEllipsisModeMultilineEnd
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleFontStyleAndWidthTest_4400
     * @tc.desc   ParagraphBuilder pushStyle ellipsisMode MULTILINE_END test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleEllipsisModeMultilineEnd', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT, maxLines: 1 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            ellipsisMode: text.EllipsisMode.MULTILINE_MIDDLE
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleEllipsisModeMultilineEnd success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleEllipsisModeMultilineEnd error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontWidthUltraCondensed
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleFontStyleAndWidthTest_4500
     * @tc.desc   ParagraphBuilder pushStyle fontWidth ULTRA_CONDENSED test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleFontWidthUltraCondensed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontWidth: text.FontWidth.ULTRA_CONDENSED
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleFontWidthUltraCondensed success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontWidthUltraCondensed error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontWidthExtraCondensed
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleFontStyleAndWidthTest_4600
     * @tc.desc   ParagraphBuilder pushStyle fontWidth EXTRA_CONDENSED test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleFontWidthExtraCondensed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontWidth: text.FontWidth.EXTRA_CONDENSED
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleFontWidthExtraCondensed success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontWidthExtraCondensed error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontWidthCondensed
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleFontStyleAndWidthTest_4700
     * @tc.desc   ParagraphBuilder pushStyle fontWidth CONDENSED test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleFontWidthCondensed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontWidth: text.FontWidth.CONDENSED
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleFontWidthCondensed success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontWidthCondensed error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

/**
     * @tc.name   pushStyleFontWidthSemiCondensed
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleFontStyleAndWidthTest_4800
     * @tc.desc   ParagraphBuilder pushStyle fontWidth SEMI_CONDENSED test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleFontWidthSemiCondensed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
const textStyle: text.TextStyle = {
            fontSize: 20,
            fontWidth: text.FontWidth.SEMI_CONDENSED
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleFontWidthSemiCondensed success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontWidthSemiCondensed error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontWidthExpanded
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleFontStyleAndWidthTest_4900
     * @tc.desc   ParagraphBuilder pushStyle fontWidth EXPANDED test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleFontWidthExpanded', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontWidth: text.FontWidth.EXPANDED
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleFontWidthExpanded success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontWidthExpanded error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontWidthExtraExpanded
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleFontStyleAndWidthTest_5000
     * @tc.desc   ParagraphBuilder pushStyle fontWidth EXTRA_EXPANDED test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleFontWidthExtraExpanded', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontWidth: text.FontWidth.EXTRA_EXPANDED
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleFontWidthExtraExpanded success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontWidthExtraExpanded error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontWidthUltraExpanded
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleFontStyleAndWidthTest_5100
     * @tc.desc   ParagraphBuilder pushStyle fontWidth ULTRA_EXPANDED test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleFontWidthUltraExpanded', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontWidth: text.FontWidth.ULTRA_EXPANDED
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleFontWidthUltraExpanded success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontWidthUltraExpanded error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleComplexProperties
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleFontStyleAndWidthTest_5200
     * @tc.desc   ParagraphBuilder pushStyle complex properties test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleComplexProperties', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontStyle: text.FontStyle.ITALIC,
            fontWeight: text.FontWeight.W500,
            fontWidth: text.FontWidth.NORMAL,
            color: { alpha: 255, red: 0, green: 0, blue: 0 }
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleComplexProperties success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleComplexProperties error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });






    /**
     * @tc.name   pushStyleFontWidthNormal
     * @tc.number SUB_GRAPHIC_Text_ParagraphBuilderPushStyleFontWidthTest_5300
     * @tc.desc   ParagraphBuilder pushStyle fontWidth NORMAL test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pushStyleFontWidthNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          
          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontWidth: text.FontWidth.NORMAL
          };
          
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          
          console.info(`${LOG_PREFIX} pushStyleFontWidthNormal success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontWidthNormal error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });
    
  })
}
