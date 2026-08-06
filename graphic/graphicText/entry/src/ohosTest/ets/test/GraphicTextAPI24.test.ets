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
import { describe, beforeAll, it, expect, TestType, Level, Size } from "@ohos/hypium"
import text from "@ohos.graphics.text";
import drawing from '@ohos.graphics.drawing';

export default function GraphicTextAPI24() {

  describe('GraphicTextAPI24', () => {
    beforeAll(() => {
    })

    /**
     * @tc.name   graphicTextAPI24Test_0100
     * @tc.number graphicTextAPI24Test_0100
     * @tc.desc   Test TextStyle Property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI24Test_0100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = "====www data graphicTextAPI24Test_0100===="
        await text.getFontDescriptorsFromPath($rawfile('test.ttf'))
          .then((fontFullDescriptors: Array<text.FontDescriptor>) => {
            let fontFullDescriptor = fontFullDescriptors[0];
            let variationAxisRecords = fontFullDescriptor.variationAxisRecords as Array<text.FontVariationAxis>;
            console.info(msgStr + 'length ', variationAxisRecords.length);
            expect(variationAxisRecords.length).assertLarger(0);
            let variationInstanceRecords = fontFullDescriptor.variationInstanceRecords as Array<text.FontVariationInstance>;
            console.info(msgStr + 'length ', variationInstanceRecords.length);
            expect(variationInstanceRecords.length).assertLarger(0);
          })
        done();
      })

    /**
     * @tc.name   graphicTextAPI24Test_0200
     * @tc.number graphicTextAPI24Test_0200
     * @tc.desc   Test fontVariationAxis Property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI24Test_0200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = "====www data graphicTextAPI24Test_0200===="
        await text.getFontDescriptorsFromPath($rawfile('test.ttf'))
          .then((fontFullDescriptors: Array<text.FontDescriptor>) => {
            let fontFullDescriptor = fontFullDescriptors[0];
            let variationAxisRecords = fontFullDescriptor.variationAxisRecords as Array<text.FontVariationAxis>;
            let fontVariationAxis: text.FontVariationAxis = variationAxisRecords[0];
            console.info(msgStr, JSON.stringify(fontVariationAxis));
            expect(fontVariationAxis.defaultValue).assertEqual(400);
            expect(fontVariationAxis.localName).assertEqual('Weight');
            expect(fontVariationAxis.minValue).assertEqual(40);
            expect(fontVariationAxis.maxValue).assertEqual(900);
            expect(fontVariationAxis.flags).assertEqual(0);
            expect(fontVariationAxis.name).assertEqual('Weight');
            expect(fontVariationAxis.key).assertEqual('wght');
          })
        done();
      })

    /**
     * @tc.name   graphicTextAPI24Test_0300
     * @tc.number graphicTextAPI24Test_0300
     * @tc.desc   Test fontVariationInstance Property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI24Test_0300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = "====www data graphicTextAPI24Test_0300===="
        await text.getFontDescriptorsFromPath($rawfile('test.ttf'))
          .then((fontFullDescriptors: Array<text.FontDescriptor>) => {
            let fontFullDescriptor = fontFullDescriptors[0];
            let variationInstanceRecords = fontFullDescriptor.variationInstanceRecords as Array<text.FontVariationInstance>;
            let fontVariationInstance: text.FontVariationInstance = variationInstanceRecords[0];
            console.info(msgStr, JSON.stringify(fontVariationInstance));
            expect(fontVariationInstance.localName).assertEqual('Thin');
            expect(fontVariationInstance.name).assertEqual('Thin');
            let coordinates: Array<text.FontVariation> = fontVariationInstance.coordinates as Array<text.FontVariation>;
            expect(coordinates.length).assertLarger(0);
            expect(coordinates[0].value).assertEqual(100);
            expect(coordinates[0].axis).assertEqual('wght');
          })
        done();
      })

    /**
     * @tc.name   graphicTextAPI24Test_0400
     * @tc.number graphicTextAPI24Test_0400
     * @tc.desc   Test fontVariationInstance Property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI24Test_0400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = "====www data graphicTextAPI24Test_0400===="
        let size: text.TextRectSize = { width: 200, height: 100 };
        let fontCollection = text.FontCollection.getLocalInstance();
        let myTextStyle: text.TextStyle = {
          fontSize: 20
        }
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);

        let textLayoutResult: text.TextLayoutResult = paragraph.layoutWithConstraints(size); // 功能增强的 layoutSync
        console.info(msgStr + 'Width: ' + textLayoutResult.correctRect.width + ', Height: '
          + textLayoutResult.correctRect.height);
        for (let i = 0; i < textLayoutResult.fitStrRange.length; ++i) {
          console.info(msgStr + 'fitRange: [' + textLayoutResult.fitStrRange[i].start + ', '
            + textLayoutResult.fitStrRange[i].end + ']');
        }
        expect(textLayoutResult.fitStrRange.length).assertLarger(0);
        expect(Math.round(textLayoutResult.correctRect.width * 100) / 100).assertEqual(194.98);
        expect(textLayoutResult.correctRect.width).assertLarger(194);
        expect(textLayoutResult.correctRect.height).assertEqual(69);
        expect(textLayoutResult.fitStrRange[0].start).assertEqual(0);
        expect(textLayoutResult.fitStrRange[0].end).assertEqual(39);
        done();
      })

    /**
     * @tc.name   graphicTextAPI24Test_0500
     * @tc.number graphicTextAPI24Test_0500
     * @tc.desc   Test getCharacterRangeForGlyphRange Method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI24Test_0500',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = "====www data graphicTextAPI24Test_0500===="
        let glyphRange: text.Range = { start: 0, end: 5 };
        let fontCollection = text.FontCollection.getLocalInstance();
        let myTextStyle: text.TextStyle = {
          fontSize: 20
        }
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        let ranges = paragraph.getCharacterRangeForGlyphRange(glyphRange, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msgStr + 'ranges ', JSON.stringify(ranges));
        expect(ranges.length).assertLarger(0);
        expect(ranges[0].start).assertEqual(0);
        expect(ranges[0].end).assertEqual(9);
        done();
      })

    /**
     * @tc.name   graphicTextAPI24Test_0600
     * @tc.number graphicTextAPI24Test_0600
     * @tc.desc   Test getCharacterRangeForGlyphRange Method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI24Test_0600',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = "====www data graphicTextAPI24Test_0600===="
        let glyphRange: text.Range = { start: 0, end: 5 };
        let fontCollection = text.FontCollection.getLocalInstance();
        let myTextStyle: text.TextStyle = {
          fontSize: 20
        }
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        try {
          let ranges1 = paragraph.getCharacterRangeForGlyphRange(glyphRange, drawing.TextEncoding.TEXT_ENCODING_UTF16);
          console.info(msgStr + 'ranges1 success ', JSON.stringify(ranges1));
          expect(ranges1.length).assertLarger(0);
          expect(ranges1[0].start).assertEqual(0);
          expect(ranges1[0].end).assertEqual(5);
        } catch(err){
          console.error(msgStr + 'ranges1 error ', err.code);
          expect().assertFail();
        }
        try {
          let ranges2 = paragraph.getCharacterRangeForGlyphRange(glyphRange, drawing.TextEncoding.TEXT_ENCODING_UTF32);
          console.info(msgStr + 'ranges2 success ', JSON.stringify(ranges2));
        } catch(err){
          console.error(msgStr + 'ranges2 error ', err.code);
          expect(err.code).assertEqual(25900001);
        }
        try {
          let ranges3 = paragraph.getCharacterRangeForGlyphRange(glyphRange, drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID);
          console.info(msgStr + 'ranges3 success ', JSON.stringify(ranges3));
        } catch(err){
          console.error(msgStr + 'ranges3 error ', err.code);
          expect(err.code).assertEqual(25900001);
        }
        done();
      })

    /**
     * @tc.name   graphicTextAPI24Test_0700
     * @tc.number graphicTextAPI24Test_0700
     * @tc.desc   Test getGlyphRangeForCharacterRange Method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI24Test_0700',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = "====www data graphicTextAPI24Test_0700===="
        let characterRange: text.Range = { start: 0, end: 5 };
        let fontCollection = text.FontCollection.getLocalInstance();
        let myTextStyle: text.TextStyle = {
          fontSize: 20
        }
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        let ranges = paragraph.getGlyphRangeForCharacterRange(characterRange, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msgStr + 'ranges ', JSON.stringify(ranges));
        expect(ranges.length).assertLarger(0);
        expect(ranges[0].start).assertEqual(0);
        expect(ranges[0].end).assertEqual(2);
        done();
      })

    /**
     * @tc.name   graphicTextAPI24Test_0800
     * @tc.number graphicTextAPI24Test_0800
     * @tc.desc   Test getGlyphRangeForCharacterRange Method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI24Test_0800',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = "====www data graphicTextAPI24Test_0800===="
        let glyphRange: text.Range = { start: 0, end: 5 };
        let fontCollection = text.FontCollection.getLocalInstance();
        let myTextStyle: text.TextStyle = {
          fontSize: 20
        }
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        try {
          let ranges1 = paragraph.getGlyphRangeForCharacterRange(glyphRange, drawing.TextEncoding.TEXT_ENCODING_UTF16);
          console.info(msgStr + 'ranges1 success ', JSON.stringify(ranges1));
          expect(ranges1.length).assertLarger(0);
          expect(ranges1[0].start).assertEqual(0);
          expect(ranges1[0].end).assertEqual(5);
        } catch(err){
          console.error(msgStr + 'ranges1 error ', err.code);
          expect().assertFail();
        }
        try {
          let ranges2 = paragraph.getGlyphRangeForCharacterRange(glyphRange, drawing.TextEncoding.TEXT_ENCODING_UTF32);
          console.info(msgStr + 'ranges2 success ', JSON.stringify(ranges2));
        } catch(err){
          console.error(msgStr + 'ranges2 error ', err.code);
          expect(err.code).assertEqual(25900001);
        }
        try {
          let ranges3 = paragraph.getGlyphRangeForCharacterRange(glyphRange, drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID);
          console.info(msgStr + 'ranges3 success ', JSON.stringify(ranges3));
        } catch(err){
          console.error(msgStr + 'ranges3 error ', err.code);
          expect(err.code).assertEqual(25900001);
        }
        done();
      })

    /**
     * @tc.name   graphicTextAPI24Test_0900
     * @tc.number graphicTextAPI24Test_0900
     * @tc.desc   Test getCharacterPositionAtCoordinate Method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI24Test_0900',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = "====www data graphicTextAPI24Test_0900===="
        let characterRange: text.Range = { start: 0, end: 5 };
        let fontCollection = text.FontCollection.getLocalInstance();
        let myTextStyle: text.TextStyle = {
          fontSize: 20
        }
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "123456";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        let x = 0;
        let y = 0;
        let position = paragraph.getCharacterPositionAtCoordinate(x, y, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msgStr + 'position ', JSON.stringify(position));
        expect(position.affinity).assertEqual(text.Affinity.DOWNSTREAM);
        expect(position.position).assertEqual(0);
        done();
      })

    /**
     * @tc.name   graphicTextAPI24Test_1000
     * @tc.number graphicTextAPI24Test_1000
     * @tc.desc   Test getGlyphRangeForCharacterRange Method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI24Test_1000',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = "====www data graphicTextAPI24Test_1000===="
        let glyphRange: text.Range = { start: 0, end: 5 };
        let fontCollection = text.FontCollection.getLocalInstance();
        let myTextStyle: text.TextStyle = {
          fontSize: 20
        }
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        let x = 10;
        let y = 5;
        try {
          let position1 = paragraph.getCharacterPositionAtCoordinate(x, y, drawing.TextEncoding.TEXT_ENCODING_UTF16);
          console.info(msgStr + 'position1 success ', JSON.stringify(position1));
          expect(position1.affinity).assertEqual(text.Affinity.UPSTREAM);
          expect(position1.position).assertEqual(1);
        } catch(err){
          console.error(msgStr + 'position1 error ', err.code);
          expect().assertFail();
        }
        try {
          let position2 = paragraph.getCharacterPositionAtCoordinate(x, y, drawing.TextEncoding.TEXT_ENCODING_UTF32);
          console.info(msgStr + 'position2 success ', JSON.stringify(position2));
        } catch(err){
          console.error(msgStr + 'position2 error ', err.code);
          expect(err.code).assertEqual(25900001);
        }
        try {
          let position3 = paragraph.getCharacterPositionAtCoordinate(x, y, drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID);
          console.info(msgStr + 'position3 success ', JSON.stringify(position3));
        } catch(err){
          console.error(msgStr + 'position3 error ', err.code);
          expect(err.code).assertEqual(25900001);
        }
        done();
      })

    /**
     * @tc.name   graphicTextAPI24Test_1100
     * @tc.number graphicTextAPI24Test_1100
     * @tc.desc   Test layoutWithConstraints Property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI24Test_1100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = "====www data graphicTextAPI24Test_1100===="
        let fontCollection = text.FontCollection.getLocalInstance();
        let myTextStyle: text.TextStyle = {
          fontSize: 20
        }
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        try {
          let textLayoutResult: text.TextLayoutResult = paragraph.layoutWithConstraints(null);
          console.info(msgStr + 'textLayoutResult null success ', JSON.stringify(textLayoutResult));
        } catch(err){
          console.error(msgStr + 'textLayoutResult null error ', err.code);
          expect(err.code).assertEqual(401);
        }
        try {
          let textLayoutResult: text.TextLayoutResult = paragraph.layoutWithConstraints(undefined);
          console.info(msgStr + 'textLayoutResult undefined success ', JSON.stringify(textLayoutResult));
        } catch(err){
          console.error(msgStr + 'textLayoutResult undefined error ', err.code);
          expect(err.code).assertEqual(401);
        }
        done();
      })

    /**
     * @tc.name   graphicTextAPI24Test_1200
     * @tc.number graphicTextAPI24Test_1200
     * @tc.desc   Test getCharacterRangeForGlyphRange Method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI24Test_1200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = "====www data graphicTextAPI24Test_1200===="
        let glyphRange: text.Range = { start: 0, end: 5 };
        let fontCollection = text.FontCollection.getLocalInstance();
        let myTextStyle: text.TextStyle = {
          fontSize: 20
        }
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        try {
          let ranges = paragraph.getCharacterRangeForGlyphRange(null, drawing.TextEncoding.TEXT_ENCODING_UTF8);
          console.info(msgStr + 'ranges null success ', JSON.stringify(ranges));
        } catch(err){
          console.error(msgStr + 'ranges null error ', err.code);
          expect(err.code).assertEqual(401);
        }
        try {
          let ranges = paragraph.getCharacterRangeForGlyphRange(undefined, drawing.TextEncoding.TEXT_ENCODING_UTF8);
          console.info(msgStr + 'ranges undefined success ', JSON.stringify(ranges));
        } catch(err){
          console.error(msgStr + 'ranges undefined error ', err.code);
          expect(err.code).assertEqual(401);
        }
        done();
      })

    /**
     * @tc.name   graphicTextAPI24Test_1300
     * @tc.number graphicTextAPI24Test_1300
     * @tc.desc   Test getGlyphRangeForCharacterRange Method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI24Test_1300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = "====www data graphicTextAPI24Test_1300===="
        let characterRange: text.Range = { start: 0, end: 5 };
        let fontCollection = text.FontCollection.getLocalInstance();
        let myTextStyle: text.TextStyle = {
          fontSize: 20
        }
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        try {
          let ranges = paragraph.getGlyphRangeForCharacterRange(null, drawing.TextEncoding.TEXT_ENCODING_UTF8);
          console.info(msgStr + 'ranges null success ', JSON.stringify(ranges));
        } catch(err){
          console.error(msgStr + 'ranges null error ', err.code);
          expect(err.code).assertEqual(401);
        }
        try {
          let ranges = paragraph.getGlyphRangeForCharacterRange(undefined, drawing.TextEncoding.TEXT_ENCODING_UTF8);
          console.info(msgStr + 'ranges undefined success ', JSON.stringify(ranges));
        } catch(err){
          console.error(msgStr + 'ranges undefined error ', err.code);
          expect(err.code).assertEqual(401);
        }
        done();
      })

    /**
     * @tc.name   graphicTextAPI24Test_1400
     * @tc.number graphicTextAPI24Test_1400
     * @tc.desc   Test getCharacterPositionAtCoordinate Method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI24Test_1400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = "====www data graphicTextAPI24Test_1400===="
        let fontCollection = text.FontCollection.getLocalInstance();
        let myTextStyle: text.TextStyle = {
          fontSize: 20
        }
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "123456";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        let x = 0;
        let y = 0;
        try {
          let position = paragraph.getCharacterPositionAtCoordinate(null, null, drawing.TextEncoding.TEXT_ENCODING_UTF8);
          console.info(msgStr + 'position null success ', JSON.stringify(position));
        } catch(err){
          console.error(msgStr + 'position null error ', err.code);
          expect(err.code).assertEqual(401);
        }
        try {
          let position = paragraph.getCharacterPositionAtCoordinate(undefined, undefined, drawing.TextEncoding.TEXT_ENCODING_UTF8);
          console.info(msgStr + 'position null success ', JSON.stringify(position));
        } catch(err){
          console.error(msgStr + 'position null error ', err.code);
          expect(err.code).assertEqual(401);
        }
        done();
      })

    /**
     * @tc.name   graphicTextAPI24Test_1500
     * @tc.number graphicTextAPI24Test_1500
     * @tc.desc   runMetrics and LineMetrics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI24Test_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msgStr  = "====testLineMetricsTest_0100===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let myTextStyle: text.TextStyle = {
          fontSize: 20,
          fontEdging: drawing.FontEdging.ALIAS,
          fontVariations: [{ axis: 'aaa', value: 2, isNormalized: false }]
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          lineSpacing: 15,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        let arrLineMetric: Array<text.LineMetrics> =  paragraph.getLineMetrics();
        let arrRunMetrics: Map<number,text.RunMetrics> = arrLineMetric[0].runMetrics;
        let arr: number[] = [];
        for (let key of arrRunMetrics.keys()) {
          arr.push(key);
        }
        let textStyle: text.TextStyle | undefined = arrRunMetrics.get(arr[arr.length -1])?.textStyle;
        console.info(msgStr + 'textStyle success ' + JSON.stringify(textStyle));
        console.info(msgStr + 'textStyle fontEdging ' + JSON.stringify(textStyle?.fontEdging));
        expect(textStyle?.fontEdging).assertEqual(drawing.FontEdging.ALIAS);
        done();
      } catch(err){
        console.info(msgStr + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   graphicTextAPI24Test_1600
     * @tc.number graphicTextAPI24Test_1600
     * @tc.desc   runMetrics and LineMetrics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI24Test_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msgStr  = "====graphicTextAPI24Test_1600===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let myTextStyle: text.TextStyle = {
          fontSize: 20,
          fontEdging: drawing.FontEdging.ANTI_ALIAS,
          fontVariations: [{ axis: 'aaa', value: 2, isNormalized: true }]
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          lineSpacing: 15,
          orphanCharOptimization: true
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        let arrLineMetric: Array<text.LineMetrics> =  paragraph.getLineMetrics();
        let arrRunMetrics: Map<number,text.RunMetrics> = arrLineMetric[0].runMetrics;
        let arr: number[] = [];
        for (let key of arrRunMetrics.keys()) {
          arr.push(key);
        }
        let textStyle: text.TextStyle | undefined = arrRunMetrics.get(arr[arr.length -1])?.textStyle;
        console.info(msgStr + 'textStyle success ' + JSON.stringify(textStyle));
        console.info(msgStr + 'textStyle fontEdging ' + JSON.stringify(textStyle?.fontEdging));
        expect(textStyle?.fontEdging).assertEqual(drawing.FontEdging.ANTI_ALIAS);
        done();
      } catch(err){
        console.info(msgStr + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   graphicTextAPI24Test_1700
     * @tc.number graphicTextAPI24Test_1700
     * @tc.desc   runMetrics and LineMetrics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI24Test_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msgStr  = "====graphicTextAPI24Test_1700===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let myTextStyle: text.TextStyle = {
          fontSize: 20,
          fontEdging: drawing.FontEdging.SUBPIXEL_ANTI_ALIAS,
          fontVariations: [{ axis: '', value: 2, isNormalized: false }]
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          lineSpacing: 15,
          orphanCharOptimization: false
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        let arrLineMetric: Array<text.LineMetrics> =  paragraph.getLineMetrics();
        let arrRunMetrics: Map<number,text.RunMetrics> = arrLineMetric[0].runMetrics;
        let arr: number[] = [];
        for (let key of arrRunMetrics.keys()) {
          arr.push(key);
        }
        let textStyle: text.TextStyle | undefined = arrRunMetrics.get(arr[arr.length -1])?.textStyle;
        console.info(msgStr + 'textStyle success ' + JSON.stringify(textStyle));
        console.info(msgStr + 'textStyle fontEdging ' + JSON.stringify(textStyle?.fontEdging));
        expect(textStyle?.fontEdging).assertEqual(drawing.FontEdging.SUBPIXEL_ANTI_ALIAS);
        done();
      } catch(err){
        console.info(msgStr + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   graphicTextAPI24Test_1800
     * @tc.number SUB_GRAPHIC_paragraph_getCharacterRangeForGlyphRange_0100
     * @tc.desc   Test getCharacterRangeForGlyphRange Method 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI24Test_1800',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = "====www data graphicTextAPI24Test_1800===="
        let glyphRange: text.Range = { start: 0, end: 5 };
        let fontCollection = text.FontCollection.getLocalInstance();
        let myTextStyle: text.TextStyle = {
          fontSize: 20
        }
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        try {
          let ranges = paragraph.getCharacterRangeForGlyphRange(glyphRange, null);
          console.info(msgStr + 'ranges null success ', JSON.stringify(ranges));
          expect().assertFail();
        } catch(err){
          console.error(msgStr + 'ranges null error ', err.code);
          expect(err.code).assertEqual(25900001);
        }
        try {
          let ranges = paragraph.getCharacterRangeForGlyphRange(glyphRange, undefined);
          console.info(msgStr + 'ranges undefined success ', JSON.stringify(ranges));
          expect().assertFail();
        } catch(err){
          console.error(msgStr + 'ranges undefined error ', err.code);
          expect(err.code).assertEqual(25900001);
        }
        done();
      })

    /**
     * @tc.name   graphicTextAPI24Test_1900
     * @tc.number SUB_GRAPHIC_paragraph_getGlyphRangeForCharacterRange_0100
     * @tc.desc   Test getGlyphRangeForCharacterRange Method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI24Test_1900',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = "====www data graphicTextAPI24Test_1900===="
        let glyphRange: text.Range = { start: 0, end: 5 };
        let fontCollection = text.FontCollection.getLocalInstance();
        let myTextStyle: text.TextStyle = {
          fontSize: 20
        }
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        try {
          let ranges = paragraph.getGlyphRangeForCharacterRange(glyphRange, null);
          console.info(msgStr + 'ranges null success ', JSON.stringify(ranges));
          expect().assertFail();
        } catch(err){
          console.error(msgStr + 'ranges null error ', err.code);
          expect(err.code).assertEqual(25900001);
        }
        try {
          let ranges = paragraph.getGlyphRangeForCharacterRange(glyphRange, undefined);
          console.info(msgStr + 'ranges undefined success ', JSON.stringify(ranges));
          expect().assertFail();
        } catch(err){
          console.error(msgStr + 'ranges undefined error ', err.code);
          expect(err.code).assertEqual(25900001);
        }
        done();
      })

    /**
     * @tc.name   graphicTextAPI24Test_2000
     * @tc.number SUB_GRAPHIC_paragraph_getCharacterPositionAtCoordinate_0100
     * @tc.desc   Test getCharacterPositionAtCoordinate Method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI24Test_2000',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = "====www data graphicTextAPI24Test_2000===="
        let glyphRange: text.Range = { start: 0, end: 5 };
        let fontCollection = text.FontCollection.getLocalInstance();
        let myTextStyle: text.TextStyle = {
          fontSize: 20
        }
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        let x = 10;
        let y = 5;
        try {
          let position1 = paragraph.getCharacterPositionAtCoordinate(x, y, null);
          console.info(msgStr + 'position1 success ', JSON.stringify(position1));
          expect().assertFail();
        } catch(err){
          console.error(msgStr + 'position1 error ', err.code);
          expect(err.code).assertEqual(401);
        }
        try {
          let position2 = paragraph.getCharacterPositionAtCoordinate(x, y, undefined);
          console.info(msgStr + 'position2 success ', JSON.stringify(position2));
          expect().assertFail();
        } catch(err){
          console.error(msgStr + 'position2 error ', err.code);
          expect(err.code).assertEqual(401);
        }
        done();
      })

    /**
     * @tc.name    getRectsForRange_InvalidWidthStyle_001
     * @tc.number  SUB_GRAPHIC_Paragraph_getRectsForRange_InvalidWidthStyle_001
     * @tc.desc    Test getRectsForRange with invalid widthStyle (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('getRectsForRange_InvalidWidthStyle_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const fontCollection = text.FontCollection.getLocalInstance();
          const myTextStyle: text.TextStyle = { fontSize: 20 };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          const paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          const range: text.Range = { start: 0, end: 1 };
          let rects = paragraph.getRectsForRange(range, -1, text.RectHeightStyle.TIGHT);
          console.info('www data getRectsForRange_InvalidWidthStyle_001 success ', JSON.stringify(rects));
          expect(rects[0].rect.bottom).assertEqual(23);
          expect(rects[0].direction).assertEqual(text.TextDirection.LTR);
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data getRectsForRange_InvalidWidthStyle_001 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    getRectsForRange_InvalidWidthStyle_002
     * @tc.number  SUB_GRAPHIC_Paragraph_getRectsForRange_InvalidWidthStyle_002
     * @tc.desc    Test getRectsForRange with invalid widthStyle (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('getRectsForRange_InvalidWidthStyle_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const fontCollection = text.FontCollection.getLocalInstance();
          const myTextStyle: text.TextStyle = { fontSize: 20 };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          const paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          const range: text.Range = { start: 0, end: 1 };
          let rects = paragraph.getRectsForRange(range, 9999, text.RectHeightStyle.TIGHT);
          console.info('www data getRectsForRange_InvalidWidthStyle_002 success ', JSON.stringify(rects));
          expect(rects[0].rect.bottom).assertEqual(23);
          expect(rects[0].direction).assertEqual(text.TextDirection.LTR);
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data getRectsForRange_InvalidWidthStyle_002 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    getRectsForRange_InvalidHeightStyle_001
     * @tc.number  SUB_GRAPHIC_Paragraph_getRectsForRange_InvalidHeightStyle_001
     * @tc.desc    Test getRectsForRange with invalid heightStyle (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('getRectsForRange_InvalidHeightStyle_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const fontCollection = text.FontCollection.getLocalInstance();
          const myTextStyle: text.TextStyle = { fontSize: 20 };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          const paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          const range: text.Range = { start: 0, end: 1 };
          let rects = paragraph.getRectsForRange(range, text.RectWidthStyle.TIGHT, -1);
          console.info('www data getRectsForRange_InvalidHeightStyle_001 success ', JSON.stringify(rects));
          expect(rects[0].rect.bottom).assertEqual(23);
          expect(rects[0].direction).assertEqual(text.TextDirection.LTR);
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data getRectsForRange_InvalidHeightStyle_001 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    getRectsForRange_InvalidHeightStyle_002
     * @tc.number  SUB_GRAPHIC_Paragraph_getRectsForRange_InvalidHeightStyle_002
     * @tc.desc    Test getRectsForRange with invalid heightStyle (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('getRectsForRange_InvalidHeightStyle_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          const fontCollection = text.FontCollection.getLocalInstance();
          const myTextStyle: text.TextStyle = { fontSize: 20 };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          const paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          const range: text.Range = { start: 0, end: 1 };
          let rects = paragraph.getRectsForRange(range, text.RectWidthStyle.TIGHT, 9999);
          console.info('www data getRectsForRange_InvalidHeightStyle_002 success ', JSON.stringify(rects));
          expect(rects[0].rect.bottom).assertEqual(23);
          expect(rects[0].direction).assertEqual(text.TextDirection.LTR);
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data getRectsForRange_InvalidHeightStyle_002 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    addPlaceholder_InvalidAlign_001
     * @tc.number  SUB_GRAPHIC_ParagraphBuilder_addPlaceholder_InvalidAlign_001
     * @tc.desc    Test addPlaceholder with invalid align (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('addPlaceholder_InvalidAlign_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          const fontCollection = text.FontCollection.getLocalInstance();
          const myTextStyle: text.TextStyle = { fontSize: 20 };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          paragraphBuilder.addPlaceholder({
            width: 50,
            height: 50,
            align: -1,
            baseline: text.TextBaseline.ALPHABETIC,
            baselineOffset: 0
          });
          const paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          console.info('www data addPlaceholder_InvalidAlign_001 success ');
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data addPlaceholder_InvalidAlign_001 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    addPlaceholder_InvalidAlign_002
     * @tc.number  SUB_GRAPHIC_ParagraphBuilder_addPlaceholder_InvalidAlign_002
     * @tc.desc    Test addPlaceholder with invalid align (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('addPlaceholder_InvalidAlign_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          const fontCollection = text.FontCollection.getLocalInstance();
          const myTextStyle: text.TextStyle = { fontSize: 20 };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          paragraphBuilder.addPlaceholder({
            width: 50,
            height: 50,
            align: 9999,
            baseline: text.TextBaseline.ALPHABETIC,
            baselineOffset: 0
          });
          const paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          console.info('www data addPlaceholder_InvalidAlign_002 success ');
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data addPlaceholder_InvalidAlign_002 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    addPlaceholder_InvalidBaseline_001
     * @tc.number  SUB_GRAPHIC_ParagraphBuilder_addPlaceholder_InvalidBaseline_001
     * @tc.desc    Test addPlaceholder with invalid baseline (-1)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('addPlaceholder_InvalidBaseline_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          const fontCollection = text.FontCollection.getLocalInstance();
          const myTextStyle: text.TextStyle = { fontSize: 20 };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          paragraphBuilder.addPlaceholder({
            width: 50,
            height: 50,
            align: text.PlaceholderAlignment.OFFSET_AT_BASELINE,
            baseline: -1,
            baselineOffset: 0
          });
          const paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          console.info('www data addPlaceholder_InvalidBaseline_001 success ');
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data addPlaceholder_InvalidBaseline_001 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name    addPlaceholder_InvalidBaseline_002
     * @tc.number  SUB_GRAPHIC_ParagraphBuilder_addPlaceholder_InvalidBaseline_002
     * @tc.desc    Test addPlaceholder with invalid baseline (9999)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('addPlaceholder_InvalidBaseline_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          const fontCollection = text.FontCollection.getLocalInstance();
          const myTextStyle: text.TextStyle = { fontSize: 20 };
          const myParagraphStyle: text.ParagraphStyle = { textStyle: myTextStyle };
          const paragraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          paragraphBuilder.addText("test");
          paragraphBuilder.addPlaceholder({
            width: 50,
            height: 50,
            align: text.PlaceholderAlignment.OFFSET_AT_BASELINE,
            baseline: 9999,
            baselineOffset: 0
          });
          const paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          console.info('www data addPlaceholder_InvalidBaseline_002 success ');
          done();
        } catch (error) {
          const err = error as BusinessError;
          console.info('www data addPlaceholder_InvalidBaseline_002 error ' + err.code);
          expect().assertFail();
          done();
        }
      })

  })
}
