/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
  $r,
  AdaptiveColor,
  BackgroundBlurStyleOptions,
  BackgroundEffectOptions,
  BlurStyleActivePolicy,
  Button,
  ButtonType,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  DialogAlignment,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  ItemAlign,
  Margin,
  Row,
  SizeOptions,
  Text,
  ThemeColorMode
} from '@ohos.arkui.component'
import { Router, UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct ShowActionSheet2 {
  build() {
    Column({ space: 10 } as ColumnOptions) {
      Button('ShowActionSheet_Effect001')
        .id('ShowActionSheet_Effect001')
        .onClick((e: ClickEvent) => {
          let uiContext: UIContext = this.getUIContext();
          uiContext.showActionSheet({
            title: 'ActionSheet title',
            message: 'message',
            autoCancel: true,
            confirm: {
              value: 'Confirm button',
              action: () => {
                console.info('Get Alert Dialog handled')
              }
            },
            cancel: () => {
              console.info('actionSheet canceled')
            },
            alignment: DialogAlignment.Bottom,
            offset: { dx: 0, dy: -10 },
            sheets: [
              {
                title: 'apples',
                action: () => {
                  console.info('apples')
                }
              },
              {
                title: 'bananas',
                action: () => {
                  console.info('bananas')
                }
              },
              {
                title: 'pears',
                action: () => {
                  console.info('pears')
                }
              }
            ],
            backgroundEffect: {
              radius: 40,
              saturation: 25,
              brightness: 2,
              color: Color.Pink,
              adaptiveColor: AdaptiveColor.DEFAULT,
              policy: BlurStyleActivePolicy.ALWAYS_ACTIVE,
              inactiveColor: Color.Blue,
              blurOptions: {
                grayscale: [20, 20]
              }
            } as BackgroundEffectOptions
          })
        })
      Button('ShowActionSheet_Effect002')
        .id('ShowActionSheet_Effect002')
        .onClick((e: ClickEvent) => {
          let uiContext: UIContext = this.getUIContext();
          uiContext.showActionSheet({
            title: 'ActionSheet title',
            message: 'message',
            autoCancel: true,
            confirm: {
              value: 'Confirm button',
              action: () => {
                console.info('Get Alert Dialog handled')
              }
            },
            cancel: () => {
              console.info('actionSheet canceled')
            },
            alignment: DialogAlignment.Bottom,
            offset: { dx: 0, dy: -10 },
            sheets: [
              {
                title: 'apples',
                action: () => {
                  console.info('apples')
                }
              },
              {
                title: 'bananas',
                action: () => {
                  console.info('bananas')
                }
              },
              {
                title: 'pears',
                action: () => {
                  console.info('pears')
                }
              }
            ],

          })
        })
      Button('ShowActionSheet_Effect003')
        .id('ShowActionSheet_Effect003')
        .onClick((e: ClickEvent) => {
          let uiContext: UIContext = this.getUIContext();
          uiContext.showActionSheet({
            title: 'ActionSheet title',
            message: 'message',
            autoCancel: true,
            confirm: {
              value: 'Confirm button',
              action: () => {
                console.info('Get Alert Dialog handled')
              }
            },
            cancel: () => {
              console.info('actionSheet canceled')
            },
            alignment: DialogAlignment.Bottom,
            offset: { dx: 0, dy: -10 },
            sheets: [
              {
                title: 'apples',
                action: () => {
                  console.info('apples')
                }
              },
              {
                title: 'bananas',
                action: () => {
                  console.info('bananas')
                }
              },
              {
                title: 'pears',
                action: () => {
                  console.info('pears')
                }
              }
            ],

          })
        })
    }
    .height('100%')
    .width('100%')
    .backgroundImage($r('app.media.icon'))
    .backgroundImageSize({ width: '100%', height: '100%' } as SizeOptions)
  }
}