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

import UIAbility from '@ohos.app.ability.UIAbility';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import abilityAccessCtrl, { Permissions, PermissionRequestResult } from '@ohos.abilityAccessCtrl';


class EntryAbility extends UIAbility {
  private isWindowReady: boolean = false;
  private hasRequestedPermission: boolean = false;

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onCreate');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onWindowStageCreate');
    windowStage.loadContent('pages/Index', (err: BusinessError<void> | null): void => {
        hilog.info(0x0000, 'testTag EntryAbility', 'loadContent entering');
        if (err?.code) {
          hilog.info(0x0000, 'testTag EntryAbility', 'loadContent error');
          return;
        }
        hilog.info(0x0000, 'testTag EntryAbility', 'loadContent ok');
        this.isWindowReady = true;
        this.requestDirectCallPermission();
      });
  }

  private requestDirectCallPermission(): void {
    if (this.hasRequestedPermission || !this.isWindowReady) {
      return;
    }
    this.hasRequestedPermission = true;
    hilog.info(0x0000, 'testTag EntryAbility', 'requestDirectCallPermission start');
    let permissionList: Permissions[] = ['ohos.permission.DIRECT_CALL'];
    let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
    atManager.requestPermissionsFromUser(this.context, permissionList).then((data: PermissionRequestResult) => {
      hilog.info(0x0000, 'testTag EntryAbility', `requestPermissionsFromUser result ${JSON.stringify(data)}`);
    }).catch((error: Error) => {
      hilog.info(0x0000, 'testTag EntryAbility', `requestPermissionsFromUser err ${JSON.stringify(error)}`);
    });
  }

  onDestroy(): Promise<void> | undefined {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'TestAbility onDestroy');
    return undefined;
  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'TestAbility onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'TestAbility onForeground');
    this.requestDirectCallPermission();
  }

  onBackground() {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'TestAbility onBackground');
  }
}