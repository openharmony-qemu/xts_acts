/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import {
  Entry,
  Component,
  Row,
  Column,
  Text,
  Image,
  Resource,
  FontWeight,
  ImageCompleteEvent,
  $r,
  ImageOnCompleteCallback
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct image14 {
  @State src: Resource = $r('app.media.icon50_50');
  @State loadingJpgResult: string = 'loading jpg failed'
  @State loadingPngResult: string = 'loading png failed'
  @State loadingBmpResult: string = 'loading bmp failed'
  @State loadingSvgResult: string = 'loading svg failed'
  @State loadingGifResult: string = 'loading gif failed'

  build() {
    Column() {
      Text(this.loadingJpgResult)
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .id('loadingJpg14')

      Image($r('app.media.icon_jpg'))
        .width(50)
        .height(50)
        .borderWidth(1)
        .onComplete((event?: ImageCompleteEvent) => {
          this.loadingJpgResult = 'loading success'
        } as ImageOnCompleteCallback)

      Text(this.loadingPngResult)
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .id('loadingPng14')

      Image($r('app.media.icon_png'))
        .width(50)
        .height(50)
        .borderWidth(1)
        .onComplete((event: ImageCompleteEvent) => {
          this.loadingPngResult = 'loading success'
        } as ImageOnCompleteCallback)

      Text(this.loadingBmpResult)
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .id('loadingBmp14')

      Image($r('app.media.icon_bmp'))
        .width(50)
        .height(50)
        .borderWidth(1)
        .onComplete((event: ImageCompleteEvent) => {
          this.loadingBmpResult = 'loading success'
        } as ImageOnCompleteCallback)

      Text(this.loadingSvgResult)
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .id('loadingSvg14')

      Image($r('app.media.icon_svg'))
        .width(50)
        .height(50)
        .borderWidth(1)
        .onComplete((event: ImageCompleteEvent) => {
          this.loadingSvgResult = 'loading success'
        } as ImageOnCompleteCallback)

      Text(this.loadingGifResult)
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .id('loadingGif14')

      Image($r('app.media.icon_gif'))
        .width(50)
        .height(50)
        .borderWidth(1)
        .onComplete((event: ImageCompleteEvent) => {
          this.loadingGifResult = 'loading success'
        } as ImageOnCompleteCallback)
    }
    .width('100%')
    .height('100%')
  }
}