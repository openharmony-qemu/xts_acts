/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import { UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, 
WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';
import { MessageManager, Callback } from '../MainAbility/utils/MessageManager';
import { text, drawing, common2D } from "@kit.ArkGraphics2D"
import { image } from '@kit.ImageKit'

export default function graphicTextNewAPI() {
  describe('graphicTextNewAPI', () => {
    beforeEach(async (done: Function) => {
      done();
    });

    /**
     * @tc.name   graphicTextNewAPI_0100
     * @tc.number graphicTextNewAPI_0100
     * @tc.desc   text newAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextNewAPI_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg  = "====graphicTextNewAPI_0100===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
          badgeType: text.TextBadgeType.TEXT_BADGE_NONE
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          autoSpace: true,
          trailingSpaceOptimized: true
        }
        interface Params {
          str?: string;
          str_color?: common2D.Color;
          backgroundRect?: text.RectStyle;
          Decoration_textDecoration?: text.TextDecorationType;
          Decoration_color?: common2D.Color;
          Decoration_decorationStyle?: text.TextDecorationStyle;
          Decoration_decorationThicknessScale?: number;
          textShadowsData: Array<text.TextShadow>;
        }
        let params: Params = {
          str: "",
          str_color: {
            alpha: 255,
            red: 0,
            green: 0,
            blue: 0
          },
          Decoration_textDecoration: text.TextDecorationType.NONE,
          Decoration_color: {
            alpha: 255,
            red: 255,
            green: 0,
            blue: 0
          },
          Decoration_decorationStyle: text.TextDecorationStyle.SOLID,
          Decoration_decorationThicknessScale: 1.0,
          textShadowsData: new Array()
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        params.backgroundRect = {
          color: {
            alpha: 255,
            red: 137,
            green: 137,
            blue: 120
          },
          leftTopRadius: 1,
          rightTopRadius: 1,
          rightBottomRadius: 1,
          leftBottomRadius: 1,
        }
        paragraph.updateColor(params.Decoration_color);
        paragraph.updateDecoration({
          textDecoration: text.TextDecorationType.OVERLINE,
          color: { alpha: 255, red: 255, green: 0, blue: 0 },
          decorationStyle: text.TextDecorationStyle.WAVY,
          decorationThicknessScale: 2.0,
        });
        paragraph.layoutSync(600);
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   graphicTextNewAPI_0200
     * @tc.number graphicTextNewAPI_0200
     * @tc.desc   text newAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextNewAPI_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg  = "====graphicTextNewAPI_0200===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
          badgeType: text.TextBadgeType.TEXT_SUPERSCRIPT
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          autoSpace: false,
          trailingSpaceOptimized: false
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.updateColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        paragraph.updateDecoration({
          textDecoration: text.TextDecorationType.LINE_THROUGH,
          color: { alpha: 255, red: 255, green: 0, blue: 0 },
          decorationStyle: text.TextDecorationStyle.DOTTED,
          decorationThicknessScale: 1.0,
        });
        paragraph.layoutSync(600);
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.name   graphicTextNewAPI_0300
     * @tc.number graphicTextNewAPI_0300
     * @tc.desc   text newAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextNewAPI_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg  = "====graphicTextNewAPI_0300===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
          badgeType: text.TextBadgeType.TEXT_SUBSCRIPT
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          autoSpace: true,
          trailingSpaceOptimized: false
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.updateColor({ alpha: 255, red: 255, green: 0, blue: 0 });
        paragraph.updateDecoration({
          textDecoration: text.TextDecorationType.UNDERLINE,
          color: { alpha: 255, red: 255, green: 0, blue: 0 },
          decorationStyle: text.TextDecorationStyle.DASHED,
          decorationThicknessScale: 1.5,
        });
        paragraph.layoutSync(600);
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   graphicTextNewAPI_0400
     * @tc.number graphicTextNewAPI_0400
     * @tc.desc   text newAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextNewAPI_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg  = "====graphicTextNewAPI_0400===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        try {
          text.setTextHighContrast(text.TextHighContrast.TEXT_FOLLOW_SYSTEM_HIGH_CONTRAST);
        } catch (err) {
          console.info('www data test error ' + msg + err);
          expect().assertFail();
        }
        paragraph.layoutSync(600);
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   graphicTextNewAPI_0500
     * @tc.number graphicTextNewAPI_0500
     * @tc.desc   text newAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextNewAPI_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg  = "====graphicTextNewAPI_0500===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        try {
          text.setTextHighContrast(text.TextHighContrast.TEXT_APP_DISABLE_HIGH_CONTRAST);
        } catch (err) {
          console.info('www data test error ' + msg + err);
          expect().assertFail();
        }
        paragraph.layoutSync(600);
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   graphicTextNewAPI_0600
     * @tc.number graphicTextNewAPI_0600
     * @tc.desc   text newAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextNewAPI_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg  = "====graphicTextNewAPI_0600===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          verticalAlign: text.TextVerticalAlign.TOP,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        try {
          text.setTextHighContrast(text.TextHighContrast.TEXT_APP_ENABLE_HIGH_CONTRAST);
        } catch (err) {
          console.info('www data test error ' + msg + err);
          expect().assertFail();
        }
        paragraph.layoutSync(600);
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   graphicTextNewAPI_0700
     * @tc.number graphicTextNewAPI_0700
     * @tc.desc   text newAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextNewAPI_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg  = "====graphicTextNewAPI_0700===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          verticalAlign: text.TextVerticalAlign.CENTER,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        try {
          text.setTextUndefinedGlyphDisplay(text.TextUndefinedGlyphDisplay.USE_TOFU);
        } catch (err) {
          console.info('www data test error ' + msg + err);
          expect().assertFail();
        }
        paragraph.layoutSync(600);
        let lines: Array<text.TextLine> = paragraph.getTextLines();
        let length = lines.length;
        for(let i =0 ; i < length ; i++) {
          let runs: Array<text.Run> = lines[i].getGlyphRuns();
          let x: number = 0;
          let y: number = 0;
          for (let j = 0; j < runs.length; j++) {
            let glyphs = runs[j].getGlyphs();
            let font = runs[j].getFont();
            try {
              let textDirection = runs[0].getTextDirection();
              expect(textDirection).assertEqual(text.TextDirection.LTR);
            } catch (err) {
              console.info(msg + JSON.stringify(err));
              expect().assertFail();
            }
            try {
              let advancesRange1 = runs[0].getAdvances({start:0, end:10});
              expect(advancesRange1.length > 0).assertTrue();
              let advancesRange2 = runs[0].getAdvances({start:10, end:10});
              expect(advancesRange2.length == 0).assertTrue();
              let advancesRange3 = runs[0].getAdvances({start:0, end:-10});
              expect(advancesRange3).assertEqual(undefined);
            } catch (err) {
              console.info(msg + JSON.stringify(err));
              expect().assertFail();
            }
            try {
              let advancesRange = runs[0].getAdvances({start:-1, end:2});
              expect(advancesRange).assertEqual(undefined);
            } catch (err) {
              console.info(msg + JSON.stringify(err));
              expect().assertFail();
            }

          }
        }
        try {
          fontCollection.unloadFontSync('custom');
        } catch (err) {
          console.info('www data test error ' + msg + err);
          expect().assertFail();
        }
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   graphicTextNewAPI_0800
     * @tc.number graphicTextNewAPI_0800
     * @tc.desc   text newAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextNewAPI_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg  = "====graphicTextNewAPI_0800===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          verticalAlign: text.TextVerticalAlign.BOTTOM,
          textDirection: text.TextDirection.RTL
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "سىناق تېكىستى";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        try {
          text.setTextUndefinedGlyphDisplay(text.TextUndefinedGlyphDisplay.USE_DEFAULT);
        } catch (err) {
          console.info('www data test error ' + msg + err);
          expect().assertFail();
        }
        paragraph.layoutSync(600);
        let lines: Array<text.TextLine> = paragraph.getTextLines();
        let length = lines.length;
        for(let i =0 ; i < length ; i++) {
          let runs: Array<text.Run> = lines[i].getGlyphRuns();
          let x: number = 0;
          let y: number = 0;
          for (let j = 0; j < runs.length; j++) {
            let glyphs = runs[j].getGlyphs();
            let font = runs[j].getFont();
            try {
              let textDirection = runs[0].getTextDirection();
              expect(textDirection).assertEqual(text.TextDirection.RTL);
            } catch (err) {
              console.info(msg + JSON.stringify(err));
              expect().assertFail();
            }
            try {
              let advancesRange = runs[0].getAdvances({start:0, end:-10});
              expect(advancesRange).assertEqual(undefined);
            } catch (err) {
              console.info(msg + JSON.stringify(err));
              expect().assertFail();
            }
            try {
              let advancesNull = runs[0].getAdvances(null);
              expect(advancesNull).assertEqual(undefined);
            } catch (err) {
              console.info(msg + JSON.stringify(err));
              expect().assertFail();
            }

          }
        }
        try {
          fontCollection.unloadFont('custom');
        } catch (err) {
          console.info('www data test error ' + msg + err);
          expect().assertFail();
        }
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   graphicTextNewAPI_0900
     * @tc.number graphicTextNewAPI_0900
     * @tc.desc   text newAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextNewAPI_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg  = "====graphicTextNewAPI_0900===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies,
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          verticalAlign: text.TextVerticalAlign.BASELINE,
        }
        let myPlaceholderSpan: text.PlaceholderSpan = {
          width: 22,
          height: 33,
          align: text.PlaceholderAlignment.FOLLOW_PARAGRAPH,
          baseline: text.TextBaseline.ALPHABETIC,
          baselineOffset: 66
        };
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        paragraphBuilder.addPlaceholder(myPlaceholderSpan);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        try {
          text.setTextUndefinedGlyphDisplay(text.TextUndefinedGlyphDisplay.USE_DEFAULT);
        } catch (err) {
          console.info('www data test error ' + msg + err);
          expect().assertFail();
        }
        paragraph.layoutSync(600);
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testTextReturnValue_0100
     * @tc.number testTextReturnValue_0100
     * @tc.desc   testTextReturnValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextReturnValue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg  = "====testTextReturnValue_0100===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        let range1: text.Range = { start: 0, end: 1};
        let rects1 = paragraph.getRectsForRange(range1, text.RectWidthStyle.TIGHT, text.RectHeightStyle.TIGHT);
        console.info('www data rects 111 ', JSON.stringify(rects1))
        expect(rects1.length > 0).assertTrue();
        let range2: text.Range = { start: 0, end: 0};
        let rects2 = paragraph.getRectsForRange(range2, text.RectWidthStyle.TIGHT, text.RectHeightStyle.TIGHT);
        console.info('www data rects 222 ', JSON.stringify(rects2))
        expect(rects2.length == 0).assertTrue();
        let placeholderRects = paragraph.getRectsForPlaceholders();
        expect(placeholderRects.length == 0).assertTrue();
        let didExceed = paragraph.didExceedMaxLines();
        expect(didExceed == false).assertTrue();
        let lines = paragraph.getTextLines();
        expect(lines.length > 0).assertTrue();
        let arrLineMetric =  paragraph.getLineMetrics();
        expect(arrLineMetric.length > 0).assertTrue();
        let lineMetrics =  paragraph.getLineMetrics(0);
        expect(lineMetrics != undefined).assertTrue();
        let runs = lines[0].getGlyphRuns();
        expect(runs.length > 0).assertTrue();
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testTextReturnValue_0200
     * @tc.number testTextReturnValue_0200
     * @tc.desc   testTextReturnValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextReturnValue_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg  = "====testTextReturnValue_0200===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        let lines = paragraph.getTextLines();
        expect(lines.length == 0).assertTrue();
        expect(lines[0] == undefined).assertTrue();
        let arrLineMetric =  paragraph.getLineMetrics();
        expect(arrLineMetric.length == 0).assertTrue();
        let lineMetrics =  paragraph.getLineMetrics(0);
        expect(lineMetrics == undefined).assertTrue();
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testTextReturnValue_0300
     * @tc.number testTextReturnValue_0300
     * @tc.desc   testTextReturnValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextReturnValue_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg  = "====testTextReturnValue_0300===="
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
          align: text.PlaceholderAlignment.FOLLOW_PARAGRAPH,
          baseline: text.TextBaseline.ALPHABETIC,
          baselineOffset: 100
        };
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        paragraphBuilder.addPlaceholder(myPlaceholderSpan);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf_测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        let placeholderRects = paragraph.getRectsForPlaceholders();
        expect(placeholderRects.length > 0).assertTrue();
        let didExceed = paragraph.didExceedMaxLines();
        expect(didExceed == true).assertTrue();
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testTextReturnValue_0400
     * @tc.number testTextReturnValue_0400
     * @tc.desc   testTextReturnValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextReturnValue_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg  = "====testTextReturnValue_0400====";
      let fontType:text.SystemFontType = text.SystemFontType.GENERIC;
      let fontTypeNums = await text.getSystemFontFullNamesByType(fontType);
      console.info(msg + fontTypeNums);
      console.info(msg + fontTypeNums.length);
      expect(fontTypeNums.length > 0).assertTrue();
      let fontTypeNums1 = await text.getSystemFontFullNamesByType(text.SystemFontType.CUSTOMIZED);
      expect(fontTypeNums1.length == 0).assertTrue();
      let fontDescriptor1 = await text.matchFontDescriptors({
        weight: text.FontWeight.W400,
      })
      console.info(msg + fontDescriptor1.length);
      expect(fontDescriptor1.length > 0).assertTrue();
      let fontDescriptor2 = await text.matchFontDescriptors({
        path: '/test_xts',
        postScriptName: 'AaAa'
      })
      console.info(msg + JSON.stringify(fontDescriptor2));
      expect(fontDescriptor2.length == 0).assertTrue();
      done();
    })

    /**
     * @tc.name   testTextReturnValue_0500
     * @tc.number testTextReturnValue_0500
     * @tc.desc   testTextReturnValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextReturnValue_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg  = "====testTextReturnValue_0500====";
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
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        let lines =  paragraph.getTextLines();
        let runs = lines[0].getGlyphRuns();
        console.info('www data runs ' + JSON.stringify(runs));
        expect(runs.length > 0).assertTrue();
        let glphy1 = runs[0].getGlyphs();
        console.info('www data glphy1 ' + JSON.stringify(glphy1));
        expect(glphy1.length > 0).assertTrue();
        let glphy2 = runs[0].getGlyphs({start: 0, end: 1});
        console.info('www data glphy2 ' + JSON.stringify(glphy2));
        expect(glphy2.length > 0).assertTrue();
        let glphy3 = runs[0].getGlyphs({start: 0, end: 0});
        console.info('www data glphy3 ' + JSON.stringify(glphy3));
        expect(glphy3.length > 0).assertTrue();
        let glphy4 = runs[0].getGlyphs({start: 0, end: -1});
        console.info('www data glphy4 ' + JSON.stringify(glphy4));
        expect(glphy4 == undefined).assertTrue();
        let glphy5 = runs[0].getGlyphs(null);
        console.info('www data glphy5 ' + JSON.stringify(glphy5));
        expect(glphy5 == undefined).assertTrue();
        let glphy6 = runs[0].getGlyphs(undefined);
        console.info('www data glphy6 ' + JSON.stringify(glphy6));
        expect(glphy6 == undefined).assertTrue();
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testTextReturnValue_0600
     * @tc.number testTextReturnValue_0600
     * @tc.desc   testTextReturnValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextReturnValue_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg  = "====testTextReturnValue_0600====";
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
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        let lines =  paragraph.getTextLines();
        let runs = lines[0].getGlyphRuns();
        console.info('www data runs ' + JSON.stringify(runs));
        expect(runs.length > 0).assertTrue();
        let position1 = runs[0].getPositions();
        console.info('www data position1 ' + JSON.stringify(position1));
        expect(position1.length > 0).assertTrue();
        let position2 = runs[0].getPositions({start: 0, end: 1});
        console.info('www data position2 ' + JSON.stringify(position2));
        expect(position2.length > 0).assertTrue();
        let position3 = runs[0].getPositions({start: 0, end: 0});
        console.info('www data position3 ' + JSON.stringify(position3));
        expect(position3.length > 0).assertTrue();
        let position4 = runs[0].getPositions({start: 0, end: -1});
        console.info('www data position4 ' + JSON.stringify(position4));
        expect(position4 == undefined).assertTrue();
        let position5 = runs[0].getPositions(null);
        console.info('www data position5 ' + JSON.stringify(position5));
        expect(position5 == undefined).assertTrue();
        let position6 = runs[0].getPositions(undefined);
        console.info('www data position6 ' + JSON.stringify(position6));
        expect(position6 == undefined).assertTrue();
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testTextReturnValue_0700
     * @tc.number testTextReturnValue_0700
     * @tc.desc   testTextReturnValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTextReturnValue_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg  = "====testTextReturnValue_0700====";
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
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        let lines =  paragraph.getTextLines();
        let runs = lines[0].getGlyphRuns();
        console.info('www data runs ' + JSON.stringify(runs));
        expect(runs.length > 0).assertTrue();
        let offset = runs[0].getOffsets();
        console.info('www data offset ' + JSON.stringify(offset));
        expect(offset.length > 0).assertTrue();
        let indices = runs[0].getStringIndices(); // 获取渲染块全部字符索引
        console.info('www data indices ' + JSON.stringify(indices));
        expect(indices.length > 0).assertTrue();
        let indicesRange1 = runs[0].getStringIndices({start:1, end:2}); // 获取渲染块从起始位置1开始, 长度为2范围内的字符索引
        console.info('www data indicesRange1 ' + JSON.stringify(indicesRange1));
        expect(indicesRange1.length > 0).assertTrue();
        let indicesRange2 = runs[0].getStringIndices({start:-1, end:2}); // -1是非法参数，将返回undefined
        console.info('www data indicesRange2 ' + JSON.stringify(indicesRange2));
        expect(indicesRange2 == undefined).assertTrue();
        let indicesRange3 = runs[0].getStringIndices({start:0, end:-10}); // -10是非法参数，将返回undefined
        console.info('www data indicesRange3 ' + JSON.stringify(indicesRange3));
        expect(indicesRange3 == undefined).assertTrue();
        let indicesNull = runs[0].getStringIndices(null); // null是非法参数，将返回undefined
        console.info('www data indicesNull ' + JSON.stringify(indicesNull));
        expect(indicesNull == undefined).assertTrue();
        let indicesUndefined = runs[0].getStringIndices(undefined); // undefined是非法参数，将返回undefined
        console.info('www data indicesUndefined ' + JSON.stringify(indicesUndefined));
        expect(indicesUndefined == undefined).assertTrue();
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSetTextHighContrastNull
     * @tc.number SUB_GRAPHIC_text_testSetTextHighContrastNull_0100
     * @tc.desc   Test setTextHighContrast property set to null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetTextHighContrastNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msgStr  = "==== www data testSetTextHighContrastNull===="
      try {
        text.setTextHighContrast(null);
        console.info(msgStr + ' setTextHighContrast success ');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(msgStr + ' setTextHighContrast error ', err.code);
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testSetTextHighContrastUndefined
     * @tc.number SUB_GRAPHIC_text_testSetTextHighContrastUndefined_0100
     * @tc.desc   Test setTextHighContrast property set to undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetTextHighContrastUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msgStr  = "==== www data testSetTextHighContrastUndefined===="
      try {
        text.setTextHighContrast(undefined);
        console.info(msgStr + ' setTextHighContrast success ');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(msgStr + ' setTextHighContrast error ', err.code);
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testSetTextUndefinedGlyphDisplayNull
     * @tc.number SUB_GRAPHIC_text_setTextUndefinedGlyphDisplayNull_0100
     * @tc.desc   Test setTextUndefinedGlyphDisplay property set to null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetTextUndefinedGlyphDisplayNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msgStr = "==== www data testSetTextUndefinedGlyphDisplayNull===="
      try {
        text.setTextUndefinedGlyphDisplay(null);
        console.info(msgStr + ' setTextUndefinedGlyphDisplay success ');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(msgStr + ' setTextUndefinedGlyphDisplay error ', err.code);
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   testSetTextUndefinedGlyphDisplayUndefined
     * @tc.number SUB_GRAPHIC_text_setTextUndefinedGlyphDisplayUndefined_0100
     * @tc.desc   Test setTextUndefinedGlyphDisplay property set to undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetTextUndefinedGlyphDisplayUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msgStr  = "==== www data testSetTextUndefinedGlyphDisplayUndefined===="
      try {
        text.setTextUndefinedGlyphDisplay(undefined);
        console.info(msgStr + ' setTextUndefinedGlyphDisplay success ');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(msgStr + ' setTextUndefinedGlyphDisplay error ', err.code);
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   getRectsForRangeNull
     * @tc.number SUB_GRAPHIC_Text_getRectsForRange_null_0100
     * @tc.desc   Paragraph getRectsForRange null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getRectsForRangeNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msgStr = 'www data getRectsForRangeNull';
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          const range: text.Range = { start: 0, end: 4 };
          const rects = paragraph.getRectsForRange(
            range, text.RectWidthStyle.TIGHT, text.RectHeightStyle.INCLUDE_LINE_SPACE_MIDDLE
          );
          try {
            const rects = paragraph.getRectsForRange(range, null, text.RectHeightStyle.INCLUDE_LINE_SPACE_MIDDLE);
            console.info(`${msgStr} success `, rects);
          } catch (err) {
            console.info(`${msgStr} error `, err.code);
            expect().assertFail();
          }
          try {
            const rects = paragraph.getRectsForRange(range, text.RectWidthStyle.TIGHT, null);
            console.info(`${msgStr} success `, rects);
          } catch (err) {
            console.info(`${msgStr} error `, err.code);
            expect().assertFail();
          }
          done();
        } catch (err) {
          console.info(`${msgStr} error `, err.code);
          expect(true).assertFail();
          done();
        }
      });

    /**
     * @tc.name   getRectsForRangeUndefined
     * @tc.number SUB_GRAPHIC_Text_getRectsForRange_undefined_0100
     * @tc.desc   Paragraph getRectsForRange undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getRectsForRangeUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msgStr = 'www data getRectsForRangeUndefined';
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          const range: text.Range = { start: 0, end: 4 };
          try {
            const rects = paragraph.getRectsForRange(range, text.RectWidthStyle.TIGHT, undefined);
            console.info(`${msgStr} success `, rects);
          } catch (err) {
            console.info(`${msgStr} error `, err.code);
            expect().assertFail();
          }
          try {
            const rects = paragraph.getRectsForRange(range, undefined, text.RectHeightStyle.INCLUDE_LINE_SPACE_MIDDLE);
            console.info(`${msgStr} success `, rects);
          } catch (err) {
            console.info(`${msgStr} error `, err.code);
            expect().assertFail();
          }
          done();
        } catch (err) {
          console.info(`${msgStr} getRectsForRangeHeightStyleIncludeLineSpaceMiddle error `, err);
          expect(true).assertFail();
          done();
        }
      });
    /**
     * @tc.name   testGetActualTextRangeNull
     * @tc.number SUB_GRAPHIC_Text_testGetActualTextRange_Null_0100
     * @tc.desc   Paragraph getActualTextRange lineNumber parameter null test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetActualTextRangeNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msgStr = 'www data testGetActualTextRangeNull';
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          try {
            const result = paragraph.getActualTextRange(0, null);
            console.info(`${msgStr} success `, result);
          } catch (err) {
            console.info(`${msgStr} error `, err.code);
            expect().assertFail();
          }
          done();
        } catch (err) {
          console.info(`${msgStr} error `, err);
          expect().assertFail();
          done();
        }
      });
      
    /**
     * @tc.name   testGetActualTextRangeUndefined
     * @tc.number SUB_GRAPHIC_Text_testGetActualTextRange_Undefined_0100
     * @tc.desc   Paragraph getActualTextRange lineNumber parameter undefined test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetActualTextRangeUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msgStr = 'www data testGetActualTextRangeUndefined';
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          try {
            const result = paragraph.getActualTextRange(0, undefined);
            console.info(`${msgStr} success `, result);
          } catch (err) {
            console.info(`${msgStr} error `, err.code);
            expect().assertFail();
          }
          done();
        } catch (err) {
          console.info(`${msgStr} error `, err);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name    getCharacterRangeForGlyphRange_InvalidEncoding_001
     * @tc.number  SUB_GRAPHIC_Paragraph_getCharacterRangeForGlyphRange_InvalidEncoding_001
     * @tc.desc    Test getCharacterRangeForGlyphRange with invalid encoding (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('getCharacterRangeForGlyphRange_InvalidEncoding_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const glyphRange: text.Range = { start: 0, end: 1 };
          const fontCollection = text.FontCollection.getLocalInstance();
          const myTextStyle: text.TextStyle = { fontSize: 20 };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          const paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          paragraph.getCharacterRangeForGlyphRange(glyphRange, -1);
          console.info('www data getCharacterRangeForGlyphRange_InvalidEncoding_001 success ');
          expect().assertFail();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data getCharacterRangeForGlyphRange_InvalidEncoding_001 error ' + err.code);
          expect(err.code).assertEqual(25900001);
        }
        done();
      })

    /**
     * @tc.name    getCharacterRangeForGlyphRange_InvalidEncoding_002
     * @tc.number  SUB_GRAPHIC_Paragraph_getCharacterRangeForGlyphRange_InvalidEncoding_002
     * @tc.desc    Test getCharacterRangeForGlyphRange with invalid encoding (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('getCharacterRangeForGlyphRange_InvalidEncoding_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const glyphRange: text.Range = { start: 0, end: 1 };
          const fontCollection = text.FontCollection.getLocalInstance();
          const myTextStyle: text.TextStyle = { fontSize: 20 };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          const paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          paragraph.getCharacterRangeForGlyphRange(glyphRange, 9999);
          console.info('www data getCharacterRangeForGlyphRange_InvalidEncoding_002 success ');
          expect().assertFail();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data getCharacterRangeForGlyphRange_InvalidEncoding_002 error ' + err.code);
          expect(err.code).assertEqual(25900001);
        }
        done();
      })

    /**
     * @tc.name    getGlyphRangeForCharacterRange_InvalidEncoding_001
     * @tc.number  SUB_GRAPHIC_Paragraph_getGlyphRangeForCharacterRange_InvalidEncoding_001
     * @tc.desc    Test getGlyphRangeForCharacterRange with invalid encoding (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('getGlyphRangeForCharacterRange_InvalidEncoding_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const characterRange: text.Range = { start: 0, end: 1 };
          const fontCollection = text.FontCollection.getLocalInstance();
          const myTextStyle: text.TextStyle = { fontSize: 20 };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          const paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          paragraph.getGlyphRangeForCharacterRange(characterRange, -1);
          console.info('www data getGlyphRangeForCharacterRange_InvalidEncoding_001 success ');
          expect().assertFail();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data getGlyphRangeForCharacterRange_InvalidEncoding_001 error ' + err.code);
          expect(err.code).assertEqual(25900001);
        }
        done();
      })

    /**
     * @tc.name    getGlyphRangeForCharacterRange_InvalidEncoding_002
     * @tc.number  SUB_GRAPHIC_Paragraph_getGlyphRangeForCharacterRange_InvalidEncoding_002
     * @tc.desc    Test getGlyphRangeForCharacterRange with invalid encoding (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('getGlyphRangeForCharacterRange_InvalidEncoding_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const characterRange: text.Range = { start: 0, end: 1 };
          const fontCollection = text.FontCollection.getLocalInstance();
          const myTextStyle: text.TextStyle = { fontSize: 20 };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          const paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          paragraph.getGlyphRangeForCharacterRange(characterRange, 9999);
          console.info('www data getGlyphRangeForCharacterRange_InvalidEncoding_002 success ');
          expect().assertFail();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data getGlyphRangeForCharacterRange_InvalidEncoding_002 error ' + err.code);
          expect(err.code).assertEqual(25900001);
        }
        done();
      })

    /**
     * @tc.name    getCharacterPositionAtCoordinate_InvalidEncoding_001
     * @tc.number  SUB_GRAPHIC_Paragraph_getCharacterPositionAtCoordinate_InvalidEncoding_001
     * @tc.desc    Test getCharacterPositionAtCoordinate with invalid encoding (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('getCharacterPositionAtCoordinate_InvalidEncoding_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const fontCollection = text.FontCollection.getLocalInstance();
          const myTextStyle: text.TextStyle = { fontSize: 20 };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          const paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          paragraph.getCharacterPositionAtCoordinate(0, 0, -1);
          console.info('www data getCharacterPositionAtCoordinate_InvalidEncoding_001 success ');
          expect().assertFail();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data getCharacterPositionAtCoordinate_InvalidEncoding_001 error ' + err.code);
          expect(err.code).assertEqual(25900001);
        }
        done();
      })

    /**
     * @tc.name    getCharacterPositionAtCoordinate_InvalidEncoding_002
     * @tc.number  SUB_GRAPHIC_Paragraph_getCharacterPositionAtCoordinate_InvalidEncoding_002
     * @tc.desc    Test getCharacterPositionAtCoordinate with invalid encoding (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('getCharacterPositionAtCoordinate_InvalidEncoding_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const fontCollection = text.FontCollection.getLocalInstance();
          const myTextStyle: text.TextStyle = { fontSize: 20 };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          const paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          paragraph.getCharacterPositionAtCoordinate(0, 0, 9999);
          console.info('www data getCharacterPositionAtCoordinate_InvalidEncoding_002 success ');
          expect().assertFail();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data getCharacterPositionAtCoordinate_InvalidEncoding_002 error ' + err.code);
          expect(err.code).assertEqual(25900001);
        }
        done();
      })

    /**
     * @tc.name    setTextHighContrast_InvalidValue_001
     * @tc.number  SUB_GRAPHIC_Text_setTextHighContrast_InvalidValue_001
     * @tc.desc    Test setTextHighContrast with invalid action (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('setTextHighContrast_InvalidValue_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const fontCollection: text.FontCollection = new text.FontCollection();
          const fontFamilies: Array<string> = ["Clock_01"];
          const myTextStyle: text.TextStyle = { fontFamilies: fontFamilies };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          text.setTextHighContrast(-1);
          console.info('www data setTextHighContrast_InvalidValue_001 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data setTextHighContrast_InvalidValue_001 error ' + err.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name    setTextHighContrast_InvalidValue_002
     * @tc.number  SUB_GRAPHIC_Text_setTextHighContrast_InvalidValue_002
     * @tc.desc    Test setTextHighContrast with invalid action (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('setTextHighContrast_InvalidValue_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const fontCollection: text.FontCollection = new text.FontCollection();
          const fontFamilies: Array<string> = ["Clock_01"];
          const myTextStyle: text.TextStyle = { fontFamilies: fontFamilies };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          text.setTextHighContrast(9999);
          console.info('www data setTextHighContrast_InvalidValue_002 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data setTextHighContrast_InvalidValue_002 error ' + err.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name    setTextUndefinedGlyphDisplay_InvalidValue_001
     * @tc.number  SUB_GRAPHIC_Text_setTextUndefinedGlyphDisplay_InvalidValue_001
     * @tc.desc    Test setTextUndefinedGlyphDisplay with invalid noGlyphShow (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('setTextUndefinedGlyphDisplay_InvalidValue_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const fontCollection: text.FontCollection = new text.FontCollection();
          const fontFamilies: Array<string> = ["Clock_01"];
          const myTextStyle: text.TextStyle = { fontFamilies: fontFamilies };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          text.setTextUndefinedGlyphDisplay(-1);
          console.info('www data setTextUndefinedGlyphDisplay_InvalidValue_001 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data setTextUndefinedGlyphDisplay_InvalidValue_001 error ' + err.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name    setTextUndefinedGlyphDisplay_InvalidValue_002
     * @tc.number  SUB_GRAPHIC_Text_setTextUndefinedGlyphDisplay_InvalidValue_002
     * @tc.desc    Test setTextUndefinedGlyphDisplay with invalid noGlyphShow (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('setTextUndefinedGlyphDisplay_InvalidValue_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const fontCollection: text.FontCollection = new text.FontCollection();
          const fontFamilies: Array<string> = ["Clock_01"];
          const myTextStyle: text.TextStyle = { fontFamilies: fontFamilies };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          text.setTextUndefinedGlyphDisplay(9999);
          console.info('www data setTextUndefinedGlyphDisplay_InvalidValue_002 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data setTextUndefinedGlyphDisplay_InvalidValue_002 error ' + err.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name    updateDecoration_InvalidTextDecoration_001
     * @tc.number  SUB_GRAPHIC_Paragraph_updateDecoration_InvalidTextDecoration_001
     * @tc.desc    Test updateDecoration with invalid textDecoration (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('updateDecoration_InvalidTextDecoration_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const fontCollection: text.FontCollection = new text.FontCollection();
          const fontFamilies: Array<string> = ["Clock_01"];
          const myTextStyle: text.TextStyle = { fontFamilies: fontFamilies };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.updateDecoration({
            textDecoration: -1,
            color: { alpha: 255, red: 255, green: 0, blue: 0 },
            decorationStyle: text.TextDecorationStyle.SOLID,
            decorationThicknessScale: 1.0
          });
          paragraph.layoutSync(600);
          console.info('www data updateDecoration_InvalidTextDecoration_001 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data updateDecoration_InvalidTextDecoration_001 error ' + err.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name    updateDecoration_InvalidTextDecoration_002
     * @tc.number  SUB_GRAPHIC_Paragraph_updateDecoration_InvalidTextDecoration_002
     * @tc.desc    Test updateDecoration with invalid textDecoration (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('updateDecoration_InvalidTextDecoration_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const fontCollection: text.FontCollection = new text.FontCollection();
          const fontFamilies: Array<string> = ["Clock_01"];
          const myTextStyle: text.TextStyle = { fontFamilies: fontFamilies };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.updateDecoration({
            textDecoration: 9999,
            color: { alpha: 255, red: 255, green: 0, blue: 0 },
            decorationStyle: text.TextDecorationStyle.SOLID,
            decorationThicknessScale: 1.0
          });
          paragraph.layoutSync(600);
          console.info('www data updateDecoration_InvalidTextDecoration_002 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data updateDecoration_InvalidTextDecoration_002 error ' + err.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name    updateDecoration_InvalidDecorationStyle_001
     * @tc.number  SUB_GRAPHIC_Paragraph_updateDecoration_InvalidDecorationStyle_001
     * @tc.desc    Test updateDecoration with invalid decorationStyle (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('updateDecoration_InvalidDecorationStyle_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const fontCollection: text.FontCollection = new text.FontCollection();
          const fontFamilies: Array<string> = ["Clock_01"];
          const myTextStyle: text.TextStyle = { fontFamilies: fontFamilies };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.updateDecoration({
            textDecoration: text.TextDecorationType.LINE_THROUGH,
            color: { alpha: 255, red: 255, green: 0, blue: 0 },
            decorationStyle: -1,
            decorationThicknessScale: 1.0
          });
          paragraph.layoutSync(600);
          console.info('www data updateDecoration_InvalidDecorationStyle_001 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data updateDecoration_InvalidDecorationStyle_001 error ' + err.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name    updateDecoration_InvalidDecorationStyle_002
     * @tc.number  SUB_GRAPHIC_Paragraph_updateDecoration_InvalidDecorationStyle_002
     * @tc.desc    Test updateDecoration with invalid decorationStyle (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('updateDecoration_InvalidDecorationStyle_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const fontCollection: text.FontCollection = new text.FontCollection();
          const fontFamilies: Array<string> = ["Clock_01"];
          const myTextStyle: text.TextStyle = { fontFamilies: fontFamilies };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.updateDecoration({
            textDecoration: text.TextDecorationType.LINE_THROUGH,
            color: { alpha: 255, red: 255, green: 0, blue: 0 },
            decorationStyle: 9999,
            decorationThicknessScale: 1.0
          });
          paragraph.layoutSync(600);
          console.info('www data updateDecoration_InvalidDecorationStyle_002 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data updateDecoration_InvalidDecorationStyle_002 error ' + err.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name    getFontPathsByType_InvalidValue_001
     * @tc.number  SUB_GRAPHIC_Text_getFontPathsByType_InvalidValue_001
     * @tc.desc    Test getFontPathsByType with invalid fontType (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('getFontPathsByType_InvalidValue_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const fontCollection: text.FontCollection = new text.FontCollection();
          const fontFamilies: Array<string> = ["Clock_01"];
          const myTextStyle: text.TextStyle = { fontFamilies: fontFamilies };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          text.getFontPathsByType(-1);
          console.info('www data getFontPathsByType_InvalidValue_001 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data getFontPathsByType_InvalidValue_001 error ' + err.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name    getFontPathsByType_InvalidValue_002
     * @tc.number  SUB_GRAPHIC_Text_getFontPathsByType_InvalidValue_002
     * @tc.desc    Test getFontPathsByType with invalid fontType (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('getFontPathsByType_InvalidValue_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const fontCollection: text.FontCollection = new text.FontCollection();
          const fontFamilies: Array<string> = ["Clock_01"];
          const myTextStyle: text.TextStyle = { fontFamilies: fontFamilies };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          text.getFontPathsByType(9999);
          console.info('www data getFontPathsByType_InvalidValue_002 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data getFontPathsByType_InvalidValue_002 error ' + err.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name    createTruncatedLine_InvalidEllipsisMode_001
     * @tc.number  SUB_GRAPHIC_TextLine_createTruncatedLine_InvalidEllipsisMode_001
     * @tc.desc    Test createTruncatedLine with invalid ellipsisMode (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('createTruncatedLine_InvalidEllipsisMode_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const lines: text.TextLine[] = paragraph.getTextLines();
          const truncatedLine: text.TextLine = lines[0].createTruncatedLine(100, -1, '...');
          console.info('www data createTruncatedLine_InvalidEllipsisMode_001 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createTruncatedLine_InvalidEllipsisMode_001 error ' + err.code);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name    createTruncatedLine_InvalidEllipsisMode_002
     * @tc.number  SUB_GRAPHIC_TextLine_createTruncatedLine_InvalidEllipsisMode_002
     * @tc.desc    Test createTruncatedLine with invalid ellipsisMode (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('createTruncatedLine_InvalidEllipsisMode_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const lines: text.TextLine[] = paragraph.getTextLines();
          const truncatedLine: text.TextLine = lines[0].createTruncatedLine(100, 9999, '...');
          console.info('www data createTruncatedLine_InvalidEllipsisMode_002 success ');
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data createTruncatedLine_InvalidEllipsisMode_002 error ' + err.code);
          expect().assertFail();
        }
        done();
      })

  })
}