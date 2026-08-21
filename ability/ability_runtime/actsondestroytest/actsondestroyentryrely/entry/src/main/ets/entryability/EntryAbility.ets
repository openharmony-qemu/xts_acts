/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import commonEvent from '@ohos.commonEventManager';
import common from '@ohos.app.ability.common';

const TERMIN_TIMEOUT = 1000;
const START_TIMEOUT = 500;
let param: string = '';

function onDestroy0200(context: common.UIAbilityContext): void {
  setTimeout(() => {
    context.terminateSelf().then(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', `EntryAbility terminateSelf success onDestroy0200`);
    }).catch((err: BusinessError) => {
      hilog.info(0x0000, 'testTag', '%{public}s', `EntryAbility terminateSelf failed, err is: ${JSON.stringify(err)}`);
    })
  }, TERMIN_TIMEOUT)
  setTimeout(() => {
    context.startAbility({
      bundleName: 'com.example.abilitystageondestroytest',
      moduleName: 'second',
      abilityName: 'SecondAbility',
      parameters: {
        parameter: param
      }
    }).then(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', `EntryAbility startAbility success onDestroy0200`);
    }).catch((err: BusinessError) => {
      hilog.info(0x0000, 'testTag', '%{public}s',
        `onDestroy0200 EntryAbility startAbility failed, err is: ${JSON.stringify(err)}`);
    })
  }, START_TIMEOUT)
}

function onDestroy0300(context: common.UIAbilityContext): void {
  setTimeout(() => {
    context.startAbility({
      bundleName: 'com.example.abilitystageondestroytest',
      moduleName: 'entry',
      abilityName: 'OtherAbility',
      parameters: {
        parameter: param
      }
    }).then(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', `onDestroy0300 EntryAbility startAbility success`);
    }).catch((err: BusinessError) => {
      console.error(param, `onDestroy0300 EntryAbility startAbility failed, err is: ${JSON.stringify(err)}`);
    })
  }, START_TIMEOUT)
  setTimeout(() => {
    context.terminateSelf().then(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', `onDestroy0300 EntryAbility terminateSelf success`);
      commonEvent.publish('Acts_EntryAbilityTerminate', (err) => {
        hilog.info(0x0000, 'testTag', '%{public}s', `onDestroy0300 EntryAbility terminateSelf publish err`);
      })
    }).catch((err: BusinessError) => {
      hilog.info(0x0000, 'testTag', '%{public}s',
        `onDestroy0300 EntryAbility terminateSelf failed, err is : ${JSON.stringify(err)}`);
    })
  }, TERMIN_TIMEOUT)
}

function onDestroy0400(context: common.UIAbilityContext): void {
  setTimeout(() => {
    context.startAbility({
      bundleName: 'com.example.abilitystageondestroytest',
      moduleName: 'entry',
      abilityName: 'OtherAbility',
      parameters: {
        parameter: param
      }
    }).then(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', `OnDestroy_0500 EntryAbility startAbility success`);
    }).catch((err: BusinessError) => {
      console.error(param, `OnDestroy_0500 EntryAbility startAbility failed, err is: ${JSON.stringify(err)}`);
    })
  }, START_TIMEOUT)
  setTimeout(() => {
    context.terminateSelf().then(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', `OnDestroy_0500 EntryAbility terminateSelf success`);
    }).catch((err: BusinessError) => {
      hilog.info(0x0000, 'testTag', '%{public}s',
        `OnDestroy_0500 EntryAbility terminateSelf failed, err is : ${JSON.stringify(err)}`);
    })
  }, TERMIN_TIMEOUT)
}

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', `Ability onCreate want: ${JSON.stringify(Want)}`);
    param = want.parameters?.param as string;
    1111
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Entry Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err: BusinessError, data: void) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
    if (param === 'AbilityStage_OnDestroy_0300') {
      onDestroy0300(this.context);
    }
    if (param === 'AbilityStage_OnDestroy_0500') {
      setTimeout(() => {
        this.context.startAbility({
          bundleName: 'com.example.abilitystageondestroytest',
          moduleName: 'second',
          abilityName: 'SecondAbility',
          parameters: {
            parameter: 'AbilityStage_OnDestroy_0500_EntryAbility'
          }
        }).then(() => {
          hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityStage_OnDestroy_0500 Ability onDestroy');
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, 'testTag', '%{public}s',
            'AbilityStage_OnDestroy_0500 EntryAbility startAbility failed, err is: ${JSON.stringify(err)}');
        })
      }, START_TIMEOUT)
    }
    if (param === 'AbilityStage_OnDestroy_0400') {
      onDestroy0400(this.context);
    }
  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
    if (param === 'AbilityStage_OnDestroy_0100') {
      setTimeout(() => {
        this.context.terminateSelf().then(() => {
          hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityStage_OnDestroy_0100 EntryAbility terminateSelf success');
        }).catch((err: BusinessError) => {
          hilog.info(0x0000, 'testTag', '%{public}s',
            'AbilityStage_OnDestroy_0100 EntryAbility terminateSelf failed, err is: ${JSON.stringify(err)}');
        })
      }, TERMIN_TIMEOUT)
    }
    if (param === 'AbilityStage_OnDestroy_0200') {
      onDestroy0200(this.context);
    }
  }

  onBackground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
