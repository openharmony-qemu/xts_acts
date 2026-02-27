/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import common2D from '@ohos.graphics.common2D';
import drawing from '@ohos.graphics.drawing';
import { $rawfile, Resource } from '@ohos.arkui.component';
import image from '@ohos.multimedia.image';

export default function GraphicTextAPIAdd02() {

  describe('GraphicTextAPIAdd02', () => {
    beforeAll(() => {
    })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_0100
     * @tc.number GraphicTextAPIAdd02Static_0100
     * @tc.desc   test matchFontDescriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_0100====";
        let fontDescriptor = await text.matchFontDescriptors({
          fullName: '',
          manufacture: '',
          weight: text.FontWeight.W100
        })
        console.info(msg + JSON.stringify(fontDescriptor));
        expect(fontDescriptor.length).assertLargerOrEqual(0);
        done();
    })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_0200
     * @tc.number GraphicTextAPIAdd02Static_0200
     * @tc.desc   test matchFontDescriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_0200====";
        let fontDescriptor = await text.matchFontDescriptors({
          fontFamily: '',
          copyright: '',
          weight: text.FontWeight.W200
        })
        console.info(msg + JSON.stringify(fontDescriptor));
        expect(fontDescriptor.length).assertLargerOrEqual(0);
        done();
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_0300
     * @tc.number GraphicTextAPIAdd02Static_0300
     * @tc.desc   test matchFontDescriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_0300====";
        let fontDescriptor = await text.matchFontDescriptors({
          fontSubfamily: '',
          trademark: '',
          weight: text.FontWeight.W300
        })
        console.info(msg + JSON.stringify(fontDescriptor));
        expect(fontDescriptor.length).assertLargerOrEqual(0);
        done();
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_0400
     * @tc.number GraphicTextAPIAdd02Static_0400
     * @tc.desc   test matchFontDescriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_0400====";
        let fontDescriptor = await text.matchFontDescriptors({
          localPostscriptName: '',
          license: '',
          weight: text.FontWeight.W500
        })
        console.info(msg + JSON.stringify(fontDescriptor));
        expect(fontDescriptor.length).assertLargerOrEqual(0);
        done();
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_0500
     * @tc.number GraphicTextAPIAdd02Static_0500
     * @tc.desc   test matchFontDescriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_0500====";
        let fontDescriptor = await text.matchFontDescriptors({
          localFullName: '',
          monoSpace: true,
          weight: text.FontWeight.W600
        })
        console.info(msg + JSON.stringify(fontDescriptor));
        expect(fontDescriptor.length).assertLargerOrEqual(0);
        done();
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_0600
     * @tc.number GraphicTextAPIAdd02Static_0600
     * @tc.desc   test matchFontDescriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_0600====";
        let fontDescriptor = await text.matchFontDescriptors({
          localFamilyName: '',
          monoSpace: false,
          weight: text.FontWeight.W700
        })
        console.info(msg + JSON.stringify(fontDescriptor));
        expect(fontDescriptor.length).assertLargerOrEqual(0);
        done();
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_0700
     * @tc.number GraphicTextAPIAdd02Static_0700
     * @tc.desc   test matchFontDescriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_0700====";
        let fontDescriptor = await text.matchFontDescriptors({
          localSubFamilyName: '',
          symbolic: false,
          weight: text.FontWeight.W800
        })
        console.info(msg + JSON.stringify(fontDescriptor));
        expect(fontDescriptor.length).assertLargerOrEqual(0);
        done();
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_0800
     * @tc.number GraphicTextAPIAdd02Static_0800
     * @tc.desc   test matchFontDescriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_0800====";
        let fontDescriptor = await text.matchFontDescriptors({
          version: '',
          symbolic: true,
          weight: text.FontWeight.W900
        })
        console.info(msg + JSON.stringify(fontDescriptor));
        expect(fontDescriptor.length).assertLargerOrEqual(0);
        done();
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_0900
     * @tc.number GraphicTextAPIAdd02Static_0900
     * @tc.desc   test addPlaceholder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_0900===="
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let fontFamilies: Array<string> = ["Clock_01"]
          let myTextStyle: text.TextStyle = {
            fontFamilies: fontFamilies,
            fontSize: 50,
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
            maxLines: 1,
          }
          let myPlaceholderSpan: text.PlaceholderSpan = {
            width: 100,
            height: 100,
            align: text.PlaceholderAlignment.OFFSET_AT_BASELINE,
            baseline: text.TextBaseline.ALPHABETIC,
            baselineOffset: 100
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          try {
            paragraphBuilder.addPlaceholder(myPlaceholderSpan);
            console.info('www data GraphicTextAPIAdd02Static_0900 success in addPlaceholder');
          } catch(err) {
            console.info('www data GraphicTextAPIAdd02Static_0900 failed to addPlaceholder');
            expect(false).assertTrue();
          }
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          done();
        } catch(err){
          console.info(msg + 'test error' + err);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_1000
     * @tc.number GraphicTextAPIAdd02Static_1000
     * @tc.desc   test addPlaceholder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_1000===="
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let fontFamilies: Array<string> = ["Clock_01"]
          let myTextStyle: text.TextStyle = {
            fontFamilies: fontFamilies,
            fontSize: 50,
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
            maxLines: 1,
          }
          let myPlaceholderSpan: text.PlaceholderSpan = {
            width: 100,
            height: 100,
            align: text.PlaceholderAlignment.BELOW_BASELINE,
            baseline: text.TextBaseline.ALPHABETIC,
            baselineOffset: 100
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          try {
            paragraphBuilder.addPlaceholder(myPlaceholderSpan);
            console.info('www data GraphicTextAPIAdd02Static_1000 success in addPlaceholder');
          } catch(err) {
            console.info('www data GraphicTextAPIAdd02Static_1000 failed to addPlaceholder');
            expect(false).assertTrue();
          }
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          done();
        } catch(err){
          console.info(msg + 'test error' + err);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_1100
     * @tc.number GraphicTextAPIAdd02Static_1100
     * @tc.desc   test addPlaceholder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_1100===="
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let fontFamilies: Array<string> = ["Clock_01"]
          let myTextStyle: text.TextStyle = {
            fontFamilies: fontFamilies,
            fontSize: 50,
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
            maxLines: 1,
          }
          let myPlaceholderSpan: text.PlaceholderSpan = {
            width: 100,
            height: 100,
            align: text.PlaceholderAlignment.TOP_OF_ROW_BOX,
            baseline: text.TextBaseline.ALPHABETIC,
            baselineOffset: 100
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          try {
            paragraphBuilder.addPlaceholder(myPlaceholderSpan);
            console.info('www data GraphicTextAPIAdd02Static_1100 success in addPlaceholder');
          } catch(err) {
            console.info('www data GraphicTextAPIAdd02Static_1100 failed to addPlaceholder');
            expect(false).assertTrue();
          }
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          done();
        } catch(err){
          console.info(msg + 'test error' + err);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_1200
     * @tc.number GraphicTextAPIAdd02Static_1200
     * @tc.desc   test addPlaceholder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_1200===="
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let fontFamilies: Array<string> = ["Clock_01"]
          let myTextStyle: text.TextStyle = {
            fontFamilies: fontFamilies,
            fontSize: 50,
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
            maxLines: 1,
          }
          let myPlaceholderSpan: text.PlaceholderSpan = {
            width: 100,
            height: 100,
            align: text.PlaceholderAlignment.BOTTOM_OF_ROW_BOX,
            baseline: text.TextBaseline.ALPHABETIC,
            baselineOffset: 100
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          try {
            paragraphBuilder.addPlaceholder(myPlaceholderSpan);
            console.info('www data GraphicTextAPIAdd02Static_1200 success in addPlaceholder');
          } catch(err) {
            console.info('www data GraphicTextAPIAdd02Static_1200 failed to addPlaceholder');
            expect(false).assertTrue();
          }
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          done();
        } catch(err){
          console.info(msg + 'test error' + err);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_1300
     * @tc.number GraphicTextAPIAdd02Static_1300
     * @tc.desc   test addPlaceholder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_1300===="
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let fontFamilies: Array<string> = ["Clock_01"]
          let myTextStyle: text.TextStyle = {
            fontFamilies: fontFamilies,
            fontSize: 50,
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
            maxLines: 1,
          }
          let myPlaceholderSpan: text.PlaceholderSpan = {
            width: 100,
            height: 100,
            align: text.PlaceholderAlignment.CENTER_OF_ROW_BOX,
            baseline: text.TextBaseline.IDEOGRAPHIC,
            baselineOffset: 100
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          try {
            paragraphBuilder.addPlaceholder(myPlaceholderSpan);
            console.info('www data GraphicTextAPIAdd02Static_1300 success in addPlaceholder');
          } catch(err) {
            console.info('www data GraphicTextAPIAdd02Static_1300 failed to addPlaceholder');
            expect(false).assertTrue();
          }
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          done();
        } catch(err){
          console.info(msg + 'test error' + err);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_1400
     * @tc.number GraphicTextAPIAdd02Static_1400
     * @tc.desc   test pushStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_1400===="
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let myTextStyle: text.TextStyle = {
            fontSize: 50,
            fontWeight: text.FontWeight.W100,
            decoration: {
              textDecoration: text.TextDecorationType.NONE,
              decorationStyle: text.TextDecorationStyle.SOLID
            },
            fontFamilies: [''],
            fontFeatures: [{ name: '', value: 1 }],
            fontWidth: text.FontWidth.ULTRA_CONDENSED,
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          try {
            paragraphBuilder.pushStyle(myTextStyle);
            console.info('www data GraphicTextAPIAdd02Static_1400 success in pushStyle');
          } catch(err) {
            console.info('www data GraphicTextAPIAdd02Static_1400 failed to pushStyle');
            expect(false).assertTrue();
          }
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          done();
        } catch(err){
          console.info(msg + 'test error' + err);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_1500
     * @tc.number GraphicTextAPIAdd02Static_1500
     * @tc.desc   test pushStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_1500===="
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let myTextStyle: text.TextStyle = {
            fontSize: 50,
            fontWeight: text.FontWeight.W200,
            decoration: {
              textDecoration: text.TextDecorationType.OVERLINE,
              decorationStyle: text.TextDecorationStyle.DOUBLE
            },
            lineHeightStyle: text.LineHeightStyle.FONT_SIZE,
            textShadows: [],
            fontWidth: text.FontWidth.EXTRA_CONDENSED,
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          try {
            paragraphBuilder.pushStyle(myTextStyle);
            console.info('www data GraphicTextAPIAdd02Static_1500 success in pushStyle');
          } catch(err) {
            console.info('www data GraphicTextAPIAdd02Static_1500 failed to pushStyle');
            expect(false).assertTrue();
          }
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          done();
        } catch(err){
          console.info(msg + 'test error' + err);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_1600
     * @tc.number GraphicTextAPIAdd02Static_1600
     * @tc.desc   test pushStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_1600===="
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let myTextStyle: text.TextStyle = {
            fontSize: 50,
            fontWeight: text.FontWeight.W300,
            decoration: {
              textDecoration: text.TextDecorationType.LINE_THROUGH,
              decorationStyle: text.TextDecorationStyle.DASHED
            },
            lineHeightStyle: text.LineHeightStyle.FONT_HEIGHT,
            fontVariations: [],
            fontWidth: text.FontWidth.CONDENSED,
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          try {
            paragraphBuilder.pushStyle(myTextStyle);
            console.info('www data GraphicTextAPIAdd02Static_1600 success in pushStyle');
          } catch(err) {
            console.info('www data GraphicTextAPIAdd02Static_1600 failed to pushStyle');
            expect(false).assertTrue();
          }
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          done();
        } catch(err){
          console.info(msg + 'test error' + err);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_1700
     * @tc.number GraphicTextAPIAdd02Static_1700
     * @tc.desc   test pushStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_1700===="
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let myTextStyle: text.TextStyle = {
            fontSize: 50,
            fontWeight: text.FontWeight.W400,
            decoration: {
              textDecoration: text.TextDecorationType.NONE,
              decorationStyle: text.TextDecorationStyle.WAVY
            },
            halfLeading: true,
            fontVariations: [{ axis: '', value: 26 }],
            fontWidth: text.FontWidth.SEMI_CONDENSED,
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          try {
            paragraphBuilder.pushStyle(myTextStyle);
            console.info('www data GraphicTextAPIAdd02Static_1700 success in pushStyle');
          } catch(err) {
            console.info('www data GraphicTextAPIAdd02Static_1700 failed to pushStyle');
            expect(false).assertTrue();
          }
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          done();
        } catch(err){
          console.info(msg + 'test error' + err);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_1800
     * @tc.number GraphicTextAPIAdd02Static_1800
     * @tc.desc   test pushStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_1800===="
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let myTextStyle: text.TextStyle = {
            fontSize: 50,
            fontWeight: text.FontWeight.W500,
            fontStyle: text.FontStyle.NORMAL,
            heightOnly: false,
            badgeType: text.TextBadgeType.TEXT_BADGE_NONE,
            fontWidth: text.FontWidth.NORMAL,
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          try {
            paragraphBuilder.pushStyle(myTextStyle);
            console.info('www data GraphicTextAPIAdd02Static_1800 success in pushStyle');
          } catch(err) {
            console.info('www data GraphicTextAPIAdd02Static_1800 failed to pushStyle');
            expect(false).assertTrue();
          }
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          done();
        } catch(err){
          console.info(msg + 'test error' + err);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_1900
     * @tc.number GraphicTextAPIAdd02Static_1900
     * @tc.desc   test pushStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_1900===="
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let myTextStyle: text.TextStyle = {
            fontSize: 50,
            fontWeight: text.FontWeight.W600,
            fontStyle: text.FontStyle.ITALIC,
            ellipsisMode: text.EllipsisMode.START,
            badgeType: text.TextBadgeType.TEXT_SUPERSCRIPT,
            fontWidth: text.FontWidth.SEMI_EXPANDED,
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          try {
            paragraphBuilder.pushStyle(myTextStyle);
            console.info('www data GraphicTextAPIAdd02Static_1900 success in pushStyle');
          } catch(err) {
            console.info('www data GraphicTextAPIAdd02Static_1900 failed to pushStyle');
            expect(false).assertTrue();
          }
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          done();
        } catch(err){
          console.info(msg + 'test error' + err);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_2000
     * @tc.number GraphicTextAPIAdd02Static_2000
     * @tc.desc   test pushStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_2000===="
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let myTextStyle: text.TextStyle = {
            fontSize: 50,
            fontWeight: text.FontWeight.W800,
            baseline: text.TextBaseline.IDEOGRAPHIC,
            ellipsisMode: text.EllipsisMode.MIDDLE,
            badgeType: text.TextBadgeType.TEXT_SUBSCRIPT,
            fontWidth: text.FontWidth.EXPANDED,
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          try {
            paragraphBuilder.pushStyle(myTextStyle);
            console.info('www data GraphicTextAPIAdd02Static_2000 success in pushStyle');
          } catch(err) {
            console.info('www data GraphicTextAPIAdd02Static_2000 failed to pushStyle');
            expect(false).assertTrue();
          }
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          done();
        } catch(err){
          console.info(msg + 'test error' + err);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_2100
     * @tc.number GraphicTextAPIAdd02Static_2100
     * @tc.desc   test pushStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_2100===="
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let myTextStyle: text.TextStyle = {
            fontSize: 50,
            fontWeight: text.FontWeight.W900,
            fontFamilies: [],
            fontFeatures: [],
            fontWidth: text.FontWidth.EXTRA_EXPANDED,
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          try {
            paragraphBuilder.pushStyle(myTextStyle);
            console.info('www data GraphicTextAPIAdd02Static_2100 success in pushStyle');
          } catch(err) {
            console.info('www data GraphicTextAPIAdd02Static_2100 failed to pushStyle');
            expect(false).assertTrue();
          }
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          done();
        } catch(err){
          console.info(msg + 'test error' + err);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_2200
     * @tc.number GraphicTextAPIAdd02Static_2200
     * @tc.desc   test pushStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_2200===="
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let myTextStyle: text.TextStyle = {
            fontSize: 50,
            fontWeight: text.FontWeight.W900,
            fontFamilies: [],
            fontFeatures: [],
            fontWidth: text.FontWidth.ULTRA_EXPANDED,
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          try {
            paragraphBuilder.pushStyle(myTextStyle);
            console.info('www data GraphicTextAPIAdd02Static_2200 success in pushStyle');
          } catch(err) {
            console.info('www data GraphicTextAPIAdd02Static_2200 failed to pushStyle');
            expect(false).assertTrue();
          }
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          done();
        } catch(err){
          console.info(msg + 'test error' + err);
          expect(false).assertTrue();
          done();
        }
      })


  })
}
