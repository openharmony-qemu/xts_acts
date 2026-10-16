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
  ImageAnimatorAttribute,
  AttributeModifier,
  ImageInterpolation,
  $r,
  FlexAlign,
  HorizontalAlign
} from '@ohos.arkui.component'

class BaseImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    instance.images([
      { src: $r('app.media.startIcon') },
      { src: $r('app.media.flower') },
      { src: $r('app.media.landscape') }
    ]);
  }
}

// 默认值组件：不设置 interpolation，验证默认值为 ImageInterpolation.Low
class DefaultModifier extends BaseImageAnimatorModifier {
}

class InterpolationNoneModifier extends BaseImageAnimatorModifier {
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    super.applyNormalAttribute(instance);
    instance.interpolation(ImageInterpolation.None);
  }
}

class InterpolationLowModifier extends BaseImageAnimatorModifier {
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    super.applyNormalAttribute(instance);
    instance.interpolation(ImageInterpolation.Low);
  }
}

class InterpolationMediumModifier extends BaseImageAnimatorModifier {
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    super.applyNormalAttribute(instance);
    instance.interpolation(ImageInterpolation.Medium);
  }
}

class InterpolationHighModifier extends BaseImageAnimatorModifier {
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    super.applyNormalAttribute(instance);
    instance.interpolation(ImageInterpolation.High);
  }
}

// 异常值：undefined
class InterpolationUndefinedModifier extends BaseImageAnimatorModifier {
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    super.applyNormalAttribute(instance);
    instance.interpolation(undefined);
  }
}

@Entry
@Component
struct ImageAnimatorInterpolationModifierPage {
  defaultModifier: DefaultModifier = new DefaultModifier();
  interpolationNoneModifier: InterpolationNoneModifier = new InterpolationNoneModifier();
  interpolationLowModifier: InterpolationLowModifier = new InterpolationLowModifier();
  interpolationMediumModifier: InterpolationMediumModifier = new InterpolationMediumModifier();
  interpolationHighModifier: InterpolationHighModifier = new InterpolationHighModifier();
  interpolationUndefinedModifier: InterpolationUndefinedModifier = new InterpolationUndefinedModifier();

  build() {
    Scroll() {
      Column({ space: 10 } as ColumnOptions) {
        ImageAnimator()
          .id('ia_interpolation_default')
          .attributeModifier(this.defaultModifier)
          .width(100)
          .height(100)

        ImageAnimator()
          .id('ia_interpolation_none')
          .attributeModifier(this.interpolationNoneModifier)
          .width(100)
          .height(100)

        ImageAnimator()
          .id('ia_interpolation_low')
          .attributeModifier(this.interpolationLowModifier)
          .width(100)
          .height(100)

        ImageAnimator()
          .id('ia_interpolation_medium')
          .attributeModifier(this.interpolationMediumModifier)
          .width(100)
          .height(100)

        ImageAnimator()
          .id('ia_interpolation_high')
          .attributeModifier(this.interpolationHighModifier)
          .width(100)
          .height(100)

        ImageAnimator()
          .id('ia_interpolation_undefined')
          .attributeModifier(this.interpolationUndefinedModifier)
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
