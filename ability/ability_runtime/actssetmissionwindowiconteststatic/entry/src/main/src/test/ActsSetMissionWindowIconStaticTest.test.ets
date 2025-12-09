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

import { describe, it, expect, TestType, Size, Level, beforeAll,beforeEach } from "../../../hypium/index"
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import image from "@ohos.multimedia.image";
import { AppStorage } from '@ohos.arkui.stateManagement';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
let testAbilityContext: common.UIAbilityContext;
export default function ActsSetMissionWindowIconStaticTest() {
  describe('ActsSetMissionWindowIconStaticTest', () => {
    beforeEach(() => {
      console.info('beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.setmissionicon.static")
      await Utils.msSleep(5000);
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
      console.info('beforeAll end');
    })

    /**
     * @tc.number  SUB_Ability_AbilityRuntime_setMissionWindowIcon_0100
     * @tc.name    SUB_Ability_AbilityRuntime_setMissionWindowIcon_0100
     * @tc.desc    test setMissionWindowIcon interface success
     * @tc.size    Large-scaleTest
     * @tc.type    Interface
     * @tc.level   Level 3
     */
    it('SUB_Ability_AbilityRuntime_setMissionWindowIcon_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_setMissionWindowIcon_0100';
        hilog.info(0x0000, TEST_CASE_NAME, `start`);
        let imagePixelMap: image.PixelMap;
        let color = new ArrayBuffer(50 * 50 * 4);
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 0;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 255;
        }
        image.createPixelMap(color, {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 50, width: 50 }
        }).then((data) => {
          imagePixelMap = data;
          testAbilityContext.setMissionWindowIcon(imagePixelMap)
              .then((idata) => {
                expect(idata).assertEqual(undefined);
                console.info('idata'+idata);
                console.info('setMissionWindowIcon succeed');
                done();
              })
              .catch((err: BusinessError):void => {
                console.error(`setMissionWindowIcon failed, code is ${err.code}, message is ${err.message}`);
                expect(err.code).assertEqual(801);
                done();
              });
        }).catch((err: BusinessError):void => {
          console.error(`createPixelMap failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      })
  })
}