'use static'
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
  Column,
  Row,
  Text,
  Button,
  Color,
  FlexAlign,
  TextAlign,
  Entry,
  Component,
  ColumnOptions,
  RowOptions,
  Margin,
  AttributeModifier,
  ButtonAttribute,
  CommonMethod,
  CustomStyles,
  Scroll,
  Blank
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

class MyButtonModifier implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.backgroundColor('#000000');
  }
  applyHoveredAttribute(instance: ButtonAttribute): void {
    instance.backgroundColor('#FF0000');
  }
}

@Entry
@Component
struct HoveredAttributeTestPage {
  @State modifier: MyButtonModifier = new MyButtonModifier();
  @State frameNodeBgColor: string = '#008000';
  @State frameNodeRemoved: boolean = false;

  hoveredStyles: CustomStyles = (instance: CommonMethod): void => {
    instance.backgroundColor('#FF0000');
  };

  build(): void {
    Scroll() {
      Column() {
        Text('HoveredAttribute Test')
          .width('90%')
          .textAlign(TextAlign.Center)
          .margin({ top: '2%' } as Margin)

        Text('Area1: applyHoveredAttribute')
          .width('90%')
          .fontColor(Color.Gray)
          .textAlign(TextAlign.Center)

        Button('Modifier Hover')
          .id('modifierHoverBtn')
          .width('80%')
          .height('8%')
          .attributeModifier(this.modifier)

        Text('Area2: stateStyles hovered')
          .width('90%')
          .fontColor(Color.Gray)
          .textAlign(TextAlign.Center)
          .margin({ top: '5%' } as Margin)

        Text('StateStyles Hover')
          .id('stateHoverText')
          .width('80%')
          .height('8%')
          .backgroundColor('#0000FF')
          .textAlign(TextAlign.Center)
          .stateStyles({
            hovered: this.hoveredStyles,
          })

        Text('Area3: FrameNode hover (onHover)')
          .width('90%')
          .fontColor(Color.Gray)
          .textAlign(TextAlign.Center)
          .margin({ top: '5%' } as Margin)

        Text('HoverTarget')
          .id('frameNodeHoverText')
          .width('80%')
          .height('8%')
          .backgroundColor(this.frameNodeBgColor)
          .textAlign(TextAlign.Center)
          .fontColor(Color.White)
          .borderWidth(2)
          .borderColor(Color.Black)
          .focusable(true)
          .onHover((isHover: boolean): void => {
            if (!this.frameNodeRemoved) {
              if (isHover) {
                this.frameNodeBgColor = '#0000FF';
              } else {
                this.frameNodeBgColor = '#008000';
              }
            }
          })

        Button('RemoveHover')
          .id('frameNodeRemoveBtn')
          .width('80%')
          .height('8%')
          .onClick(() => {
            this.frameNodeRemoved = true;
          })

        Text('Area4: Move Out Button')
          .width('90%')
          .fontColor(Color.Gray)
          .textAlign(TextAlign.Center)
          .margin({ top: '5%' } as Margin)

        Button('Move Mouse Out')
          .id('moveOutBtn')
          .width('80%')
          .height('8%')
          .backgroundColor('#FFFFFF')
          .borderWidth(1)
          .borderColor('#000000')

        Blank().height('5%')
      }
      .width('100%')
      .padding({ left: '5%', right: '5%' } as Margin)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFF')
  }
}