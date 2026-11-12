'use static';
/*
 * Copyright (c) 2026 Kaihong Co., Ltd.
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
const TAG: string = 'SetAbilityInstanceInfoXlsx';
const ERR_PARAM: number = 401;
const ERR_CAPABILITY: number = 801;

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
  let cmd = 'aa start -a EntryAbility -b com.acts.startabilityforresulttest2.static';
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

function groupIdOfLen(len: int): string {
  let s: string = '';
  for (let i: int = 0; i < len; i++) {
    s += 'a';
  }
  return s;
}

export default function setAbilityInstanceInfoXlsxStatic(): void {
  describe('SetAbilityInstanceInfoXlsxStatic', () => {
    beforeAll(async (): Promise<void> => {
      await ensureContext();
      hilog.info(DOMAIN, TAG, 'beforeAll context ready');
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Call_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Call_static_0100
     * @tc.desc   setAbilityInstanceInfo call cover: valid label+icon Promise resolves
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Call_static_0100', Level.LEVEL0,
      async (): Promise<void> => {
        await context!.setAbilityInstanceInfo('xlsx_call_label', pixelMap);
        hilog.info(DOMAIN, TAG, 'Call success');
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Input_EmptyLabel_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Input_EmptyLabel_static_0100
     * @tc.desc   setAbilityInstanceInfo input cover: empty label expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Input_EmptyLabel_static_0100', Level.LEVEL0,
      async (): Promise<void> => {
        try {
          await context!.setAbilityInstanceInfo('', pixelMap);
          expect().assertFail();
        } catch (err) {
          expect(errCode(err as Object)).assertEqual(ERR_PARAM);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Spec_Group64_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Spec_Group64_static_0100
     * @tc.desc   setAbilityInstanceInfo spec: groupId length=64; expect 801 on non-2in1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Spec_Group64_static_0100', Level.LEVEL0,
      async (): Promise<void> => {
        let groupId: string = groupIdOfLen(64 as int);
        expect(groupId.length).assertEqual(64);
        try {
          await context!.setAbilityInstanceInfo('label_g64', pixelMap, groupId);
          expect().assertFail();
        } catch (err) {
          expect(errCode(err as Object)).assertEqual(ERR_CAPABILITY);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Spec_Group65_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Spec_Group65_static_0100
     * @tc.desc   setAbilityInstanceInfo spec: groupId length=65 expect 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Spec_Group65_static_0100', Level.LEVEL0,
      async (): Promise<void> => {
        let groupId: string = groupIdOfLen(65 as int);
        expect(groupId.length).assertEqual(65);
        try {
          await context!.setAbilityInstanceInfo('label_g65', pixelMap, groupId);
          expect().assertFail();
        } catch (err) {
          expect(errCode(err as Object)).assertEqual(ERR_PARAM);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Return_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Return_static_0100
     * @tc.desc   setAbilityInstanceInfo return cover: Promise<void> resolves
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Return_static_0100', Level.LEVEL0,
      async (): Promise<void> => {
        await context!.setAbilityInstanceInfo('xlsx_return_label', pixelMap);
        expect(context !== undefined).assertTrue();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Err_801_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Err_801_static_0100
     * @tc.desc   setAbilityInstanceInfo error 801 with groupId on non-multi-instance device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_SetAbilityInstanceInfo_Err_801_static_0100', Level.LEVEL0,
      async (): Promise<void> => {
        try {
          await context!.setAbilityInstanceInfo('xlsx_err801', pixelMap, 'group_801');
          expect().assertFail();
        } catch (err) {
          expect(errCode(err as Object)).assertEqual(ERR_CAPABILITY);
        }
      });
  });
}
