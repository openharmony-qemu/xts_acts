'use static';
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
import { LengthMetrics } from '@ohos.arkui.node'
import {
  Entry,
  MutableStyledString,
  ColorFilter,
  ClickEvent,
  Component,
  RichEditor,
  Column,
  Text,
  ImageSpan,
  Visibility,
  $r,
  FlexAlign,
  HorizontalAlign,
  RichEditorStyledStringController,
  RichEditorStyledStringOptions,
  ColumnOptions,
  ImageAttachment,
  Button,
  Row,
  Margin,
  Scroller,
  AnimationStatus,
  Stack,
  Alignment,
  Scroll,
  ImageAnimator,
  ForEach,
  ScrollDirection,
  BarState,
  TextAlign,
  Color,
  EdgeEffect,
  RowOptions,
  Button,
  Padding,
  ScrollState,
  Edge,
  Image, ImageError, ImageErrorCallback
} from '@ohos.arkui.component';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage, State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct ImageOnErrorExample {
  @State componentWidthValue: number = 0
  @State componentHeightValue: number = 0
  errorCallback: ImageErrorCallback | undefined = (error: ImageError) => {
    this.componentWidthValue = error.componentWidth
    this.componentHeightValue = error.componentHeight
    console.log('hello ImageErrorCallback error1'+ error.error+ ' a' + error.componentWidth + ' ' + error.componentHeight + ' ' + error.message);
  };
  build() {
    Column({ space: 10 } as ColumnOptions) {
      Text('componentWidth: ' + this.componentWidthValue + ' componentHeight: ' + this.componentHeightValue)
      Text('' + this.componentWidthValue).id('componentWidth')
      Text('' + this.componentHeightValue).id('componentHeight')
      Image('xxx')
        .width(100)
        .height(100)
        // .onError(this.errorCallback)
        .onError((error: ImageError) => {
          console.log('componentWidth = ' + error.componentWidth)
          console.log('componentHeight = ' + error.componentHeight)
          this.componentWidthValue = error.componentWidth
          this.componentHeightValue = error.componentHeight
        })
        .id('image')
    }.width('100%')
    .padding(20)
  }
}