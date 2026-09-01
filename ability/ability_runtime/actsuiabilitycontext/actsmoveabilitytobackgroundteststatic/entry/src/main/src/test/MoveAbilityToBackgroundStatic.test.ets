'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import {  afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level  } from '../../../hypium/index';
import { Driver, MatchPattern, ON, Component } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import CommonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from './Util.test';
import systemParameterEnhance from '@ohos.systemParameterEnhance';

export default function moveAbilityToBackgroundTest(): void {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
  let driver = Driver.create();
  let mpEnable = '';
  describe('ActsMoveAbilityToBackgroundTest', () => {
    beforeAll(async () => {
      try {
        mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.move_ui_ability_to_background_api_enable', 'false');
      } catch(err) {
        console.error(`MoveAbilityToBackground Get system parameter error: ${JSON.stringify(err)}`);
      }
      console.log(`MoveAbilityToBackground Get system parameter mpEnable is ${mpEnable}`);
      let allowed: Component | null = null;
      try {
        allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
      } catch (e) {
        console.log('advanced_dialog_button_0 not found');
      }
      if (allowed) {
        await allowed.click();
      }
    });
    beforeEach(() => {
    });
    afterEach(async () => {
      let abilityCtx: common.UIAbilityContext | undefined = AppStorage.get<common.UIAbilityContext>('abilityContext');
      if (abilityCtx != undefined) {
        abilityCtx.terminateSelf();
      }
      
    });
    afterAll(() => {
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_MoveAbilityToBackground_0100
     * @tc.number SUB_Ability_AbilityRuntime_MoveAbilityToBackground_0100
     * @tc.desc   expect current ability moved to background and onBackground() called.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_MoveAbilityToBackground_0100', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
      let tag = `SUB_Ability_AbilityRuntime_MoveAbilityToBackground_0100`;
      console.log(`${tag}, it begin`);
      if (mpEnable === 'true') {
        try {
          let cmd = "aa start -b com.acts.moveabilitytobgtest.static -a EntryAbility";
          let user = AbilityDelegatorRegistry.getArguments().parameters["-u"];
          if(user !== undefined){
              cmd += ' -u ' + user;
          }
          abilityDelegator.executeShellCommand(cmd);
          let buttonPromise: Promise<Component | null> = driver.waitForComponent(ON.text("Move To background"), 4000);
          let subscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
            events: ['Acts_onBackground_MoveAbilityToBackground_Event_1']
          };
          let subscriber = CommonEventManager.createSubscriberSync(subscribeInfo);
          let subscribeCB = (err: BusinessError<void> | null, data: CommonEventManager.CommonEventData | undefined) => {
            if (err) {
              console.error(`receive event failed, code is ${err?.code}, message is ${err?.message}`);
              expect().assertFail();
              resolve(undefined);
            } else {
              console.info(`receive event success, event:${data?.event}`);
              if (data?.event == 'Acts_onBackground_MoveAbilityToBackground_Event_1') {
                unSubscribe(subscriber, () => { resolve(undefined); });
              }
            }
          }
          CommonEventManager.subscribe(subscriber, subscribeCB);
          buttonPromise.then((button: Component | null): void => {
            if (button != null) {
              button.click();
            }
          });
          // 静态运行时 TestAbility 前台生命周期需主线程执行：不能阻塞主线程等待
          // （msSleep 阻塞主线程 → 生命周期回调无法派发 → 设备 LIFECYCLE_HALF_TIMEOUT 冻结），
          // 改定时器兜底，用例完成由订阅回调驱动
          setTimeout(() => {
            console.error(`${tag}, timeout`);
            resolve(undefined);
            expect().assertFail();
          }, 5000);
        } catch (err) {
          console.error(`${tag} error, errorCode: ${JSON.stringify(err)}`);
          expect().assertFail();
          resolve(undefined);
        }
      }else if(mpEnable === 'false') {
        console.error(`${tag} error, current device not support MoveAbilityToBackground,please check: ${JSON.stringify(mpEnable)}`);
        resolve(undefined);
      }else{
        console.error(`${tag} error, current device get MoveAbilityToBackground config fail,please check: ${JSON.stringify(mpEnable)}`);
        expect().assertFail();
        resolve(undefined);
      }
      
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })
  })
}

let unSubscribeDone: () => void = () => {};
function unSubscribe(subscriber: CommonEventManager.CommonEventSubscriber, callback: () => void) {
  unSubscribeDone = callback;
  let unSubscribeCB = (err: BusinessError<void> | null) => {
    if (err) {
      console.error(`unsubscribe failed, code is ${err?.code}, message is ${err?.message}`);
    } else {
      console.info("unsubscribe success");
    }
    unSubscribeDone();
  };
  CommonEventManager.unsubscribe(subscriber, unSubscribeCB);
}

function sleep(time: int): Promise<void> {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve(undefined);
    }, time);
  });
}
