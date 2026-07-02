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

import { ComposeTitleBarV2, ComposeTitleBarV2MenuItem, ComposeTitleBarV2MenuItemParams } from '@ohos.arkui.advanced.ComposeTitleBarV2';
import { Entry, ComponentV2, $r, Column, Resource, Scroll, Local } from '@kit.ArkUI';
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';

@Entry
@ComponentV2
struct composeTitleBarV2Page {
  @Local leftItem: ComposeTitleBarV2MenuItem = new ComposeTitleBarV2MenuItem({
    value: $r('sys.media.ohos_app_icon'),
    action: () => {
      console.info('Left item clicked');
    },
    accessibilityDescription: '描述',
    accessibilityLevel: 'auto',
    accessibilityText: '文本'
  });

  @Local menuItems: ComposeTitleBarV2MenuItem[] = [
    new ComposeTitleBarV2MenuItem({
      value: $r('sys.media.ohos_ic_public_copy'),
      isEnabled: true,
      action: () => {
        console.info('Menu item 1 clicked');
      }
    }),
    new ComposeTitleBarV2MenuItem({
      value: $r('sys.media.ohos_ic_public_edit'),
      isEnabled: false,
      action: () => {
        console.info('Menu item 2 clicked');
      }
    }),
    new ComposeTitleBarV2MenuItem({
      value: $r('sys.media.ohos_ic_public_remove'),
      isEnabled: false
    }),
    new ComposeTitleBarV2MenuItem({
      value: $r('sys.media.ohos_save_button_filled'),
      isEnabled: false,
      label: '',
      action: () => {
        console.info('Clickable item clicked');
      }
    }),
    new ComposeTitleBarV2MenuItem({
      value: $r('sys.media.ohos_save_button_filled'),
      isEnabled: true,
      label: '标签文本',
      symbolStyle: new SymbolGlyphModifier($r('sys.symbol.bell'))
    })
  ];

  @Local menuItemOption1: ComposeTitleBarV2MenuItemParams = {
    value: $r('sys.media.ohos_app_icon'),
    symbolStyle: new SymbolGlyphModifier($r('sys.symbol.bell')),
    isEnabled: true,
    action: () => {
      console.info('right item clicked');
    },
    label: '标签',
    accessibilityDescription: '描述',
    accessibilityLevel: 'auto',
    accessibilityText: '文本'
  }

  @Local menuItemOption2: ComposeTitleBarV2MenuItemParams = {
    value: $r('sys.media.ohos_app_icon'),
    symbolStyle: new SymbolGlyphModifier($r('sys.symbol.bell')),
    isEnabled: false,
    action: () => {
      console.info('right item clicked');
    },
    label: '',
    accessibilityDescription: '',
    accessibilityLevel: 'yes',
    accessibilityText: ''
  }

  @Local menuItems2: ComposeTitleBarV2MenuItem[] = [
    new ComposeTitleBarV2MenuItem(this.menuItemOption1),
    new ComposeTitleBarV2MenuItem(this.menuItemOption2),
  ];

  aboutToAppear(): void {
    console.info('composeTitleBarV2Page aboutToAppear');
  }

  build(): void {
    Scroll() {
      Column() {
        ComposeTitleBarV2({
          title: '标题测试',
          subtitle: '副标题测试',
          item: this.leftItem,
          menuItems: this.menuItems
        });

        ComposeTitleBarV2({
          title: '标题Title',
          subtitle: '副标题subtitle',
          item: this.leftItem,
          menuItems: this.menuItems2
        });
      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
  }
}