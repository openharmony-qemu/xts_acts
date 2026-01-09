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

function generatelargeData(sizeInBytes: number): string {
  let data = '';
  let char = 'A';
  while (data.length < sizeInBytes) {
    data += char;
  }
  return data;
}

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
          console.info(`====> Vincent TextArea1 ${client.nodeId}`);
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
          console.info(`====> Vincent TextArea2 ${client.nodeId}`);
          const customSettings: Record<string, number | string | boolean> = {'aaa': 'AAA'};
          console.info(`====> customSettings2: ${JSON.stringify(customSettings)}`);
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
          console.info(`====> Vincent TextArea3 ${client.nodeId}`);
          const customSettings: Record<string, number | string | boolean> = {'name': 123};
          console.info(`====> customSettings3: ${JSON.stringify(customSettings)}`);
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
          console.info(`====> Vincent TextArea4 ${client.nodeId}`);
          const customSettings: Record<string, number | string | boolean> = {'bbb': true, 'aaa': 'AAA', 'name': 123};
          console.info(`====> customSettings4: ${JSON.stringify(customSettings)}`);
          client.setExtraConfig({
            customSettings: customSettings
          })
        })
      TextArea({
        text: '',
        placeholder: 'extraConfig undefined'
       }).width('100%')
        .id('TextArea5')
        .onWillAttachIME((client: IMEClient) => {
          console.info(`====> Vincent TextArea5 ${client.nodeId}`);
          console.info(`====> customSettings5: extraConfig undefined`);
          client.setExtraConfig({
            undefined
          })
        })
      TextArea({
        text: '',
        placeholder: 'customSettings undefined'
       }).width('100%')
        .id('TextArea6')
        .onWillAttachIME((client: IMEClient) => {
          console.info(`====> Vincent TextArea6 ${client.nodeId}`);
          console.info(`====> customSettings6: customSettings undefined`);
          client.setExtraConfig({
            customSettings: undefined
          })
        })
      TextArea({
        text: '',
        placeholder: 'record 32k'
       }).width('100%')
        .id('TextArea7')
        .onWillAttachIME((client: IMEClient) => {
          console.info(`====> Vincent TextArea7 ${client.nodeId}`);
          let largeData = generatelargeData(32 * 1024 - 4)
          console.info(`====> customSettings7: largeData.length: ${largeData.length}`);
          const customSettings: Record<string, number | string | boolean> = {'text': largeData};
          client.setExtraConfig({
            customSettings: customSettings
          })
        })
      TextArea({
        text: '',
        placeholder: 'record 33k'
       }).width('100%')
        .id('TextArea8')
        .onWillAttachIME((client: IMEClient) => {
          console.info(`====> Vincent TextArea8 ${client.nodeId}`);
          let largeData = generatelargeData(33 * 1024 - 4)
          console.info(`====> customSettings8: largeData.length: ${largeData.length}`);
          const customSettings: Record<string, number | string | boolean> = {'text': largeData};
          client.setExtraConfig({
            customSettings: customSettings
          })
        })
      TextArea({
        text: '',
        placeholder: 'records 32k'
       }).width('100%')
        .id('TextArea9')
        .onWillAttachIME((client: IMEClient) => {
          console.info(`====> Vincent TextArea9 ${client.nodeId}`);
          const customSettings: Record<string, string> = {};
          let num = 0;
          for (let i = 0; i < 5645; i++) {
            const key = 'a' + i;
            const value: string = 'a';
            num += (key.length + value.length);
            customSettings[key] = value;
          }
          console.info(`====> Vincent TextArea9, num: ${num}`);
          client.setExtraConfig({
            customSettings
          })
        })
      TextArea({
        text: '',
        placeholder: 'records 33k'
       }).width('100%')
        .id('TextArea10')
        .onWillAttachIME((client: IMEClient) => {
          console.info(`====> Vincent TextArea10 ${client.nodeId}`);
          const customSettings: Record<string, string> = {};
          let num = 0;
          for (let i = 0; i < 5650; i++) {
            const key = 'a' + i;
            const value: string = 'a';
            num += (key.length + value.length);
            customSettings[key] = value;
          }
          console.info(`====> Vincent TextArea10, num: ${num}`);
          client.setExtraConfig({
            customSettings
          })
        })
    }
  }
}