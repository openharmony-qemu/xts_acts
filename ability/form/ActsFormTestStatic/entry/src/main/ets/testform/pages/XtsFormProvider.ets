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

import { Text, Component, Column, Button, ClickEvent, Entry } from '@ohos.arkui.component';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import formProvider from '@ohos.app.form.formProvider';
import Want from '@ohos.app.ability.Want';

const DOMAIN: int = 0x0000;
const TAG: string = 'testTag';

@Entry
@Component
struct XtsFormProvider {
  aboutToAppear() {
    hilog.info(DOMAIN, TAG, 'XtsFormProvider enter');

    let formId: string = '3610022740'; //用hap包装好的应用的卡片id
    try {
      formProvider.setFormNextRefreshTime(formId, 2, (error: BusinessError<void> | null) => {
        if (error?.code) {
          hilog.info(DOMAIN, TAG, `XtsFormProvider callback error, code:${error?.code}`);
        }
        hilog.info(DOMAIN, TAG, 'XtsFormProvider setFormNextRefreshTime callback success');
      });
      hilog.info(DOMAIN, TAG, 'XtsFormProvider setFormNextRefreshTime register success');
    } catch (error) {
      hilog.info(DOMAIN, TAG, 'XtsFormProvider catch error');
    }

    let formId2: string = '21347330770'; //用hap包装好的应用的卡片id
    try {
      formProvider.setFormNextRefreshTime(formId2, 3).then(() => {
        hilog.info(DOMAIN, TAG, `XtsFormProvider setFormNextRefreshTime success`);
      }).catch((error) => {
        hilog.info(DOMAIN, TAG, `XtsFormProvider promise error, code:`);
      });
      hilog.info(DOMAIN, TAG, 'XtsFormProvider setFormNextRefreshTime register success');
    } catch (error) {
      hilog.info(DOMAIN, TAG, `XtsFormProvider catch error, code: `);
    }
  }

  build() {
    Column(undefined) {
      Text('XTS FormProvider').fontSize(20)

      Button('openFormManagerCrossBundle success').backgroundColor('#ff35e288')
        .onClick((event: ClickEvent) => {
          hilog.info(DOMAIN, TAG, 'onClick openFormManagerCrossBundle');
          let want: Want = {
            bundleName: 'com.example.actsformtest.static',
            abilityName: 'EntryAbility',
            parameters: {
              'ohos.extra.param.key.form_dimension': 2,
              'ohos.extra.param.key.form_name': 'widget',
              'ohos.extra.param.key.module_name': 'entry'
            } as Record<string, Object>
          };
          try {
            formProvider.openFormManagerCrossBundle(want)
            hilog.info(DOMAIN, TAG, '%{public}s', `formProvider openFormManagerCrossBundle success`);
          } catch (error: BusinessError) {
            hilog.info(DOMAIN, TAG, '%{public}s', `openFormManagerCrossBundle error: ${error.code}, ${error.message}`);
          }
        })

      Button('openFormManagerCrossBundle error').backgroundColor('#ff35e288')
        .onClick((event: ClickEvent) => {
          hilog.info(DOMAIN, TAG, 'onClick openFormManagerCrossBundle');
          let want: Want = {};
          try {
            formProvider.openFormManagerCrossBundle(want)
            hilog.info(DOMAIN, TAG, '%{public}s', `formProvider openFormManagerCrossBundle success`);
          } catch (error: BusinessError) {
            hilog.info(DOMAIN, TAG, '%{public}s', `openFormManagerCrossBundle error: ${JSON.stringify(error)}`);
              hilog.info(DOMAIN, TAG, '%{public}s', `openFormManagerCrossBundle error.code: ${error.code}`);
          }
        })
    }
  }
}
