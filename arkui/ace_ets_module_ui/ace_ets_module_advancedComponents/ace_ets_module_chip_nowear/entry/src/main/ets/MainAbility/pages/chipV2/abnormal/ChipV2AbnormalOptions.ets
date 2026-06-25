/*
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
  ChipV2,
  ChipV2Options,
  ChipV2Label,
} from '@kit.ArkUI';

@Entry
@ComponentV2
struct ChipV2AbnormalOptions {
  private lbl(text: string): ChipV2Label {
    return new ChipV2Label({ text: text });
  }

  build() {
    Scroll() {
      Column({ space: 8 }) {
        ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('prefixIcon') }) })
          .id('abn_prefixIcon_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('prefixIcon'),
            prefixIcon: undefined,
          })
        }).id('abn_prefixIcon_u')

        ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('suffixIcon') }) })
          .id('abn_suffixIcon_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('suffixIcon'),
            suffixIcon: undefined,
          })
        }).id('abn_suffixIcon_u')

        ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('allowClose') }) })
          .id('abn_allowClose_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('allowClose'),
            allowClose: undefined,
          })
        }).id('abn_allowClose_u')

        ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('closeIcon') }) })
          .id('abn_closeIcon_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('closeIcon'),
            closeIcon: undefined,
          })
        }).id('abn_closeIcon_u')

        ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('enabled') }) })
          .id('abn_enabled_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('enabled'),
            enabled: undefined,
          })
        }).id('abn_enabled_u')

        ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('activated') }) })
          .id('abn_activated_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('activated'),
            activated: undefined,
          })
        }).id('abn_activated_u')

        ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('backgroundColor') }) })
          .id('abn_backgroundColor_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('backgroundColor'),
            backgroundColor: undefined,
          })
        }).id('abn_backgroundColor_u')

        ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('activatedBgColor') }) })
          .id('abn_activatedBgColor_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('activatedBgColor'),
            activatedBackgroundColor: undefined,
          })
        }).id('abn_activatedBgColor_u')

        ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('borderRadius') }) })
          .id('abn_borderRadius_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('borderRadius'),
            borderRadius: undefined,
          })
        }).id('abn_borderRadius_u')

        ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('size') }) })
          .id('abn_size_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('size'),
            size: undefined,
          })
        }).id('abn_size_u')

        ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('direction') }) })
          .id('abn_direction_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('direction'),
            direction: undefined,
          })
        }).id('abn_direction_u')

        ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('a11yDesc') }) })
          .id('abn_a11yDesc_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('a11yDesc'),
            accessibilityDescription: undefined,
          })
        }).id('abn_a11yDesc_u')

        ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('a11yLevel') }) })
          .id('abn_a11yLevel_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('a11yLevel'),
            accessibilityLevel: undefined,
          })
        }).id('abn_a11yLevel_u')

        ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('a11ySelType') }) })
          .id('abn_a11ySelType_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('a11ySelType'),
            accessibilitySelectedType: undefined,
          })
        }).id('abn_a11ySelType_u')

        ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('maxFontScale') }) })
          .id('abn_maxFontScale_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('maxFontScale'),
            maxFontScale: undefined,
          })
        }).id('abn_maxFontScale_u')

        ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('minFontScale') }) })
          .id('abn_minFontScale_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('minFontScale'),
            minFontScale: undefined,
          })
        }).id('abn_minFontScale_u')

        ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('padding') }) })
          .id('abn_padding_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('padding'),
            padding: undefined,
          })
        }).id('abn_padding_u')

        ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('fontSize') }) })
          .id('abn_fontSize_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('fontSize'),
            fontSize: undefined,
          })
        }).id('abn_fontSize_u')

        ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('actBgSysMaterial') }) })
          .id('abn_actBgSysMaterial_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('actBgSysMaterial'),
            activatedBackgroundSystemMaterial: undefined,
          })
        }).id('abn_actBgSysMaterial_u')

        ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('onClose') }) })
          .id('abn_onClose_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('onClose'),
            onClose: undefined,
          })
        }).id('abn_onClose_u')

        ChipV2({ chipV2Options: new ChipV2Options({ label: this.lbl('onClicked') }) })
          .id('abn_onClicked_d')
        ChipV2({
          chipV2Options: new ChipV2Options({
            label: this.lbl('onClicked'),
            onClicked: undefined,
          })
        }).id('abn_onClicked_u')
      }
      .width('100%')
      .padding(12)
    }
    .width('100%')
    .height('100%')
  }
}
