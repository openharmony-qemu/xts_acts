/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';

@Entry
@Component
struct Index {
  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility index aboutToAppear');
  }

  build() {
    Column() {
      TextArea({
        text: '',
        placeholder: 'textArea boolean'
       }).width('100%')
        .id('TextArea1')
        .onWillAttachIME((client: IMEClient) => {
          console.info(`====> Vincent TextArea ${client.nodeId}`);
          const customSettings: Record<string, number | string | boolean> = {'bbb': true};
          console.info(`====> customSettings1: ${JSON.stringify(customSettings)}`);
          client.setExtraConfig({
            customSettings: customSettings
          })
        })
      TextArea({
        text: '',
        placeholder: 'textArea string'
       }).width('100%')
        .id('TextArea2')
        .onWillAttachIME((client: IMEClient) => {
          console.info(`====> Vincent TextArea ${client.nodeId}`);
          const customSettings: Record<string, number | string | boolean> = {'aaa': 'AAA'};
          console.info(`====> customSettings1: ${JSON.stringify(customSettings)}`);
          client.setExtraConfig({
            customSettings: customSettings
          })
        })
      TextArea({
        text: '',
        placeholder: 'textArea number'
       }).width('100%')
        .id('TextArea3')
        .onWillAttachIME((client: IMEClient) => {
          console.info(`====> Vincent TextArea ${client.nodeId}`);
          const customSettings: Record<string, number | string | boolean> = {'name': 123};
          console.info(`====> customSettings1: ${JSON.stringify(customSettings)}`);
          client.setExtraConfig({
            customSettings: customSettings
          })
        })
      TextArea({
        text: '',
        placeholder: 'textArea MultipleType'
       }).width('100%')
        .id('TextArea4')
        .onWillAttachIME((client: IMEClient) => {
          console.info(`====> Vincent TextArea ${client.nodeId}`);
          const customSettings: Record<string, number | string | boolean> = {'bbb': true, 'aaa': 'AAA', 'name': 123};
          console.info(`====> customSettings1: ${JSON.stringify(customSettings)}`);
          client.setExtraConfig({
            customSettings: customSettings
          })
        })
    }
  }
}