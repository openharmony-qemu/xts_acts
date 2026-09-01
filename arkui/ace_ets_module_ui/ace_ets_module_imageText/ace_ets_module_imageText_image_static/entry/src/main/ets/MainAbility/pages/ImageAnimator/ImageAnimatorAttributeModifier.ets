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
  AnimationStatus,
  FillMode,
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

class ImagesModifier extends BaseImageAnimatorModifier {
}

class StateInitialModifier extends BaseImageAnimatorModifier {
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    super.applyNormalAttribute(instance);
    instance.state(AnimationStatus.Initial);
  }
}

class StateRunningModifier extends BaseImageAnimatorModifier {
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    super.applyNormalAttribute(instance);
    instance.state(AnimationStatus.Running);
  }
}

class Duration2000Modifier extends BaseImageAnimatorModifier {
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    super.applyNormalAttribute(instance);
    instance.duration(2000);
  }
}

class Duration500Modifier extends BaseImageAnimatorModifier {
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    super.applyNormalAttribute(instance);
    instance.duration(500);
  }
}

class ReverseTrueModifier extends BaseImageAnimatorModifier {
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    super.applyNormalAttribute(instance);
    instance.reverse(true);
  }
}

class ReverseFalseModifier extends BaseImageAnimatorModifier {
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    super.applyNormalAttribute(instance);
    instance.reverse(false);
  }
}

class FixedSizeTrueModifier extends BaseImageAnimatorModifier {
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    super.applyNormalAttribute(instance);
    instance.fixedSize(true);
  }
}

class FixedSizeFalseModifier extends BaseImageAnimatorModifier {
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    super.applyNormalAttribute(instance);
    instance.fixedSize(false);
  }
}

class FillModeForwardsModifier extends BaseImageAnimatorModifier {
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    super.applyNormalAttribute(instance);
    instance.fillMode(FillMode.Forwards);
  }
}

class FillModeNoneModifier extends BaseImageAnimatorModifier {
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    super.applyNormalAttribute(instance);
    instance.fillMode(FillMode.None);
  }
}

class Iterations3Modifier extends BaseImageAnimatorModifier {
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    super.applyNormalAttribute(instance);
    instance.iterations(3);
  }
}

class IterationsInfiniteModifier extends BaseImageAnimatorModifier {
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    super.applyNormalAttribute(instance);
    instance.iterations(-1);
  }
}

class MonitorInvisibleAreaTrueModifier extends BaseImageAnimatorModifier {
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    super.applyNormalAttribute(instance);
    instance.monitorInvisibleArea(true);
  }
}

class MonitorInvisibleAreaFalseModifier extends BaseImageAnimatorModifier {
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    super.applyNormalAttribute(instance);
    instance.monitorInvisibleArea(false);
  }
}

@Entry
@Component
struct ImageAnimatorAttributeModifierPage {
  imagesModifier: ImagesModifier = new ImagesModifier();
  stateInitialModifier: StateInitialModifier = new StateInitialModifier();
  stateRunningModifier: StateRunningModifier = new StateRunningModifier();
  duration2000Modifier: Duration2000Modifier = new Duration2000Modifier();
  duration500Modifier: Duration500Modifier = new Duration500Modifier();
  reverseTrueModifier: ReverseTrueModifier = new ReverseTrueModifier();
  reverseFalseModifier: ReverseFalseModifier = new ReverseFalseModifier();
  fixedSizeTrueModifier: FixedSizeTrueModifier = new FixedSizeTrueModifier();
  fixedSizeFalseModifier: FixedSizeFalseModifier = new FixedSizeFalseModifier();
  fillModeForwardsModifier: FillModeForwardsModifier = new FillModeForwardsModifier();
  fillModeNoneModifier: FillModeNoneModifier = new FillModeNoneModifier();
  iterations3Modifier: Iterations3Modifier = new Iterations3Modifier();
  iterationsInfiniteModifier: IterationsInfiniteModifier = new IterationsInfiniteModifier();
  monitorInvisibleAreaTrueModifier: MonitorInvisibleAreaTrueModifier = new MonitorInvisibleAreaTrueModifier();
  monitorInvisibleAreaFalseModifier: MonitorInvisibleAreaFalseModifier = new MonitorInvisibleAreaFalseModifier();

  build() {
    Scroll() {
      Column({ space: 10 } as ColumnOptions) {
        ImageAnimator()
          .id('ia_modifier_images')
          .attributeModifier(this.imagesModifier)
          .width(100)
          .height(100)

        ImageAnimator()
          .id('ia_modifier_state_initial')
          .attributeModifier(this.stateInitialModifier)
          .width(100)
          .height(100)

        ImageAnimator()
          .id('ia_modifier_state_running')
          .attributeModifier(this.stateRunningModifier)
          .width(100)
          .height(100)

        ImageAnimator()
          .id('ia_modifier_duration_2000')
          .attributeModifier(this.duration2000Modifier)
          .width(100)
          .height(100)

        ImageAnimator()
          .id('ia_modifier_duration_500')
          .attributeModifier(this.duration500Modifier)
          .width(100)
          .height(100)

        ImageAnimator()
          .id('ia_modifier_reverse_true')
          .attributeModifier(this.reverseTrueModifier)
          .width(100)
          .height(100)

        ImageAnimator()
          .id('ia_modifier_reverse_false')
          .attributeModifier(this.reverseFalseModifier)
          .width(100)
          .height(100)

        ImageAnimator()
          .id('ia_modifier_fixedsize_true')
          .attributeModifier(this.fixedSizeTrueModifier)
          .width(100)
          .height(100)

        ImageAnimator()
          .id('ia_modifier_fixedsize_false')
          .attributeModifier(this.fixedSizeFalseModifier)
          .width(100)
          .height(100)

        ImageAnimator()
          .id('ia_modifier_fillmode_forwards')
          .attributeModifier(this.fillModeForwardsModifier)
          .width(100)
          .height(100)

        ImageAnimator()
          .id('ia_modifier_fillmode_none')
          .attributeModifier(this.fillModeNoneModifier)
          .width(100)
          .height(100)

        ImageAnimator()
          .id('ia_modifier_iterations_3')
          .attributeModifier(this.iterations3Modifier)
          .width(100)
          .height(100)

        ImageAnimator()
          .id('ia_modifier_iterations_infinite')
          .attributeModifier(this.iterationsInfiniteModifier)
          .width(100)
          .height(100)

        ImageAnimator()
          .id('ia_modifier_monitor_invisible_true')
          .attributeModifier(this.monitorInvisibleAreaTrueModifier)
          .width(100)
          .height(100)

        ImageAnimator()
          .id('ia_modifier_monitor_invisible_false')
          .attributeModifier(this.monitorInvisibleAreaFalseModifier)
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
