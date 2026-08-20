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
import { Caller } from '@ohos.app.ability.UIAbility';

class MySequenceable implements rpc.Parcelable {
    num: number = 0;
    str: string = '';
    result: string = '';

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
let event_case2000 = 'call_case2000_test';
let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
    events: [event_case2000, ],
};
let subscriber: ESObject;
function test2200ReleaseCallback(data: ESObject) {
    console.log('SystemAppCalleeA MainAbility test2200ReleaseCallback:' + data);
    test2200ReleaseFlag = data.toString();
}

let test2200ReleaseFlag = '';

function testCall(data: rpc.MessageSequence) {
    let recvSequence = new MySequenceable(0, '', '');
    console.log('======>SystemAppCalleeA MainAbility on testCall <======')
    data.readParcelable(recvSequence);
    let result = recvSequence.str + 'processed';
    let commonEventData: commonEvent.CommonEventPublishData = {
        code: 0,
        data: 'calleeCheckCallParam',
        parameters: {
            num: recvSequence.num,
            str: recvSequence.str,
            result: result
        }
    }
    commonEvent.publish('CallTest', commonEventData, (err) => {
        console.log('======>CallTestSysA SecondAbility Call_Finish<======')
    })

    return recvSequence;
}

function testCallWithResult(data: rpc.MessageSequence) {
    let recvSequence = new MySequenceable(0, '', '');
    console.log('======>SystemAppCalleeA MainAbility on testCall <======')
    data.readParcelable(recvSequence);
    let result = recvSequence.str + 'processed';
    recvSequence.setMySequence(recvSequence.num, recvSequence.str, result);

    return recvSequence;
}

export default class MainAbility extends Ability {

    test2200(data: ESObject) {
        console.log('SystemAppCalleeA MainAbility test2200');
        let recvData = new MySequenceable(0, '', '');
        data.readParcelable(recvData);

        let want: Want = {
            bundleName: 'com.example.systemappcalleea',
            abilityName: 'com.example.systemappcalleea.SecondAbility',
        };
        console.log('SystemAppCalleeA MainAbility test2200 before startAbilityByCall');
        let resultData = new MySequenceable(0, '', '');
        globalThis.abilityContext.startAbilityByCall(want).then((caller: Caller) => {
            let param = new MySequenceable(recvData.num + 1, recvData.str + 'SystemAppCalleeA', '');
            caller.onRelease(test2200ReleaseCallback);
            caller.callWithResult('test2200', param).then((data2: rpc.MessageSequence) => {
                data2.readParcelable(resultData);
                caller.release();
                for (let start = Date.now(); Date.now() - start <= 200;) { }
                resultData.result = test2200ReleaseFlag;
                let commonEventData: commonEvent.CommonEventPublishData = {
                    parameters: {
                        num: resultData.num,
                        str: resultData.str,
                        result: resultData.result,
                    }
                };
                commonEvent.publish('call_case2200_test_result', commonEventData, (err) => {
                    console.log('SystemAppCalleeA publish call_case2200_test_result event')
                })

            });
        });
        return resultData;
    }

    subscribeCallBack(err: BusinessError, data: ESObject) {
        console.log('SystemAppCalleeA MainAbility subscribeCallBack data:' + JSON.stringify(data));
        switch (data.event) {
            case event_case2000:
                globalThis.abilityContext.terminateSelf();
                break;
            default:
                console.log('SystemAppCalleeA MainAbility subscribeCallBack event error:' + data.event);
                break;
        }
    }

    onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
        // Ability is creating, initialize resources for this ability
        console.log('SystemAppCalleeA MainAbility onCreate')
        globalThis.abilityWant = want;
        globalThis.abilityContext = this.context;
        this.callee.on('test2200', this.test2200);
        this.callee.on('testCall', testCall);
        this.callee.on('testCallWithResult', testCallWithResult);
        commonEvent.createSubscriber(subscribeInfo).then((data: ESObject) => {
            console.log('SystemAppCalleeA MainAbility createSubscriber');
            subscriber = data;
            commonEvent.subscribe(subscriber, this.subscribeCallBack);
        });
    }

    onDestroy() {
        // Ability is destroying, release resources for this ability
        console.log('SystemAppCalleeA MainAbility onDestroy')
    }

    onWindowStageCreate(windowStage: window.WindowStage): void {
        // Main window is created, set main page for this ability
        console.log('SystemAppCalleeA MainAbility onWindowStageCreate')
        windowStage.loadContent('pages/index/index', null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log('SystemAppCalleeA MainAbility onWindowStageDestroy')
    }

    onForeground() {
        // Ability has brought to foreground
        console.log('SystemAppCalleeA MainAbility onForeground');
    }

    onBackground() {
        // Ability has back to background
        console.log('SystemAppCalleeA MainAbility onBackground')
    }
};
