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

import { EditableTitleBarV2, EditableLeftIconV2, EditableTitleV2, EditableTitleBarItemV2, EditableTitleBarStyleV2 } from '@ohos.arkui.advanced.EditableTitleBarV2';
import { EditableLeftIconTypeV2 } from '@ohos.arkui.advanced.EditableTitleBarV2';
import { Entry, ComponentV2, $r, Column, Text, Scroll, FontWeight, Padding, ColumnOptions } from '@kit.ArkUI';

@Entry
@ComponentV2
struct EditableTitleBarV2Basic {
  build(): void {
    Scroll() {
      Column({ space: 20 } as ColumnOptions) {
        Text('Basic Features Test')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .padding({ top: 20, bottom: 20 })

        EditableTitleBarV2({
          title: 'Test Title',
          options: new EditableTitleBarStyleV2(),
          leftIcon: new EditableLeftIconV2({ iconType: EditableLeftIconTypeV2.Back })
        })
        
        EditableTitleBarV2({
          title: 'Test Title with Cancel',
          options: new EditableTitleBarStyleV2(),
          leftIcon: new EditableLeftIconV2({ iconType: EditableLeftIconTypeV2.Cancel })
        })

        EditableTitleBarV2({
          title: new EditableTitleV2({ mainTitle: 'Main Title Object', subTitle: 'Sub Title' }),
          options: new EditableTitleBarStyleV2()
        })

        EditableTitleBarV2({
          title: 'Title with Image',
          options: new EditableTitleBarStyleV2(),
          imageItem: new EditableTitleBarItemV2({ value: $r('sys.media.ohos_ic_public_more') })
        })
      }
      .width('100%')
      .padding({ left: 20, right: 20 })
    }
    .width('100%')
    .height('100%')
  }
}