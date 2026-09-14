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
import { MessageManager, Callback } from '../../utils/MessageManager';

@Entry
@Component
struct TextPickerSelectedIndexEmptyArray {
  private emptyRange: string[] = []
  private emptyMultiRange: string[][] = []
  @State dynamicRange: string[] = ['apple1', 'orange2', 'peach3', 'grape4']
  messageManager: MessageManager = new MessageManager()

  onPageShow() {
    console.info('TextPickerSelectedIndexEmptyArray onPageShow')
    globalThis.value = {
      name: 'messageManager', message: this.messageManager
    }
    let callback: Callback = (message: ESObject) => {
      console.info('message = ' + message.name + '--' + message.value)
      if (message.name == 'dynamicRange') {
        this.dynamicRange = message.value
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Scroll() {
      Column({ space: 20 }) {
        // Test 1: empty range with selectedIndex(0) - default value
        TextPicker({ range: this.emptyRange })
          .id('textPicker_emptyRange_selectedIndex_0')
          .selectedIndex(0)
          .width('100%')
          .height('15%')

        // Test 2: empty range with selectedIndex(2) - exceeds max index
        TextPicker({ range: this.emptyRange })
          .id('textPicker_emptyRange_selectedIndex_2')
          .selectedIndex(2)
          .width('100%')
          .height('15%')

        // Test 3: empty range with selectedIndex(-1) - negative value
        TextPicker({ range: this.emptyRange })
          .id('textPicker_emptyRange_selectedIndex_negative')
          .selectedIndex(-1)
          .width('100%')
          .height('15%')

        // Test 4: multi-column empty range with selectedIndex([])
        TextPicker({ range: this.emptyMultiRange })
          .id('textPicker_emptyMultiRange_selectedIndex_emptyArray')
          .selectedIndex([])
          .width('100%')
          .height('15%')

        // Test 5: dynamic change range to empty array
        TextPicker({ range: this.dynamicRange, selected: 1 })
          .id('textPicker_dynamicRange_selectedIndex')
          .selectedIndex(1)
          .width('100%')
          .height('15%')
      }
      .width('100%')
      .padding({ left: 20, right: 20, top: 10, bottom: 10 })
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Off)
  }
}
