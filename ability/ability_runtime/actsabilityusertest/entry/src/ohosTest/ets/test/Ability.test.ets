/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import commonEvent from '@ohos.commonEventManager';
import common from '@ohos.app.ability.common';
import commonEventManager from '@ohos.commonEventManager';

let subscriberInfo_MainAbility: commonEventManager.CommonEventSubscribeInfo = {
  events: ['ACTS_StartAbility_CommonEvent']
}
let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
const START_ABILITY_TIMEOUT = 4000;

export default function abilityTest() {
  describe('ACTS_StartAbility_Test', () => {
    afterEach(async (done:Function) => {
        let cmd = 'aa start -b com.example.actsabilityusertest -a MainAbility';
        let user = AbilityDelegatorRegistry.getArguments().parameters['-u'];
        if(user !== undefined){
            cmd += ' -u ' + user;
        }
        try {
        await abilityDelegator.executeShellCommand(cmd);
        } catch (e) {
          console.error('====>await exception====>' + JSON.stringify(e));
        }
        expect().assertFail();
        done();
    });
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityCallbackSuccessfully_0100
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityCallbackSuccessfully_0100
     * @tc.desc   Starting mainability2 with startability succeeded.(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityCallbackSuccessfully_0100', Level.LEVEL0, async (done: Function) => {
      let Subscriber: commonEventManager.CommonEventSubscriber;
      let flag = true;
      let startresult = false;

      try {
      await commonEvent.createSubscriber(subscriberInfo_MainAbility)
        .then((data) => {
          console.log('====>Create Subscriber====>');
          data.getSubscribeInfo()
            .then(async (SubscribeInfo) => {
              console.log('====>SubscribeInfo is====>' + JSON.stringify(SubscribeInfo));
              Subscriber = data;
              commonEvent.subscribe(Subscriber, (err, data) => {
                expect(data.event == 'ACTS_StartAbility_CommonEvent').assertTrue();
                console.log('====>0100 Subscribe CallBack data:====>' + JSON.stringify(data));
                if (data.event == 'ACTS_StartAbility_CommonEvent') {
                  startresult = true
                }
                commonEvent.unsubscribe(Subscriber, () => {
                  console.log('====>UnSubscribeCallback====>');
                  flag = false
                  expect(startresult).assertEqual(true);
                  done();
                })
              })
              console.log('====>start startAbility====>');
              AppStorage.get<common.UIAbilityContext>('abilityContext')!.startAbility(
                {
                  bundleName: 'com.example.actsabilityusertest',
                  abilityName: 'MainAbility2'
                }, () => {
                console.log('====>startAbility end====>');
              })
            })
        })
      } catch (e) {
        console.error('====>await exception====>' + JSON.stringify(e));
      }

      setTimeout(() => {
        if (flag == true) {
          expect().assertFail();
          console.log('ACTS_StartAbility_Callback_Successfully_0100 - timeout')
          commonEvent.unsubscribe(Subscriber, () => {
            console.log('====>UnSubscribeCallback====>');
            flag = false
            expect(startresult).assertEqual(true);
            done();
          })
        }
      }, START_ABILITY_TIMEOUT);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityCallbackError_0200
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityCallbackError_0200
     * @tc.desc   Starting mainability2 with startability failed.(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityCallbackError_0200', Level.LEVEL0, async (done: Function) => {
      let AbilityDelegatorArgs = AbilityDelegatorRegistry.getArguments();
      console.log('====>getArguments is====>' + JSON.stringify(AbilityDelegatorArgs));
      let Subscriber: commonEventManager.CommonEventSubscriber;

      try {
      await commonEvent.createSubscriber(subscriberInfo_MainAbility)
        .then((data) => {
          console.log('====>Create Subscriber====>');
          data.getSubscribeInfo()
            .then(async (SubscribeInfo) => {
              console.log('====>SubscribeInfo is====>' + JSON.stringify(SubscribeInfo));
              Subscriber = data;
              commonEvent.subscribe(Subscriber, (err, data) => {
                expect().assertFail();
                console.log('====>0200 Subscribe CallBack data:====>' + JSON.stringify(data));
                commonEvent.unsubscribe(Subscriber, () => {
                  console.log('====>UnSubscribeCallback====>');
                  done();
                })
              })
              console.log('====>start startAbility====>');
              AppStorage.get<common.UIAbilityContext>('abilityContext')!.startAbility(
                {
                  bundleName: 'com.example.error',
                  abilityName: 'com.example.error.MainAbility2'
                }, () => {
                console.log('====>startAbility end====>');
              })
            })
        })
      } catch (e) {
        console.error('====>await exception====>' + JSON.stringify(e));
      }

      setTimeout(() => {
        console.log('ACTS_StartAbility_Callback_Error_0200 - timeout');
        commonEvent.unsubscribe(Subscriber, () => {
          console.log('====>UnSubscribeCallback====>');
          done();
        })
      }, START_ABILITY_TIMEOUT)
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityPromiseSuccessfully_0100
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityPromiseSuccessfully_0100
     * @tc.desc   Starting mainability2 with startability succeeded.(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityPromiseSuccessfully_0100', Level.LEVEL0, async (done: Function) => {
      let Subscriber: commonEventManager.CommonEventSubscriber;
      let flag = true;
      let startresult = false;

      commonEvent.createSubscriber(subscriberInfo_MainAbility)
        .then((data) => {
          console.log('====>Create Subscriber====>');
          data.getSubscribeInfo()
            .then(async (SubscribeInfo) => {
              console.log('====>SubscribeInfo is====>' + JSON.stringify(SubscribeInfo));
              Subscriber = data;
              commonEvent.subscribe(Subscriber, (error, data) => {
                expect(data.event == 'ACTS_StartAbility_CommonEvent').assertTrue();
                console.log('====>0100 Subscribe CallBack data:====>' + JSON.stringify(data));
                if (data.event == 'ACTS_StartAbility_CommonEvent') {
                  startresult = true;
                }
                commonEvent.unsubscribe(Subscriber, () => {
                  console.log('====>UnSubscribeCallback====>');
                  flag = false;
                  expect(startresult).assertEqual(true);
                  expect().assertFail();
                  done();
                })
              })
              console.log('====>start startAbility====>');
              try {
                await AppStorage.get<common.UIAbilityContext>('abilityContext')!.startAbility(
                  {
                    bundleName: 'com.example.actsabilityusertest',
                    abilityName: 'MainAbility3'
                  })
                  .then(() => {
                    console.log('====>startAbility end====>');
                    expect().assertFail();
                    done();
                  }).catch((err: BusinessError) => {
                    console.error('====>startAbility failed====>' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                  })
              } catch (e) {
                console.error('====>startAbility await exception====>' + JSON.stringify(e));
                done();
              }
            })
        })
      setTimeout(() => {
        if (flag == true) {
          expect().assertFail();
          console.log('ACTS_StartAbility_Promise_Successfully_0100 - timeout');
          commonEvent.unsubscribe(Subscriber, () => {
            console.log('====>UnSubscribeCallback====>');
            flag = false;
            expect(startresult).assertEqual(true);
            done();
          })
        }
      }, START_ABILITY_TIMEOUT)
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAbilityPromiseError_0200
     * @tc.number SUB_Ability_AbilityRuntime_StartAbilityPromiseError_0200
     * @tc.desc   Starting mainability2 with startability failed.(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAbilityPromiseError_0200', Level.LEVEL0, async (done: Function) => {
      let AbilityDelegatorArgs = AbilityDelegatorRegistry.getArguments();
      console.log('====>getArguments is====>' + JSON.stringify(AbilityDelegatorArgs));
      let Subscriber: commonEventManager.CommonEventSubscriber;
      commonEvent.createSubscriber(subscriberInfo_MainAbility)
        .then((data) => {
          console.log('====>Create Subscriber====>');
          data.getSubscribeInfo()
            .then(async (SubscribeInfo) => {
              console.log('====>SubscribeInfo is====>' + JSON.stringify(SubscribeInfo));
              Subscriber = data;
              commonEvent.subscribe(Subscriber, (err, data) => {
                expect().assertFail();
                console.log('====>0200 Subscribe CallBack data:====>' + JSON.stringify(data));
                commonEvent.unsubscribe(Subscriber, () => {
                  console.log('====>UnSubscribeCallback====>');
                  done();
                })
              })
              console.log('====>start startAbility====>');
              AppStorage.get<common.UIAbilityContext>('abilityContext')!.startAbility(
                {
                  bundleName: 'com.example.error',
                  abilityName: 'com.example.error.MainAbility2'
                })
                .then(() => {
                  console.log('====>startAbility end====>');
                  done();
                }).catch((err: BusinessError) => {
                  console.error('====>startAbility failed====>' + JSON.stringify(err));
                  expect().assertFail();
                  done();
                })
            })
        })

      setTimeout(() => {
        console.log('ACTS_StartAbility_Promise_Error_0200 - timeout');
        commonEvent.unsubscribe(Subscriber, () => {
          console.log('====>UnSubscribeCallback====>');
          done();
        })
      }, START_ABILITY_TIMEOUT);
    })
  })
}
