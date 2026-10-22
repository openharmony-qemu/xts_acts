'use static';
/**
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
  Component,
  Scroll,
  Column,
  Row,
  Text,
  ImageAnimator,
  ImageInterpolation,
  $r,
  FontWeight,
  FlexAlign,
  HorizontalAlign
} from '@ohos.arkui.component'

@Entry
@Component
struct ImageAnimatorInterpolationPage {
  build() {
    Scroll() {
      Column() {
        Text('ImageAnimator Interpolation Test')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 10 })

        Row() {
          ImageAnimator()
            .images([
              { src: $r('app.media.startIcon') },
              { src: $r('app.media.flower') },
              { src: $r('app.media.landscape') }
            ])
            .interpolation(ImageInterpolation.None)
            .width(100)
            .height(100)
            .key('ia_interpolation_none')
        }.width('80%')

        Row() {
          ImageAnimator()
            .images([
              { src: $r('app.media.startIcon') },
              { src: $r('app.media.flower') },
              { src: $r('app.media.landscape') }
            ])
            .interpolation(ImageInterpolation.Low)
            .width(100)
            .height(100)
            .key('ia_interpolation_low')
        }.width('80%')

        Row() {
          ImageAnimator()
            .images([
              { src: $r('app.media.startIcon') },
              { src: $r('app.media.flower') },
              { src: $r('app.media.landscape') }
            ])
            .interpolation(ImageInterpolation.Medium)
            .width(100)
            .height(100)
            .key('ia_interpolation_medium')
        }.width('80%')

        Row() {
          ImageAnimator()
            .images([
              { src: $r('app.media.startIcon') },
              { src: $r('app.media.flower') },
              { src: $r('app.media.landscape') }
            ])
            .interpolation(ImageInterpolation.High)
            .width(100)
            .height(100)
            .key('ia_interpolation_high')
        }.width('80%')

        Row() {
          ImageAnimator()
            .images([
              { src: $r('app.media.startIcon') },
              { src: $r('app.media.flower') },
              { src: $r('app.media.landscape') }
            ])
            .width(100)
            .height(100)
            .key('ia_interpolation_default')
        }.width('80%')

        Row() {
          ImageAnimator()
            .images([
              { src: $r('app.media.startIcon') },
              { src: $r('app.media.flower') },
              { src: $r('app.media.landscape') }
            ])
            .interpolation(undefined)
            .width(100)
            .height(100)
            .key('ia_interpolation_undefined')
        }.width('80%')
      }
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .height('100%')
  }
}
