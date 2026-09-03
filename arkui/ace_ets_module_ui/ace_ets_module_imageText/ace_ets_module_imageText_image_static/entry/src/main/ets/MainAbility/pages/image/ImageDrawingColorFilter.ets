'use static';
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
import {
  Entry,
  Text,
  Column,
  Row,
  Component,
  Button,
  ClickEvent,
  Image,
  ImageAttribute,
  AttributeModifier,
  $r,
  FontWeight,
  FlexAlign,
  HorizontalAlign,
  Scroll
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { drawing, common2D } from '@kit.ArkGraphics2D'

export class MyColorFilterModifier1 implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    let color: common2D.Color = { alpha: 255, red: 0, green: 255, blue: 0 };
    let filter = drawing.ColorFilter.createBlendModeColorFilter(color, drawing.BlendMode.SRC_IN);
    instance.colorFilter(filter)
  }
}

export class MyColorFilterModifier2 implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.colorFilter(undefined)
  }
}

@Entry
@Component
struct ImageDrawingColorFilter {
  private colorRed: common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
  private colorGreen: common2D.Color = { alpha: 255, red: 0, green: 255, blue: 0 };

  private filterSrcInRed: drawing.ColorFilter | undefined = drawing.ColorFilter.createBlendModeColorFilter(this.colorRed, drawing.BlendMode.SRC_IN);
  private filterSrcAtopRed: drawing.ColorFilter | undefined = drawing.ColorFilter.createBlendModeColorFilter(this.colorRed, drawing.BlendMode.SRC_ATOP);
  private filterSrcInGreen: drawing.ColorFilter | undefined = drawing.ColorFilter.createBlendModeColorFilter(this.colorGreen, drawing.BlendMode.SRC_IN);

  @State drawingColorFilterDynamic: drawing.ColorFilter | undefined = undefined;
  @State modifier1: MyColorFilterModifier1 = new MyColorFilterModifier1();
  @State modifier2: MyColorFilterModifier2 = new MyColorFilterModifier2();

  build() {
    Scroll() {
      Column() {
        Text('Image DrawingColorFilter Test')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 10 })

        Row() {
          Image($r('app.media.startIcon'))
            .width(100)
            .height(100)
            .colorFilter(this.filterSrcInRed)
            .key('drawingColorFilterImage1')
        }.width('80%')

        Row() {
          Image($r('app.media.startIcon'))
            .width(100)
            .height(100)
            .colorFilter(this.filterSrcAtopRed)
            .key('drawingColorFilterImage2')
        }.width('80%')

        Row() {
          Image($r('app.media.startIcon'))
            .width(100)
            .height(100)
            .colorFilter(this.filterSrcInGreen)
            .key('drawingColorFilterImage3')
        }.width('80%')

        Row() {
          Image($r('app.media.startIcon'))
            .width(100)
            .height(100)
            .colorFilter(undefined)
            .key('drawingColorFilterImage4')
        }.width('80%')

        Row() {
          Image($r('app.media.startIcon'))
            .width(100)
            .height(100)
            .colorFilter(this.drawingColorFilterDynamic)
            .key('drawingColorFilterImage5')

          Button('Set Filter')
            .id('drawingColorFilterBtn5')
            .margin({ left: 10 })
            .onClick(() => {
              this.drawingColorFilterDynamic =
                drawing.ColorFilter.createBlendModeColorFilter(this.colorRed, drawing.BlendMode.SRC_IN);
            })
        }.width('80%')

        Row() {
          Image($r('app.media.startIcon'))
            .width(100)
            .height(100)
            .attributeModifier(this.modifier1)
            .key('drawingColorFilterImage6')
        }.width('80%')

        Row() {
          Image($r('app.media.startIcon'))
            .width(100)
            .height(100)
            .attributeModifier(this.modifier2)
            .key('drawingColorFilterImage7')
        }.width('80%')

        Row() {
          Image($r('app.media.startIcon'))
            .width(100)
            .height(100)
            .key('drawingColorFilterImage8')
        }.width('80%')
      }
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Center)
    }.width('100%').height('100%')
  }
}
