/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';
import { Entry, Color,Resource,Length, Span,Text,ResourceStr,Length, ScrollDirection,Column, Component, $r, Scroll, AttributeModifier, SpanAttribute, Length, FontStyle, FontWeight, TextCase, TextDecorationType, ResourceColor, Font } from '@ohos.arkui.component'
import {
  State,
  AppStorage
} from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { AppStorage,StoragePropRef } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
class MySpanComponentModifier implements AttributeModifier<SpanAttribute> {
  mFontSize: number = 16;
  mFontFamily: string  = 'HarmonyOS Sans'
  mLineHeight: number = 0
  mFontStyle: FontStyle = FontStyle.Normal
  mFontWeight: int  = 400
  mTextCase: TextCase = TextCase.Normal
  mDecorationType: TextDecorationType = TextDecorationType.None
  mDecorationColor: ResourceColor | undefined = Color.Red
  mFontColor: Color = Color.Red
  mLetterSpacing: number = 0
  applyNormalAttribute(instance: SpanAttribute): void {
    instance.fontSize(this.mFontSize);
    instance.fontFamily(this.mFontFamily);
    instance.lineHeight(this.mLineHeight);
    instance.fontStyle(this.mFontStyle);
    instance.fontWeight(this.mFontWeight);
    instance.textCase(this.mTextCase);
    instance.decoration({type: this.mDecorationType, color: this.mDecorationColor})
    instance.fontColor(this.mFontColor)
    instance.letterSpacing(this.mLetterSpacing)
  }
}
class MySpanFontModifier implements AttributeModifier<SpanAttribute> {
  mFont: Font = {}
  applyNormalAttribute(instance: SpanAttribute): void {
    instance.font(this.mFont);
  }
}

@Entry
@Component
struct VideoExample {

  @State message: string = 'span';
  @State mod1: MySpanComponentModifier = new MySpanComponentModifier();
  @State mod2: MySpanFontModifier = new MySpanFontModifier();

  @StoragePropRef('mFontSize') mFontSize: number = 16;
  @StoragePropRef('mFontFamily') mFontFamily: string = 'HarmonyOS Sans';
  @StoragePropRef('mLineHeight') mLineHeight: number= 0;
  @StoragePropRef('mFontStyle') mFontStyle: FontStyle = FontStyle.Normal;
  @StoragePropRef('mFontWeight') mFontWeight: int= 400;
  @StoragePropRef('mTextCase') mTextCase: TextCase = TextCase.Normal;
  @StoragePropRef('mDecorationType') mDecorationType: TextDecorationType = TextDecorationType.None;
  @StoragePropRef('mDecorationColor') mDecorationColor: ResourceColor | undefined = Color.Red;
  @StoragePropRef('mFontColor') mFontColor: Color = Color.Red;
  @StoragePropRef('mLetterSpacing') mLetterSpacing : number = 0
  @StoragePropRef('mFont') mFont: Font = {} as Font;
  @State fontStyleValue: string = '';

  build() {
    Scroll() {
      Column() {
        Text(this.message).fontSize(9).fontColor(Color.Red)
        Text() {
          Span('This is the TEST Span component 测试')
            .key('keykeyspan')
            .attributeModifier(this.mod1)
            .fontSize(this.mFontSize)
            .fontFamily(this.mFontFamily)
            .lineHeight(this.mLineHeight)
            .fontStyle(this.mFontStyle)
            .fontWeight(this.mFontWeight)
            .textCase(this.mTextCase)
            .decoration({ type: this.mDecorationType, color: this.mDecorationColor })
            .fontColor(this.mFontColor)
            .letterSpacing(this.mLetterSpacing)
        }.border({ width: 1 })
        .padding(10)

        Text() {
          Span('This is the test Span component2')
            .key('keykeyspan2')
            .attributeModifier(this.mod2)
            .font(this.mFont)
        }.border({ width: 1 })
        .padding(10)
      }.width('100%').padding(10)
    }.scrollable(ScrollDirection.Vertical)
  }
}