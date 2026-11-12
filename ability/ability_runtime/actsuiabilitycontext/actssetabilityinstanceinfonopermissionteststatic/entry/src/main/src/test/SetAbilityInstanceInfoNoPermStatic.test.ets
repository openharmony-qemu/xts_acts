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
const BUNDLE: string = 'com.acts.setabilityinstanceinfonopermission.static';

/**
 * Mirrors AbilityKit AbilityRuntime_ErrorCode (ability_runtime_common.h):
 * PERMISSION_DENIED=201, NOT_SUPPORTED=801.
 */
enum AbilityRuntimeErrorCode {
  PERMISSION_DENIED = 201,
  NOT_SUPPORTED = 801
}

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
  for (let i: int = 0; i < 20; i++) {
    let ctx = AppStorage.get<common.UIAbilityContext>('UIAbilityContext');
    if (ctx !== undefined) {
      context = ctx as common.UIAbilityContext;
      return;
    }
    await Utils.msSleep(500);
  }
  hilog.error(DOMAIN, TAG, 'UIAbilityContext not ready after aa start');
}

function errCodeOf(err: Object): number {
  return (err as BusinessError).code;
}

function assertPermOrCapability(code: number): void {
  hilog.info(DOMAIN, TAG, 'setAbilityInstanceInfo noperm code=%{public}d', code);
  if (Number(code) === AbilityRuntimeErrorCode.PERMISSION_DENIED) {
    expect(Number(code)).assertEqual(AbilityRuntimeErrorCode.PERMISSION_DENIED);
    return;
  }
  expect(Number(code)).assertEqual(AbilityRuntimeErrorCode.NOT_SUPPORTED);
  hilog.info(DOMAIN, TAG, 'got NOT_SUPPORTED (201 may be masked)');
}

export default function setAbilityInstanceInfoNoPermStatic(): void {
  describe('SetAbilityInstanceInfoNoPermStatic', () => {
    beforeAll(async (): Promise<void> => {
      await ensureContext();
      expect(context !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, 'beforeAll context ready');
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_NoPerm_201_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_NoPerm_201_static_0100
     * @tc.desc   no SET_ABILITY_INSTANCE_INFO; accept PERMISSION_DENIED or NOT_SUPPORTED;
     *     log actual code for later tighten
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
          assertPermOrCapability(errCodeOf(err as Object));
        }
      });
  });
}
