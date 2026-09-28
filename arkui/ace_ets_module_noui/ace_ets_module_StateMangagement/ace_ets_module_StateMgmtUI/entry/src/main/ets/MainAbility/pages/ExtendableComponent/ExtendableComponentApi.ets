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
import { UIContext, FrameNode } from '@kit.ArkUI';

@Component
struct ChildUniqueIdComponent {
  @State childUniqueId: string = '';

  build() {
    Column({ space: 5 }) {
      Button('Get Child UniqueId')
        .id('button_get_child_uniqueid')
        .height('5%')
        .onClick(() => {
          let id: number = this.getUniqueId();
          this.childUniqueId = id.toString();
        })
      Text(`Child UniqueId: ${this.childUniqueId}`)
        .id('text_child_uniqueid_result')
        .height('5%')
    }
  }
}

@Entry
@Component
struct ExtendableComponentApi {
  @State uiContextValid: string = '';
  @State uiContextFunctional: string = '';
  @State uniqueIdValue: string = '';

  build() {
    Column({ space: 10 }) {
      // === getUIContext tests ===
      Text('GetUIContext Test')
        .id('text_title_uicontext')
        .height('5%')

      Button('Get UIContext Valid')
        .id('button_get_uicontext_valid')
        .height('5%')
        .onClick(() => {
          let ctx: UIContext = this.getUIContext();
          let node: FrameNode | null = ctx.getFrameNodeById('text_uicontext_result') || null;
          this.uiContextValid = node !== null ? 'valid' : 'invalid';
        })

      Text(`UIContext: ${this.uiContextValid}`)
        .id('text_uicontext_result')
        .height('5%')

      Button('Get UIContext Functional')
        .id('button_get_uicontext_functional')
        .height('5%')
        .onClick(() => {
          let ctx: UIContext = this.getUIContext();
          let node: FrameNode | null = ctx.getFrameNodeById('non_existent_id_test') || null;
          this.uiContextFunctional = node === null ? 'valid' : 'invalid';
        })

      Text(`UIContext Functional: ${this.uiContextFunctional}`)
        .id('text_uicontext_functional_result')
        .height('5%')

      // === getUniqueId tests ===
      Text('GetUniqueId Test')
        .id('text_title_uniqueid')
        .height('5%')

      Button('Get UniqueId')
        .id('button_get_uniqueid')
        .height('5%')
        .onClick(() => {
          let id: number = this.getUniqueId();
          this.uniqueIdValue = id.toString();
        })

      Text(`UniqueId: ${this.uniqueIdValue}`)
        .id('text_uniqueid_result')
        .height('5%')

      // Child component for different ID test
      ChildUniqueIdComponent()
    }
    .width('100%')
    .height('100%')
    .padding({ left: 20, right: 20, top: 10, bottom: 10 })
    .backgroundColor('#F5F5F5')
  }
}
