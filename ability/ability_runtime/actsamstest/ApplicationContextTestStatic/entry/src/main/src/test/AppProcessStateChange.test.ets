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
import { describe, expect, it, Level } from '@ohos/hypium-static/src/main/indexStatic';
import {
  AppProcessStateObserver,
  appManager,
  common
} from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog';

const TAG: string = 'AppProcessStateChangeStatic';
const ERR_INTERNAL: number = 16000050;
const ERR_OBSERVER_LIMIT: number = 16000165;
const ERR_OBSERVER_NOT_EXIST: number = 16300004;

function isOnErr(code: number): boolean {
  return code === ERR_INTERNAL || code === ERR_OBSERVER_LIMIT;
}

function isOffErr(code: number): boolean {
  return code === ERR_INTERNAL || code === ERR_OBSERVER_NOT_EXIST;
}

function getAppContext(): common.ApplicationContext {
  let uiCtx = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as
    common.UIAbilityContext;
  return uiCtx.getApplicationContext();
}

function makeObserver(): AppProcessStateObserver {
  return {
    onProcessCreated(_data: appManager.ProcessData): void {
    },
    onProcessDied(_data: appManager.ProcessData): void {
    }
  };
}

export default function appProcessStateChangeStaticTest(): void {
  describe('AppProcessStateChangeStaticTest', () => {
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppProcessStateChange_On_static_0100
     * @tc.number SUB_Ability_AbilityRuntime_AppProcessStateChange_On_static_0100
     * @tc.desc   onAppProcessStateChange valid observer; success or 16000050/16000165
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppProcessStateChange_On_static_0100', Level.LEVEL0,
      (): void => {
        let appCtx: common.ApplicationContext = getAppContext();
        let observer = makeObserver();
        try {
          appCtx.onAppProcessStateChange(observer);
          try {
            appCtx.offAppProcessStateChange(observer);
          } catch (offErr) {
            let e = offErr as BusinessError;
            expect(isOffErr(e.code)).assertTrue();
          }
        } catch (err) {
          let e = err as BusinessError;
          hilog.info(0x0000, TAG, 'on err=%{public}d', e.code);
          expect(isOnErr(e.code)).assertTrue();
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppProcessStateChange_Off_static_0200
     * @tc.number SUB_Ability_AbilityRuntime_AppProcessStateChange_Off_static_0200
     * @tc.desc   offAppProcessStateChange unregistered observer; 16300004 or 16000050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppProcessStateChange_Off_static_0200', Level.LEVEL0,
      (): void => {
        let appCtx: common.ApplicationContext = getAppContext();
        let observer = makeObserver();
        try {
          appCtx.offAppProcessStateChange(observer);
        } catch (err) {
          let e = err as BusinessError;
          expect(isOffErr(e.code)).assertTrue();
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppProcessStateChange_Off_static_0300
     * @tc.number SUB_Ability_AbilityRuntime_AppProcessStateChange_Off_static_0300
     * @tc.desc   offAppProcessStateChange no-arg clears listeners; success or 16000050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppProcessStateChange_Off_static_0300', Level.LEVEL0,
      (): void => {
        let appCtx: common.ApplicationContext = getAppContext();
        try {
          appCtx.offAppProcessStateChange();
        } catch (err) {
          let e = err as BusinessError;
          expect(e.code === ERR_INTERNAL).assertTrue();
        }
      });
  });
}
