/*
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
import {
  Entry,
  Component,
  Resource,
  FontWeight,
  Color,
  Row,
  $r,
  AlphabetIndexer,
  Margin,
  IndexerAlign,
  Font
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

import events_emitter from '@ohos.events.emitter';
import hilog from '@ohos.hilog';

@Component
@Entry
struct AlphabetIndexerTestux {
  private arrayA: string[] = ['安', '爱', '奥']
  private arrayB: string[] = ['卜', '白', '包', '毕', '丙']
  private arrayC: string[] = ['曹', '成', '陈', '催']
  private arrayH: string[] = ['韩', '何', '郝', '黑']
  private arrayL: string[] = ['刘', '李', '楼', '梁', '雷', '吕', '柳', '卢']
  private arrayT: string[] = ['太', '天', '田', '唐', '陶', '汤']
  private value: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
    'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
    'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
  @State popupSelectedColorStr: string = '#00FF00'
  @State popupUnselectedColorStr: string = '#DA70D6'
  @State popupItemBackgroundStr: string = '#FFD700'
  @State popupItemFontSizeStr: string = '20'
  @State popupItemFontWeightStr: string = '400'
  @State popupSpaceStr: string = '120'
  @State popupSelectedColor: Color = Color.Orange
  @State popupUnselectedColor: Color = Color.Green
  @State popupItemBackgroundColor: Color = Color.Pink
  @State popupSelectedColorNum: number = 0x00CED1
  @State popupUnselectedColorNum: number = 0xC0FF3E
  @State popupItemBackgroundNum: number = 0x8470FF
  @State popupItemFontSizeNum: number = 30
  @State popupItemFontWeightNum: int = FontWeight.Normal as int
  @State popupSpaceNum: number = 50
  @State popupSelectedColorRes: Resource = $r('app.color.popupSelectedColor')
  @State popupUnselectedColorRes: Resource = $r('app.color.popupUnselectedColor')
  @State popupItemBackgroundRes: Resource = $r('app.color.popupItemBackground')
  @State popupItemFontSizeRes: Resource = $r('app.string.fontSize')
  @State popupSpaceRes: Resource = $r('app.string.popupSpace')
  @State popupItemFontWeightFont: number = FontWeight.Bolder
  @State nullFlag1: boolean = false
  @State nullFlag2: boolean = false
  @State nullFlag3: boolean = false
  @State nullFlag4: boolean = false
  @State nullFlag5: boolean = false
  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    console.info("sideBar page state change called:" + JSON.stringify(eventData));
    if (eventData != null) {
      const popupSelectedColorStr = (eventData.data as ESObject).getPropertySafe('popupSelectedColorStr')
      if (popupSelectedColorStr.isString()) {
        this.popupSelectedColorStr = popupSelectedColorStr.toString();
      }
      const popupUnselectedColorStr = (eventData.data as ESObject).getPropertySafe('popupUnselectedColorStr')
      if (popupUnselectedColorStr.isString()) {
        this.popupUnselectedColorStr = popupUnselectedColorStr.toString();
      }
      const popupItemBackgroundStr = (eventData.data as ESObject).getPropertySafe('popupItemBackgroundStr')
      if (popupItemBackgroundStr.isString()) {
        this.popupItemBackgroundStr = popupItemBackgroundStr.toString()
      }
      const popupItemFontSizeStr = (eventData.data as ESObject).getPropertySafe('popupItemFontSizeStr')
      if (popupItemFontSizeStr.isString()) {
        this.popupItemFontSizeStr = popupItemFontSizeStr.toString()
      }
      const popupItemFontWeightStr = (eventData.data as ESObject).getPropertySafe('popupItemFontWeightStr')
      if (popupItemFontWeightStr.isString()) {
        this.popupItemFontWeightStr = popupItemFontWeightStr.toString();
      }
      const popupSpaceStr = (eventData.data as ESObject).getPropertySafe('popupSpaceStr')
      if (popupSpaceStr.isString()) {
        this.popupSpaceStr = popupSpaceStr.toString()
      }
      const popupSelectedColor = (eventData.data as ESObject).getPropertySafe('popupSelectedColor')
      if (!(popupSelectedColor.isNull() || popupSelectedColor.isUndefined())) {
        this.popupSelectedColor = popupSelectedColor.toStaticObject() as Color;
      }
      const popupUnselectedColor = (eventData.data as ESObject).getPropertySafe('popupUnselectedColor')
      if (!(popupUnselectedColor.isNull() || popupUnselectedColor.isUndefined())) {
        this.popupUnselectedColor = popupUnselectedColor.toStaticObject() as Color;
      }
      const popupItemBackgroundColor = (eventData.data as ESObject).getPropertySafe('popupItemBackgroundColor')
      if (!(popupItemBackgroundColor.isNull() || popupItemBackgroundColor.isUndefined())) {
        this.popupItemBackgroundColor = popupItemBackgroundColor.toStaticObject() as Color;
      }
      const popupSelectedColorNum = (eventData.data as ESObject).getPropertySafe('popupSelectedColorNum')
      if (popupSelectedColorNum.isNumber()) {
        this.popupSelectedColorNum = popupSelectedColorNum.toNumber();
      }
      const popupUnselectedColorNum = (eventData.data as ESObject).getPropertySafe('popupUnselectedColorNum')
      if (popupUnselectedColorNum.isNumber()) {
        this.popupUnselectedColorNum = popupUnselectedColorNum.toNumber();
      }
      const popupItemBackgroundNum = (eventData.data as ESObject).getPropertySafe('popupItemBackgroundNum')
      if (popupItemBackgroundNum.isNumber()) {
        this.popupItemBackgroundNum = popupItemBackgroundNum.toNumber();
      }
      const popupItemFontSizeNum = (eventData.data as ESObject).getPropertySafe('popupItemFontSizeNum')
      if (popupItemFontSizeNum.isNumber()) {
        this.popupItemFontSizeNum = popupItemFontSizeNum.toNumber();
      }
      const popupSpaceNum = (eventData.data as ESObject).getPropertySafe('popupSpaceNum')
      if (popupSpaceNum.isNumber()) {
        this.popupSpaceNum = popupSpaceNum.toNumber()
      }
      const popupSelectedColorRes = (eventData.data as ESObject).getPropertySafe('popupSelectedColorRes')
      if (!(popupSelectedColorRes.isNull() || popupSelectedColorRes.isUndefined())) {
        this.popupSelectedColorRes = popupSelectedColorRes.toStaticObject() as Resource;
      }
      const popupUnselectedColorRes = (eventData.data as ESObject).getPropertySafe('popupUnselectedColorRes')
      if (!(popupUnselectedColorRes.isNull() || popupUnselectedColorRes.isUndefined())) {
        this.popupUnselectedColorRes = popupUnselectedColorRes.toStaticObject() as Resource;
      }

      const popupItemBackgroundRes = (eventData.data as ESObject).getPropertySafe('popupItemBackgroundRes')
      if (!(popupItemBackgroundRes.isNull() || popupItemBackgroundRes.isUndefined())) {
        this.popupItemBackgroundRes = popupItemBackgroundRes.toStaticObject() as Resource;
      }
      const popupItemFontSizeRes = (eventData.data as ESObject).getPropertySafe('popupItemFontSizeRes')
      if (!(popupItemFontSizeRes.isNull() || popupItemFontSizeRes.isUndefined())) {
        this.popupItemFontSizeRes = popupItemFontSizeRes.toStaticObject() as Resource;
      }
      const popupSpaceRes = (eventData.data as ESObject).getPropertySafe('popupSpaceRes')
      if (!(popupSpaceRes.isNull() || popupSpaceRes.isUndefined())) {
        this.popupSpaceRes = popupSpaceRes.toStaticObject() as Resource;
      }
      const popupItemFontWeightFont = (eventData.data as ESObject).getPropertySafe('popupItemFontWeightFont')
      if (popupItemFontWeightFont.isNumber()) {
        this.popupItemFontWeightFont = popupItemFontWeightFont.toNumber();
      }
      const nullFlag1 = (eventData.data as ESObject).getPropertySafe('nullFlag1')
      if (nullFlag1.isBoolean()) {
        this.nullFlag1 = nullFlag1.toBoolean();
      }

      const nullFlag2 = (eventData.data as ESObject).getPropertySafe('nullFlag2')
      if (nullFlag2.isBoolean()) {
        this.nullFlag2 = nullFlag2.toBoolean();
      }

      const nullFlag3 = (eventData.data as ESObject).getPropertySafe('nullFlag3')
      if (nullFlag3.isBoolean()) {
        this.nullFlag3 = nullFlag3.toBoolean();
      }

      const nullFlag4 = (eventData.data as ESObject).getPropertySafe('nullFlag4')
      if (nullFlag4.isBoolean()) {
        this.nullFlag4 = nullFlag4.toBoolean();
      }

      const nullFlag5 = (eventData.data as ESObject).getPropertySafe('nullFlag5')
      if (nullFlag5.isBoolean()) {
        this.nullFlag5 = nullFlag5.toBoolean();
      }
    }
  }

  aboutToAppear() {
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 183,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
    console.info("AlphabetIndexerTest about to appear");
  }

  build() {
    Row() {
      AlphabetIndexer({ arrayValue: this.value, selected: 0 })
        .key('alphabetIndexerTest1')
        .font({ size: 18, weight: FontWeight.Normal })
        .selectedFont({ size: 28, weight: FontWeight.Bold })
        .color(0x000000)
        .selectedColor(0xFF1493)
        .backgroundColor($r("sys.color.ohos_id_color_primary"))
        .selectedBackgroundColor(0xBEBEBE)
        .itemSize(26)
        .onSelect((index: number): void => {
          console.info(this.value[index.toInt()] + ' Selected!')
        })
        .usingPopup(true)
        .alignStyle(IndexerAlign.Left)
        .popupFont({ size: 28, weight: FontWeight.Bold })
        .popupColor(0xFFA500)
        .popupBackground(0x32CD32)
        .onRequestPopupData((index: number): Array<string> => {
          if (this.value[index.toInt()] == 'A') {
            return this.arrayA
          } else if (this.value[index.toInt()] == 'B') {
            return this.arrayB
          } else if (this.value[index.toInt()] == 'C') {
            return this.arrayC
          } else if (this.value[index.toInt()] == 'L') {
            return this.arrayL
          } else if (this.value[index.toInt()] == 'T') {
            return this.arrayT
          } else {
            return []
          }
        })
        .onPopupSelect((index: number): void => {
          console.info('onPopupSelected label :' + index)
        })
        .margin({ top: 20 } as Margin)

      AlphabetIndexer({ arrayValue: this.value, selected: 0 })
        .key('alphabetIndexerTest2')
        .font({ size: 18, weight: FontWeight.Normal })
        .selectedFont({ size: 28, weight: FontWeight.Bold })
        .color(0x000000)
        .selectedColor(0xFF1493)
        .backgroundColor($r("sys.color.ohos_id_color_primary"))
        .selectedBackgroundColor(0xBEBEBE)
        .itemSize(26)
        .onSelect((index: number): void => {
          console.info(this.value[index.toInt()] + ' Selected!')
        })
        .usingPopup(true)
        .popupFont({ size: 28, weight: FontWeight.Bold })
        .popupColor(0xFFA500)
        .popupBackground(0x32CD32)
        .onRequestPopupData((index: number): Array<string> => {
          if (this.value[index.toInt()] == 'A') {
            return this.arrayA
          } else if (this.value[index.toInt()] == 'B') {
            return this.arrayB
          } else if (this.value[index.toInt()] == 'C') {
            return this.arrayC
          } else if (this.value[index.toInt()] == 'L') {
            return this.arrayL
          } else if (this.value[index.toInt()] == 'T') {
            return this.arrayT
          } else {
            return []
          }
        })
        .onPopupSelect((index: number): void => {
          console.info('onPopupSelected label :' + index)
        })
        .margin({ top: 20, left: 20 } as Margin)
        .alignStyle(IndexerAlign.Left, this.nullFlag5 ? undefined : this.popupSpaceNum)
        .popupSelectedColor(this.nullFlag1 ? undefined : this.popupSelectedColorNum)
        .popupUnselectedColor(this.nullFlag2 ? undefined : this.popupUnselectedColorNum)
        .popupItemBackgroundColor(this.nullFlag3 ? undefined : this.popupItemBackgroundNum)
        .popupItemFont(this.nullFlag4 ? undefined :
          { size: this.popupItemFontSizeNum, weight: this.popupItemFontWeightNum } as Font)

      AlphabetIndexer({ arrayValue: this.value, selected: 0 })
        .key('alphabetIndexerTest3')
        .font({ size: 18, weight: FontWeight.Normal })
        .selectedFont({ size: 28, weight: FontWeight.Bold })
        .color(0x000000)
        .selectedColor(0xFF1493)
        .backgroundColor($r("sys.color.ohos_id_color_primary"))
        .selectedBackgroundColor(0xBEBEBE)
        .itemSize(26)
        .onSelect((index: number): void => {
          console.info(this.value[index.toInt()] + ' Selected!')
        })
        .usingPopup(true)
        .popupFont({ size: 28, weight: FontWeight.Bold })
        .popupColor(0xFFA500)
        .popupBackground(0x32CD32)
        .onRequestPopupData((index: number): Array<string> => {
          if (this.value[index.toInt()] == 'A') {
            return this.arrayA
          } else if (this.value[index.toInt()] == 'B') {
            return this.arrayB
          } else if (this.value[index.toInt()] == 'C') {
            return this.arrayC
          } else if (this.value[index.toInt()] == 'L') {
            return this.arrayL
          } else if (this.value[index.toInt()] == 'T') {
            return this.arrayT
          } else {
            return []
          }
        })
        .onPopupSelect((index: number): void => {
          console.info('onPopupSelected label :' + index)
        })
        .margin({ top: 20, left: 20 } as Margin)
        .alignStyle(IndexerAlign.Left, this.nullFlag5 ? undefined : this.popupSpaceStr)
        .popupSelectedColor(this.nullFlag1 ? undefined : this.popupSelectedColorStr)
        .popupUnselectedColor(this.nullFlag2 ? undefined : this.popupUnselectedColorStr)
        .popupItemBackgroundColor(this.nullFlag3 ? undefined : this.popupItemBackgroundStr)
        .popupItemFont(this.nullFlag4 ? undefined :
          { size: this.popupItemFontSizeStr, weight: this.popupItemFontWeightStr } as Font)

      AlphabetIndexer({ arrayValue: this.value, selected: 0 })
        .key('alphabetIndexerTest4')
        .font({ size: 18, weight: FontWeight.Normal })
        .selectedFont({ size: 28, weight: FontWeight.Bold })
        .color(0x000000)
        .selectedColor(0xFF1493)
        .backgroundColor($r("sys.color.ohos_id_color_primary"))
        .selectedBackgroundColor(0xBEBEBE)
        .itemSize(26)
        .onSelect((index: number): void => {
          console.info(this.value[index.toInt()] + ' Selected!')
        })
        .usingPopup(true)
        .popupFont({ size: 28, weight: FontWeight.Bold })
        .popupColor(0xFFA500)
        .popupBackground(0x32CD32)
        .onRequestPopupData((index: number): Array<string> => {
          if (this.value[index.toInt()] == 'A') {
            return this.arrayA
          } else if (this.value[index.toInt()] == 'B') {
            return this.arrayB
          } else if (this.value[index.toInt()] == 'C') {
            return this.arrayC
          } else if (this.value[index.toInt()] == 'L') {
            return this.arrayL
          } else if (this.value[index.toInt()] == 'T') {
            return this.arrayT
          } else {
            return []
          }
        })
        .onPopupSelect((index: number): void => {
          console.info('onPopupSelected label :' + index)
        })
        .margin({ top: 20, left: 20 } as Margin)
        .alignStyle(IndexerAlign.Left, this.nullFlag5 ? undefined : this.popupSpaceRes)
        .popupSelectedColor(this.nullFlag1 ? undefined : this.popupSelectedColorRes)
        .popupUnselectedColor(this.nullFlag2 ? undefined : this.popupUnselectedColorRes)
        .popupItemBackgroundColor(this.nullFlag3 ? undefined : this.popupItemBackgroundRes)
        .popupItemFont(this.nullFlag4 ? undefined :
          { size: this.popupItemFontSizeRes, weight: this.popupItemFontWeightFont as int } as Font)

      AlphabetIndexer({ arrayValue: this.value, selected: 0 })
        .key('alphabetIndexerTest5')
        .font({ size: 18, weight: FontWeight.Normal })
        .selectedFont({ size: 28, weight: FontWeight.Bold })
        .color(0x000000)
        .selectedColor(0xFF1493)
        .backgroundColor(0xF8F8FF)
        .selectedBackgroundColor(0xBEBEBE)
        .itemSize(26)
        .onSelect((index: number): void => {
          console.info(this.value[index.toInt()] + ' Selected!')
        })
        .usingPopup(true)
        .popupFont({ size: 28, weight: FontWeight.Bold })
        .popupColor(0xFFA500)
        .popupBackground(0x32CD32)
        .onRequestPopupData((index: number): Array<string> => {
          if (this.value[index.toInt()] == 'A') {
            return this.arrayA
          } else if (this.value[index.toInt()] == 'B') {
            return this.arrayB
          } else if (this.value[index.toInt()] == 'C') {
            return this.arrayC
          } else if (this.value[index.toInt()] == 'L') {
            return this.arrayL
          } else if (this.value[index.toInt()] == 'T') {
            return this.arrayT
          } else {
            return []
          }
        })
        .onPopupSelect((index: number): void => {
          console.info('onPopupSelected label :' + index)
        })
        .margin({ top: 20, left: 20 } as Margin)
        .alignStyle(IndexerAlign.Left, this.popupSpaceNum)
        .popupSelectedColor(this.popupSelectedColor)
        .popupUnselectedColor(this.popupUnselectedColor)
        .popupItemBackgroundColor(this.popupItemBackgroundColor)
        .popupItemFont({ size: this.popupItemFontSizeNum, weight: this.popupItemFontWeightNum } as Font)

      AlphabetIndexer({ arrayValue: this.value, selected: 0 })
        .key('alphabetIndexerTest6')
        .font({ size: 18, weight: FontWeight.Normal })
        .selectedFont({ size: 28, weight: FontWeight.Bold })
        .color(0x000000)
        .selectedColor(0xFF1493)
        .backgroundColor(0xF8F8FF)
        .selectedBackgroundColor(0xBEBEBE)
        .itemSize(26)
        .onSelect((index: number): void => {
          console.info(this.value[index.toInt()] + ' Selected!')
        })
        .usingPopup(true)
        .alignStyle(IndexerAlign.Left)
        .popupFont({ size: 28, weight: FontWeight.Bold })
        .popupColor(0xFFA500)
        .popupBackground(0x32CD32)
        .onRequestPopupData((index: number): Array<string> => {
          if (this.value[index.toInt()] == 'A') {
            return this.arrayA
          } else if (this.value[index.toInt()] == 'B') {
            return this.arrayB
          } else if (this.value[index.toInt()] == 'C') {
            return this.arrayC
          } else if (this.value[index.toInt()] == 'L') {
            return this.arrayL
          } else if (this.value[index.toInt()] == 'T') {
            return this.arrayT
          } else {
            return []
          }
        })
        .onPopupSelect((index: number): void => {
          console.info('onPopupSelected label :' + index)
        })
        .margin({ top: 20, left: 20 } as Margin)
        .popupItemFont({ size: this.popupItemFontSizeNum } as Font)

      AlphabetIndexer({ arrayValue: this.value, selected: 0 })
        .key('alphabetIndexerTest7')
        .font({ size: 18, weight: FontWeight.Normal })
        .selectedFont({ size: 28, weight: FontWeight.Bold })
        .color(0x000000)
        .selectedColor(0xFF1493)
        .backgroundColor(0xF8F8FF)
        .selectedBackgroundColor(0xBEBEBE)
        .itemSize(26)
        .onSelect((index: number): void => {
          console.info(this.value[index.toInt()] + ' Selected!')
        })
        .usingPopup(true)
        .alignStyle(IndexerAlign.Left)
        .popupFont({ size: 28, weight: FontWeight.Bold })
        .popupColor(0xFFA500)
        .popupBackground(0x32CD32)
        .onRequestPopupData((index: number): Array<string> => {
          if (this.value[index.toInt()] == 'A') {
            return this.arrayA
          } else if (this.value[index.toInt()] == 'B') {
            return this.arrayB
          } else if (this.value[index.toInt()] == 'C') {
            return this.arrayC
          } else if (this.value[index.toInt()] == 'L') {
            return this.arrayL
          } else if (this.value[index.toInt()] == 'T') {
            return this.arrayT
          } else {
            return []
          }
        })
        .onPopupSelect((index: number): void => {
          console.info('onPopupSelected label :' + index)
        })
        .margin({ top: 20, left: 20 } as Margin)
        .popupItemFont({ weight: this.popupItemFontWeightNum } as Font)
    }.backgroundColor(0x00FFFF).width('100%').height('100%')
  }
}
