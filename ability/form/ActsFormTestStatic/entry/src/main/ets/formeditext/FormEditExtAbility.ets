'use static';
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

const TAG: string = 'FormEditExtAbility';
const FINISH_EVENT: string = 'FMS_FormEditSetBgColorFinish_Static_commonEvent';

export default class FormEditExtAbility extends FormEditExtensionAbility {
  private publishResult(action: string, code: number, message: string): void {
    let publishData: commonEventManager.CommonEventPublishData = {
      code: code.toInt(),
      parameters: {
        'action': action,
        'message': message,
      }
    };
    commonEventManager.publish(FINISH_EVENT, publishData, (err: BusinessError | null): void => {
      if (err) {
        console.error(`${TAG} publish ${action} failed, err: ${JSON.stringify(err)}`);
      } else {
        console.info(`${TAG} publish ${action} success, code: ${code}`);
      }
    });
  }

  onSessionCreate(want: Want, session: UIExtensionContentSession): void {
    let action: string = typeof want.parameters?.['formEditAction'] === 'string' ? (want.parameters?.['formEditAction'] as string) : '';
    console.info(`${TAG} onSessionCreate, action: ${action}`);

    let color: string = typeof want.parameters?.['color'] === 'string' ? (want.parameters?.['color'] as string) : '';
    let useNull: boolean = typeof want.parameters?.['useNull'] === 'boolean' ? (want.parameters?.['useNull'] as boolean) : false;
    let useUndefined: boolean = typeof want.parameters?.['useUndefined'] === 'boolean' ? (want.parameters?.['useUndefined'] as boolean) : false;

    let actualColor: string = color;
    if (useNull) {
      actualColor = 'null';
    } else if (useUndefined) {
      actualColor = 'undefined';
    }

    // loadContent to create uiContent before setWindowBackgroundColor (required for success path)
    let needLoadContent: boolean = typeof want.parameters?.['needLoadContent'] === 'boolean' ? (want.parameters?.['needLoadContent'] as boolean) : false;
    if (needLoadContent) {
      session.loadContent('formeditext/pages/Index');
    }

    console.info(`${TAG} ${action} setWindowBackgroundColor, color: ${actualColor}, needLoadContent: ${needLoadContent}`);
    try {
      this.formEditContext.setWindowBackgroundColor(actualColor).then((): void => {
        console.info(`${TAG} ${action} setWindowBackgroundColor success`);
        this.publishResult(action, 0, 'success');
      }).catch((error: Error): void => {
        let err: BusinessError = error as BusinessError;
        console.info(`${TAG} ${action} setWindowBackgroundColor reject, code: ${err.code}`);
        this.publishResult(action, err.code, err.message);
      });
    } catch (error) {
      let err: BusinessError = error as BusinessError;
      console.info(`${TAG} ${action} setWindowBackgroundColor exception, code: ${err.code}`);
      this.publishResult(action, err.code, err.message);
    }
  }

  onSessionDestroy(session: UIExtensionContentSession): void {
    console.info(`${TAG} onSessionDestroy`);
  }
}
