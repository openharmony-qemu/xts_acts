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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import { BusinessError } from '@ohos.base';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import commonEvent from '@ohos.commonEventManager';
import commonEventManager from '@ohos.commonEventManager';

let subscriberInfoMainAbility: commonEventManager.CommonEventSubscribeInfo = {
  events: ['ACTS_Start_CommonEvent']
};
const START_ABILITY_TIMEOUT = 4000;

export default function abilityTest() {
  describe('ACTS_TestApi', () => {
    /**
     * @tc.name   ACTS_TestRunner_0100
     * @tc.number ACTS_TestRunner_0100
     * @tc.desc   Starting mainability2 with startability succeeded.(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_TestRunner_0100', Level.LEVEL0, async (done: Function) => {
      let data = AbilityDelegatorRegistry.getAbilityDelegator();
      expect(typeof (data)).assertEqual('object');
      done();
    })

    /**
     * @tc.name   ACTS_TestRunner_0200
     * @tc.number ACTS_TestRunner_0200
     * @tc.desc   Starting mainability2 with startability succeeded.(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_TestRunner_0200', Level.LEVEL0, async (done: Function) => {
      let abilityDelegatorArgs = AbilityDelegatorRegistry.getArguments();
      console.log('====>getArguments is====>' + JSON.stringify(abilityDelegatorArgs));
      expect(abilityDelegatorArgs.bundleName).assertEqual('com.example.actsstartyunnertest');
      expect(abilityDelegatorArgs.parameters['-b']).assertEqual('com.example.actsstartyunnertest');
      expect(abilityDelegatorArgs.parameters['-s unittest']).assertEqual('OpenHarmonyTestRunner');
      expect(abilityDelegatorArgs.testRunnerClassName).assertEqual('OpenHarmonyTestRunner');
      done();
    })

    /**
     * @tc.name   ACTS_StartAbility_Callback_0100
     * @tc.number ACTS_StartAbility_Callback_0100
     * @tc.desc   Starting mainability2 with startability succeeded.(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_StartAbility_Callback_0100', Level.LEVEL0, async (done: Function) => {
      let subscriber: commonEventManager.CommonEventSubscriber;
      let flag = true;
      let startresult = false;
      let delegator = AbilityDelegatorRegistry.getAbilityDelegator();

      await commonEvent.createSubscriber(subscriberInfoMainAbility)
        .then((data) => {
          console.log('====>Create subscriber====>');
          data.getSubscribeInfo()
            .then(async (SubscribeInfo) => {
              console.log('====>SubscribeInfo is====>' + JSON.stringify(SubscribeInfo));
              subscriber = data;
              commonEvent.subscribe(subscriber, (err, data) => {
                if (err) {
                  console.error(JSON.stringify(err));
                }
                expect(data.event == 'ACTS_Start_CommonEvent').assertTrue();
                console.log('====>0100 Subscribe CallBack data:====>' + JSON.stringify(data));
                if (data.event == 'ACTS_Start_CommonEvent') {
                  startresult = true;
                }
                commonEvent.unsubscribe(subscriber, () => {
                  console.log('====>UnSubscribeCallback====>');
                  flag = false;
                  expect(startresult).assertEqual(true);
                  done();
                });
              });
              console.log('====>start startAbility====>');
              delegator.startAbility(
                {
                  bundleName: 'com.example.actsstartyunnertest',
                  abilityName: 'MainAbility2'
                }, (error: BusinessError) => {
                  if (error) {
                    expect().assertFail();
                    console.log('ACTS_StartAbility_Callback_0100 - timeout');
                    commonEvent.unsubscribe(subscriber, () => {
                      console.log('====>UnSubscribeCallback====>');
                      flag = false;
                      expect(startresult).assertEqual(true);
                      done();
                    })
                  }
                  console.log('====>startAbility end====>');
              })
            })
        })
    })

    /**
     * @tc.name   ACTS_StartAbility_Callback_0200
     * @tc.number ACTS_StartAbility_Callback_0200
     * @tc.desc   Starting mainability2 with startability failed.(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_StartAbility_Callback_0200', Level.LEVEL0, async (done: Function) => {
      let delegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let subscriber: commonEventManager.CommonEventSubscriber;
      await commonEvent.createSubscriber(subscriberInfoMainAbility)
        .then((data) => {
          console.log('====>Create subscriber====>');
          data.getSubscribeInfo()
            .then(async (SubscribeInfo) => {
              console.log('====>SubscribeInfo is====>' + JSON.stringify(SubscribeInfo));
              subscriber = data;
              commonEvent.subscribe(subscriber, (err, data) => {
                if (err) {
                  console.error(JSON.stringify(err));
                }
                expect().assertFail();
                console.log('====>0200 Subscribe CallBack data:====>' + JSON.stringify(data));
                commonEvent.unsubscribe(subscriber, () => {
                  console.log('====>UnSubscribeCallback====>');
                  done();
                });
              });
              console.log('====>start startAbility====>');
              delegator.startAbility(
                {
                  bundleName: 'com.example.error',
                  abilityName: 'MainAbility2'
                }, (error: BusinessError) => {
                  if (error) {
                    console.log('ACTS_StartAbility_Callback_0200 - timeout');
                    commonEvent.unsubscribe(subscriber, () => {
                      console.log('====>UnSubscribeCallback====>');
                      done();
                    })
                  }
                  console.log('====>startAbility end====>');
              })
            })
        })
    })

    /**
     * @tc.name   ACTS_StartAbility_Promise_0100
     * @tc.number ACTS_StartAbility_Promise_0100
     * @tc.desc   Starting mainability2 with startability succeeded.(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_StartAbility_Promise_0100', Level.LEVEL0, async (done: Function) => {
      let delegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let subscriber: commonEventManager.CommonEventSubscriber;
      let flag = true;
      let startresult = false;

      commonEvent.createSubscriber(subscriberInfoMainAbility)
        .then((data) => {
          console.log('====>Create subscriber====>');
          data.getSubscribeInfo()
            .then(async (SubscribeInfo) => {
              console.log('====>SubscribeInfo is====>' + JSON.stringify(SubscribeInfo));
              subscriber = data;
              commonEvent.subscribe(subscriber, (err, data) => {
                if (err) {
                  console.error(JSON.stringify(err));
                }
                expect(data.event == 'ACTS_Start_CommonEvent').assertTrue();
                console.log('====>0100 Subscribe CallBack data:====>' + JSON.stringify(data));
                if (data.event == 'ACTS_Start_CommonEvent') {
                  startresult = true;
                }
                commonEvent.unsubscribe(subscriber, () => {
                  console.log('====>UnSubscribeCallback====>');
                  flag = false;
                  expect(startresult).assertEqual(true);
                  done();
                });
              });
              console.log('====>start startAbility====>');
              await delegator.startAbility(
                {
                  bundleName: 'com.example.actsstartyunnertest',
                  abilityName: 'MainAbility3'
                })
                .then(() => {
                  console.log('====>startAbility end====>');
                }).catch((error: BusinessError) => {
                  if (error) {
                    console.error(JSON.stringify(error));
                  }
                  expect().assertFail();
                  console.log('ACTS_StartAbility_Promise_0100 - timeout');
                  commonEvent.unsubscribe(subscriber, () => {
                    console.log('====>UnSubscribeCallback====>');
                    flag = false;
                    expect(startresult).assertEqual(true);
                    done();
                  })
                });

            })
            .catch((error: BusinessError) => {
              console.error(JSON.stringify(error));
              done();
            });
        })
        .catch((error: BusinessError) => {
          console.error(JSON.stringify(error));
          done();
        });
    })

    /**
     * @tc.name   ACTS_StartAbility_Promise_0200
     * @tc.number ACTS_StartAbility_Promise_0200
     * @tc.desc   Starting mainability2 with startability failed.(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_StartAbility_Promise_0200', Level.LEVEL0, async (done: Function) => {
      let delegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let subscriber: commonEventManager.CommonEventSubscriber;
      commonEvent.createSubscriber(subscriberInfoMainAbility)
        .then((data) => {
          console.log('====>Create subscriber====>');
          data.getSubscribeInfo()
            .then(async (SubscribeInfo) => {
              console.log('====>SubscribeInfo is====>' + JSON.stringify(SubscribeInfo));
              subscriber = data;
              commonEvent.subscribe(subscriber, (err, data) => {
                if (err) {
                  console.error(JSON.stringify(err));
                }
                expect().assertFail();
                console.log('====>0200 Subscribe CallBack data:====>' + JSON.stringify(data));
                commonEvent.unsubscribe(subscriber, () => {
                  console.log('====>UnSubscribeCallback====>');
                  done();
                });
              });
              console.log('====>start startAbility====>');
              await delegator.startAbility(
                {
                  bundleName: 'com.example.error',
                  abilityName: 'MainAbility2'
                })
                .then(() => {
                  console.log('====>startAbility end====>');
                }).catch((error: BusinessError) => {
                  if (error) {
                    console.error(JSON.stringify(error));
                  }
                  console.log('ACTS_StartAbility_Promise_0200 - timeout');
                  commonEvent.unsubscribe(subscriber, () => {
                    console.log('====>UnSubscribeCallback====>');
                    done();
                  })
                });

            })
            .catch((error: BusinessError) => {
              console.error(JSON.stringify(error));
              done();
            });
        })
        .catch((error: BusinessError) => {
          console.error(JSON.stringify(error));
          done();
        });
    })
  })
}
