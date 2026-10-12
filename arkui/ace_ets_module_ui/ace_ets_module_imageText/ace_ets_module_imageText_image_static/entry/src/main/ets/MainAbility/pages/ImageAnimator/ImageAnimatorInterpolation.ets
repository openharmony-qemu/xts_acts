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
  ColumnOptions,
  ImageAnimator,
  ImageInterpolation,
  $r,
  FlexAlign,
  HorizontalAlign
} from '@ohos.arkui.component'

@Entry
@Component
struct ImageAnimatorInterpolationPage {
  build() {
    Scroll() {
      Column({ space: 10 } as ColumnOptions) {
        // 默认值组件：不设置 interpolation，验证默认值为 ImageInterpolation.Low
        ImageAnimator()
          .images([
            { src: $r('app.media.startIcon') },
            { src: $r('app.media.flower') },
            { src: $r('app.media.landscape') }
          ])
          .id('ia_interpolation_default')
          .width(100)
          .height(100)

        // 参数测试：ImageInterpolation.None
        ImageAnimator()
          .images([
            { src: $r('app.media.startIcon') },
            { src: $r('app.media.flower') },
            { src: $r('app.media.landscape') }
          ])
          .interpolation(ImageInterpolation.None)
          .id('ia_interpolation_none')
          .width(100)
          .height(100)

        // 参数测试：ImageInterpolation.Low
        ImageAnimator()
          .images([
            { src: $r('app.media.startIcon') },
            { src: $r('app.media.flower') },
            { src: $r('app.media.landscape') }
          ])
          .interpolation(ImageInterpolation.Low)
          .id('ia_interpolation_low')
          .width(100)
          .height(100)

        // 参数测试：ImageInterpolation.Medium
        ImageAnimator()
          .images([
            { src: $r('app.media.startIcon') },
            { src: $r('app.media.flower') },
            { src: $r('app.media.landscape') }
          ])
          .interpolation(ImageInterpolation.Medium)
          .id('ia_interpolation_medium')
          .width(100)
          .height(100)

        // 参数测试：ImageInterpolation.High
        ImageAnimator()
          .images([
            { src: $r('app.media.startIcon') },
            { src: $r('app.media.flower') },
            { src: $r('app.media.landscape') }
          ])
          .interpolation(ImageInterpolation.High)
          .id('ia_interpolation_high')
          .width(100)
          .height(100)

        // 异常值：非法枚举数字 99
        ImageAnimator()
          .images([
            { src: $r('app.media.startIcon') },
            { src: $r('app.media.flower') },
            { src: $r('app.media.landscape') }
          ])
          .interpolation(99 as ImageInterpolation)
          .id('ia_interpolation_invalid_enum')
          .width(100)
          .height(100)

        // 异常值：负数 -1
        ImageAnimator()
          .images([
            { src: $r('app.media.startIcon') },
            { src: $r('app.media.flower') },
            { src: $r('app.media.landscape') }
          ])
          .interpolation(-1 as ImageInterpolation)
          .id('ia_interpolation_invalid_negative')
          .width(100)
          .height(100)

        // 异常值：undefined
        ImageAnimator()
          .images([
            { src: $r('app.media.startIcon') },
            { src: $r('app.media.flower') },
            { src: $r('app.media.landscape') }
          ])
          .interpolation(undefined as ImageInterpolation)
          .id('ia_interpolation_undefined')
          .width(100)
          .height(100)

        // 异常值：null
        ImageAnimator()
          .images([
            { src: $r('app.media.startIcon') },
            { src: $r('app.media.flower') },
            { src: $r('app.media.landscape') }
          ])
          .interpolation(null as ImageInterpolation)
          .id('ia_interpolation_null')
          .width(100)
          .height(100)
      }
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .height('100%')
  }
}
