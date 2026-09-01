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

  build() {
    Column() {
      List() {
        ListItem() {
          ComposeListItem({
            contentItem: ({
              iconStyle: IconType.NORMAL_ICON,
              icon: $r('sys.symbol.house'),
              primaryText: 'Icon1',
              secondaryText: 'ComposeListItem',
              description: 'operateItem',
            }),
            operateItem: ({
              icon: {
                value: $r('sys.symbol.car'),
                symbolStyle: new SymbolGlyphModifier($r('sys.symbol.bell')).fontColor([Color.Orange]),
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
            contentItem: {
              iconStyle: IconType.NORMAL_ICON,
              icon: $r('sys.symbol.house'),
              primaryText: 'SymbolStyle2',
              secondaryText: 'ComposeListItem',
              description: 'operateItem',
            },
            operateItem: {
              image: $r('sys.symbol.car'),
              symbolStyle: new SymbolGlyphModifier($r('sys.symbol.align_right')).fontColor([Color.Pink])
            }
          })
        }
        ListItem() {
          ComposeListItem({
            contentItem: ({
              iconStyle: IconType.NORMAL_ICON,
              icon: $r('sys.media.ohos_app_icon'),
              primaryText: 'Radio3',
              secondaryText: 'ComposeListItem',
              description: 'operateItem',
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
              },
            })
          })
        }

        ListItem() {
          ComposeListItem({
            contentItem: ({
              iconStyle: IconType.NORMAL_ICON,
              icon: $r('sys.symbol.house'),
              primaryText: 'Button4',
              secondaryText: 'ComposeListItem',
              description: 'operateItem',
            }),
            operateItem: ({
              button: {
                text: '确定',
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
              primaryText: 'Arrow5',
              secondaryText: 'ComposeListItem',
              description: 'operateItem',
            }),
            operateItem: ({
              arrow: {
                value: $r('sys.symbol.house'),
                symbolStyle: new SymbolGlyphModifier($r('sys.symbol.heart')).fontColor([Color.Pink]),
                action: () => {
                  console.info('Arrow clicked');
                },
                accessibilityText: 'arrow Text',
                accessibilityDescription: 'arrow Description',
                accessibilityLevel: 'yes'
              },
              text: '右侧',
            })
          })
        }
        ListItem() {
          ComposeListItem({
            contentItem: {
              iconStyle: IconType.NORMAL_ICON,
              icon: $r('sys.media.ohos_app_icon'),
              primaryText: 'Checkbox6',
              secondaryText: 'ComposeListItem',
              description: 'operateItem',
            },
            operateItem: {
              checkbox: {
                isCheck: false,
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
              icon: $r('sys.symbol.house'),
              primaryText: 'Toggle7',
              secondaryText: 'ComposeListItem',
              description: 'operateItem',
            },
            operateItem: {
              toggle: {
                isCheck: true,
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