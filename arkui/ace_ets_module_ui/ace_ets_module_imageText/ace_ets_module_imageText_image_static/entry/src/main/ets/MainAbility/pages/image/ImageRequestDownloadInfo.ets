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
  FontWeight,
  FlexAlign,
  HorizontalAlign,
  Scroll,
  ImageError
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct ImageRequestDownloadInfo {
  @State onErrorTriggered1: string = 'not_triggered'
  @State downloadInfoStr1: string = 'null'
  @State errorCode1: string = ''
  @State componentWidth1: string = ''
  @State componentHeight1: string = ''
  @State message1: string = ''

  @State onErrorTriggered2: string = 'not_triggered'
  @State downloadInfoStr2: string = 'null'

  @State onErrorTriggered3: string = 'not_triggered'

  @State onErrorTriggered5: string = 'not_triggered'
  @State downloadInfoStr5: string = 'null'
  @State message5: string = ''

  @State onErrorTriggered6: string = 'not_triggered'
  @State downloadInfoStr6: string = 'null'
  @State componentWidth6: string = ''
  @State componentHeight6: string = ''

  build() {
    Scroll() {
      Column() {
        Text('Image RequestDownloadInfo Test')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 10 })

        Row() {
          Image('https://www.example.com/nonexistent_image_test.png')
            .width(100)
            .height(100)
            .onError((error: ImageError) => {
              this.onErrorTriggered1 = 'triggered'
              if (error.downloadInfo) {
                this.downloadInfoStr1 = 'not_null'
              } else {
                this.downloadInfoStr1 = 'null'
              }
              if (error.error) {
                this.errorCode1 = `${error.error.code}`
              } else {
                this.errorCode1 = '-1'
              }
              this.componentWidth1 = `${error.componentWidth}`
              this.componentHeight1 = `${error.componentHeight}`
              this.message1 = error.message
            })
            .key('downloadInfoImage1')
        }.width('80%')

        Text(this.onErrorTriggered1)
          .key('onErrorTriggered1Text')
        Text(this.downloadInfoStr1)
          .key('downloadInfoStr1Text')
        Text(this.errorCode1)
          .key('errorCode1Text')
        Text(this.componentWidth1)
          .key('componentWidth1Text')
        Text(this.componentHeight1)
          .key('componentHeight1Text')
        Text(this.message1)
          .key('message1Text')

        Row() {
          Image('common/nonexistent_local_image.png')
            .width(100)
            .height(100)
            .onError((error: ImageError) => {
              this.onErrorTriggered2 = 'triggered'
              if (error.downloadInfo) {
                this.downloadInfoStr2 = 'not_null'
              } else {
                this.downloadInfoStr2 = 'null'
              }
            })
            .key('downloadInfoImage2')
        }.width('80%')

        Text(this.onErrorTriggered2)
          .key('onErrorTriggered2Text')
        Text(this.downloadInfoStr2)
          .key('downloadInfoStr2Text')

        Row() {
          Image($r('app.media.startIcon'))
            .width(100)
            .height(100)
            .onError((error: ImageError) => {
              this.onErrorTriggered3 = 'triggered'
            })
            .key('downloadInfoImage3')
        }.width('80%')

        Text(this.onErrorTriggered3)
          .key('onErrorTriggered3Text')

        Row() {
          Image('https://www.example.com/nonexistent2_test.png')
            .width(100)
            .height(100)
            .onError(undefined)
            .key('downloadInfoImage4')
        }.width('80%')

        Row() {
          Image('https://www.example.com/nonexistent3_test.png')
            .width(100)
            .height(100)
            .onError((error: ImageError) => {
              this.onErrorTriggered5 = 'triggered'
              if (error.downloadInfo) {
                this.downloadInfoStr5 = 'not_null'
              } else {
                this.downloadInfoStr5 = 'null'
              }
              this.message5 = error.message
            })
            .key('downloadInfoImage5')
        }.width('80%')

        Text(this.onErrorTriggered5)
          .key('onErrorTriggered5Text')
        Text(this.downloadInfoStr5)
          .key('downloadInfoStr5Text')
        Text(this.message5)
          .key('message5Text')

        Row() {
          Image('https://www.example.com/nonexistent4_test.png')
            .width(80)
            .height(60)
            .onError((error: ImageError) => {
              this.onErrorTriggered6 = 'triggered'
              if (error.downloadInfo) {
                this.downloadInfoStr6 = 'not_null'
              } else {
                this.downloadInfoStr6 = 'null'
              }
              this.componentWidth6 = `${error.componentWidth}`
              this.componentHeight6 = `${error.componentHeight}`
            })
            .key('downloadInfoImage6')
        }.width('80%')

        Text(this.onErrorTriggered6)
          .key('onErrorTriggered6Text')
        Text(this.downloadInfoStr6)
          .key('downloadInfoStr6Text')
        Text(this.componentWidth6)
          .key('componentWidth6Text')
        Text(this.componentHeight6)
          .key('componentHeight6Text')
      }
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Center)
    }.width('100%').height('100%')
  }
}
