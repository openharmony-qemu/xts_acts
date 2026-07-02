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
  Column,
  Row,
  ComponentV2,
  Color,
  $r,
  ColumnOptions,
  Direction,
  Button,
  Text,
  LengthMetrics,
  FlexAlign
} from '@ohos.arkui.component';
import { Local } from '@ohos.arkui.stateManagement';
import {
  ChipV2,
  ChipV2Size,
  ChipV2PrefixImageIcon,
  ChipV2SuffixImageIcon,
  ChipV2Options,
  ChipV2Label,
  ChipV2PrefixImageIconConfig,
  ChipV2SuffixImageIconConfig,
  ChipV2ImageIconConfig,
  ChipV2LabelConfig,
  ColorMetrics,
  SizeT
} from '@kit.ArkUI';

@Entry
@ComponentV2
struct ChipV2LabelOptionsPage {
  build() {
    Column() {
      ChipV2({
        chipV2Options: new ChipV2Options({
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('sys.media.ohos_app_icon'),
            size: { width: LengthMetrics.vp(16), height: LengthMetrics.vp(16) } as SizeT<LengthMetrics>,
            fillColor: ColorMetrics.resourceColor(Color.Red),
          }) as ChipV2PrefixImageIcon,
          label: new ChipV2Label({
            text: 'label1',
            fontSize: LengthMetrics.fp(12),
            fontColor: ColorMetrics.resourceColor(Color.Blue),
            fontFamily: 'HarmonySans',
            activatedFontColor: ColorMetrics.resourceColor(0xFF0000),
            labelMargin: { left: LengthMetrics.vp(20), right: LengthMetrics.vp(30) },
          }),
          suffixIcon: new ChipV2SuffixImageIcon({
            src: $r('sys.media.ohos_app_icon'),
            size: { width: LengthMetrics.vp(16), height: LengthMetrics.vp(16) } as SizeT<LengthMetrics>,
            fillColor: ColorMetrics.resourceColor(Color.Red),
          }) as ChipV2SuffixImageIcon,
          size: ChipV2Size.NORMAL,
          allowClose: false,
          enabled: false,
          activated: false,
          backgroundColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_button_normal')),
          activatedBackgroundColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_emphasize')),
          borderRadius: LengthMetrics.resource($r('sys.float.ohos_id_corner_radius_button')),
          onClose: () => {
            console.info('chip on close');
          },
          onClicked: () => {
            console.info('chip on clicked');
          }
        })
      })

      ChipV2({
        chipV2Options: new ChipV2Options({
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('sys.media.ohos_app_icon'),
            size: { width: LengthMetrics.vp(16), height: LengthMetrics.vp(16) } as SizeT<LengthMetrics>,
            fillColor: ColorMetrics.resourceColor(Color.Red),
          }) as ChipV2PrefixImageIcon,
          label: new ChipV2Label({
            text: 'label2',
            fontSize: LengthMetrics.resource($r('sys.float.ohos_id_text_size_button2')),
            fontColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_text_primary')),
            fontFamily: 'HarmonySans',
            activatedFontColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_text_primary_contrary')),
            labelMargin: { left: LengthMetrics.vp(6), right: LengthMetrics.vp(6) },
          }),
          suffixIcon: new ChipV2SuffixImageIcon({
            src: $r('sys.media.ohos_app_icon'),
            size: { width: LengthMetrics.vp(16), height: LengthMetrics.vp(16) } as SizeT<LengthMetrics>,
            fillColor: ColorMetrics.resourceColor(Color.Red),
          }) as ChipV2SuffixImageIcon,
          size: ChipV2Size.NORMAL,
          allowClose: false,
          enabled: false,
          activated: false,
          backgroundColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_button_normal')),
          activatedBackgroundColor: ColorMetrics.resourceColor($r('sys.color.ohos_id_color_emphasize')),
          borderRadius: LengthMetrics.resource($r('sys.float.ohos_id_corner_radius_button')),
          onClose: () => {
            console.info('chip on close');
          },
          onClicked: () => {
            console.info('chip on clicked');
          }
        })
      })

      ChipV2({
        chipV2Options: new ChipV2Options({
          prefixIcon: new ChipV2PrefixImageIcon({
            src: $r('sys.media.ohos_app_icon'),
            size: { width: LengthMetrics.vp(16), height: LengthMetrics.vp(16) } as SizeT<LengthMetrics>,
            fillColor: ColorMetrics.resourceColor(Color.Red),
          }) as ChipV2PrefixImageIcon,
          label: new ChipV2Label({
            text: 'label3',
            fontSize: undefined,
            fontColor: undefined,
            fontFamily: undefined,
            activatedFontColor: undefined,
            labelMargin: undefined,
          }),
          suffixIcon: new ChipV2SuffixImageIcon({
            src: $r('sys.media.ohos_app_icon'),
            size: { width: LengthMetrics.vp(16), height: LengthMetrics.vp(16) } as SizeT<LengthMetrics>,
            fillColor: ColorMetrics.resourceColor(Color.Red),
          }) as ChipV2SuffixImageIcon,
          size: ChipV2Size.NORMAL,
          allowClose: false,
          enabled: false,
          activated: false,
          backgroundColor: undefined,
          activatedBackgroundColor: undefined,
          borderRadius: undefined,
          onClose: () => {
            console.info('chip on close');
          },
          onClicked: () => {
            console.info('chip on clicked');
          }
        })
      })
    }.justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}