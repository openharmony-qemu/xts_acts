/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import commonEvent from '@ohos.commonEvent';
import { beforeAll, beforeEach, afterEach, describe, expect, it } from '@ohos/hypium';
import CommonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@kit.BasicServicesKit';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog';

interface onFormEvent {
    events: string[];
}

const INTERVAL_TIME = 2500;
const DELEGATOR: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const COMMON_TAG: string = 'updateFormSize';
const DOMAIN: number = 0xF811;

let onUpdateSizeFormEvent: onFormEvent = {
    events: ["FMS_FormOnUpdateSize_commonEvent"],
};

let onFormLocationChanged: onFormEvent = {
    events: ["FMS_FormOnLocationChanged_commonEvent"],
};

let finishForm_Event: string = "FMS_FormTestFinish_commonEvent";

let subscriberOnUpdateSize: CommonEventManager.CommonEventSubscriber;
let subscriberonFormLocationChanged: CommonEventManager.CommonEventSubscriber;

const unsubscribeCallback = (tcNumber: string)  => {
    hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${tcNumber} unsubscribeCallback`);
}

let options:CommonEventManager.CommonEventPublishData = {
    code: 1,
    data: "initial data",
    isOrdered: true
}

function sleep(time: number): Promise<void> {
    return new Promise((resolve)=>setTimeout(resolve,time));
}

export default function updateFormSizeTest() {
  describe(`UpdateFormSizeTest`, () => {
    beforeAll(async (done: () => void) => {
        done();
    })

    beforeEach(async () => {
        subscriberOnUpdateSize = await commonEvent.createSubscriber(onUpdateSizeFormEvent);
        subscriberonFormLocationChanged = await commonEvent.createSubscriber(onFormLocationChanged);
        await sleep(1000);
    })

    afterEach(async () => {
        commonEvent.unsubscribe(subscriberOnUpdateSize, () => unsubscribeCallback("afterEach unsubscribe subscriberOnUpdateSize"));
        commonEvent.unsubscribe(subscriberonFormLocationChanged, () => unsubscribeCallback("afterEach unsubscribe subscriberonFormLocationChanged"));
    })

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0100
     * @tc.number SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0100
     * @tc.desc   Function UpdateFormSize test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it(`SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0100`, 0, async (done:Function) => {
        const TAG: string = 'SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0100';
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} start`);
        let onUpdateSizeCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
            hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} onUpdateSizeCallBack data: ${JSON.stringify(data)}`);
            expect(data.code).assertEqual(16501001);
            
            commonEvent.publish(finishForm_Event, data, async (err) => {
                hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} publish ${JSON.stringify(err)}`);
                await sleep(2000);
                done();
            });
        }

        commonEvent.subscribe(subscriberOnUpdateSize, onUpdateSizeCallBack);
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbility start`);
        await DELEGATOR.startAbility({
            bundleName: "com.example.formsystemhost",
            abilityName: "EntryAbility",
            parameters: {
                "formId" : "0",
                "name" : "widget",
                "bundle" : "com.example.getformsinfotest",
                "ability" : "EntryFormAbility",
                "moduleName" : "entry",
                "updateFormSize" : true,
                "isTestFormId": true,
                "testFormId": "0",
                "newDimension" : 3,
            }
        }).then(() => {
            hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbilityhost end`);
        }).catch((err: BusinessError) => {
            hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbilityhost error: ${JSON.stringify(err)}`);
        });
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbility end`);
    });

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0200
     * @tc.number SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0200
     * @tc.desc   Function UpdateFormSize test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it(`SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0200`, 0, async (done:Function) => {
        const TAG: string = 'SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0200';
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} start`);
        let onUpdateSizeCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
            hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} onUpdateSizeCallBack data: ${JSON.stringify(data)}`);
            expect(data.code).assertEqual(16501001);
            commonEvent.publish(finishForm_Event, data, async (err) => {
                hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} publish ${JSON.stringify(err)}`);
                await sleep(2000);
                done();
            });
        }

        commonEvent.subscribe(subscriberOnUpdateSize, onUpdateSizeCallBack);
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbility start`);
        await DELEGATOR.startAbility({
            bundleName: "com.example.formsystemhost",
            abilityName: "EntryAbility",
            parameters: {
                "formId" : "0",
                "name" : "widget",
                "bundle" : "com.example.getformsinfotest",
                "ability" : "EntryFormAbility",
                "moduleName" : "entry",
                "updateFormSize" : true,
                "isTestFormId": true,
                "testFormId": "1",
                "newDimension" : 3,
            }
        }).then(() => {
            hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbilityhost end`);
        }).catch((err: BusinessError) => {
            hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbilityhost error: ${JSON.stringify(err)}`);
        });
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbility end`);
    });

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0300
     * @tc.number SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0300
     * @tc.desc   Function UpdateFormSize test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it(`SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0300`, 0, async (done:Function) => {
        const TAG: string = 'SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0300';
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} start`);
        let onUpdateSizeCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
            hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} onUpdateSizeCallBack data: ${JSON.stringify(data)}`);
            expect(data.code).assertEqual(16501001);
            commonEvent.publish(finishForm_Event, data, async (err) => {
                hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} publish ${JSON.stringify(err)}`);
                await sleep(2000);
                done();
            });
        }

        commonEvent.subscribe(subscriberOnUpdateSize, onUpdateSizeCallBack);
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbility start`);
        await DELEGATOR.startAbility({
            bundleName: "com.example.formsystemhost",
            abilityName: "EntryAbility",
            parameters: {
                "formId" : "0",
                "name" : "widget",
                "bundle" : "com.example.getformsinfotest",
                "ability" : "EntryFormAbility",
                "moduleName" : "entry",
                "updateFormSize" : true,
                "isTestFormId": true,
                "testFormId": "1",
                "newDimension" : 3,
            }
        }).then(() => {
            hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbilityhost end`);
        }).catch((err: BusinessError) => {
            hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbilityhost error: ${JSON.stringify(err)}`);
        });
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbility end`);
    });

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0400
     * @tc.number SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0400
     * @tc.desc   Function UpdateFormSize test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it(`SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0400`, 0, async (done:Function) => {
        const TAG: string = 'SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0400';
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} start`);
        let onUpdateSizeCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
            hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} onUpdateSizeCallBack data: ${JSON.stringify(data)}`);
            expect(data.code).assertEqual(16501001);
            commonEvent.publish(finishForm_Event, data, async (err) => {
                hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} publish ${JSON.stringify(err)}`);
                await sleep(2000);
                done();
            });
        }

        commonEvent.subscribe(subscriberOnUpdateSize, onUpdateSizeCallBack);
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbility start`);
        await DELEGATOR.startAbility({
            bundleName: "com.example.formsystemhost",
            abilityName: "EntryAbility",
            parameters: {
                "formId" : "0",
                "name" : "widget",
                "bundle" : "com.example.getformsinfotest",
                "ability" : "EntryFormAbility",
                "moduleName" : "entry",
                "updateFormSize" : true,
                "isTestFormId": true,
                "testFormId": "2147483647",
                "newDimension" : 3,
            }
        }).then(() => {
            hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbilityhost end`);
        }).catch((err: BusinessError) => {
            hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbilityhost error: ${JSON.stringify(err)}`);
        });
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbility end`);
    });

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0500
     * @tc.number SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0500
     * @tc.desc   Function UpdateFormSize test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it(`SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0500`, 0, async (done:Function) => {
        const TAG: string = 'SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0500';
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} start`);
        let onUpdateSizeCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
            hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} onUpdateSizeCallBack data: ${JSON.stringify(data)}`);
            expect(data.code).assertEqual(0);
            commonEvent.publish(finishForm_Event, data, async (err) => {
                hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} publish ${JSON.stringify(err)}`);
                await sleep(2000);
                done();
            });
        }

        commonEvent.subscribe(subscriberOnUpdateSize, onUpdateSizeCallBack);
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbility start`);
        await DELEGATOR.startAbility({
            bundleName: "com.example.formsystemhost",
            abilityName: "EntryAbility",
            parameters: {
                "formId" : "0",
                "name" : "widget",
                "bundle" : "com.example.getformsinfotest",
                "ability" : "EntryFormAbility",
                "moduleName" : "entry",
                "updateFormSize" : true,
                "isTestFormId": false,
                "newDimension" : 3,
            }
        }).then(() => {
            hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbilityhost end`);
        }).catch((err: BusinessError) => {
            hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbilityhost error: ${JSON.stringify(err)}`);
        });
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbility end`);
    });

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0600
     * @tc.number SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0600
     * @tc.desc   Function UpdateFormSize test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it(`SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0600`, 0, async (done:Function) => {
        const TAG: string = 'SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0600';
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} start`);
        let onUpdateSizeCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
            hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} onUpdateSizeCallBack data: ${JSON.stringify(data)}`);
            expect(data.code).assertEqual(16501012);
            commonEvent.publish(finishForm_Event, data, async (err) => {
                hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} publish ${JSON.stringify(err)}`);
                await sleep(2000);
                done();
            });
        }

        commonEvent.subscribe(subscriberOnUpdateSize, onUpdateSizeCallBack);
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbility start`);
        await DELEGATOR.startAbility({
            bundleName: "com.example.formsystemhost",
            abilityName: "EntryAbility",
            parameters: {
                "formId" : "0",
                "name" : "widget",
                "bundle" : "com.example.getformsinfotest",
                "ability" : "EntryFormAbility",
                "moduleName" : "entry",
                "updateFormSize" : true,
                "isTestFormId": false,
                "newDimension" : 0,
            }
        }).then(() => {
            hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbilityhost end`);
        }).catch((err: BusinessError) => {
            hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbilityhost error: ${JSON.stringify(err)}`);
        });
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbility end`);
    });

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0700
     * @tc.number SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0700
     * @tc.desc   Function UpdateFormSize test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it(`SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0700`, 0, async (done:Function) => {
        const TAG: string = 'SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0700';
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} start`);
        let onUpdateSizeCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
            hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} onUpdateSizeCallBack data: ${JSON.stringify(data)}`);
            expect(data.code).assertEqual(16501012);
            commonEvent.publish(finishForm_Event, data, async (err) => {
                hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} publish ${JSON.stringify(err)}`);
                await sleep(2000);
                done();
            });
        }

        commonEvent.subscribe(subscriberOnUpdateSize, onUpdateSizeCallBack);
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbility start`);
        await DELEGATOR.startAbility({
            bundleName: "com.example.formsystemhost",
            abilityName: "EntryAbility",
            parameters: {
                "formId" : "0",
                "name" : "widget",
                "bundle" : "com.example.getformsinfotest",
                "ability" : "EntryFormAbility",
                "moduleName" : "entry",
                "updateFormSize" : true,
                "isTestFormId": false,
                "newDimension" : 5,
            }
        }).then(() => {
            hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbilityhost end`);
        }).catch((err: BusinessError) => {
            hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbilityhost error: ${JSON.stringify(err)}`);
        });
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbility end`);
    });

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0800
     * @tc.number SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0800
     * @tc.desc   Function UpdateFormSize test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it(`SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0800`, 0, async (done:Function) => {
        const TAG: string = 'SUB_ABILITY_FORM_FWK_UPDATE_FORM_SIZE_0800';
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} start`);
        let onUpdateSizeCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
            hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} onUpdateSizeCallBack data: ${JSON.stringify(data)}`);
            expect(data.code).assertEqual(401);
            commonEvent.publish(finishForm_Event, data, async (err) => {
                hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} publish ${JSON.stringify(err)}`);
                await sleep(2000);
                done();
            });
        }

        commonEvent.subscribe(subscriberOnUpdateSize, onUpdateSizeCallBack);
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbility start`);
        await DELEGATOR.startAbility({
            bundleName: "com.example.formsystemhost",
            abilityName: "EntryAbility",
            parameters: {
                "formId" : "0",
                "name" : "widget",
                "bundle" : "com.example.getformsinfotest",
                "ability" : "EntryFormAbility",
                "moduleName" : "entry",
                "updateFormSize" : true,
                "isTestFormId": false,
                "isTestRect": true,
                "newDimension" : 3,
            }
        }).then(() => {
            hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbilityhost end`);
        }).catch((err: BusinessError) => {
            hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbilityhost error: ${JSON.stringify(err)}`);
        });
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbility end`);
    });

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_FORMLOCATIONCHANGED_0100
     * @tc.number SUB_ABILITY_FORM_FWK_FORMLOCATIONCHANGED_0100
     * @tc.desc   Function FormLocationChanged test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it(`SUB_ABILITY_FORM_FWK_FORMLOCATIONCHANGED_0100`, 0, async (done:Function) => {
        const TAG: string = 'SUB_ABILITY_FORM_FWK_FORMLOCATIONCHANGED_0100';
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} start`);
        let onFormLocationChangedCallBack = (_:BusinessError, data: CommonEventManager.CommonEventPublishData) => {
            hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} onFormLocationChangedCallBack data: ${JSON.stringify(data)}`);
            expect(data.code).assertEqual(0);
            commonEvent.publish(finishForm_Event, data, async (err) => {
                hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} publish ${JSON.stringify(err)}`);
                await sleep(2000);
                done();
            });
        }

        commonEvent.subscribe(subscriberonFormLocationChanged, onFormLocationChangedCallBack);
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbility start`);
        await DELEGATOR.startAbility({
            bundleName: "com.example.formsystemhost",
            abilityName: "EntryAbility",
            parameters: {
                "formId" : "0",
                "name" : "widget",
                "bundle" : "com.example.getformsinfotest",
                "ability" : "EntryFormAbility",
                "moduleName" : "entry",
                "isFormLocation" : true,
                "formLocation" : 0,
            }
        }).then(() => {
            hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbilityhost end`);
        }).catch((err: BusinessError) => {
            hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbilityhost error: ${JSON.stringify(err)}`);
        });
        hilog.info(DOMAIN, COMMON_TAG, '%{public}s', `${TAG} startAbility end`);
    });
  })
}
