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
import {
  afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level
} from '@ohos/hypium-static/src/main/indexStatic';
import { Driver, ON, Component } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import CommonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import systemParameterEnhance from '@ohos.systemParameterEnhance';

const ERR_MOVE_NOT_FOREGROUND: int = 16000065;
const ERR_MOVE_INVALID_CONTEXT: int = 16000061;

async function shellSleep(sec: string): Promise<void> {
  let delegator = AbilityDelegatorRegistry.getAbilityDelegator();
  await delegator.executeShellCommand('sleep ' + sec);
}

async function terminateEntryAbilityBestEffort(): Promise<void> {
  let entryCtx: common.UIAbilityContext | undefined =
    AppStorage.get<common.UIAbilityContext>('UIAbilityContext');
  if (entryCtx == undefined) {
    return;
  }
  let settled: boolean = false;
  entryCtx.terminateSelf().then((): void => {
    settled = true;
  }).catch((): void => {
    settled = true;
  });
  for (let i = 0; i < 20; i++) {
    if (settled) {
      break;
    }
    await shellSleep('0.1');
  }
  AppStorage.setOrCreate<common.UIAbilityContext | undefined>('UIAbilityContext', undefined);
  AppStorage.setOrCreate<string>('onBackground', '');
}

async function startEntryAndGetContext(
  delegator: AbilityDelegatorRegistry.AbilityDelegator
): Promise<common.UIAbilityContext> {
  let cmd = 'aa start -a EntryAbility -b com.acts.moveabilitytobgtest.static';
  let user = AbilityDelegatorRegistry.getArguments().parameters['-u'];
  if (user !== undefined) {
    cmd += ' -u ' + user;
  }
  await delegator.executeShellCommand(cmd);
  for (let i = 0; i < 30; i++) {
    let ctx: common.UIAbilityContext | undefined =
      AppStorage.get<common.UIAbilityContext>('UIAbilityContext');
    if (ctx != undefined) {
      await shellSleep('0.3');
      return ctx;
    }
    await shellSleep('0.2');
  }
  throw new Error('EntryAbility UIAbilityContext not ready');
}

async function waitOnBackgroundSuccess(): Promise<boolean> {
  for (let i = 0; i < 40; i++) {
    if ((AppStorage.get<string>('onBackground') + '') === 'SUCCESS') {
      return true;
    }
    await shellSleep('0.1');
  }
  return (AppStorage.get<string>('onBackground') + '') === 'SUCCESS';
}

async function moveTwiceExpectSecond65(context: common.UIAbilityContext): Promise<void> {
  AppStorage.setOrCreate<string>('onBackground', '');
  try {
    await context.moveAbilityToBackground();
  } catch (err) {
    if (err instanceof BusinessError && err.code === ERR_MOVE_INVALID_CONTEXT) {
      return;
    }
    throw err;
  }
  let okBg: boolean = await waitOnBackgroundSuccess();
  expect(okBg).assertTrue();
  await shellSleep('0.2');
  try {
    await context.moveAbilityToBackground();
    console.log('0200 second move unexpectedly succeeded');
    expect().assertFail();
  } catch (err2) {
    let code: int = -1;
    if (err2 instanceof BusinessError) {
      code = err2.code;
    }
    console.log('0200 second move err code: ' + code);
    expect(code).assertEqual(ERR_MOVE_NOT_FOREGROUND);
  }
}

async function run0200Isolated(
  delegator: AbilityDelegatorRegistry.AbilityDelegator
): Promise<void> {
  await terminateEntryAbilityBestEffort();
  let context = await startEntryAndGetContext(delegator);
  console.log('getcontext success, context: ' + context);
  await moveTwiceExpectSecond65(context);
}

export default function moveAbilityToBackgroundTestStatic(): void {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
  let driver = Driver.create();
  let mpEnable = '';
  describe('ActsMoveAbilityToBackgroundTest', () => {
    beforeAll(async () => {
      try {
        let key = 'persist.sys.abilityms.move_ui_ability_to_background_api_enable';
        mpEnable = systemParameterEnhance.getSync(key, 'false');
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
     * @tc.name   SUB_Ability_AbilityRuntime_MoveAbilityToBackground_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_MoveAbilityToBackground_Static_0100
     * @tc.desc   expect current ability moved to background and onBackground() called.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_MoveAbilityToBackground_Static_0100', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityRuntime_MoveAbilityToBackground_0100`;
      console.log(`${tag}, it begin`);
      if (mpEnable === 'true') {
        try {
          let cmd = "aa start -b com.acts.moveabilitytobgtest.static -a EntryAbility";
          let user = AbilityDelegatorRegistry.getArguments().parameters["-u"];
          if (user !== undefined) {
            cmd += ' -u ' + user;
          }
          abilityDelegator.executeShellCommand(cmd);
          let buttonPromise: Promise<Component | null> =
            driver.waitForComponent(ON.text("Move To background"), 4000);
          let subscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
            events: ['Acts_onBackground_MoveAbilityToBackground_Event_1']
          };
          let subscriber = CommonEventManager.createSubscriberSync(subscribeInfo);
          let subscribeCB = (err: BusinessError<void> | null,
            data: CommonEventManager.CommonEventData | undefined) => {
            if (err && err.code !== 0) {
              console.error(`receive event failed, code is ${err.code}, message is ${err.message}`);
              expect().assertFail();
              done();
            } else {
              console.info(`receive event success, event:${data?.event}`);
              if (data?.event == 'Acts_onBackground_MoveAbilityToBackground_Event_1') {
                unSubscribe(subscriber, () => { done(); });
              }
            }
          }
          CommonEventManager.subscribe(subscriber, subscribeCB);
          buttonPromise.then((button: Component | null): void => {
            if (button != null) {
              button.click();
            }
          }).catch((err: Error) => {
            console.log('promise chain catch: ' + JSON.stringify(err));
            done();
          });
        } catch (err) {
          console.error(`${tag} error, errorCode: ${JSON.stringify(err)}`);
          try { expect().assertFail(); } catch (e) { }
          done();
        }
      } else if (mpEnable === 'false') {
        console.error(`${tag} skip: device mpEnable=false`);
        done();
      } else {
        console.error(`${tag} fail: mpEnable invalid=${mpEnable}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_MoveAbilityToBackground_Static_0200
     * @tc.number SUB_Ability_AbilityRuntime_MoveAbilityToBackground_Static_0200
     * @tc.desc   Second moveAbilityToBackground must return 16000065 (not foreground).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_MoveAbilityToBackground_Static_0200', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('it begin');
      let finished: boolean = false;
      let finish = (): void => {
        if (finished) {
          return;
        }
        finished = true;
        done();
      };
      if (mpEnable !== 'true') {
        console.error('0200 skip: mpEnable=' + mpEnable);
        finish();
        return;
      }
      try {
        console.log('getAbilityDelegator success');
        await run0200Isolated(abilityDelegator);
      } catch (err) {
        console.log('moveAbilityToBackground fail: ' + err);
        try {
          expect().assertFail();
        } catch (e) {
        }
      } finally {
        finish();
      }
    })
  })
}

let unSubscribeDone: () => void = () => {};
function unSubscribe(subscriber: CommonEventManager.CommonEventSubscriber, callback: () => void) {
  unSubscribeDone = callback;
  let unSubscribeCB = (err: BusinessError<void> | null) => {
    if (err && err.code !== 0) {
      console.error(`unsubscribe failed, code is ${err.code}, message is ${err.message}`);
    } else {
      console.info("unsubscribe success");
    }
    unSubscribeDone();
  };
  CommonEventManager.unsubscribe(subscriber, unSubscribeCB);
}
