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
  EditableTitleBarV2, EditableLeftIconV2, EditableTitleV2, EditableTitleBarMenuItemV2,
  EditableTitleBarMenuItemV2Options, EditableSaveButtonV2, EditableTitleBarStyleV2, EditableLeftIconTypeV2,
  EditableTitleBarStyleV2Options, EditableLeftIconV2Options, EditableTitleBarItemV2
} from '@ohos.arkui.advanced.EditableTitleBarV2';
import { SymbolGlyphModifier, LengthMetrics } from '@kit.ArkUI'

@Entry
@ComponentV2
struct EditableTitleBarV2Page {
  @Local titleText: string = 'Title';
  @Local subTitleText: string = 'Subtitle';
  @Local leftIconType: EditableLeftIconTypeV2 = EditableLeftIconTypeV2.Back;
  @Local saveButtonRequired: boolean = true;
  @Local menuItemCount: number = 2;

  @Local itemOptions1: EditableTitleBarMenuItemV2Options = {
    value: $r('sys.media.ohos_app_icon'),
    symbolStyle: new SymbolGlyphModifier($r('sys.symbol.bell')).fontColor([Color.Red]),
    isEnabled: true,
    label: 'label',
    defaultFocus: true,
    action: () => {
      console.info('Menu item 1 clicked');
    },
    accessibilityLevel: 'yes',
    accessibilityText: '单指双击即可选中',
    accessibilityDescription: '单指双击即可执行',
  }

  @Local itemOptions2: EditableTitleBarMenuItemV2Options = {
    value: $r('sys.media.ohos_app_icon'),
    symbolStyle: undefined,
    isEnabled: false,
    label: '',
    defaultFocus: false,
    action: () => {
      console.info('Menu item 2 clicked');
    },
    accessibilityLevel: '',
    accessibilityText: '',
    accessibilityDescription: '',
  }

  @Local item1:EditableTitleBarItemV2 = new EditableTitleBarMenuItemV2(this.itemOptions1)
  @Local item2:EditableTitleBarItemV2 = new EditableTitleBarMenuItemV2(this.itemOptions2)
  @Local menuItemsList: Array<EditableTitleBarMenuItemV2> = [this.item1, this.item2]

  @Local styleOptions:EditableTitleBarStyleV2Options = {
    backgroundBlurStyle: BlurStyle.Thick,
    backgroundColor: '#ffffffff',
    safeAreaTypes: [SafeAreaType.SYSTEM],
    safeAreaEdges: [SafeAreaEdge.TOP],
    contentMargin: { start: LengthMetrics.vp(5), end: LengthMetrics.vp(5),}
  }
  @Local options01:EditableTitleBarStyleV2 = new EditableTitleBarStyleV2(this.styleOptions)

  @Local leftIconOptions:EditableLeftIconV2Options = {
    iconType: EditableLeftIconTypeV2.Cancel,
    defaultFocus: false,
    onAction: () => {
      console.info('Left icon clicked');
    }
  }
  @Local leftIconBuilder:EditableLeftIconV2 = new EditableLeftIconV2(this.leftIconOptions)


  build() {
    Column() {
      Scroll() {
        Column({ space: 10 }) {
          Text('EditableTitleBarV2 Basic Test')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)

          EditableTitleBarV2({
            title: 'Basic Title',
            leftIcon:this.leftIconBuilder,
            options: new EditableTitleBarStyleV2({
              backgroundBlurStyle: BlurStyle.Thick,
              backgroundColor: '#ffffffff',
              safeAreaTypes: [SafeAreaType.SYSTEM],
              safeAreaEdges: [SafeAreaEdge.TOP],
              contentMargin: { start: LengthMetrics.vp(5), end: LengthMetrics.vp(5),}
            }),
            imageItem:new EditableTitleBarMenuItemV2({
              value: $r('sys.media.ohos_app_icon'),
              symbolStyle: new SymbolGlyphModifier($r('sys.symbol.bell')).fontColor([Color.Red]),
              isEnabled: true,
              label: 'label',
              defaultFocus: true,
              action: () => {
                console.info('Menu item 1 clicked');
              },
              accessibilityLevel: 'yes',
              accessibilityText: '单指双击即可选中',
              accessibilityDescription: '单指双击即可执行',
            })
          })

          Text('EditableTitleBarV2 With Left Icon')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 20 })

          EditableTitleBarV2({
            title: 'With Left Icon',
            leftIcon: new EditableLeftIconV2({
              iconType: this.leftIconType,
              defaultFocus: true,
              onAction: () => {
                console.info('Left icon clicked');
              }
            }),
            options: this.options01
          })

          Text('EditableTitleBarV2 With Title Object')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 20 })

          EditableTitleBarV2({
            title: new EditableTitleV2({
              mainTitle: this.titleText,
              subTitle: this.subTitleText
            }),
            menuItems:this.menuItemsList,
            options: new EditableTitleBarStyleV2()
          })

          Text('EditableTitleBarV2 With Menu Items')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 20 })

          EditableTitleBarV2({
            title: 'With Menu',
            menuItems: [
              new EditableTitleBarMenuItemV2({
                value: $r('sys.symbol.album_compose'),
                action: () => {
                  console.info('Menu item 1 clicked');
                },
                accessibilityDescription: '描述',
                accessibilityLevel: 'auto',
                accessibilityText: '文本',
                defaultFocus: false,
                isEnabled: true,
                label: 'label'
              }),
              new EditableTitleBarMenuItemV2({
                value: $r('sys.symbol.trash'),
                symbolStyle: new SymbolGlyphModifier($r('sys.symbol.save')),
                action: () => {
                  console.info('Menu item 2 clicked');
                },
                defaultFocus: true,
                accessibilityDescription: '',
                accessibilityLevel: '',
                accessibilityText: '',
                isEnabled: false,
                label:''
              })
            ],
            options: new EditableTitleBarStyleV2()
          })

          Text('EditableTitleBarV2 With Save Button')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 20 })

          EditableTitleBarV2({
            title: 'With Save Button',
            menuItems: [
              new EditableTitleBarMenuItemV2({
                value: $r('sys.symbol.trash'),
                symbolStyle: undefined,
                action: () => {
                  console.info('Menu item clicked');
                },
              })
            ],
            saveButton: new EditableSaveButtonV2({
              isRequired: this.saveButtonRequired,
              defaultFocus: false,
              onAction: () => {
                console.info('Save button clicked');
              }
            }),
            options: new EditableTitleBarStyleV2()
          })

        }
        .alignItems(HorizontalAlign.Center)
        .width('100%')
        .margin({ top: 50 })
      }
    }
    .width('100%')
    .height('100%')
  }
}