'use static';
/*
 * Copyright (c) 2026 Kaihong Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, Level, beforeAll } from '@ohos/hypium-static/src/main/indexStatic';
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { image } from '@kit.ImageKit';
import { Driver, ON } from '@ohos.UiTest';

const DOMAIN: int = 0x0000;
const TAG: string = 'SetAbilityInstanceInfoNoPerm';
const ERR_PERMISSION: number = 201;
const BUNDLE: string = 'com.acts.setabilityinstanceinfonopermission.static';

let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let context: common.UIAbilityContext | undefined;
let color: ArrayBuffer = new ArrayBuffer(512 * 512 * 4);
let opts: image.InitializationOptions = {
  editable: true,
  pixelFormat: image.PixelMapFormat.RGBA_8888,
  size: { height: 512, width: 512 }
};
let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

async function ensureContext(): Promise<void> {
  if (context !== undefined) {
    return;
  }
  let driver = Driver.create();
  try {
    let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
    if (allowed) {
      await allowed.click();
    }
  } catch (err) {
    console.error('findComponent failed: ' + JSON.stringify(err));
  }
  let cmd = 'aa start -a EntryAbility -b ' + BUNDLE;
  let user = abilityDelegatorRegistry.getArguments().parameters['-u'];
  if (user !== undefined) {
    cmd += ' -u ' + user;
  }
  await abilityDelegator.executeShellCommand(cmd);
  await Utils.msSleep(2000);
  context = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
}

function errCode(err: Object): number {
  return (err as BusinessError).code;
}

export default function setAbilityInstanceInfoNoPermStatic(): void {
  describe('SetAbilityInstanceInfoNoPermStatic', () => {
    beforeAll(async (): Promise<void> => {
      await ensureContext();
      hilog.info(DOMAIN, TAG, 'beforeAll context ready');
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_NoPerm_201_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_NoPerm_201_static_0100
     * @tc.desc   no SET_ABILITY_INSTANCE_INFO (module+empty ACL); hard assert 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_NoPerm_201_static_0100', Level.LEVEL0,
      async (): Promise<void> => {
        try {
          await context!.setAbilityInstanceInfo('noperm_label', pixelMap);
          expect().assertFail();
        } catch (err) {
          hilog.info(DOMAIN, TAG, 'err=%{public}s', JSON.stringify(err));
          expect(errCode(err as Object)).assertEqual(ERR_PERMISSION);
        }
      });
  });
}
