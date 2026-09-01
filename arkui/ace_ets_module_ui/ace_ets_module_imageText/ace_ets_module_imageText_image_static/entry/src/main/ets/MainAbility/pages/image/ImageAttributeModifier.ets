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
  Entry, Component, Scroll, Column, ColumnOptions,
  Image, ImageAttribute, AttributeModifier,
  ImageFit, ImageRepeat, ImageInterpolation, ImageRenderMode,
  CopyOptions, DynamicRangeMode, ImageRotateOrientation,
  Color, $r, FlexAlign, HorizontalAlign
} from '@ohos.arkui.component'

class AltModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.alt($r('app.media.flower'));
  }
}

class ObjectFitCoverModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.objectFit(ImageFit.Cover);
  }
}
class ObjectFitContainModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.objectFit(ImageFit.Contain);
  }
}

class ObjectRepeatNoRepeatModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.objectRepeat(ImageRepeat.NoRepeat);
  }
}
class ObjectRepeatXYModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.objectRepeat(ImageRepeat.XY);
  }
}

class InterpolationLowModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.interpolation(ImageInterpolation.Low);
  }
}
class InterpolationHighModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.interpolation(ImageInterpolation.High);
  }
}

class RenderModeOriginalModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.renderMode(ImageRenderMode.Original);
  }
}
class RenderModeTemplateModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.renderMode(ImageRenderMode.Template);
  }
}

class MatchTextDirectionTrueModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.matchTextDirection(true);
  }
}
class MatchTextDirectionFalseModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.matchTextDirection(false);
  }
}

class FitOriginalSizeTrueModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.fitOriginalSize(true);
  }
}
class FitOriginalSizeFalseModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.fitOriginalSize(false);
  }
}

class FillColorRedModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.fillColor(Color.Red);
  }
}
class FillColorBlueModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.fillColor(Color.Blue);
  }
}

class AutoResizeTrueModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.autoResize(true);
  }
}
class AutoResizeFalseModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.autoResize(false);
  }
}

class SyncLoadTrueModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.syncLoad(true);
  }
}
class SyncLoadFalseModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.syncLoad(false);
  }
}

class CopyOptionNoneModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.copyOption(CopyOptions.None);
  }
}
class CopyOptionLocalModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.copyOption(CopyOptions.LocalDevice);
  }
}

class DraggableTrueModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.draggable(true);
  }
}
class DraggableFalseModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.draggable(false);
  }
}

class EnableAnalyzerTrueModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.enableAnalyzer(true);
  }
}
class EnableAnalyzerFalseModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.enableAnalyzer(false);
  }
}

class PrivacySensitiveTrueModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.privacySensitive(true);
  }
}
class PrivacySensitiveFalseModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.privacySensitive(false);
  }
}

class DynamicRangeStandardModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.dynamicRangeMode(DynamicRangeMode.STANDARD);
  }
}
class DynamicRangeHighModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.dynamicRangeMode(DynamicRangeMode.HIGH);
  }
}

class OrientationUpModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.orientation(ImageRotateOrientation.UP);
  }
}
class OrientationLeftModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.orientation(ImageRotateOrientation.LEFT);
  }
}

class HdrBrightness05Modifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.hdrBrightness(0.5);
  }
}
class HdrBrightness10Modifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.hdrBrightness(1.0);
  }
}

class SupportSvg2TrueModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.supportSvg2(true);
  }
}
class SupportSvg2FalseModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.supportSvg2(false);
  }
}

class AntialiasedTrueModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.antialiased(true);
  }
}
class AntialiasedFalseModifier implements AttributeModifier<ImageAttribute> {
  applyNormalAttribute(instance: ImageAttribute): void {
    instance.antialiased(false);
  }
}

@Entry
@Component
struct ImageAttributeModifierPage {
  altModifier: AltModifier = new AltModifier();
  objectFitCoverModifier: ObjectFitCoverModifier = new ObjectFitCoverModifier();
  objectFitContainModifier: ObjectFitContainModifier = new ObjectFitContainModifier();
  objectRepeatNoRepeatModifier: ObjectRepeatNoRepeatModifier = new ObjectRepeatNoRepeatModifier();
  objectRepeatXYModifier: ObjectRepeatXYModifier = new ObjectRepeatXYModifier();
  interpolationLowModifier: InterpolationLowModifier = new InterpolationLowModifier();
  interpolationHighModifier: InterpolationHighModifier = new InterpolationHighModifier();
  renderModeOriginalModifier: RenderModeOriginalModifier = new RenderModeOriginalModifier();
  renderModeTemplateModifier: RenderModeTemplateModifier = new RenderModeTemplateModifier();
  matchTextDirectionTrueModifier: MatchTextDirectionTrueModifier = new MatchTextDirectionTrueModifier();
  matchTextDirectionFalseModifier: MatchTextDirectionFalseModifier = new MatchTextDirectionFalseModifier();
  fitOriginalSizeTrueModifier: FitOriginalSizeTrueModifier = new FitOriginalSizeTrueModifier();
  fitOriginalSizeFalseModifier: FitOriginalSizeFalseModifier = new FitOriginalSizeFalseModifier();
  fillColorRedModifier: FillColorRedModifier = new FillColorRedModifier();
  fillColorBlueModifier: FillColorBlueModifier = new FillColorBlueModifier();
  autoResizeTrueModifier: AutoResizeTrueModifier = new AutoResizeTrueModifier();
  autoResizeFalseModifier: AutoResizeFalseModifier = new AutoResizeFalseModifier();
  syncLoadTrueModifier: SyncLoadTrueModifier = new SyncLoadTrueModifier();
  syncLoadFalseModifier: SyncLoadFalseModifier = new SyncLoadFalseModifier();
  copyOptionNoneModifier: CopyOptionNoneModifier = new CopyOptionNoneModifier();
  copyOptionLocalModifier: CopyOptionLocalModifier = new CopyOptionLocalModifier();
  draggableTrueModifier: DraggableTrueModifier = new DraggableTrueModifier();
  draggableFalseModifier: DraggableFalseModifier = new DraggableFalseModifier();
  enableAnalyzerTrueModifier: EnableAnalyzerTrueModifier = new EnableAnalyzerTrueModifier();
  enableAnalyzerFalseModifier: EnableAnalyzerFalseModifier = new EnableAnalyzerFalseModifier();
  privacySensitiveTrueModifier: PrivacySensitiveTrueModifier = new PrivacySensitiveTrueModifier();
  privacySensitiveFalseModifier: PrivacySensitiveFalseModifier = new PrivacySensitiveFalseModifier();
  dynamicRangeStandardModifier: DynamicRangeStandardModifier = new DynamicRangeStandardModifier();
  dynamicRangeHighModifier: DynamicRangeHighModifier = new DynamicRangeHighModifier();
  orientationUpModifier: OrientationUpModifier = new OrientationUpModifier();
  orientationLeftModifier: OrientationLeftModifier = new OrientationLeftModifier();
  hdrBrightness05Modifier: HdrBrightness05Modifier = new HdrBrightness05Modifier();
  hdrBrightness10Modifier: HdrBrightness10Modifier = new HdrBrightness10Modifier();
  supportSvg2TrueModifier: SupportSvg2TrueModifier = new SupportSvg2TrueModifier();
  supportSvg2FalseModifier: SupportSvg2FalseModifier = new SupportSvg2FalseModifier();
  antialiasedTrueModifier: AntialiasedTrueModifier = new AntialiasedTrueModifier();
  antialiasedFalseModifier: AntialiasedFalseModifier = new AntialiasedFalseModifier();

  build() {
    Scroll() {
      Column({space:10} as ColumnOptions) {
        Image($r('app.media.startIcon'))
          .id('img_modifier_alt').attributeModifier(this.altModifier).width(100).height(100)

        Image($r('app.media.startIcon'))
          .id('img_modifier_objectfit_cover').attributeModifier(this.objectFitCoverModifier).width(100).height(100)
        Image($r('app.media.startIcon'))
          .id('img_modifier_objectfit_contain').attributeModifier(this.objectFitContainModifier).width(100).height(100)

        Image($r('app.media.startIcon'))
          .id('img_modifier_objectrepeat_norepeat').attributeModifier(this.objectRepeatNoRepeatModifier).width(100).height(100)
        Image($r('app.media.startIcon'))
          .id('img_modifier_objectrepeat_xy').attributeModifier(this.objectRepeatXYModifier).width(100).height(100)

        Image($r('app.media.startIcon'))
          .id('img_modifier_interpolation_low').attributeModifier(this.interpolationLowModifier).width(100).height(100)
        Image($r('app.media.startIcon'))
          .id('img_modifier_interpolation_high').attributeModifier(this.interpolationHighModifier).width(100).height(100)

        Image($r('app.media.startIcon'))
          .id('img_modifier_rendermode_original').attributeModifier(this.renderModeOriginalModifier).width(100).height(100)
        Image($r('app.media.startIcon'))
          .id('img_modifier_rendermode_template').attributeModifier(this.renderModeTemplateModifier).width(100).height(100)

        Image($r('app.media.startIcon'))
          .id('img_modifier_matchtextdirection_true').attributeModifier(this.matchTextDirectionTrueModifier).width(100).height(100)
        Image($r('app.media.startIcon'))
          .id('img_modifier_matchtextdirection_false').attributeModifier(this.matchTextDirectionFalseModifier).width(100).height(100)

        Image($r('app.media.startIcon'))
          .id('img_modifier_fitoriginalsize_true').attributeModifier(this.fitOriginalSizeTrueModifier).width(100).height(100)
        Image($r('app.media.startIcon'))
          .id('img_modifier_fitoriginalsize_false').attributeModifier(this.fitOriginalSizeFalseModifier).width(100).height(100)

        Image($r('app.media.startIcon'))
          .id('img_modifier_fillcolor_red').attributeModifier(this.fillColorRedModifier).width(100).height(100)
        Image($r('app.media.startIcon'))
          .id('img_modifier_fillcolor_blue').attributeModifier(this.fillColorBlueModifier).width(100).height(100)

        Image($r('app.media.startIcon'))
          .id('img_modifier_autoresize_true').attributeModifier(this.autoResizeTrueModifier).width(100).height(100)
        Image($r('app.media.startIcon'))
          .id('img_modifier_autoresize_false').attributeModifier(this.autoResizeFalseModifier).width(100).height(100)

        Image($r('app.media.startIcon'))
          .id('img_modifier_syncload_true').attributeModifier(this.syncLoadTrueModifier).width(100).height(100)
        Image($r('app.media.startIcon'))
          .id('img_modifier_syncload_false').attributeModifier(this.syncLoadFalseModifier).width(100).height(100)

        Image($r('app.media.startIcon'))
          .id('img_modifier_copyoption_none').attributeModifier(this.copyOptionNoneModifier).width(100).height(100)
        Image($r('app.media.startIcon'))
          .id('img_modifier_copyoption_local').attributeModifier(this.copyOptionLocalModifier).width(100).height(100)

        Image($r('app.media.startIcon'))
          .id('img_modifier_draggable_true').attributeModifier(this.draggableTrueModifier).width(100).height(100)
        Image($r('app.media.startIcon'))
          .id('img_modifier_draggable_false').attributeModifier(this.draggableFalseModifier).width(100).height(100)

        Image($r('app.media.startIcon'))
          .id('img_modifier_enableanalyzer_true').attributeModifier(this.enableAnalyzerTrueModifier).width(100).height(100)
        Image($r('app.media.startIcon'))
          .id('img_modifier_enableanalyzer_false').attributeModifier(this.enableAnalyzerFalseModifier).width(100).height(100)

        Image($r('app.media.startIcon'))
          .id('img_modifier_privacysensitive_true').attributeModifier(this.privacySensitiveTrueModifier).width(100).height(100)
        Image($r('app.media.startIcon'))
          .id('img_modifier_privacysensitive_false').attributeModifier(this.privacySensitiveFalseModifier).width(100).height(100)

        Image($r('app.media.startIcon'))
          .id('img_modifier_dynamicrange_standard').attributeModifier(this.dynamicRangeStandardModifier).width(100).height(100)
        Image($r('app.media.startIcon'))
          .id('img_modifier_dynamicrange_high').attributeModifier(this.dynamicRangeHighModifier).width(100).height(100)

        Image($r('app.media.startIcon'))
          .id('img_modifier_orientation_up').attributeModifier(this.orientationUpModifier).width(100).height(100)
        Image($r('app.media.startIcon'))
          .id('img_modifier_orientation_left').attributeModifier(this.orientationLeftModifier).width(100).height(100)

        Image($r('app.media.startIcon'))
          .id('img_modifier_hdrbrightness_05').attributeModifier(this.hdrBrightness05Modifier).width(100).height(100)
        Image($r('app.media.startIcon'))
          .id('img_modifier_hdrbrightness_10').attributeModifier(this.hdrBrightness10Modifier).width(100).height(100)

        Image($r('app.media.startIcon'))
          .id('img_modifier_supportsvg2_true').attributeModifier(this.supportSvg2TrueModifier).width(100).height(100)
        Image($r('app.media.startIcon'))
          .id('img_modifier_supportsvg2_false').attributeModifier(this.supportSvg2FalseModifier).width(100).height(100)

        Image($r('app.media.startIcon'))
          .id('img_modifier_antialiased_true').attributeModifier(this.antialiasedTrueModifier).width(100).height(100)
        Image($r('app.media.startIcon'))
          .id('img_modifier_antialiased_false').attributeModifier(this.antialiasedFalseModifier).width(100).height(100)
      }
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .height('100%')
  }
}
