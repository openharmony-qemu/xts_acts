/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import data_preferences from '@ohos.data.preferences';
import common from '@ohos.app.ability.common';

export default class FirstDialog {
  static async ChooseDialog(context: common.Context, stepTips: string, name: string) {
    let preferences = await data_preferences.getPreferences(context, 'mystore');
    let test = await preferences.get(name, 0);
    if (test !== 1) {
      AlertDialog.show({
        title: '操作提示',
        message: stepTips,
        primaryButton: {
          value: '不再提醒',
          fontColor: Color.Grey,
          action: async () => {
            await preferences.put(name, 1);
            await preferences.flush();
          }
        },
        secondaryButton: {
          value: '我已知晓',
          action: () => {
          }
        },
        cancel: () => {
        }
      });
    }
  }
}