/*
 * Copyright (c) 2023-2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import { OverlayModuleInfo } from 'bundleManager.OverlayModuleInfo';
import overlay from '@ohos.bundle.overlay';

let bundleName = "com.example.overLayTest";
let moduleName = "library";
let MODULE_NAME1 = "test1";
let moduleName2 = "entry";
let isEnabled = true;

export default function setOverlayEnabled() {
  describe('setOverlayEnabled',  () =>{

    /**
     * @tc.number: Sub_Bms_Framework_Status_OverlayEnable_static_0100
     * @tc.name: Sub_Bms_Framework_Status_OverlayEnable_static_0100
     * @tc.desc: Failed to set when the incoming moduleName is empty
     */
    it("Sub_Bms_Framework_Status_OverlayEnable_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          overlay.setOverlayEnabled("", true, (err: BusinessError<void> | null) => {
            if (err && err.code != 0) {
              hilog.error(0x0000, 'testParamTag', 'o1 setOverlayEnabled callback failed: %{public}s',
                JSON.stringify(err));
              expect(err?.code).assertEqual(401);
              done();
            } else {
              hilog.info(0x0000, 'testParamTag', 'o1 setOverlayEnabled success');
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          let code = (error as BusinessError).code;
          let message = (error as BusinessError).message;
          hilog.error(0x0000, 'testParamTag', 'setOverlayEnabled failed ' + message + " " + code);
          expect(code).assertEqual(401);
          done();
        }

        await Utils.msSleep(1000);
        try {
          overlay.setOverlayEnabled("", true)
            .then((): void => {
              hilog.info(0x0000, 'testParamTag', 'o2 setOverlayEnabled Promise success');
              expect().assertFail();
              done();
            }, (err: BusinessError<void>): void => {
              hilog.error(0x0000, 'testParamTag', 'o2 setOverlayEnabled Promise then failed: %{public}s',
                JSON.stringify(err));
              expect(err.code).assertEqual(401);
              done();
            })
        } catch (error) {
          let code = (error as BusinessError).code;
          let message = (error as BusinessError).message;
          hilog.error(0x0000, 'testParamTag', 'setOverlayEnabled failed ' + message + " " + code);
          expect(code).assertEqual(401);
          done();
        }
      })

    /*
     * @tc.number: Sub_Bms_Framework_Status_OverlayEnable_static_0500
     * @tc.name: Sub_Bms_Framework_Status_OverlayEnable_static_0500
     * @tc.desc: Failed to set when the incoming moduleName is not installed
     */
    it("Sub_Bms_Framework_Status_OverlayEnable_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        overlay.setOverlayEnabled(MODULE_NAME1, true)
          .then((): void => {
            hilog.info(0x0000, 'testParamTag', 'o2 setOverlayEnabled Promise success');
            expect().assertFail();
            done();
          }, (err: BusinessError<void>): void => {
            hilog.error(0x0000, 'testParamTag', 'o2 setOverlayEnabled Promise then failed: %{public}s', JSON.stringify(err));
            expect(err.code).assertEqual(17700002);
            done();
          })
        await Utils.msSleep(1000);
        overlay.setOverlayEnabled(MODULE_NAME1, true, (err: BusinessError<void> | null) => {
          if (err && err.code != 0) {
            hilog.error(0x0000, 'testParamTag', 'o1 setOverlayEnabled callback failed: %{public}s', JSON.stringify(err));
            expect(err?.code).assertEqual(17700002);
            done();
          } else {
            hilog.info(0x0000, 'testParamTag', 'o1 setOverlayEnabled success');
            expect().assertFail();
            done();
          }
        });
      })

    /*
     * @tc.number: Sub_Bms_Framework_Status_OverlayEnable_static_0600
     * @tc.name: Sub_Bms_Framework_Status_OverlayEnable_static_0600
     * @tc.desc: Failed to set when the incoming moduleName is not overlay
     */
    it("Sub_Bms_Framework_Status_OverlayEnable_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        overlay.setOverlayEnabled(moduleName2, true, (err: BusinessError<void> | null) => {
          if (err && err.code != 0) {
            hilog.error(0x0000, 'testParamTag', 'o1 setOverlayEnabled callback failed: %{public}s', JSON.stringify(err));
            expect(err?.code).assertEqual(17700033);
            done();
          } else {
            hilog.info(0x0000, 'testParamTag', 'o1 setOverlayEnabled success');
            expect().assertFail();
            done();
          }
        });
        await Utils.msSleep(1000);
        overlay.setOverlayEnabled(moduleName2, true)
          .then((): void => {
            hilog.info(0x0000, 'testParamTag', 'o2 setOverlayEnabled Promise success');
            expect().assertFail();
            done();
          }, (err: BusinessError<void>): void => {
            hilog.error(0x0000, 'testParamTag', 'o2 setOverlayEnabled Promise then failed: %{public}s', JSON.stringify(err));
            expect(err.code).assertEqual(17700033);
            done();
          })

      })

  })
}