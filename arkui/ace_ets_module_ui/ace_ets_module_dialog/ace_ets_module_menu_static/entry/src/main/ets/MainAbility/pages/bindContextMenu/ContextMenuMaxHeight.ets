'use static';

/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import {
  Entry,
  Column,
  ColumnOptions,
  Component,
  Builder,
  Button,
  Text,
  FlexAlign,
  ContextMenuOptions,
  ResponseType,
  Menu,
  MenuItem,
  $r,
  MenuItemOptions,
  MenuPreviewMode,
  PreviewScaleMode,
  AvailableLayoutArea,
  ModalMode,
  BlurStyle,
  MenuKeyboardAvoidMode,
  BarState,
  Color
} from '@ohos.arkui.component';
import { LengthUnit, LengthMetrics } from '@ohos.arkui.node';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { ResourceStr } from '@ohos.arkui.component';

import { SymbolGlyphModifier } from '@kit.ArkUI';
import inspector from '@ohos.arkui.inspector';

@Entry
@Component
struct ContextMenuMaxHeight {
  @State startIconModifier: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_star'))
  @State isShow1: boolean = false;
  @State isShow2: boolean = false;
  @State isShow3: boolean = false;
  @State isShow4: boolean = false;
  @State isShow5: boolean = false;
  @State isShow6: boolean = false;
  @State isShow7: boolean = false;
  @State isShow8: boolean = false;

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({symbolStartIcon: this.startIconModifier, content: '新建文件夹',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '排序方式',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '查看方式',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '新建文件夹',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '排序方式',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '查看方式',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '新建文件夹',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '排序方式',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '查看方式',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '新建文件夹',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '排序方式',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '查看方式',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '新建文件夹',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '排序方式',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '查看方式',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '新建文件夹',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '排序方式',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '查看方式',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '新建文件夹',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '排序方式',})
      MenuItem({symbolStartIcon: this.startIconModifier, content: '查看方式',})
    }.id('menu')
  }

  build() {
    Column({ space: 2 } as ColumnOptions)  {
      Text('maxHeight:percent')
        .id('SetMaxHeightPercent')
        .fontSize(12)
        .border({ width: 1 })
        .onClick(() => {
          this.isShow1 = !this.isShow1;
        })
        .bindContextMenu(this.isShow1, this.MyMenu, {
          maxHeight:LengthMetrics.percent(0.7)
        })


      Text('maxHeight:vp')
        .id('SetMaxHeightVp')
        .fontSize(12)
        .border({ width: 1 })
        .onClick(() => {
          this.isShow2 = !this.isShow2;
        })
        .bindContextMenu(this.isShow2, this.MyMenu,  {
          maxHeight:LengthMetrics.vp(300)
        })

      Text('maxHeight:px')
        .id('SetMaxHeightPx')
        .fontSize(12)
        .border({ width: 1 })
        .onClick(() => {
          this.isShow3 = !this.isShow3;
        })
        .bindContextMenu(this.isShow3, this.MyMenu, {
          maxHeight:LengthMetrics.px(400)
        })

      Text('maxHeight:fp')
        .id('SetMaxHeightFp')
        .fontSize(12)
        .border({ width: 1 })
        .onClick(() => {
          this.isShow4 = !this.isShow4;
        })
        .bindContextMenu(this.isShow4, this.MyMenu, {
          maxHeight:LengthMetrics.fp(200)
        })

      Text('maxHeight:lpx')
        .id('SetMaxHeightLpx')
        .fontSize(12)
        .border({ width: 1 })
        .onClick(() => {
          this.isShow5 = !this.isShow5;
        })
        .bindContextMenu(this.isShow5, this.MyMenu, {
          maxHeight:LengthMetrics.lpx(300),
          scrollBar: BarState.On
        })

      Text('maxHeight:0')
        .id('SetMaxHeight_0')
        .fontSize(12)
        .border({ width: 1 })
        .onClick(() => {
          this.isShow6 = !this.isShow6;
        })
        .bindContextMenu(this.isShow6, this.MyMenu, {
          maxHeight:LengthMetrics.vp(0),
          scrollBar: BarState.Off
        })

      Text('maxHeight:-1')
        .id('SetMaxHeight_-1')
        .fontSize(12)
        .border({ width: 1 })
        .onClick(() => {
          this.isShow7 = !this.isShow7;
        })
        .bindContextMenu(this.isShow7, this.MyMenu, {
          maxHeight:LengthMetrics.vp(-1),
          scrollBar: BarState.Auto
        })

      Text('maxHeight: undefined')
        .id('SetMaxHeightUndefined')
        .fontSize(12)
        .border({ width: 1 })
        .onClick(() => {
          this.isShow8 = !this.isShow8;
        })
        .bindContextMenu(this.isShow8, this.MyMenu, {
          maxHeight:undefined,
          scrollBar: undefined
        })
      Button('get')
        .onClick(()=>{
          let strJson1 = inspector.getInspectorByKey('SetMaxHeightPercent');
          let strJson2 = inspector.getInspectorByKey('SetMaxHeightVp');
          let strJson3 = inspector.getInspectorByKey('SetMaxHeightPx');
          let strJson4 = inspector.getInspectorByKey('SetMaxHeightFp');
          let strJson5 = inspector.getInspectorByKey('SetMaxHeightLpx');
          let strJson6 = inspector.getInspectorByKey('SetMaxHeight_0');
          let strJson7 = inspector.getInspectorByKey('SetMaxHeight_-1');
          let strJson8 = inspector.getInspectorByKey('SetMaxHeightUndefined');
          console.info('hello: ' + Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('height').split('.')[0]));
          console.info('hello: ' + Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('height').split('.')[0]));
          console.info('hello: ' + Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('height').split('.')[0]));
          console.info('hello: ' + Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('height').split('.')[0]));
          console.info('hello: ' + Number(JSON.parseJsonElement(strJson5).getElement('$attrs').getString('height').split('.')[0]));
          console.info('hello: ' + Number(JSON.parseJsonElement(strJson6).getElement('$attrs').getString('height').split('.')[0]));
          console.info('hello: ' + Number(JSON.parseJsonElement(strJson7).getElement('$attrs').getString('height').split('.')[0]));
          console.info('hello: ' + Number(JSON.parseJsonElement(strJson8).getElement('$attrs').getString('height').split('.')[0]));
        })
        .id('getStringLog')
        .width(90)
        .height(20)
    }.width('100%').height('100%')
  }
}
