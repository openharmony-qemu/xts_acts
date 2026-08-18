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

@Entry
@Component
struct TextLayoutManagerApi26 {
  private textController: TextController = new TextController();
  private textContent: string = '世界Hello';
  @State statusInfo: string = 'Click buttons to run LayoutManager API 26 tests';

  build() {
    Column({ space: 10 }) {
      Text(this.textContent, { controller: this.textController })
        .id('text_source_api26')
        .fontSize(24)
        .height('6%')
        .width('90%')
        .borderWidth(1)

      Text(this.statusInfo)
        .id('text_status_api26')
        .fontSize(12)
        .fontColor('#666666')
        .height('5%')
        .width('90%')

      Button('getCharacterPositionAtCoordinate')
        .id('btn_char_pos_api26')
        .height('5%')
        .width('90%')
        .onClick(() => {
          this.computeCharPosition();
        })

      Button('getGlyphRangeForCharacterRange')
        .id('btn_glyph_range_api26')
        .height('5%')
        .width('90%')
        .onClick(() => {
          this.computeGlyphRange();
        })

      Button('getCharacterRangeForGlyphRange')
        .id('btn_char_range_api26')
        .height('5%')
        .width('90%')
        .onClick(() => {
          this.computeCharRange();
        })
    }
    .width('100%')
    .height('100%')
    .padding(10)
    .backgroundColor('#F5F5F5')
  }

  private computeCharPosition(): void {
    let layoutManager: LayoutManager = this.textController.getLayoutManager();
    if (!layoutManager) {
      this.statusInfo = 'LayoutManager not available';
      return;
    }
    let uiContext: UIContext = this.getUIContext();
    let xNearStart: number = uiContext.vp2px(1);
    let yCenter: number = uiContext.vp2px(12);

    let result1: PositionWithAffinity | undefined =
      layoutManager.getCharacterPositionAtCoordinate(xNearStart, yCenter, TextEncoding.TEXT_ENCODING_UTF8);
    AppStorage.setOrCreate('charPos_utf8', this.formatPosition(result1));

    let result2: PositionWithAffinity | undefined =
      layoutManager.getCharacterPositionAtCoordinate(xNearStart, yCenter, TextEncoding.TEXT_ENCODING_UTF16);
    AppStorage.setOrCreate('charPos_utf16', this.formatPosition(result2));

    let result3: PositionWithAffinity | undefined =
      layoutManager.getCharacterPositionAtCoordinate(xNearStart, yCenter);
    AppStorage.setOrCreate('charPos_default', this.formatPosition(result3));

    let result4: PositionWithAffinity | undefined =
      layoutManager.getCharacterPositionAtCoordinate(0, 0, TextEncoding.TEXT_ENCODING_UTF8);
    AppStorage.setOrCreate('charPos_zero', this.formatPosition(result4));

    let result5: PositionWithAffinity | undefined =
      layoutManager.getCharacterPositionAtCoordinate(-1, -1, TextEncoding.TEXT_ENCODING_UTF8);
    AppStorage.setOrCreate('charPos_negative', this.formatPosition(result5));

    let result6: PositionWithAffinity | undefined =
      layoutManager.getCharacterPositionAtCoordinate(uiContext.vp2px(9999), uiContext.vp2px(9999),
        TextEncoding.TEXT_ENCODING_UTF8);
    AppStorage.setOrCreate('charPos_large', this.formatPosition(result6));

    let result7: PositionWithAffinity | undefined =
      layoutManager.getCharacterPositionAtCoordinate(xNearStart, yCenter, TextEncoding.TEXT_ENCODING_UTF16);
    AppStorage.setOrCreate('charPos_utf16_result', result7 === undefined ? 'undefined' : 'defined');

    let result8: PositionWithAffinity | undefined =
      layoutManager.getCharacterPositionAtCoordinate(xNearStart, yCenter, null);
    AppStorage.setOrCreate('charPos_null_textEncoding', this.formatPosition(result8));

    let result9: PositionWithAffinity | undefined =
      layoutManager.getCharacterPositionAtCoordinate(xNearStart, yCenter, undefined);
    AppStorage.setOrCreate('charPos_undfined_textEncoding', this.formatPosition(result9));


    let result10: PositionWithAffinity | undefined =
      layoutManager.getCharacterPositionAtCoordinate(xNearStart, yCenter, 3 as TextEncoding);
    AppStorage.setOrCreate('charPos_exceeds_textEncoding', this.formatPosition(result10));

    this.statusInfo = 'getCharacterPositionAtCoordinate computed (9 cases + undefined encoding check)';
  }

  private computeGlyphRange(): void {
    let layoutManager: LayoutManager = this.textController.getLayoutManager();
    if (!layoutManager) {
      this.statusInfo = 'LayoutManager not available';
      return;
    }

    let result1: Array<TextRange> | undefined =
      layoutManager.getGlyphRangeForCharacterRange({ start: 0, end: 3 }, TextEncoding.TEXT_ENCODING_UTF8);
    AppStorage.setOrCreate('glyphRange_utf8', this.formatRangeArray(result1));

    let result2: Array<TextRange> | undefined =
      layoutManager.getGlyphRangeForCharacterRange({ start: 0, end: 1 }, TextEncoding.TEXT_ENCODING_UTF16);
    AppStorage.setOrCreate('glyphRange_utf16', this.formatRangeArray(result2));

    let result3: Array<TextRange> | undefined =
      layoutManager.getGlyphRangeForCharacterRange({ start: 0, end: 3 });
    AppStorage.setOrCreate('glyphRange_default', this.formatRangeArray(result3));

    let result4: Array<TextRange> | undefined =
      layoutManager.getGlyphRangeForCharacterRange({ start: 0, end: 1 }, TextEncoding.TEXT_ENCODING_UTF8);
    AppStorage.setOrCreate('glyphRange_partial', this.formatRangeArray(result4));

    let result5: Array<TextRange> | undefined =
      layoutManager.getGlyphRangeForCharacterRange({ start: 0, end: 100 }, TextEncoding.TEXT_ENCODING_UTF8);
    AppStorage.setOrCreate('glyphRange_oob', this.formatRangeArray(result5));

    let undefinedRange: TextRange = { start: undefined, end: undefined };
    let result6: Array<TextRange> | undefined =
      layoutManager.getGlyphRangeForCharacterRange(undefinedRange, TextEncoding.TEXT_ENCODING_UTF8);
    AppStorage.setOrCreate('glyphRange_undefined_range', this.formatRangeArray(result6));

    let result7: Array<TextRange> | undefined =
      layoutManager.getGlyphRangeForCharacterRange({ start: 0, end: 100 }, null);
    AppStorage.setOrCreate('glyphRange_null_textEncoding', this.formatRangeArray(result7));

    let result8: Array<TextRange> | undefined =
      layoutManager.getGlyphRangeForCharacterRange({ start: 0, end: 100 }, undefined);
    AppStorage.setOrCreate('glyphRange_undfined_textEncoding', this.formatRangeArray(result8));

    let result9: Array<TextRange> | undefined =
      layoutManager.getGlyphRangeForCharacterRange({ start: 0, end: 100 }, 3 as TextEncoding);
    AppStorage.setOrCreate('glyphRange_exceeds_textEncoding', this.formatRangeArray(result9));

    this.statusInfo = 'getGlyphRangeForCharacterRange computed (9 cases)';
  }

  private computeCharRange(): void {
    let layoutManager: LayoutManager = this.textController.getLayoutManager();
    if (!layoutManager) {
      this.statusInfo = 'LayoutManager not available';
      return;
    }

    let result1: Array<TextRange> | undefined =
      layoutManager.getCharacterRangeForGlyphRange({ start: 0, end: 7 }, TextEncoding.TEXT_ENCODING_UTF8);
    AppStorage.setOrCreate('charRange_utf8', this.formatRangeArray(result1));

    let result2: Array<TextRange> | undefined =
      layoutManager.getCharacterRangeForGlyphRange({ start: 0, end: 7 }, TextEncoding.TEXT_ENCODING_UTF16);
    AppStorage.setOrCreate('charRange_utf16', this.formatRangeArray(result2));

    let result3: Array<TextRange> | undefined =
      layoutManager.getCharacterRangeForGlyphRange({ start: 0, end: 7 });
    AppStorage.setOrCreate('charRange_default', this.formatRangeArray(result3));

    let result4: Array<TextRange> | undefined =
      layoutManager.getCharacterRangeForGlyphRange({ start: 0, end: 11 }, TextEncoding.TEXT_ENCODING_UTF8);
    AppStorage.setOrCreate('charRange_oob_utf8', this.formatRangeArray(result4));

    let result5: Array<TextRange> | undefined =
      layoutManager.getCharacterRangeForGlyphRange({ start: 0, end: 11 }, TextEncoding.TEXT_ENCODING_UTF16);
    AppStorage.setOrCreate('charRange_oob_utf16', this.formatRangeArray(result5));

    let undefinedRange: TextRange = { start: undefined, end: undefined };
    let result6: Array<TextRange> | undefined =
      layoutManager.getCharacterRangeForGlyphRange(undefinedRange, TextEncoding.TEXT_ENCODING_UTF8);
    AppStorage.setOrCreate('charRange_undefined_range', this.formatRangeArray(result6));

    let result7: Array<TextRange> | undefined =
      layoutManager.getCharacterRangeForGlyphRange({ start: 0, end: 11 }, null);
    AppStorage.setOrCreate('charRange_null_textEncoding', this.formatRangeArray(result7));

    let result8: Array<TextRange> | undefined =
      layoutManager.getCharacterRangeForGlyphRange({ start: 0, end: 11 }, undefined);
    AppStorage.setOrCreate('charRange_undfined_textEncoding', this.formatRangeArray(result8));

    let result9: Array<TextRange> | undefined =
      layoutManager.getCharacterRangeForGlyphRange({ start: 0, end: 11 }, 3 as TextEncoding);
    AppStorage.setOrCreate('charRange_exceeds_textEncoding', this.formatRangeArray(result9));

    this.statusInfo = 'getCharacterRangeForGlyphRange computed (9 cases)';
  }

  private formatPosition(result: PositionWithAffinity | undefined): string {
    if (result === undefined || result === null) {
      return 'undefined';
    }
    return 'position:' + result.position + ',affinity:' + result.affinity;
  }

  private formatRangeArray(result: Array<TextRange> | undefined): string {
    if (result === undefined || result === null) {
      return 'undefined';
    }
    if (result.length < 2) {
      return 'length:' + result.length;
    }
    return 'first:[' + result[0].start + ',' + result[0].end + '],second:[' + result[1].start + ',' + result[1].end + ']';
  }
}
