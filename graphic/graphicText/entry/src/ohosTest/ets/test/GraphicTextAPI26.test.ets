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
import { describe, beforeAll, it, expect, TestType, Level, Size } from "@ohos/hypium";
import text from "@ohos.graphics.text";

export default function GraphicTextAPI26() {

  describe('GraphicTextAPI26', () => {

    beforeAll(() => {
    })

    /**
     * @tc.name   testOrphanCharOptimizationTrue
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationTrue_001
     * @tc.desc   Test ParagraphStyle orphanCharOptimization property set to true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationTrue===="
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          locale: "zh-Hans"
        };
        try {
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            orphanCharOptimization: true
          };
          expect(paragraphStyle.orphanCharOptimization).assertTrue();
          console.info(msgStr + ' orphanCharOptimization is true');
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   testOrphanCharOptimizationFalse
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationFalse_002
     * @tc.desc   Test ParagraphStyle orphanCharOptimization property set to false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationFalse===="
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          locale: "zh-Hans"
        };
        try {
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            orphanCharOptimization: false
          };
          expect(paragraphStyle.orphanCharOptimization).assertFalse();
          console.info(msgStr + ' orphanCharOptimization is false');
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   testOrphanCharOptimizationUndefined
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationUndefined_003
     * @tc.desc   Test ParagraphStyle orphanCharOptimization property with undefined value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationUndefined===="
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          locale: "zh-Hans"
        };
        try {
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD
          };
          expect(paragraphStyle.orphanCharOptimization).assertEqual(undefined);
          console.info(msgStr + ' orphanCharOptimization is undefined');
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   testOrphanCharOptimizationWithZhHans
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationWithZhHans_004
     * @tc.desc   Test orphanCharOptimization with zh-Hans locale and BREAK_WORD.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationWithZhHans', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationWithZhHans===="
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          locale: "zh-Hans"
        };
        try {
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            orphanCharOptimization: true
          };
          let fontCollection = new text.FontCollection();
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('这是一个测试文本，用于验证孤字优化功能的效果。孤字优化应该能够避免段落末尾出现孤立的字符，使排版更加美观和合理');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);
          let maxWidth: number = paragraph.getMaxWidth();
          let height: number = paragraph.getHeight();
          let longestLine: number = paragraph.getLongestLine();
          console.info(msgStr + ' layout success with zh-Hans locale');
          console.info(msgStr + ' maxWidth: ' + maxWidth);
          console.info(msgStr + ' height: ' + height);
          console.info(msgStr + ' longestLine: ' + longestLine);
          expect(maxWidth).assertLarger(0);
          expect(height).assertLarger(0);
          expect(longestLine).assertLarger(0);
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   testOrphanCharOptimizationWithZhHant
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationWithZhHant_005
     * @tc.desc   Test orphanCharOptimization with zh-Hant locale and BREAK_WORD.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationWithZhHant', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationWithZhHant===="
        let zhHantTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          locale: "zh-Hant"
        };
        try {
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHantTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            orphanCharOptimization: true
          };
          let fontCollection = new text.FontCollection();
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('這是一個測試文本，用於驗證孤字優化功能的效果。孤字優化應該能夠避免段落末尾出現孤立的字符，使排版更加美觀和合理');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);
          let maxWidth: number = paragraph.getMaxWidth();
          let height: number = paragraph.getHeight();
          let longestLine: number = paragraph.getLongestLine();
          console.info(msgStr + ' layout success with zh-Hant locale');
          console.info(msgStr + ' maxWidth: ' + maxWidth);
          console.info(msgStr + ' height: ' + height);
          console.info(msgStr + ' longestLine: ' + longestLine);
          expect(maxWidth).assertLarger(0);
          expect(height).assertLarger(0);
          expect(longestLine).assertLarger(0);
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   testOrphanCharOptimizationWithBreakAll
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationWithBreakAll_006
     * @tc.desc   Test orphanCharOptimization with BREAK_ALL wordBreak.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationWithBreakAll', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationWithBreakAll===="
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          locale: "zh-Hans"
        };
        try {
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_ALL,
            orphanCharOptimization: true
          };
          let fontCollection = new text.FontCollection();
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('这是一个测试文本，用于验证孤字优化功能的效果');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);
          let maxWidth: number = paragraph.getMaxWidth();
          let height: number = paragraph.getHeight();
          let longestLine: number = paragraph.getLongestLine();
          console.info(msgStr + ' layout success with BREAK_ALL wordBreak');
          console.info(msgStr + ' maxWidth: ' + maxWidth);
          console.info(msgStr + ' height: ' + height);
          console.info(msgStr + ' longestLine: ' + longestLine);
          expect(maxWidth).assertLarger(0);
          expect(height).assertLarger(0);
          expect(longestLine).assertLarger(0);
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   testOrphanCharOptimizationWithEnLocale
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationWithEnLocale_007
     * @tc.desc   Test orphanCharOptimization with en locale.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationWithEnLocale', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationWithEnLocale===="
        let enTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          locale: "en"
        };
        try {
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: enTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            orphanCharOptimization: true
          };
          let fontCollection = new text.FontCollection();
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText("This is a test text for verifying orphan character optimization functionality.");
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);
          let maxWidth: number = paragraph.getMaxWidth();
          let height: number = paragraph.getHeight();
          let longestLine: number = paragraph.getLongestLine();
          console.info(msgStr + ' layout success with en locale');
          console.info(msgStr + ' maxWidth: ' + maxWidth);
          console.info(msgStr + ' height: ' + height);
          console.info(msgStr + ' longestLine: ' + longestLine);
          expect(maxWidth).assertLarger(0);
          expect(height).assertLarger(0);
          expect(longestLine).assertLarger(0);
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   testOrphanCharOptimizationLayoutEffect
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationLayoutEffect_008
     * @tc.desc   Test orphanCharOptimization layout effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationLayoutEffect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationLayoutEffect===="
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          locale: "zh-Hans"
        };
        try {
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            orphanCharOptimization: true
          };
          let fontCollection = new text.FontCollection();
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('孤字优化通过更高效地处理孤立字符来改善文本布局。使能后，它会调整换行点以尽可能避免孤立字符');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(200).then(() => {
            console.info(msgStr + ' layout success');
            let maxWidth: number = paragraph.getMaxWidth();
            let height: number = paragraph.getHeight();
            let longestLine: number = paragraph.getLongestLine();
            console.info(msgStr + ' maxWidth: ' + maxWidth);
            console.info(msgStr + ' height: ' + height);
            console.info(msgStr + ' longestLine: ' + longestLine);
            expect(maxWidth).assertLarger(0);
            expect(height).assertLarger(0);
            expect(longestLine).assertLarger(0);
          }).catch((error: Error) => {
            console.error(msgStr + ' layout error: ' + error.message);
            expect().assertFail();
          });
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   testOrphanCharOptimizationWithLongText
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationWithLongText_009
     * @tc.desc   Test orphanCharOptimization with long text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationWithLongText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationWithLongText===="
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          locale: "zh-Hans"
        };
        try {
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            orphanCharOptimization: true
          };
          let fontCollection = new text.FontCollection();
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          let longText: string = '这是一个很长的测试文本，用于验证孤字优化功能在长文本场景下的效果。孤字优化应该能够避免段落末尾出现孤立的字符，使排版更加美观和合理。通过调整换行点，孤字优化可以确保文本布局更加符合中文排版规范，提升阅读体验';
          paragraphBuilder.addText(longText);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);
          let maxWidth: number = paragraph.getMaxWidth();
          let height: number = paragraph.getHeight();
          let longestLine: number = paragraph.getLongestLine();
          console.info(msgStr + ' layout success with long text');
          console.info(msgStr + ' maxWidth: ' + maxWidth);
          console.info(msgStr + ' height: ' + height);
          console.info(msgStr + ' longestLine: ' + longestLine);
          expect(maxWidth).assertLarger(0);
          expect(height).assertLarger(0);
          expect(longestLine).assertLarger(0);
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   testOrphanCharOptimizationEmptyText
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationEmptyText_010
     * @tc.desc   Test orphanCharOptimization with empty text.
     * @tc.type     FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationEmptyText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationEmptyText===="
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          locale: "zh-Hans"
        };
        try {
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            orphanCharOptimization: true
          };
          let fontCollection = new text.FontCollection();
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText("");
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);
          let maxWidth: number = paragraph.getMaxWidth();
          let height: number = paragraph.getHeight();
          let longestLine: number = paragraph.getLongestLine();
          console.info(msgStr + ' layout success with empty text');
          console.info(msgStr + ' maxWidth: ' + maxWidth);
          console.info(msgStr + ' height: ' + height);
          console.info(msgStr + ' longestLine: ' + longestLine);
          expect(maxWidth).assertLarger(0);
          expect(height).assertLarger(0);
          expect(longestLine).assertLessOrEqual(0);
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   testOrphanCharOptimizationSingleChar
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationSingleChar_011
     * @tc.desc   Test orphanCharOptimization with single character text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationSingleChar', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationSingleChar===="
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          locale: "zh-Hans"
        };
        try {
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            orphanCharOptimization: true
          };
          let fontCollection = new text.FontCollection();
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('a');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);
          let maxWidth: number = paragraph.getMaxWidth();
          let height: number = paragraph.getHeight();
          let longestLine: number = paragraph.getLongestLine();
          console.info(msgStr + ' layout success with single character');
          console.info(msgStr + ' maxWidth: ' + maxWidth);
          console.info(msgStr + ' height: ' + height);
          console.info(msgStr + ' longestLine: ' + longestLine);
          expect(maxWidth).assertLarger(0);
          expect(height).assertLarger(0);
          expect(longestLine).assertLarger(0);
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      })
  })
}
