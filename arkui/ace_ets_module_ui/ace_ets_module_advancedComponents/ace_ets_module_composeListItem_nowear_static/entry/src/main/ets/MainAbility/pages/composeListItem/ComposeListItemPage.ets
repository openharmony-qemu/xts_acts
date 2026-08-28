'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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
  $r,
  Column,
  Scroll,
  List,
  ListItem,
  Text,
  FontWeight,
  Color,
  ColumnOptions } from '@ohos.arkui.component';
import {
  ContentItem, ComposeListItem,
  OperateItem, OperateIcon, OperateCheck, OperateButton,
  IconType
} from '@ohos.arkui.advanced.ComposeListItem';
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';
import { AppStorage, State } from '@ohos.arkui.stateManagement'; 

@Entry
@Component
struct ComposeListItemPage {
  @State checkboxValue: boolean = false;

  build() {
    Column() {
      List() {
        ListItem() {
          ComposeListItem({
            contentItem: ({
              iconStyle: IconType.NORMAL_ICON,
              icon: $r('sys.media.ohos_app_icon'),
              primaryText: '双行列表',
            }),
            operateItem: ({
              icon: {
                value: $r('sys.symbol.car'),
                symbolStyle: new SymbolGlyphModifier($r('sys.symbol.heart')).fontColor([Color.Orange]),
                action: () => {
                  this.getUIContext().getPromptAction().showToast({
                    message: 'icon'
                  });
                },
                accessibilityText: 'icon',
                accessibilityDescription: 'icon Description',
                accessibilityLevel: 'yes'
              },
              subIcon: {
                value: $r('sys.media.ohos_app_icon'),
                symbolStyle: new SymbolGlyphModifier($r('sys.symbol.heart')).fontColor([Color.Pink]),
                action: () => {
                  console.info('SubIcon clicked');
                },
                accessibilityText: 'subIcon Text',
                accessibilityDescription: 'subIcon Description',
                accessibilityLevel: 'yes'
              },
            })
          })
        }
        ListItem() {
          ComposeListItem({
            contentItem: ({
              iconStyle: IconType.NORMAL_ICON,
              icon: $r('sys.symbol.house'),
              symbolStyle: new SymbolGlyphModifier($r('sys.symbol.bell')).fontColor([Color.Red]),
              primaryText: 'with symbolStyle',
            }),
            operateItem: ({
              image: $r('sys.symbol.car'),
              symbolStyle: new SymbolGlyphModifier($r('sys.symbol.heart')).fontColor([Color.Pink]),
              text: '右侧文本',
            })
          })
        }
        ListItem() {
          ComposeListItem({
            contentItem: ({
              iconStyle: IconType.NORMAL_ICON,
              icon: $r('sys.media.ohos_app_icon'),
              primaryText: 'with radio',
            }),
            operateItem: ({
              radio: {
                isCheck: true,
                accessibilityText: 'radio',
                accessibilityDescription: '未选中',
                accessibilityLevel: 'yes',
                onChange: (value: boolean) => {
                  console.log('radio onChange: ' + value)
                }
              }
            })
          })
        }

        ListItem() {
          ComposeListItem({
            contentItem: ({
              iconStyle: IconType.NORMAL_ICON,
              icon: $r('sys.media.ohos_app_icon'),
              primaryText: 'with button',
            }),
            operateItem: ({
              button: {
                text: 'Button',
                accessibilityText: 'Button Text',
                accessibilityDescription: 'Button Description',
                accessibilityLevel: 'no'
              }
            })
          })
        }

        ListItem() {
          ComposeListItem({
            contentItem: ({
              iconStyle: IconType.NORMAL_ICON,
              icon: $r('sys.media.ohos_app_icon'),
              primaryText: 'with Arrow',
            }),
            operateItem: ({
              arrow: {
                value: $r('sys.media.ohos_app_icon'),
                symbolStyle: new SymbolGlyphModifier($r('sys.symbol.heart')).fontColor([Color.Pink]),
                action: () => {
                  console.info('Arrow clicked');
                },
                accessibilityText: 'arrow Text',
                accessibilityDescription: 'arrow Description',
                accessibilityLevel: 'yes'
              }
            })
          })
        }
        ListItem() {
          ComposeListItem({
            contentItem: {
              iconStyle: IconType.NORMAL_ICON,
              icon: $r('sys.media.ohos_app_icon'),
              primaryText: 'with Checkbox'
            },
            operateItem: {
              checkbox: {
                isCheck: this.checkboxValue,
                onChange: (value: boolean) => {
                  console.log('checkbox onChange: ' + value)
                },
                accessibilityText: 'checkbox Text',
                accessibilityDescription: 'checkbox Description',
                accessibilityLevel: 'yes'
              }
            }
          })
        }
        ListItem() {
          ComposeListItem({
            contentItem: {
              iconStyle: IconType.NORMAL_ICON,
              icon: $r('sys.media.ohos_app_icon'),
              primaryText: 'with toggle'
            },
            operateItem: {
              toggle: {
                isCheck: false,
                accessibilityText: 'toggle',
                accessibilityDescription: '未选中',
                accessibilityLevel: 'yes',
                onChange: (value: boolean) => {
                  console.log('toggle onChange: ' + value)
                },
              }
            }
          })
        }
      }
    }
  }
}