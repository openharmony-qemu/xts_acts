/*
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

import { Text, Column,
  FormComponent, FormCallbackInfo, Visibility, FormDimension,
  Component, Entry, Button, ClickEvent } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import formHost from '@ohos.app.form.formHost';
import formInfo from '@ohos.app.form.formInfo';


const DOMAIN: int = 0x0000;
const TAG: string = 'testTag';

@Entry
@Component
struct XtsFormComponent {
  aboutToAppear() {
    hilog.info(DOMAIN, TAG, 'XtsFormComponent enter');
  }
  @State formId: string = '0';
  @State deviceId: string = '0';

  build() {
    Column() {
      Text('XTS FormComponent')
        .fontSize(20)
      FormComponent({
        id: this.formId,
        name: 'widget',
        bundle: 'com.example.actsformtest.static',
        ability: 'EntryFormAbility',
        module: 'entry',
        dimension: FormDimension.Dimension_2_2,
        temporary: true
      })
        .allowUpdate(true)
        .visibility(Visibility.Visible)
        .width(300)
        .height(300)
        .onAcquired((form: FormCallbackInfo) => {
          hilog.info(DOMAIN, TAG, `form info: ${JSON.stringify(form)}`);
          // Invalid form id
          if (form.id == -1) {
            this.formId = form.idString;
          } else {
            this.formId = form.id.toString();
          }
        })
        .onUninstall((form: FormCallbackInfo) => {
          hilog.info(DOMAIN, TAG, `uninstall form success : ${JSON.stringify(form)}`);
          // Invalid form id
          if (form.id == -1) {
            this.formId = form.idString;
          } else {
            this.formId = form.id.toString();
          }
        })
        .onUpdate((form: FormCallbackInfo) => {
          hilog.info(DOMAIN, TAG, `form update done : ${JSON.stringify(form)}`);
        })
    }
  }
}
