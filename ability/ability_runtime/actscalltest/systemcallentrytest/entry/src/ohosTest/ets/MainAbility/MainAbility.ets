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
import rpc from '@ohos.rpc';
import UIAbility from '@ohos.app.ability.UIAbility';

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

export default class MainAbility extends Ability {
    test2100(data: rpc.MessageSequence) {
        console.log('SystemCallTest MainAbility test2100 begin');
        let recvData = new MySequenceable(0, '', '');
        data.readParcelable(recvData);
        return new MySequenceable(recvData.num + 1, recvData.str + 'Main', recvData.result);
    }

    onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
        // Ability is creating, initialize resources for this ability
        console.log('SystemCallTest MainAbility onCreate')
        globalThis.abilityWant = want;
        globalThis.callee = this.callee;
        this.callee.on('test2100', this.test2100);
    }

    onDestroy() {
        // Ability is destroying, release resources for this ability
        console.log('SystemCallTest MainAbility onDestroy')
    }

    onWindowStageCreate(windowStage: window.WindowStage): void {
        // Main window is created, set main page for this ability
        console.log('SystemCallTest MainAbility onWindowStageCreate')
        globalThis.abilityContext = this.context
        windowStage.loadContent('MainAbility/pages/index/index', null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log('SystemCallTest MainAbility onWindowStageDestroy')
    }

    onForeground() {
        // Ability has brought to foreground
        console.log('SystemCallTest MainAbility onForeground')
    }

    onBackground() {
        // Ability has back to background
        console.log('SystemCallTest MainAbility onBackground')
    }
};
