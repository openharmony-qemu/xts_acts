/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import FormExtension from '@ohos.app.form.FormExtensionAbility';
import formBindingData from '@ohos.application.formBindingData';
import formInfo from '@ohos.application.formInfo';
import Want from '@ohos.app.ability.Want';
import { Configuration } from '@ohos.app.ability.Configuration';
import { BusinessError } from '@ohos.base';

interface FormWeatherData {
  temperature: string;
  time: string;
  area: string;
}

interface FormProxyItem {
  key: string;
  subscriberId: string;
}

export default class FormAbility extends FormExtension {
  onAddForm(want: Want) {
    console.info('FormAbility onCreate');
    let formData: FormWeatherData = {
      temperature: '11°',
      time: '11:00',
      area: 'Shenyang'
    };
    console.info('FormAbility onCreate===StarAbility=== ');
    let startWant: Want = {
      bundleName: 'com.example.apicoverhaptest',
      abilityName: 'SecondAbility'
    };
    this.context.startAbility(startWant)
      .then((data: Object) => {
        console.info('FormAbility startAbility success');
      })
      .catch((err: BusinessError) => {
        console.info('FormAbility startAbility failed ' + err.code);
      });
    console.info('FormAbility onCreate===end=== ');
    return formBindingData.createFormBindingData(formData);
  }

  onCastToNormalForm(formId: string) {
    console.info('FormAbility onCastToNormalForm===end=== ' + formId);
  }

  onUpdateForm(formId: string) {
    console.info('FormAbility onUpdateForm===end=== ' + formId);
    let formData: Record<string, Object> = {};
    let proxies: FormProxyItem[] = [
      {
        key: 'detail',
        subscriberId: '11'
      }
    ];
    let formBinding = formBindingData.createFormBindingData(formData);
    formBinding['proxies'] = proxies;
  }

  onChangeFormVisibility(newStatus: Record<string, number>) {
    console.info('FormAbility onChangeFormVisibility===end=== ' + newStatus);
  }

  onFormEvent(formId: string, message: string) {
    console.info('FormAbility onFormEvent===end=== ' + message);
  }

  onRemoveForm(formId: string) {
    console.info('FormAbility onRemoveForm===end=== ' + formId);
  }

  onAcquireFormState(want: Want) {
    console.info('FormAbility want success' + JSON.stringify(want.parameters));
    return formInfo.FormState.READY;
  }

  onConfigurationUpdate(config: Configuration) {
    console.log('[Demo] FormAbility onConfigurationUpdate: ' + this.context.config.language);
    console.log('[Demo] FormAbility onConfigurationUpdate: ' + config.language);
  }
}
