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

import {
  Entry,
  Component,
  Column,
  Text,
  Button,
  Scroll,
  TextEncoding,
  TextRange,
  LengthMetrics,
  MutableStyledString,
  StyledStringKey,
  TextStyle,
  ColumnOptions,
  PositionWithAffinity,
  Divider,
  TextController
} from '@kit.ArkUI';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

const TEXT_CONTENT: string = '世界Hello';

@Entry
@Component
struct LayoutManagerEncoding {
  private textController: TextController = new TextController();
  @State posResult: string = 'pos_init';
  @State glyphResult: string = 'glyph_init';
  @State charResult: string = 'char_init';

  aboutToAppear(): void {
    const styledString = new MutableStyledString(TEXT_CONTENT, [{
      start: 0,
      length: TEXT_CONTENT.length,
      styledKey: StyledStringKey.FONT,
      styledValue: new TextStyle({ fontSize: LengthMetrics.vp(24) })
    }]);
    this.textController.setStyledString(styledString);
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('LayoutManagerEncoding error ' + error);
    }
  }

  private formatPosResult(tag: string, r: PositionWithAffinity | undefined): string {
    if (r) {
      return tag + ':' + r.position + '|' + r.affinity;
    }
    return tag + ':undefined';
  }

  private formatRangeResult(tag: string, r: Array<TextRange> | undefined): string {
    if (r && r.length >= 2) {
      return tag + ':' + r[0].start + ',' + r[0].end + '|' + r[1].start + ',' + r[1].end;
    }
    return tag + ':undefined';
  }

  build() {
    Scroll() {
      Column({ space: 6 } as ColumnOptions) {
        Text('LayoutManager Encoding Test')
          .fontSize(18)
          .width('90%')
          .height('4%')

        Text(undefined, { controller: this.textController })
          .id('text_content')
          .fontSize(24)
          .width('90%')
          .height('5%')
          .border({ width: 1 })

        Divider()

        Text(this.posResult)
          .id('text_pos_result')
          .fontSize(13)
          .width('90%')
          .height('4%')
          .backgroundColor('#F0F0F0')
          .padding(5)

        Button('Pos UTF8 Start')
          .id('btn_pos_utf8_start')
          .width('90%')
          .height('4%')
          .onClick(() => {
            const lm = this.textController.getLayoutManager();
            if (!lm) { this.posResult = 'pos_utf8_start:lm_undefined'; return; }
            const r = lm.getCharacterPositionAtCoordinate(0, 0, TextEncoding.TEXT_ENCODING_UTF8);
            this.posResult = this.formatPosResult('pos_utf8_start', r);
          })

        Button('Pos UTF16 Start')
          .id('btn_pos_utf16_start')
          .width('90%')
          .height('4%')
          .onClick(() => {
            const lm = this.textController.getLayoutManager();
            if (!lm) { this.posResult = 'pos_utf16_start:lm_undefined'; return; }
            const r = lm.getCharacterPositionAtCoordinate(0, 0, TextEncoding.TEXT_ENCODING_UTF16);
            this.posResult = this.formatPosResult('pos_utf16_start', r);
          })

        Button('Pos UTF8 End')
          .id('btn_pos_utf8_end')
          .width('90%')
          .height('4%')
          .onClick(() => {
            const lm = this.textController.getLayoutManager();
            if (!lm) { this.posResult = 'pos_utf8_end:lm_undefined'; return; }
            const r = lm.getCharacterPositionAtCoordinate(10000, 100, TextEncoding.TEXT_ENCODING_UTF8);
            this.posResult = this.formatPosResult('pos_utf8_end', r);
          })

        Button('Pos UTF16 End')
          .id('btn_pos_utf16_end')
          .width('90%')
          .height('4%')
          .onClick(() => {
            const lm = this.textController.getLayoutManager();
            if (!lm) { this.posResult = 'pos_utf16_end:lm_undefined'; return; }
            const r = lm.getCharacterPositionAtCoordinate(10000, 100, TextEncoding.TEXT_ENCODING_UTF16);
            this.posResult = this.formatPosResult('pos_utf16_end', r);
          })

        Button('Pos Undefined Encoding')
          .id('btn_pos_undef')
          .width('90%')
          .height('4%')
          .onClick(() => {
            const lm = this.textController.getLayoutManager();
            if (!lm) { this.posResult = 'pos_undef:lm_undefined'; return; }
            const r = lm.getCharacterPositionAtCoordinate(0, 0, undefined);
            this.posResult = this.formatPosResult('pos_undef', r);
          })

        Button('Pos Null Encoding')
          .id('btn_pos_null')
          .width('90%')
          .height('4%')
          .onClick(() => {
            const lm = this.textController.getLayoutManager();
            if (!lm) { this.posResult = 'pos_null:lm_undefined'; return; }
            try {
              let nullEnc: TextEncoding | null = null;
              const r = lm.getCharacterPositionAtCoordinate(0, 0, nullEnc as TextEncoding);
              this.posResult = this.formatPosResult('pos_null', r);
            } catch (e) {
              this.posResult = 'pos_null:caught';
            }
          })

        Button('Pos Negative Coord')
          .id('btn_pos_negative')
          .width('90%')
          .height('4%')
          .onClick(() => {
            const lm = this.textController.getLayoutManager();
            if (!lm) { this.posResult = 'pos_negative:lm_undefined'; return; }
            try {
              const r = lm.getCharacterPositionAtCoordinate(-10, -10, TextEncoding.TEXT_ENCODING_UTF8);
              this.posResult = this.formatPosResult('pos_negative', r);
            } catch (e) {
              this.posResult = 'pos_negative:caught';
            }
          })

        Button('Pos vp2px Coord')
          .id('btn_pos_vp2px')
          .width('90%')
          .height('4%')
          .onClick(() => {
            const lm = this.textController.getLayoutManager();
            if (!lm) { this.posResult = 'pos_vp2px:lm_undefined'; return; }
            try {
              const uiContext = this.getUIContext();
              const xPx = uiContext.vp2px(10);
              const yPx = uiContext.vp2px(15);
              const r = lm.getCharacterPositionAtCoordinate(xPx, yPx, TextEncoding.TEXT_ENCODING_UTF8);
              this.posResult = this.formatPosResult('pos_vp2px', r);
            } catch (e) {
              this.posResult = 'pos_vp2px:caught';
            }
          })

        Divider()

        Text(this.glyphResult)
          .id('text_glyph_result')
          .fontSize(13)
          .width('90%')
          .height('4%')
          .backgroundColor('#F0F0F0')
          .padding(5)

        Button('Glyph UTF8 Aligned [0,3]')
          .id('btn_glyph_utf8_aligned')
          .width('90%')
          .height('4%')
          .onClick(() => {
            const lm = this.textController.getLayoutManager();
            if (!lm) { this.glyphResult = 'glyph_utf8_aligned:lm_undefined'; return; }
            const r = lm.getGlyphRangeForCharacterRange(
              { start: 0, end: 3 } as TextRange, TextEncoding.TEXT_ENCODING_UTF8);
            this.glyphResult = this.formatRangeResult('glyph_utf8_aligned', r);
          })

        Button('Glyph UTF16 [0,1]')
          .id('btn_glyph_utf16')
          .width('90%')
          .height('4%')
          .onClick(() => {
            const lm = this.textController.getLayoutManager();
            if (!lm) { this.glyphResult = 'glyph_utf16:lm_undefined'; return; }
            const r = lm.getGlyphRangeForCharacterRange(
              { start: 0, end: 1 } as TextRange, TextEncoding.TEXT_ENCODING_UTF16);
            this.glyphResult = this.formatRangeResult('glyph_utf16', r);
          })

        Button('Glyph Undefined Encoding')
          .id('btn_glyph_undef')
          .width('90%')
          .height('4%')
          .onClick(() => {
            const lm = this.textController.getLayoutManager();
            if (!lm) { this.glyphResult = 'glyph_undef:lm_undefined'; return; }
            const r = lm.getGlyphRangeForCharacterRange(
              { start: 0, end: 3 } as TextRange, undefined);
            this.glyphResult = this.formatRangeResult('glyph_undef', r);
          })

        Button('Glyph Null Encoding')
          .id('btn_glyph_null')
          .width('90%')
          .height('4%')
          .onClick(() => {
            const lm = this.textController.getLayoutManager();
            if (!lm) { this.glyphResult = 'glyph_null:lm_undefined'; return; }
            try {
              let nullEnc: TextEncoding | null = null;
              const r = lm.getGlyphRangeForCharacterRange(
                { start: 0, end: 3 } as TextRange, nullEnc as TextEncoding);
              this.glyphResult = this.formatRangeResult('glyph_null', r);
            } catch (e) {
              this.glyphResult = 'glyph_null:caught';
            }
          })

        Button('Glyph UTF8 Unaligned [0,1]')
          .id('btn_glyph_utf8_unaligned')
          .width('90%')
          .height('4%')
          .onClick(() => {
            const lm = this.textController.getLayoutManager();
            if (!lm) { this.glyphResult = 'glyph_utf8_unaligned:lm_undefined'; return; }
            const r = lm.getGlyphRangeForCharacterRange(
              { start: 0, end: 1 } as TextRange, TextEncoding.TEXT_ENCODING_UTF8);
            this.glyphResult = this.formatRangeResult('glyph_utf8_unaligned', r);
          })

        Button('Glyph Out Of Range [100,200]')
          .id('btn_glyph_outofrange')
          .width('90%')
          .height('4%')
          .onClick(() => {
            const lm = this.textController.getLayoutManager();
            if (!lm) { this.glyphResult = 'glyph_outofrange:lm_undefined'; return; }
            const r = lm.getGlyphRangeForCharacterRange(
              { start: 100, end: 200 } as TextRange, TextEncoding.TEXT_ENCODING_UTF8);
            this.glyphResult = this.formatRangeResult('glyph_outofrange', r);
          })

        Divider()

        Text(this.charResult)
          .id('text_char_result')
          .fontSize(13)
          .width('90%')
          .height('4%')
          .backgroundColor('#F0F0F0')
          .padding(5)

        Button('Char UTF8 Full [0,7]')
          .id('btn_char_utf8_full')
          .width('90%')
          .height('4%')
          .onClick(() => {
            const lm = this.textController.getLayoutManager();
            if (!lm) { this.charResult = 'char_utf8_full:lm_undefined'; return; }
            const r = lm.getCharacterRangeForGlyphRange(
              { start: 0, end: 7 } as TextRange, TextEncoding.TEXT_ENCODING_UTF8);
            this.charResult = this.formatRangeResult('char_utf8_full', r);
          })

        Button('Char UTF16 Full [0,7]')
          .id('btn_char_utf16_full')
          .width('90%')
          .height('4%')
          .onClick(() => {
            const lm = this.textController.getLayoutManager();
            if (!lm) { this.charResult = 'char_utf16_full:lm_undefined'; return; }
            const r = lm.getCharacterRangeForGlyphRange(
              { start: 0, end: 7 } as TextRange, TextEncoding.TEXT_ENCODING_UTF16);
            this.charResult = this.formatRangeResult('char_utf16_full', r);
          })

        Button('Char Undefined Encoding')
          .id('btn_char_undef')
          .width('90%')
          .height('4%')
          .onClick(() => {
            const lm = this.textController.getLayoutManager();
            if (!lm) { this.charResult = 'char_undef:lm_undefined'; return; }
            const r = lm.getCharacterRangeForGlyphRange(
              { start: 0, end: 7 } as TextRange, undefined);
            this.charResult = this.formatRangeResult('char_undef', r);
          })

        Button('Char Null Encoding')
          .id('btn_char_null')
          .width('90%')
          .height('4%')
          .onClick(() => {
            const lm = this.textController.getLayoutManager();
            if (!lm) { this.charResult = 'char_null:lm_undefined'; return; }
            try {
              let nullEnc: TextEncoding | null = null;
              const r = lm.getCharacterRangeForGlyphRange(
                { start: 0, end: 7 } as TextRange, nullEnc as TextEncoding);
              this.charResult = this.formatRangeResult('char_null', r);
            } catch (e) {
              this.charResult = 'char_null:caught';
            }
          })

        Button('Char UTF8 Exceed [0,11]')
          .id('btn_char_utf8_exceed')
          .width('90%')
          .height('4%')
          .onClick(() => {
            const lm = this.textController.getLayoutManager();
            if (!lm) { this.charResult = 'char_utf8_exceed:lm_undefined'; return; }
            const r = lm.getCharacterRangeForGlyphRange(
              { start: 0, end: 11 } as TextRange, TextEncoding.TEXT_ENCODING_UTF8);
            this.charResult = this.formatRangeResult('char_utf8_exceed', r);
          })

        Button('Char UTF8 Single [0,1]')
          .id('btn_char_utf8_single')
          .width('90%')
          .height('4%')
          .onClick(() => {
            const lm = this.textController.getLayoutManager();
            if (!lm) { this.charResult = 'char_utf8_single:lm_undefined'; return; }
            const r = lm.getCharacterRangeForGlyphRange(
              { start: 0, end: 1 } as TextRange, TextEncoding.TEXT_ENCODING_UTF8);
            this.charResult = this.formatRangeResult('char_utf8_single', r);
          })
      }
      .width('100%')
      .padding({ top: '2%', bottom: '2%', left: '2%', right: '2%' })
    }
    .width('100%')
    .height('100%')
  }
}
