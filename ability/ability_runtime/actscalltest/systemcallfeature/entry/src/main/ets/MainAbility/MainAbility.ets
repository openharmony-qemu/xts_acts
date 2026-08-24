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
import Ability from '@ohos.app.ability.Ability'
import Want from '@ohos.app.ability.Want'
import AbilityConstant from '@ohos.app.ability.AbilityConstant'
import window from '@ohos.window'
import rpc from '@ohos.rpc';

class MySequenceable {
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

    marshalling(dataOut: rpc.MessageSequence) {
        dataOut.writeInt(this.num);
        dataOut.writeString(this.str);
        dataOut.writeString(this.result);
        return true;
    }

    unmarshalling(dataOut: rpc.MessageSequence) {
        this.num = dataOut.readInt();
        this.str = dataOut.readString();
        this.result = dataOut.readString();
        return true;
    }
}
let callSeq = '';

export default class MainAbility extends Ability {
    test2300(data: rpc.MessageSequence) {
        let recvData = new MySequenceable(0, '', '');
        data.readParcelable(recvData);
        let sendData = new MySequenceable(0, '', '');
        if (recvData.num == 2300 && recvData.str == 'case2300') {
            sendData.num = 0;
        } else {
            sendData.num = 1;
        }
        sendData.str = callSeq;
        return sendData;
    }

    test4600(data: rpc.MessageSequence) {
        let recvData = new MySequenceable(0, '', '');
        data.readParcelable(recvData);
        let sendData = new MySequenceable(0, '', '');
        if (recvData.num == 4600 && recvData.str == 'case4600') {
            sendData.num = 0;
        } else {
            sendData.num = 1;
        }
        sendData.str = callSeq;
        return sendData;
    }

    onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
        // Ability is creating, initialize resources for this ability
        console.log('SystemCallTest Second Hap MainAbility onCreate')
        globalThis.abilityWant = want;
        (this as ESObject).callee.on('test2300', this.test2300);
        (this as ESObject).callee.on('test4600', this.test4600);
        callSeq = callSeq + 'onCreate';
    }

    onDestroy() {
        // Ability is destroying, release resources for this ability
        console.log('SystemCallTest Second Hap MainAbility onDestroy')
        callSeq = callSeq + 'onDestroy';
    }

    onWindowStageCreate(windowStage: window.WindowStage): void {
        // Main window is created, set main page for this ability
        console.log('SystemCallTest Second Hap MainAbility onWindowStageCreate')
        windowStage.loadContent('pages/index', null)
        callSeq = callSeq + 'onWindowStageCreate';
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log('SystemCallTest Second Hap MainAbility onWindowStageDestroy')
    }

    onForeground() {
        // Ability has brought to foreground
        console.log('SystemCallTest Second Hap MainAbility onForeground')
        callSeq = callSeq + 'onForeground';
    }

    onBackground() {
        // Ability has back to background
        console.log('SystemCallTest Second Hap MainAbility onBackground')
        callSeq = callSeq + 'onBackground';
    }
};

