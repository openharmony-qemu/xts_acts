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

import { FormEditExtensionAbility } from '@kit.FormKit';
import { UIExtensionContentSession, Want } from '@kit.AbilityKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import hilog from '@ohos.hilog';

const TAG: string = 'FormEditExtAbility';
const DOMAIN: number = 0xF811;
const FINISH_EVENT: string = 'FMS_FormEditSetBgColorFinish_commonEvent';

export default class FormEditExtAbility extends FormEditExtensionAbility {
  private publishResult(action: string, code: number, message: string): void {
    let publishData: commonEventManager.CommonEventPublishData = {
      code: code,
      parameters: {
        'action': action,
        'message': message,
      }
    };
    commonEventManager.publish(FINISH_EVENT, publishData, (err: BusinessError) => {
      if (err) {
        hilog.error(DOMAIN, TAG, 'publish %{public}s failed, err: %{public}s', action, JSON.stringify(err));
      } else {
        hilog.info(DOMAIN, TAG, 'publish %{public}s success, code: %{public}d', action, code);
      }
    });
  }

  onSessionCreate(want: Want, session: UIExtensionContentSession): void {
    let action: string = (want.parameters?.['formEditAction'] as string) ?? '';
    hilog.info(DOMAIN, TAG, 'onSessionCreate, action: %{public}s', action);

    // color param for each case, decoded from want.parameters
    let color: string = want.parameters?.['color'] as string;
    let useNull: boolean = want.parameters?.['useNull'] as boolean;
    let useUndefined: boolean = want.parameters?.['useUndefined'] as boolean;

    let actualColor: string | null | undefined = color;
    if (useNull) {
      actualColor = null;
    } else if (useUndefined) {
      actualColor = undefined;
    }

    // loadContent to create uiContent before setWindowBackgroundColor (required for success path)
    let needLoadContent: boolean = (want.parameters?.['needLoadContent'] as boolean) ?? false;
    if (needLoadContent) {
      session.loadContent('testformeditability/pages/Index');
    }

    hilog.info(DOMAIN, TAG, '%{public}s setWindowBackgroundColor, color: %{public}s, needLoadContent: %{public}s', action, String(actualColor), String(needLoadContent));
    try {
      this.context.setWindowBackgroundColor(actualColor as string).then(() => {
        hilog.info(DOMAIN, TAG, '%{public}s setWindowBackgroundColor success', action);
        this.publishResult(action, 0, 'success');
      }).catch((error: BusinessError) => {
        hilog.info(DOMAIN, TAG, '%{public}s setWindowBackgroundColor reject, code: %{public}d', action, error.code);
        this.publishResult(action, error.code, error.message);
      });
    } catch (error) {
      let err = error as BusinessError;
      hilog.info(DOMAIN, TAG, '%{public}s setWindowBackgroundColor exception, code: %{public}d', action, err.code);
      this.publishResult(action, err.code, err.message);
    }
  }

  onSessionDestroy(session: UIExtensionContentSession): void {
    hilog.info(DOMAIN, TAG, 'onSessionDestroy');
  }
}
