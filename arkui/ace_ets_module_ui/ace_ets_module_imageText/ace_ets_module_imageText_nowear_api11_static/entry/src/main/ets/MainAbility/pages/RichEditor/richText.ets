'use static';
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
import events_emitter from '@ohos.events.emitter';
import { Entry, Component, Flex, Padding,FlexDirection,ItemAlign,
  FlexAlign,Column,RichText
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { MessageManager } from '../../common/MessageManager'

@Entry
@Component
struct RichTextCreateComponent {
  @State data: string = "test data";
  build() {
    Flex({
      direction: FlexDirection.Column, alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.Center
    }) {
      Column() {
        RichText(this.data)
          .onStart(() => {
            console.info("RichText onStart")
          })
          .onComplete(() => {
            console.info("RichText onComplete")
          })
      }

    }.padding({ top: 30 } as Padding)
  }
}