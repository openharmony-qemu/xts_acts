/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic';
import Want from '@ohos.app.ability.Want';
import common from '@ohos.app.ability.common';
import deviceInfo from '@ohos.deviceInfo';
import CommonEventManager from '@ohos.commonEventManager';
import formProvider from '@ohos.app.form.formProvider';

export default function formDimensionMultiDeviceTest() {
  describe('FormDimensionMultiDeviceTest', () => {

    /**
     * @tc.number SUB_Ability_AbilityForm_MultiDevice_Dimension_3_3_0100
     * @tc.name SUB_Ability_AbilityForm_MultiDevice_Dimension_3_3_0100
     * @tc.desc Normal provision of static 3*3 cards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(`SUB_Ability_AbilityForm_MultiDevice_Dimension_3_3_0100`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
        let subscriber: CommonEventManager.CommonEventSubscriber;
        let finished: boolean = false;
        let startOk: boolean = false;
        let subscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
            events: ['Form_StartAbility']
        }

        const finishOnce = (): void => {
            if (finished) {
                return;
            }
            finished = true;
            try {
                if (subscriber !== undefined) {
                    CommonEventManager.unsubscribe(subscriber, () => {
                        console.info('SUB_Ability_AbilityForm_MultiDevice_Dimension3_3_0100 ===UnSubscribeInfoCallback===');
                    });
                }
            } catch (unsubErr) {
                console.info('Dimension3_3 unsubscribe err=' + JSON.stringify(unsubErr));
            }
            done();
        };

        CommonEventManager.createSubscriber(subscribeInfo, (err, data) => {
            console.info('SUB_Ability_AbilityForm_MultiDevice_Dimension3_3_0100 ===CreateSubscriberCallback===');
            subscriber = data;
            CommonEventManager.subscribe(subscriber, async (err, data) => {
                if (finished) {
                    return;
                }
                console.info('SUB_Ability_AbilityForm_MultiDevice_Dimension3_3_0100 ===SubscribeInfoCallback===' + JSON.stringify(data));
                let payload = data?.data !== undefined ? String(data.data) : '';
                if (deviceInfo.deviceType === 'wearable') {
                    console.info('[SUB_Ability_AbilityForm_MultiDevice_Dimension3_3_0100]device is wearable');
                    expect(payload).assertEqual('0');
                } else {
                    console.info('[SUB_Ability_AbilityForm_MultiDevice_Dimension3_3_0100]device is not wearable');
                    // 401: dimension not supported; 202: form/system API denied under normal apl
                    let ok = payload === '401' || payload === '202';
                    expect(ok).assertTrue();
                }
                finishOnce();
            })
        })
        let formWant: Want = {
            deviceId: '',
            bundleName: 'com.example.apicoverhaptest',
            abilityName: 'CreateFormAbility33',
            parameters: {
              'createForm': true
            }
        }
        AppStorage.get<common.UIAbilityContext>('abilityContext')!.startAbility(formWant, (err, data) => {
            if (err.code == 0) {
              startOk = true;
              console.info('SUB_Ability_AbilityForm_MultiDevice_Dimension_3_3_0100=== ' + JSON.stringify(data));
            } else {
              expect().assertFail();
              finishOnce();
            }
        })
        setTimeout(() => {
            if (finished) {
                return;
            }
            console.info('Dimension3_3 form event wait end, startOk=' + startOk);
            expect(startOk).assertTrue();
            finishOnce();
        }, 18000);
    })

    /**
     * @tc.number SUB_Ability_AbilityForm_MultiDevice_Dimension_2_3_0100
     * @tc.name SUB_Ability_AbilityForm_MultiDevice_Dimension_2_3_0100
     * @tc.desc Normal provision of static 2*3 cards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it(`SUB_Ability_AbilityForm_MultiDevice_Dimension_2_3_0100`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
        let subscriber: CommonEventManager.CommonEventSubscriber;
        let finished: boolean = false;
        let startOk: boolean = false;
        let subscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
            events: ['Form_StartAbility']
        }

        const finishOnce = (): void => {
            if (finished) {
                return;
            }
            finished = true;
            try {
                if (subscriber !== undefined) {
                    CommonEventManager.unsubscribe(subscriber, () => {
                        console.info('SUB_Ability_AbilityForm_MultiDevice_Dimension_2_3_0100 ===UnSubscribeInfoCallback===');
                    });
                }
            } catch (unsubErr) {
                console.info('Dimension2_3 unsubscribe err=' + JSON.stringify(unsubErr));
            }
            done();
        };

        CommonEventManager.createSubscriber(subscribeInfo, (err, data) => {
            console.info('SUB_Ability_AbilityForm_MultiDevice_Dimension_2_3_0100 ===CreateSubscriberCallback===');
            subscriber = data;
            CommonEventManager.subscribe(subscriber, async (err, data) => {
                if (finished) {
                    return;
                }
                console.info('SUB_Ability_AbilityForm_MultiDevice_Dimension_2_3_0100 ===SubscribeInfoCallback===' + JSON.stringify(data));
                let payload = data?.data !== undefined ? String(data.data) : '';
                if (deviceInfo.deviceType === 'wearable') {
                    console.info('[SUB_Ability_AbilityForm_MultiDevice_Dimension2_3_0100]device is wearable');
                    expect(payload).assertEqual('0');
                } else {
                    console.info('[SUB_Ability_AbilityForm_MultiDevice_Dimension2_3_0100]device is not wearable');
                    let ok = payload === '401' || payload === '202';
                    expect(ok).assertTrue();
                }
                finishOnce();
            })
        })
        let formWant: Want = {
            deviceId: '',
            bundleName: 'com.example.apicoverhaptest',
            abilityName: 'CreateFormAbility23',
            parameters: {
              'createForm': true
            }
        }
        AppStorage.get<common.UIAbilityContext>('abilityContext')!.startAbility(formWant, (err, data) => {
            if (err.code == 0) {
              startOk = true;
              console.info('SUB_Ability_AbilityForm_MultiDevice_Dimension_2_3_0100=== ' + JSON.stringify(data));
            } else {
              expect().assertFail();
              finishOnce();
            }
        })
        setTimeout(() => {
            if (finished) {
                return;
            }
            console.info('Dimension2_3 form event wait end, startOk=' + startOk);
            expect(startOk).assertTrue();
            finishOnce();
        }, 18000);
    })

    /**
     * @tc.number SUB_Ability_AbilityForm_closeFormEditAbility_0100
     * @tc.name SUB_Ability_AbilityForm_closeFormEditAbility_0100
     * @tc.desc closeFormEditAbility
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(`SUB_Ability_AbilityForm_closeFormEditAbility_0100`, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
        try {
            formProvider.closeFormEditAbility();
            console.info(`close FormEditAbility success.`);
          } catch (error) {
            console.error(`close FormEditAbility faild, code: ${error.code}, message: ${error.message}`);
            if (deviceInfo.deviceType === 'wearable') {
                console.info('[SUB_Ability_AbilityForm_closeFormEditAbility_0100]device is wearable');
                expect(error.code).assertEqual(801);
                done();
            }
            else {
                console.info('[SUB_Ability_AbilityForm_closeFormEditAbility_0100]device is not wearable');
                expect(error.code !== 801).assertTrue();
                done();
            }
          }
    })
  })
}