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

import { EditableTitleBarV2, EditableLeftIconV2, EditableTitleV2, EditableTitleBarMenuItemV2, EditableSaveButtonV2, EditableTitleBarStyleV2, EditableLeftIconTypeV2 } from '@ohos.arkui.advanced.EditableTitleBarV2';

@Entry
@ComponentV2
struct EditableTitleBarV2Page {
  @Local titleText: string = 'Title';
  @Local subTitleText: string = 'Subtitle';
  @Local leftIconType: EditableLeftIconTypeV2 = EditableLeftIconTypeV2.Back;
  @Local saveButtonRequired: boolean = true;
  @Local menuItemCount: number = 2;

  build() {
    Column() {
      Scroll() {
        Column({ space: 20 }) {
          Text('EditableTitleBarV2 With Save Button')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 20 })

          EditableTitleBarV2({
            title: 'With Save Button',
            saveButton: new EditableSaveButtonV2({
              isRequired: this.saveButtonRequired,
              onAction: () => {
                console.info('Save button clicked');
              }
            }),
            options: new EditableTitleBarStyleV2()
          })

          Text('EditableTitleBarV2 Complete Example')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 20 })

          EditableTitleBarV2({
            title: new EditableTitleV2({
              mainTitle: 'Complete',
              subTitle: 'All Features'
            }),
            leftIcon: new EditableLeftIconV2({
              iconType: EditableLeftIconTypeV2.Cancel,
              onAction: () => {
                console.info('Cancel clicked');
              }
            }),
            menuItems: [
              new EditableTitleBarMenuItemV2({
                value: $r('sys.symbol.share'),
                action: () => {
                  console.info('Share clicked');
                }
              })
            ],
            saveButton: new EditableSaveButtonV2({
              isRequired: true,
              defaultFocus: true,
              onAction: () => {
                console.info('Save clicked');
              }
            }),
            options: new EditableTitleBarStyleV2({
              backgroundColor: Color.White
            })
          })

          Text('EditableTitleBarV2 With Custom Style')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 20 })

          EditableTitleBarV2({
            title: 'Custom Style',
            options: new EditableTitleBarStyleV2({
              backgroundColor: $r('sys.color.background_primary'),
              safeAreaEdges: [SafeAreaEdge.TOP]
            })
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