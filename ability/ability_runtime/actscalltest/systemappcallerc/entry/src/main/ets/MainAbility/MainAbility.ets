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
import Ability from '@ohos.app.ability.UIAbility'
import Want from '@ohos.app.ability.Want'
import AbilityConstant from '@ohos.app.ability.AbilityConstant'
import window from '@ohos.window'
import commonEvent from '@ohos.commonEventManager'
import rpc from '@ohos.rpc';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Caller } from '@ohos.app.ability.UIAbility';

let bundleNameCallee = 'com.example.systemcalltest';
let abilityNameCallee = 'com.example.systemcalltest.SecondAbility';
let subscriber: commonEvent.CommonEventSubscriber;
let caller: Caller;
let eventGetcaller = 'getcaller.com.example.systemcalltest.SecondAbility';
let eventCall = 'call.com.example.systemcalltest.SecondAbility';
let eventRelease = 'release.com.example.systemcalltest.SecondAbility';
let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
    events: [eventGetcaller, eventCall, eventRelease, ],
};

class MySequenceable implements rpc.Parcelable {
    public num: number = 0;
    public str: string = '';
    public result: string = '';

    constructor(num: number, string: string, result: string) {
        this.num = num;
        this.str = string;
        this.result = result;
    }

    setMySequence(num: number, string: string, result: string) {
        this.num = num;
        this.str = string;
        this.result = result;
    }

    marshalling(messageParcel: rpc.MessageSequence) {
        messageParcel.writeInt(this.num);
        messageParcel.writeString(this.str);
        messageParcel.writeString(this.result);
        return true;
    }

    unmarshalling(messageParcel: rpc.MessageSequence) {
        this.num = messageParcel.readInt();
        this.str = messageParcel.readString();
        this.result = messageParcel.readString();
        return true;
    }
}

function getCaller(context: common.UIAbilityContext) {
    let want: Want = {
        bundleName: bundleNameCallee,
        abilityName: abilityNameCallee,
    };
    context.startAbilityByCall(want).then((data: Caller) => {
        if (typeof data !== 'object' || data == null) {
            console.log('SystemAppCallerC MainAbility startAbilityByCall fail');
        }
        caller = data;
    });
}

function stressCall() {
    console.log('SystemAppCallerC MainAbility stressCall begin');
    if (typeof caller !== 'object' || caller == null) {
        console.log('SystemAppCallerC MainAbility caller error in stressCall');
    }
    let times = 10;
    for (let i = 0; i < times; i++) {
        let data = new MySequenceable(i, 'SystemAppCallerC', '');
        caller.call('stressMethod', data);
    }
}

function unsubscribeCallback() {
    console.debug('SystemAppCallerC MainAbility  unsubscribeCallback');
}

function releaseCallee() {
    try {
        caller.onRelease((data: string) => {
            console.log('SystemAppCallerC MainAbility releaseCallBack:' + data);
        });
        caller.release();
    } catch (e) {
        console.log('SystemAppCallerC MainAbility release fail ' + e);
    }
    commonEvent.unsubscribe(subscriber, unsubscribeCallback);
}

function triggerStressEvent() {
    let commonEventData: commonEvent.CommonEventPublishData = {}
    commonEvent.publish(eventCall, commonEventData, (err) => {
        console.log('SystemAppCallerC publish event')
    })
}

export default class MainAbility extends Ability {

    subscribeCallBack(err: BusinessError, data: commonEvent.CommonEventData) {
        console.log('SystemAppCallerC MainAbility subscribeCallBack data:' + JSON.stringify(data));
        switch (data.event) {
          case eventCall:
                stressCall();
                break;
          case eventRelease:
                releaseCallee();
                break;
          default:
                console.log('SystemAppCallerC MainAbility subscribeCallBack event error:' + data.event);
                break;
        }
    }

    onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
        // Ability is creating, initialize resources for this ability
        console.log('SystemAppCallerC MainAbility onCreate')
        globalThis.abilityWant = want;
        globalThis.abilityContext = this.context;
    }

    onDestroy() {
        // Ability is destroying, release resources for this ability
        console.log('SystemAppCallerC MainAbility onDestroy')
    }

    onWindowStageCreate(windowStage: window.WindowStage): void {
        // Main window is created, set main page for this ability
        console.log('SystemAppCallerC MainAbility onWindowStageCreate')
        windowStage.loadContent('pages/index/index', null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log('SystemAppCallerC MainAbility onWindowStageDestroy')
    }

    onForeground() {
        // Ability has brought to foreground
        console.log('SystemAppCallerC MainAbility onForeground');
        commonEvent.createSubscriber(subscribeInfo).then((data: commonEvent.CommonEventSubscriber) => {
            console.log('SystemAppCallerC MainAbility createSubscriber');
            subscriber = data;
            commonEvent.subscribe(subscriber, this.subscribeCallBack);
            for (let start=Date.now(); Date.now() - start <= 100;) { }
            if (globalThis.abilityWant.parameters['case_num'] == 'case5600') {
                getCaller(this.context);
                triggerStressEvent();
            }
        });
    }

    onBackground() {
        // Ability has back to background
        console.log('SystemAppCallerC MainAbility onBackground')
    }
};
