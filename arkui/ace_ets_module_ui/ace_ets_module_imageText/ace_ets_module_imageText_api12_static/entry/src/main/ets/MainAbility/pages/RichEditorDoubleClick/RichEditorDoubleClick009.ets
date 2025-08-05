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
import { LengthMetrics } from '@ohos.arkui.node'
import image from "@ohos.multimedia.image";
import { MyCustomSpan } from '../../common/MyCustomSpan'
import CommonFunc from '../../common/Common'

import {
  Entry,
  Component,
  Column,
  Row,
  Text,
  ColumnOptions,
  TouchType,
  CustomBuilder,
  DragItemInfo,
  Color,
  Button,
  TouchEvent,
  Margin,
  Scroller,
  GestureRecognizer,
  PanRecognizer,
  GestureEvent,
  ScrollableTargetInfo,
  Stack,
  Alignment,
  Scroll,
  TextAlign,
  ForEach,
  ScrollDirection,
  BarState,
  EdgeEffect,
  GestureControl,
  PanGesture,
GestureRecognizerState,RichEditorController,RichEditor,RichEditorChangeValue,RichEditorTextSpanResult,RichEditorOptions,RichEditorLayoutStyle,LongPressGesture,Direction,RichEditorRange,ClickEvent,$r,LayoutManager,RichEditorOptions,MutableStyledString,TextStyle,StyledString,RichEditorStyledStringController,Resource,ImageAttachment,FontWeight,FontStyle,StyledStringKey,RichEditorStyledStringOptions,TextEditControllerEx,TextMenuItem,TextRange,TextMenuItemId,CopyOptions,RichEditorInsertValue,Builder
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
@Entry
@Component
struct RichEditorDoubleClick009 {
  customSpan1: MyCustomSpan = new MyCustomSpan('Hello', 80);
  // style1: MutableStyledString = new MutableStyledString(this.customSpan1);
  imagePixelMap: image.PixelMap | undefined = undefined;
  @State message: string = '';

  richEditorStyledString: MutableStyledString = new MutableStyledString('');
  // textStyle: TextStyle = {
  //   fontWeight: FontWeight.Lighter,
  //   fontFamily: CommonFunc.FONT_FAMILY,
  //   fontColor: Color.Green,
  //   fontSize: LengthMetrics.vp(50),
  //   fontStyle: FontStyle.Normal
  // }
  // fontStyle1: TextStyle = { fontColor: Color.Blue };
  // // 创建属性字符串对象
  // mutableStyledString: MutableStyledString = new MutableStyledString('abc',
  //   [{ start: 0, length: 3, styledKey: StyledStringKey.FONT, styledValue: this.fontStyle1 }]);

  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = {controller: this.controller} as RichEditorStyledStringOptions;


  //
  // private async getPixmapFromMedia(resource: Resource) {
  //   let unit8Array = await this.getUIContext()?.resourceManager?.getMediaContent({
  //     bundleName: resource.bundleName,
  //     moduleName: resource.moduleName,
  //     id: resource.id
  //   })
  //   let imageSource = image.createImageSource(unit8Array.buffer.slice(0, unit8Array.buffer.byteLength))
  //   let createPixelMap: image.PixelMap = await imageSource.createPixelMap({
  //     desiredPixelFormat: image.PixelMapFormat.RGBA_8888
  //   })
  //   await imageSource.release()
  //   return createPixelMap
  // }


build() {
    Column() {
      Button('image Top').onClick((e: ClickEvent) => {
        if (this.imagePixelMap !== undefined) {
          // let imageStyledString = new MutableStyledString(new ImageAttachment({
          //   value: this.imagePixelMap,
          //   size: { width: 20, height: 20 },
          //   layoutStyle: { borderRadius: LengthMetrics.vp(10) },
          //   verticalAlign: ImageSpanAlignment.TOP,
          //   objectFit: ImageFit.Contain
          // }))
          // this.richEditorStyledString = this.controller.getStyledString();
          // this.richEditorStyledString.appendStyledString(imageStyledString);
          // this.controller.setStyledString(this.richEditorStyledString);
          // this.controller.setCaretOffset(this.richEditorStyledString.length);
        }
      }).id('imageTop')

      Text('message:' + this.message).id('message')

      RichEditor(this.options)
        .onReady((): void => {
          // this.controller.setStyledString(this.mutableStyledString);
        })
        .onSelectionChange((value: RichEditorRange): void => {
          console.log('RichEditorController value:' + JSON.stringify(value));
          this.message = JSON.stringify(value);
        })
        .height('20%')
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black).id('RichEditorDoubleClick009')

      Column() {
        Row() {
          Button('add custom').onClick((e: ClickEvent) => {
            // this.richEditorStyledString = this.controller.getStyledString();
            // this.richEditorStyledString.appendStyledString(this.style1);
            // this.controller.setStyledString(this.richEditorStyledString);
            // this.controller.setCaretOffset(this.richEditorStyledString.length);
          }).id('addCustom')
        }

      }
      .width('100%')
    }
  }
}