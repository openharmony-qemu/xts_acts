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
import { Entry, Column, Row, ComponentV2, Color, $r, ColumnOptions, Direction, Button } from '@ohos.arkui.component';
import { AppStorage, Local } from '@ohos.arkui.stateManagement';
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';
import {
  ChipV2,
  ChipV2Size,
  ChipV2PrefixImageIcon,
  ChipV2SuffixImageIcon,
  ChipV2Options,
  ChipV2Label,
  ChipV2PrefixSymbolIcon,
  ChipV2PrefixImageIconConfig,
  ChipV2SuffixImageIconConfig,
  ChipV2ImageIconConfig,
  ChipV2LabelConfig,
  ChipV2PrefixSymbolIconConfig,
  ColorMetrics,
  SizeT,
  LengthMetrics
} from '@kit.ArkUI';

@Entry
@ComponentV2
struct ChipV2PrefixIconPage {
  @Local isActivated: boolean = AppStorage.get<boolean>('chipV2PrefixIconActivated') as boolean;

  build() {
    Column({ space: 5 } as ColumnOptions) {
      ChipV2({
        chipV2Options: new ChipV2Options({
          prefixIcon: new ChipV2PrefixSymbolIcon({
            normal: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16).fontColor([Color.Green]),
            activated: new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontSize(16).fontColor([Color.Red]),
          }) as ChipV2PrefixSymbolIcon,
          label: new ChipV2Label({
            text: '操作块1',
            fontSize: LengthMetrics.fp(12),
            fontColor: ColorMetrics.resourceColor(Color.Blue),
          }),
          activated: this.isActivated,
        })
      })

      ChipV2({
        chipV2Options: new ChipV2Options({
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('sys.media.ohos_ic_public_cut'),
            size: { width: LengthMetrics.vp(16), height: LengthMetrics.vp(16) } as SizeT<LengthMetrics>,
            fillColor: ColorMetrics.resourceColor(Color.Pink),
            activatedFillColor: ColorMetrics.resourceColor(Color.Red)
          }) as ChipV2PrefixImageIcon,
          label: new ChipV2Label({
            text: '操作块2',
            fontSize: LengthMetrics.fp(12),
            fontColor: ColorMetrics.resourceColor(Color.Blue),
          }),
          activated: this.isActivated,
        })
      })

      ChipV2({
        chipV2Options: new ChipV2Options({
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('sys.media.ohos_ic_public_cut'),
            size: { width: LengthMetrics.vp(16), height: LengthMetrics.vp(16) } as SizeT<LengthMetrics>,
            fillColor: ColorMetrics.resourceColor('#FFFFC0CB'),
            activatedFillColor: ColorMetrics.resourceColor('#FFFF0000'),
          }) as ChipV2PrefixImageIcon,
          label: new ChipV2Label({
            text: '操作块3',
            fontSize: LengthMetrics.fp(12),
            fontColor: ColorMetrics.resourceColor(Color.Blue),
          }),
          activated: this.isActivated,
        })
      })

      ChipV2({
        chipV2Options: new ChipV2Options({
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('sys.media.ohos_ic_public_cut'),
            size: { width: LengthMetrics.vp(16), height: LengthMetrics.vp(16) } as SizeT<LengthMetrics>,
            fillColor: ColorMetrics.resourceColor(0xFFC0CB),
            activatedFillColor: ColorMetrics.resourceColor(0xFF0000)
          }) as ChipV2PrefixImageIcon,
          label: new ChipV2Label({
            text: '操作块4',
            fontSize: LengthMetrics.fp(12),
            fontColor: ColorMetrics.resourceColor(Color.Blue),
          }),
          activated: this.isActivated,
        })
      })

      ChipV2({
        chipV2Options: new ChipV2Options({
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('sys.media.ohos_ic_public_cut'),
            size: {
              width: LengthMetrics.resource($r('app.float.icon_size')),
              height: LengthMetrics.resource($r('app.float.icon_size'))
            },
            fillColor: ColorMetrics.resourceColor($r('sys.color.chip_usually_icon_color')),
            activatedFillColor: ColorMetrics.resourceColor($r('sys.color.chip_active_icon_color'))
          }) as ChipV2PrefixImageIcon,
          label: new ChipV2Label({
            text: '操作块5',
            fontSize: LengthMetrics.fp(12),
            fontColor: ColorMetrics.resourceColor(Color.Blue),
          }),
          activated: this.isActivated,
        })
      })

      ChipV2({
        chipV2Options: new ChipV2Options({
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('sys.media.ohos_ic_public_cut'),
            size: undefined,
            fillColor: undefined,
            activatedFillColor: undefined
          }) as ChipV2PrefixImageIcon,
          label: new ChipV2Label({
            text: '操作块6',
            fontSize: LengthMetrics.fp(12),
            fontColor: ColorMetrics.resourceColor(Color.Blue),
          }),
          activated: this.isActivated,
        })
      })

      ChipV2({
        chipV2Options: new ChipV2Options({
          prefixIcon: new ChipV2PrefixImageIcon({
            src: '',
          }) as ChipV2PrefixImageIcon,
          label: new ChipV2Label({
            text: '操作块7',
            fontSize: LengthMetrics.fp(12),
            fontColor: ColorMetrics.resourceColor(Color.Blue),
          }),
          activated: this.isActivated,
        })
      })

      Row() {
        Button('activated: true').id('ChipV2PrefixIcon_isActivated_true')
          .onClick(() => {
            this.isActivated = true;
          })
        Button('activated: false').id('ChipV2PrefixIcon_isActivated_false')
          .onClick(() => {
            this.isActivated = false;
          })
      }

    }
  }
}
