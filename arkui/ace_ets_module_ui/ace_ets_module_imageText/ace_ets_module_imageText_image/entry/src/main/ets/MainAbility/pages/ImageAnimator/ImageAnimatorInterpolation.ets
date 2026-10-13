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

@Entry
@Component
struct ImageAnimatorInterpolationPage {
  private images: Array<ImageFrameInfo> = [
    {
      src: $rawfile('img1.png'),
      width: 20,
      height: 20,
      top: 20,
      left: 20
    },
    {
      src: $rawfile('img2.png'),
      width: 30,
      height: 20,
      top: 20,
      left: 20
    },
    {
      src: $rawfile('img3.png'),
      width: 20,
      height: 20,
      top: 20,
      left: 20
    }
  ];

  build() {
    Scroll() {
      Column({ space: 10 }) {
        // 默认值基准组件：未设置 interpolation 属性，默认值为 ImageInterpolation.Low
        ImageAnimator()
          .images(this.images)
          .width('100%')
          .height('10%')
          .key('imageAnimatorDefault')

        // 参数测试：ImageInterpolation.None
        ImageAnimator()
          .images(this.images)
          .interpolation(ImageInterpolation.None)
          .width('100%')
          .height('10%')
          .key('imageAnimatorNone')

        // 参数测试：ImageInterpolation.Low
        ImageAnimator()
          .images(this.images)
          .interpolation(ImageInterpolation.Low)
          .width('100%')
          .height('10%')
          .key('imageAnimatorLow')

        // 参数测试：ImageInterpolation.Medium
        ImageAnimator()
          .images(this.images)
          .interpolation(ImageInterpolation.Medium)
          .width('100%')
          .height('10%')
          .key('imageAnimatorMedium')

        // 参数测试：ImageInterpolation.High
        ImageAnimator()
          .images(this.images)
          .interpolation(ImageInterpolation.High)
          .width('100%')
          .height('10%')
          .key('imageAnimatorHigh')

        // 异常值：非法枚举数字 99
        ImageAnimator()
          .images(this.images)
          .interpolation(99 as ImageInterpolation)
          .width('100%')
          .height('10%')
          .key('imageAnimatorInvalidEnum')

        // 异常值：负数 -1
        ImageAnimator()
          .images(this.images)
          .interpolation(-1 as ImageInterpolation)
          .width('100%')
          .height('10%')
          .key('imageAnimatorInvalidNegative')

        // 异常值：undefined
        ImageAnimator()
          .images(this.images)
          .interpolation(undefined)
          .width('100%')
          .height('10%')
          .key('imageAnimatorUndefined')
      }
      .padding(5)
      .backgroundColor('#F5F5F5')
    }
    .height('100%')
    .width('100%')
  }
}
