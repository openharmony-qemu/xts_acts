'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {LengthMetrics, uiMaterial, State, TextAlign, MenuElement, Scroll, Placement, BlurStyle, MenuPreviewMode, BarState, AnchoredColorMode} from '@kit.ArkUI';

import { $r, AdaptiveColor, BackgroundBlurStyleOptions, BlurStyleActivePolicy,
  Entry, Component, Column, ColumnOptions, Row, RowOptions, Text, Button, Menu, MenuItem, ResponseType,
  FontWeight, ContextMenuOptions, ClickEvent, MenuItemOptions, Builder, MenuGridPosition,
  Color, SizeOptions, ThemeColorMode } from '@ohos.arkui.component';


@Entry
@Component
struct bindContextMenuByResponseTypeIndex {
  @State onAppearResult: string = 'init';
  @State onDisappearResult: string = 'init';
  @State aboutToAppearResult: string = 'init';
  @State aboutToDisappearResult: string = 'init';

  @Builder
  CustomMenuBuilder() {
    Menu() {
      MenuItem({ content: 'CustomItem1' })
      MenuItem({ content: 'CustomItem2' })
      MenuItem({ content: 'CustomItem3' })
    }.id('customMenu')
  }

  @Builder
  PreviewBuilder() {
    Column() {
      Text('PreviewContent')
        .fontSize(20)
        .textAlign(TextAlign.Center)
    }.width(200).height(100)
  }

  private menuElements: Array<MenuElement> = [
    { value: 'Element1', action: () => {} },
    { value: 'Element2', action: () => {} },
    { value: 'Element3', action: () => {} },
  ];

  private manyMenuElements: Array<MenuElement> = [
    { value: 'Item1', action: () => {} },
    { value: 'Item2', action: () => {} },
    { value: 'Item3', action: () => {} },
    { value: 'Item4', action: () => {} },
    { value: 'Item5', action: () => {} },
    { value: 'Item6', action: () => {} },
    { value: 'Item7', action: () => {} },
    { value: 'Item8', action: () => {} },
    { value: 'Item9', action: () => {} },
  ];

  private gridMenuElements: Array<MenuElement> = [
    { value: 'Grid1', action: () => {} },
    { value: 'Grid2', action: () => {} },
    { value: 'Grid3', action: () => {} },
    { value: 'Grid4', action: () => {} },
    { value: 'Grid5', action: () => {} },
    { value: 'Grid6', action: () => {} },
  ];

  build() {
    Scroll() {
      Column({ space: 10 } as ColumnOptions) {
        Row() {
          Button('CustomBuilder_LongPress')
            .id('btn01')
            .height('5%')
            .width('30%')
            .bindContextMenuByResponseType(this.CustomMenuBuilder, ResponseType.LongPress)

          Button('CustomBuilder_RightClick')
            .id('btn02')
            .height('5%')
            .width('30%')
            .bindContextMenuByResponseType(this.CustomMenuBuilder, ResponseType.RightClick)
        }

        Row() {
          Button('MenuElement_LongPress')
            .id('btn03')
            .height('5%')
            .width('30%')
            .bindContextMenuByResponseType(this.menuElements, ResponseType.LongPress)

          Button('MenuElement_RightClick')
            .id('btn04')
            .height('5%')
            .width('30%')
            .bindContextMenuByResponseType(this.menuElements, ResponseType.RightClick)
        }

        Row() {
          Button('Offset_Placement')
            .id('btn05')
            .height('5%')
            .width('30%')
            .bindContextMenuByResponseType(this.CustomMenuBuilder, ResponseType.LongPress, {
              offset: { x: 20, y: 20 },
              placement: Placement.Bottom,
            })

          Button('EnableArrow_ArrowOffset')
            .id('btn06')
            .height('5%')
            .width('30%')
            .bindContextMenuByResponseType(this.CustomMenuBuilder, ResponseType.LongPress, {
              enableArrow: true,
              arrowOffset: 10,
              placement: Placement.Bottom,
            })
        }

        Row() {
          Button('OnAppearDisappear')
            .id('btn07')
            .height('5%')
            .width('30%')
            .bindContextMenuByResponseType(this.CustomMenuBuilder, ResponseType.LongPress, {
              onAppear: () => {
                this.onAppearResult = 'appeared';
              },
              onDisappear: () => {
                this.onDisappearResult = 'disappeared';
              },
            })

          Button('AboutToAppearDisappear')
            .id('btn08')
            .height('5%')
            .width('30%')
            .bindContextMenuByResponseType(this.CustomMenuBuilder, ResponseType.LongPress, {
              aboutToAppear: () => {
                this.aboutToAppearResult = 'aboutToAppear';
              },
              aboutToDisappear: () => {
                this.aboutToDisappearResult = 'aboutToDisappear';
              },
            })
        }

        Row() {
          Button('BackgroundColor')
            .id('btn09')
            .height('5%')
            .width('30%')
            .bindContextMenuByResponseType(this.menuElements, ResponseType.LongPress, {
              backgroundColor: Color.Red,
            })

          Button('BackgroundBlurStyle')
            .id('btn10')
            .height('5%')
            .width('30%')
            .bindContextMenuByResponseType(this.menuElements, ResponseType.LongPress, {
              backgroundBlurStyle: BlurStyle.COMPONENT_ULTRA_THICK,
            })
        }

        Row() {
          Button('BorderRadius')
            .id('btn11')
            .height('5%')
            .width('30%')
            .bindContextMenuByResponseType(this.menuElements, ResponseType.LongPress, {
              borderRadius: 20,
            })

          Button('PreviewImage')
            .id('btn12')
            .height('5%')
            .width('30%')
            .bindContextMenuByResponseType(this.CustomMenuBuilder, ResponseType.LongPress, {
              preview: MenuPreviewMode.IMAGE,
            })
        }

        Row() {
          Button('PreviewCustomBuilder')
            .id('btn13')
            .height('5%')
            .width('30%')
            .bindContextMenuByResponseType(this.CustomMenuBuilder, ResponseType.LongPress, {
              preview: this.PreviewBuilder,
            })

          Button('BackgroundBlurStyleOptions')
            .id('btn14')
            .height('5%')
            .width('30%')
            .bindContextMenuByResponseType(this.menuElements, ResponseType.LongPress, {
              backgroundBlurStyle: BlurStyle.BACKGROUND_THIN,
              backgroundBlurStyleOptions: {
                colorMode: ThemeColorMode.LIGHT,
                policy: BlurStyleActivePolicy.ALWAYS_ACTIVE,
                adaptiveColor: AdaptiveColor.AVERAGE,
                scale: 1,
              } as BackgroundBlurStyleOptions,
            })
        }

        Row() {
          Button('BackgroundEffect')
            .id('btn15')
            .height('5%')
            .width('30%')
            .bindContextMenuByResponseType(this.menuElements, ResponseType.LongPress, {
              backgroundBlurStyle: BlurStyle.BACKGROUND_THIN,
              backgroundEffect: {
                radius: 60,
                saturation: 10,
                brightness: 1,
                color: '#661A1A1A',
                adaptiveColor: AdaptiveColor.AVERAGE,
                blurOptions: { grayscale: [20, 20] },
              },
            })

          Button('ScrollBar')
            .id('btn16')
            .height('5%')
            .width('30%')
            .bindContextMenuByResponseType(this.manyMenuElements, ResponseType.LongPress, {
              scrollBar: BarState.Off,
            })
        }

        Row() {
          Button('MaxHeight')
            .id('btn17')
            .height('5%')
            .width('30%')
            .bindContextMenuByResponseType(this.manyMenuElements, ResponseType.LongPress, {
              maxHeight: LengthMetrics.vp(200),
            })

          Button('GridStyle')
            .id('btn18')
            .height('5%')
            .width('30%')
            .bindContextMenuByResponseType(this.gridMenuElements, ResponseType.LongPress, {
              gridStyle: { count: 3, horizontalSize: 3, position: MenuGridPosition.TOP }
            })
        }

        Row() {
          Button('TargetSpace')
            .id('btn19')
            .height('5%')
            .width('30%')
            .bindContextMenuByResponseType(this.menuElements, ResponseType.LongPress, {
              targetSpace: LengthMetrics.vp(20),
            })

          Button('ColorMode')
            .id('btn20')
            .height('5%')
            .width('30%')
            .bindContextMenuByResponseType(this.menuElements, ResponseType.LongPress, {
              colorMode: AnchoredColorMode.FOLLOW_TARGET,
            })
        }

        Row() {
          Button('SystemMaterial')
            .id('btn21')
            .height('5%')
            .width('30%')
            .bindContextMenuByResponseType(this.menuElements, ResponseType.LongPress, {
              systemMaterial: new uiMaterial.ImmersiveMaterial({
                style: uiMaterial.ImmersiveStyle.THICK,
              }),
            })

          Button('Chaining_ReturnT')
            .id('btn22')
            .height('5%')
            .width('30%')
            .backgroundColor(Color.Blue)
            .bindContextMenuByResponseType(this.CustomMenuBuilder, ResponseType.LongPress)
            .fontColor(Color.White)
        }

        Row() {
          Text('onAppear:' + this.onAppearResult)
            .id('appearText')
            .fontSize(12)
          Text('onDisappear:' + this.onDisappearResult)
            .id('disappearText')
            .fontSize(12)
          Text('aboutToAppear:' + this.aboutToAppearResult)
            .id('aboutAppearText')
            .fontSize(12)
        }

        Text('aboutToDisappear:' + this.aboutToDisappearResult)
          .id('aboutDisappearText')
          .fontSize(12)

      }
    }
    .width('100%')
    .height('100%')
  }
}