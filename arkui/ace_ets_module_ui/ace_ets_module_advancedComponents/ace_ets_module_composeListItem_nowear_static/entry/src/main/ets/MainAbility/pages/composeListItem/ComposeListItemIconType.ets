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
 
@Entry
@Component
struct ComposeListItemIconType {
  build() {
    Column() {
      List() {
        ListItem() {
          ComposeListItem({
            contentItem: ({
              iconStyle: IconType.BADGE,
              icon: $r('sys.media.ohos_app_icon'),
              primaryText: 'BADGE',
              secondaryText: 'contentItem',
              description: 'IconType1',
            })
          })
        }
        ListItem() {
          ComposeListItem({
            contentItem: ({
              iconStyle: IconType.NORMAL_ICON,
              icon: $r('sys.media.ohos_app_icon'),
              symbolStyle: new SymbolGlyphModifier($r('sys.symbol.camera')).fontColor([Color.Red]),
              primaryText: 'NORMAL_ICON',
              secondaryText: 'contentItem',
              description: 'IconType2',
            })
          })
        }
        ListItem() {
          ComposeListItem({
            contentItem: ({
              iconStyle: IconType.SYSTEM_ICON,
              icon: $r('sys.media.ohos_app_icon'),
              primaryText: 'SYSTEM_ICON',
              secondaryText: 'contentItem',
              description: 'IconType3',
            })
          })
        }
        ListItem() {
          ComposeListItem({
            contentItem: ({
              iconStyle: IconType.HEAD_SCULPTURE,
              icon: $r('sys.media.ohos_app_icon'),
              primaryText: 'HEAD_SCULPTURE',
              secondaryText: 'contentItem',
              description: 'IconType4',
            })
          })
        }
        ListItem() {
          ComposeListItem({
            contentItem: ({
              iconStyle: IconType.APP_ICON,
              icon: $r('sys.media.ohos_app_icon'),
              primaryText: 'APP_ICON',
              secondaryText: 'contentItem',
              description: 'IconType5',
            })
          })
        }
        ListItem() {
          ComposeListItem({
            contentItem: ({
              iconStyle: IconType.PREVIEW,
              icon: $r('sys.media.ohos_app_icon'),
              primaryText: 'PREVIEW',
              secondaryText: 'contentItem',
              description: 'IconType6',
            })
          })
        }
        ListItem() {
          ComposeListItem({
            contentItem: ({
              iconStyle: IconType.LONGITUDINAL,
              icon: $r('sys.media.ohos_app_icon'),
              primaryText: 'LONGITUDINAL',
              secondaryText: 'contentItem',
              description: 'IconType7',
            })
          })
        }
        ListItem() {
          ComposeListItem({
            contentItem: ({
              iconStyle: IconType.VERTICAL,
              icon: $r('sys.media.ohos_app_icon'),
              primaryText: 'VERTICAL',
              secondaryText: 'contentItem',
              description: 'IconType8',
            })
          })
        }
      }
    }
  }
}