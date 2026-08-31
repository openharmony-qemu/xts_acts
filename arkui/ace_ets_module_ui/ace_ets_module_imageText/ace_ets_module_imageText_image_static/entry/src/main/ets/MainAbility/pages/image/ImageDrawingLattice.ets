'use static';
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
  Resource,
  PixelMap,
  FontWeight,
  FlexAlign,
  HorizontalAlign,
  Scroll
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { drawing } from '@kit.ArkGraphics2D'

export class MyLatticeModifier1 implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    let xDivs: Array<number> = [1, 2, 200];
    let yDivs: Array<number> = [1, 2, 200];
    let fXCount: number = 3;
    let fYCount: number = 3;
    let lattice: drawing.Lattice = drawing.Lattice.createImageLattice(xDivs, yDivs, fXCount, fYCount);
    instance.resizable({ lattice: lattice })
  }
}

export class MyLatticeModifier2 implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.resizable(undefined)
  }
}

@Entry
@Component
struct ImageDrawingLattice {
  private xDivs1: Array<number> = [1, 2, 200];
  private yDivs1: Array<number> = [1, 2, 200];
  private fXCount1: number = 3;
  private fYCount1: number = 3;
  private drawingLattice1: drawing.Lattice =
    drawing.Lattice.createImageLattice(this.xDivs1, this.yDivs1, this.fXCount1, this.fYCount1);

  private xDivs2: Array<number> = [0, 50, 100];
  private yDivs2: Array<number> = [0, 50, 100];
  private fXCount2: number = 2;
  private fYCount2: number = 2;
  private drawingLattice2: drawing.Lattice =
    drawing.Lattice.createImageLattice(this.xDivs2, this.yDivs2, this.fXCount2, this.fYCount2);

  private xDivs3: Array<number> = [1];
  private yDivs3: Array<number> = [1];
  private fXCount3: number = 1;
  private fYCount3: number = 1;
  private drawingLattice3: drawing.Lattice =
    drawing.Lattice.createImageLattice(this.xDivs3, this.yDivs3, this.fXCount3, this.fYCount3);

  @State modifier1: MyLatticeModifier1 = new MyLatticeModifier1();
  @State modifier2: MyLatticeModifier2 = new MyLatticeModifier2();

  build() {
    Scroll() {
      Column() {
        Text('Image DrawingLattice Test')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 10 })

        Row() {
          Image($r('app.media.startIcon'))
            .width(100)
            .height(100)
            .resizable({ lattice: this.drawingLattice1 })
            .key('drawingLatticeImage1')
        }.width('80%')

        Row() {
          Image($r('app.media.startIcon'))
            .width(100)
            .height(100)
            .resizable({ lattice: this.drawingLattice2 })
            .key('drawingLatticeImage2')
        }.width('80%')

        Row() {
          Image($r('app.media.startIcon'))
            .width(100)
            .height(100)
            .resizable(undefined)
            .key('drawingLatticeImage3')
        }.width('80%')

        Row() {
          Image($r('app.media.startIcon'))
            .width(100)
            .height(100)
            .attributeModifier(this.modifier1)
            .key('drawingLatticeImage4')
        }.width('80%')

        Row() {
          Image($r('app.media.startIcon'))
            .width(100)
            .height(100)
            .attributeModifier(this.modifier2)
            .key('drawingLatticeImage5')
        }.width('80%')

        Row() {
          Image($r('app.media.startIcon'))
            .width(100)
            .height(100)
            .resizable({ slice: { top: 10, bottom: 10, left: 10, right: 10 }, lattice: this.drawingLattice1 })
            .key('drawingLatticeImage6')
        }.width('80%')

        Row() {
          Image($r('app.media.startIcon'))
            .width(100)
            .height(100)
            .resizable({ lattice: this.drawingLattice3 })
            .key('drawingLatticeImage7')
        }.width('80%')

        Row() {
          Image($r('app.media.startIcon'))
            .width(100)
            .height(100)
            .key('drawingLatticeImage8')
        }.width('80%')
      }
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Center)
    }.width('100%').height('100%')
  }
}
