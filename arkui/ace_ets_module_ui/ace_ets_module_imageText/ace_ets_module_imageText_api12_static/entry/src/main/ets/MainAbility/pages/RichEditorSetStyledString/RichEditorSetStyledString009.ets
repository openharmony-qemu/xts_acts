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
  GestureRecognizerState,RichEditorController,RichEditor,RichEditorChangeValue,RichEditorTextSpanResult,RichEditorOptions,RichEditorLayoutStyle,LongPressGesture,Direction,RichEditorRange,ClickEvent,$r,LayoutManager,RichEditorOptions,MutableStyledString,TextStyle,StyledString,RichEditorStyledStringController,Resource,ImageAttachment,FontWeight,FontStyle,StyledStringKey,RichEditorStyledStringOptions,TextEditControllerEx,TextMenuItem,TextRange,TextMenuItemId
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
@Entry
@Component
struct RichEditorSetStyledString009 {
  stringLength: number = 0;
  imagePixelMap: image.PixelMap | undefined = undefined;
  @State selection: string = '';
  @State lengthStr: string = '';
  @State range: string = '';
  @State replaceString: string = '';
  @State rangeBefore: string = '';
  @State rangeAfter: string = '';
  richEditorStyledString: MutableStyledString = new MutableStyledString('');
  // textStyle: TextStyle = {
  //   fontWeight: FontWeight.Lighter,
  //   fontFamily: CommonFunc.FONT_FAMILY,
  //   fontColor: Color.Green,
  //   fontSize: LengthMetrics.vp(30),
  //   fontStyle: FontStyle.Normal
  // }
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = {controller: this.controller} as RichEditorStyledStringOptions;
  aboutToAppear() {
    console.info('aboutToAppear initial imagePixelMap');
    // this.imagePixelMap = await this.getPixmapFromMedia($r('app.media.icon'));
  }

  // private async getPixmapFromMedia(resource: Resource) {
  //   let unit8Array = await this.getContext()?.resourceManager?.getMediaContent({
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
          this.richEditorStyledString = this.controller.getStyledString();
          // this.richEditorStyledString.appendStyledString(imageStyledString);
          this.controller.setStyledString(this.richEditorStyledString as StyledString);
          this.controller.setCaretOffset(this.richEditorStyledString.length);
        }
      }).id('image_top')

      Text('lengthStr:' + this.lengthStr).id('lengthStr')

      Button('get length').onClick((e: ClickEvent) => {
        this.lengthStr = this.controller.getStyledString().length + '';
      }).id('get_length')

      RichEditor(this.options)
        .onReady((): void => {
        })
        .height('20%')
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black).id('RichEditorSetStyledString009')

      Column() {
        Row() {
          Button('add text').onClick((e: ClickEvent) => {
            this.richEditorStyledString = this.controller.getStyledString();
            this.richEditorStyledString.insertString(2, 'ab');
            this.richEditorStyledString.insertString(0, 'cd');
            this.controller.setStyledString(this.richEditorStyledString as StyledString);
            this.controller.setCaretOffset(this.richEditorStyledString.length);
          }).id('add_text')
        }

      }
      .width('100%')
    }
  }
}