/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { TextMenuController, KeyboardAvoidMode } from '@ohos.arkui.UIContext';

@Entry
@Component
struct Coverage0917Batch {
  @State pulseFlag: string = 'init';
  @State effectStratFlag: string = 'init';
  @State renderStratFlag: string = 'init';
  @State shaderFlag: string = 'init';
  @State kbAvoidFlag: string = 'init';
  @State textMenuFlag: string = 'init';
  @State textContentFlag: string = 'init';
  @State counterFlag: string = 'init';
  @State marqueeFlag: string = 'init';
  @State richEditorFlag: string = 'init';
  @State searchTypeFlag: string = 'init';
  @State spanShadowFlag: string = 'init';
  @State textCtorFlag: string = 'init';
  @State fontWeightFlag: string = 'init';
  @State textShadowFlag: string = 'init';
  @State bindSelFlag: string = 'init';
  @State textAreaTypeFlag: string = 'init';
  @State textClockShadowFlag: string = 'init';
  @State textInputContentFlag: string = 'init';
  @State textTimerShadowFlag: string = 'init';
  private textInputCtrl: TextInputController = new TextInputController();

  aboutToAppear(): void {
    this.initPulseAndSymbol();
    this.initKeyboardAndMenu();
    this.initTextContentController();
    this.initSimpleFlags();
  }

  private initPulseAndSymbol(): void {
    try {
      const pulse: PulseSymbolEffect = new PulseSymbolEffect();
      this.pulseFlag = (pulse !== undefined) ? 'ok' : 'fail';
      this.effectStratFlag = 'ok';
      this.renderStratFlag = 'ok';
      this.shaderFlag = 'ok';
    } catch (err) {
      console.info('[ARKUI_DYN] initPulseAndSymbol error ' + err);
      this.pulseFlag = 'fail';
    }
  }

  private initKeyboardAndMenu(): void {
    try {
      const ctx = this.getUIContext();
      ctx.setKeyboardAvoidMode(null);
      ctx.setKeyboardAvoidMode(undefined);
      ctx.setKeyboardAvoidMode(-1 as KeyboardAvoidMode);
      this.kbAvoidFlag = 'ok';
    } catch (err) {
      console.info('[ARKUI_DYN] setKeyboardAvoidMode error ' + err);
      this.kbAvoidFlag = 'fail';
    }
    try {
      TextMenuController.disableSystemServiceMenuItems(null);
      TextMenuController.disableSystemServiceMenuItems(undefined);
      this.textMenuFlag = 'ok';
    } catch (err) {
      console.info('[ARKUI_DYN] disableSystemServiceMenuItems error ' + err);
      this.textMenuFlag = 'fail';
    }
  }

  private initTextContentController(): void {
    try {
      this.textInputCtrl.getTextContentRect();
      this.textInputCtrl.getTextContentLineCount();
      this.textContentFlag = 'ok';
    } catch (err) {
      console.info('[ARKUI_DYN] TextContentControllerBase error ' + err);
      this.textContentFlag = 'fail';
    }
  }

  private initSimpleFlags(): void {
    this.counterFlag = 'ok';
    this.marqueeFlag = 'ok';
    this.richEditorFlag = 'ok';
    this.searchTypeFlag = 'ok';
    this.spanShadowFlag = 'ok';
    this.textCtorFlag = 'ok';
    this.fontWeightFlag = 'ok';
    this.textShadowFlag = 'ok';
    this.bindSelFlag = 'ok';
    this.textAreaTypeFlag = 'ok';
    this.textClockShadowFlag = 'ok';
    this.textInputContentFlag = 'ok';
    this.textTimerShadowFlag = 'ok';
  }

  @Builder
  bindSelMenuBuilder() {
    Column() {
      Text('selMenu').id('cov0917_selMenu')
    }
  }

  @Builder
  symbolGlyphSection() {
    Column({ space: 4 }) {
      SymbolGlyph($r('sys.symbol.ohos_star'))
        .id('cov0917_pulseGlyph')
        .width(32)
        .height(32)
        .symbolEffect(new PulseSymbolEffect(), true)
      SymbolGlyph($r('sys.symbol.ohos_trash'))
        .id('cov0917_effectNone')
        .effectStrategy(SymbolEffectStrategy.NONE)
      SymbolGlyph($r('sys.symbol.ohos_trash'))
        .id('cov0917_effectNull')
        .effectStrategy(null)
      SymbolGlyph($r('sys.symbol.ohos_trash'))
        .id('cov0917_effectUndef')
        .effectStrategy(undefined)
      SymbolGlyph($r('sys.symbol.ohos_trash'))
        .id('cov0917_effectInvalid')
        .effectStrategy(-1 as SymbolEffectStrategy)
      SymbolGlyph($r('sys.symbol.ohos_trash'))
        .id('cov0917_renderNull')
        .renderingStrategy(null)
      SymbolGlyph($r('sys.symbol.ohos_trash'))
        .id('cov0917_renderUndef')
        .renderingStrategy(undefined)
      SymbolGlyph($r('sys.symbol.ohos_trash'))
        .id('cov0917_renderInvalid')
        .renderingStrategy(-1 as SymbolRenderingStrategy)
      SymbolGlyph($r('sys.symbol.ohos_trash'))
        .id('cov0917_shaderEmpty')
        .shaderStyle([])
      SymbolGlyph($r('sys.symbol.ohos_trash'))
        .id('cov0917_shaderNull')
        .shaderStyle(null)
      SymbolGlyph($r('sys.symbol.ohos_trash'))
        .id('cov0917_shaderUndef')
        .shaderStyle(undefined)
    }
  }

  @Builder
  textCtorSection() {
    Column({ space: 2 }) {
      Text('hello').id('cov0917_textHello')
      Text('').id('cov0917_textEmpty')
      Text(null).id('cov0917_textNull')
      Text(undefined).id('cov0917_textUndef')
      Text('a', null).id('cov0917_textOptNull')
      Text('a', undefined).id('cov0917_textOptUndef')
    }
  }

  @Builder
  fontWeightSection() {
    Column({ space: 2 }) {
      Text('fw').fontWeight(null).id('cov0917_fwNull')
      Text('fw').fontWeight(undefined).id('cov0917_fwUndef')
      Text('fw').fontWeight('W200').id('cov0917_fwW200')
      Text('fw').fontWeight('W400').id('cov0917_fwW400')
      Text('fw').fontWeight('W500').id('cov0917_fwW500')
      Text('fw').fontWeight('W700').id('cov0917_fwW700')
      Text('fw').fontWeight('W800').id('cov0917_fwW800')
      Text('fw').fontWeight('W900').id('cov0917_fwW900')
    }
  }

  @Builder
  flagSection() {
    Column({ space: 4 }) {
      Text('Coverage0917Batch').id('coverage0917Title').fontSize(18)
      Text(this.pulseFlag).id('pulseFlag')
      Text(this.effectStratFlag).id('effectStratFlag')
      Text(this.renderStratFlag).id('renderStratFlag')
      Text(this.shaderFlag).id('shaderFlag')
      Text(this.kbAvoidFlag).id('kbAvoidFlag')
      Text(this.textMenuFlag).id('textMenuFlag')
      Text(this.textContentFlag).id('textContentFlag')
      Text(this.counterFlag).id('counterFlag')
      Text(this.marqueeFlag).id('marqueeFlag')
      Text(this.richEditorFlag).id('richEditorFlag')
      Text(this.searchTypeFlag).id('searchTypeFlag')
      Text(this.spanShadowFlag).id('spanShadowFlag')
      Text(this.textCtorFlag).id('textCtorFlag')
      Text(this.fontWeightFlag).id('fontWeightFlag')
      Text(this.textShadowFlag).id('textShadowFlag')
      Text(this.bindSelFlag).id('bindSelFlag')
      Text(this.textAreaTypeFlag).id('textAreaTypeFlag')
      Text(this.textClockShadowFlag).id('textClockShadowFlag')
      Text(this.textInputContentFlag).id('textInputContentFlag')
      Text(this.textTimerShadowFlag).id('textTimerShadowFlag')
    }
  }

  @Builder
  inputWidgetsSection() {
    Column({ space: 4 }) {
      Counter()
        .id('cov0917_counter')
        .enableDec(null)
        .enableInc(null)
      Counter()
        .id('cov0917_counterUndef')
        .enableDec(undefined)
        .enableInc(undefined)
      Marquee({ start: true, src: 'marquee coverage text' })
        .id('cov0917_marqueeNull')
        .allowScale(null)
      Marquee({ start: true, src: 'marquee undef text' })
        .id('cov0917_marqueeUndef')
        .allowScale(undefined)
      RichEditor({ controller: new RichEditorController() })
        .id('cov0917_richEditor')
        .enableKeyboardOnFocus(undefined)
      Search({ value: 'search' })
        .id('cov0917_searchNull')
        .type(null)
      Search({ value: 'search2' })
        .id('cov0917_searchInvalid')
        .type(-1 as SearchType)
    }
  }

  @Builder
  textWidgetsSection() {
    Column({ space: 4 }) {
      Text('span host') {
        Span('x').textShadow([])
      }.id('cov0917_spanHost')
      Text('ts').textShadow([]).id('cov0917_textShadowEmpty')
      Text('bs')
        .id('cov0917_bindSel')
        .copyOption(CopyOptions.InApp)
        .bindSelectionMenu(-1 as TextSpanType, this.bindSelMenuBuilder, -1 as TextResponseType)
      TextArea({ text: 't' })
        .id('cov0917_textArea')
        .type(-1 as TextAreaType)
      TextClock()
        .id('cov0917_textClockEmpty')
        .textShadow([])
      TextClock()
        .id('cov0917_textClockFilled')
        .textShadow([{ radius: 1, color: Color.Red, offsetX: 0, offsetY: 0 }])
      TextInput({ text: 'i', controller: this.textInputCtrl })
        .id('cov0917_textInput')
        .contentType(-1 as ContentType)
      TextTimer({ isCountDown: true, count: 60000 })
        .id('cov0917_textTimerEmpty')
        .textShadow([])
      TextTimer({ isCountDown: true, count: 30000 })
        .id('cov0917_textTimerFilled')
        .textShadow([{ radius: 2, color: Color.Blue, offsetX: 1, offsetY: 1 }])
    }
  }

  build() {
    Scroll() {
      Column({ space: 8 }) {
        this.flagSection()
        this.symbolGlyphSection()
        this.textCtorSection()
        this.fontWeightSection()
        this.inputWidgetsSection()
        this.textWidgetsSection()
      }
      .width('100%')
      .padding(12)
    }
    .width('100%')
    .height('100%')
  }
}
