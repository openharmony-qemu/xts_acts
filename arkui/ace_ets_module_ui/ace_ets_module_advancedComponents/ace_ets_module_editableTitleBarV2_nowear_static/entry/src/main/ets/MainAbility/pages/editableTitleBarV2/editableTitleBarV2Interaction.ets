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
  EditableTitleBarV2, EditableLeftIconV2, EditableTitleBarMenuItemV2, EditableSaveButtonV2, EditableTitleBarStyleV2,
  EditableLeftIconTypeV2,EditableTitleBarMenuItemV2Options, EditableTitleBarItemV2, EditableTitleBarStyleV2Options
} from '@ohos.arkui.advanced.EditableTitleBarV2';
import {
  Entry, ComponentV2, $r, Column, Text, Scroll, FontWeight, Padding, Local, ColumnOptions, Color, BlurStyle,
  SafeAreaType, SafeAreaEdge, LengthMetrics,
} from '@kit.ArkUI';
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';

@Entry
@ComponentV2
struct EditableTitleBarV2Interaction {
  @Local callbackResult: string = '';
  @Local menuCallbackResult: string = '';
  @Local saveCallbackResult: string = '';

  @Local itemOptions1: EditableTitleBarMenuItemV2Options = {
    value: $r('sys.media.ohos_app_icon'),
    symbolStyle: undefined,
    isEnabled: true,
    label: 'label',
    defaultFocus: true,
    action: () => {
      this.menuCallbackResult = 'Menu Item Click';
    },
    accessibilityLevel: 'yes',
    accessibilityText: '单指双击即可选中',
    accessibilityDescription: '单指双击即可执行',
  }
  @Local item1:EditableTitleBarItemV2 = new EditableTitleBarMenuItemV2(this.itemOptions1)
  @Local menuItemsList: Array<EditableTitleBarMenuItemV2> = [this.item1]

  @Local itemOptions2: EditableTitleBarMenuItemV2Options = {
    value: $r('sys.media.ohos_ic_public_more'),
    symbolStyle: new SymbolGlyphModifier($r('sys.symbol.bell')).fontColor([Color.Red]),
    defaultFocus: true,
    accessibilityDescription: '',
    accessibilityLevel: '',
    accessibilityText: '',
    isEnabled: false,
    label: '',
    action: () => {
      this.menuCallbackResult = 'Menu Item Click';
    }
  }
  @Local item2:EditableTitleBarItemV2 = new EditableTitleBarMenuItemV2(this.itemOptions2)
  @Local menuItemsList2: Array<EditableTitleBarMenuItemV2> = [this.item2]

  @Local styleV2OptionsItem: EditableTitleBarStyleV2Options = {
    backgroundBlurStyle: BlurStyle.Thick,
    backgroundColor: '#3f5fff',
    safeAreaTypes: [SafeAreaType.SYSTEM],
    safeAreaEdges: [SafeAreaEdge.TOP],
    contentMargin: { start: LengthMetrics.vp(16), end: LengthMetrics.vp(16),}
  }
  @Local styleV2Options: EditableTitleBarStyleV2 = new EditableTitleBarStyleV2(this.styleV2OptionsItem)

  build(): void {
    Scroll() {
      Column({ space: 20 } as ColumnOptions) {
        Text('Interaction Test')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .padding({ top: 20, bottom: 20 })

        EditableTitleBarV2({
          title: 'Left Icon Click',
          options: new EditableTitleBarStyleV2({

          }),
          leftIcon: new EditableLeftIconV2({
            iconType: EditableLeftIconTypeV2.Back,
            onAction: () => {
              this.callbackResult = 'Left icon clicked';
            }
          }),
          menuItems: this.menuItemsList
        })

        Text(this.callbackResult)
          .fontSize(16)
          .padding({ top: 10 })

        EditableTitleBarV2({
          title: 'Menu Item Click',
          options: new EditableTitleBarStyleV2(),
          menuItems: [
            new EditableTitleBarMenuItemV2({
              value: $r('sys.media.ohos_ic_public_more'),
              action: () => {
                this.menuCallbackResult = 'Menu item clicked';
              }
            })
          ]
        })

        Text(this.menuCallbackResult)
          .fontSize(16)
          .padding({ top: 10 })

        EditableTitleBarV2({
          title: 'Save Button Click',
          options: new EditableTitleBarStyleV2(),
          menuItems: this.menuItemsList2,
          saveButton: new EditableSaveButtonV2({
            isRequired: true,
            onAction: () => {
              this.saveCallbackResult = 'Save button clicked';
            }
          })
        })

        Text(this.saveCallbackResult)
          .fontSize(16)
          .padding({ top: 10 })

        EditableTitleBarV2({
          title: 'Default Focus Left',
          options: new EditableTitleBarStyleV2({
            backgroundBlurStyle: BlurStyle.Thick,
            backgroundColor: '#ffffffff',
            safeAreaTypes: [SafeAreaType.SYSTEM],
            safeAreaEdges: [SafeAreaEdge.TOP],
            contentMargin: { start: LengthMetrics.vp(5), end: LengthMetrics.vp(5),}
          }),
          leftIcon: new EditableLeftIconV2({
            iconType: EditableLeftIconTypeV2.Back,
            defaultFocus: true
          }),
          saveButton: new EditableSaveButtonV2({
            isRequired: false,
            defaultFocus: false
          }),
          menuItems: [
            new EditableTitleBarMenuItemV2({
              value: $r('sys.media.ohos_ic_public_more'),
              symbolStyle: new SymbolGlyphModifier($r('sys.symbol.bell')).fontColor([Color.Red]),
              accessibilityDescription: '描述',
              accessibilityLevel: 'yes',
              accessibilityText: '文本',
              defaultFocus: false,
              isEnabled: true,
              label: 'label text',
              action: () => {
                this.menuCallbackResult = 'Menu Item Click';
              }
            })
          ]
        })

        EditableTitleBarV2({
          title: 'Default Focus Menu',
          options: this.styleV2Options,
          menuItems: [
            new EditableTitleBarMenuItemV2({
              value: $r('sys.media.ohos_ic_public_more'),
              symbolStyle: undefined,
              defaultFocus: true,
              accessibilityDescription: '',
              accessibilityLevel: '',
              accessibilityText: '',
              isEnabled: false,
              label: '',
              action: () => {
                this.menuCallbackResult = 'Menu Item Click';
              }
            })
          ]
        })

        EditableTitleBarV2({
          title: 'Default Focus Save',
          leftIcon: new EditableLeftIconV2({
            iconType: EditableLeftIconTypeV2.Back,
            defaultFocus: false
          }),
          options: new EditableTitleBarStyleV2(),
          saveButton: new EditableSaveButtonV2({
            isRequired: true,
            defaultFocus: true
          })
        })
      }
      .width('100%')
      .padding({ left: 20, right: 20 })
    }
    .width('100%')
    .height('100%')
  }
}