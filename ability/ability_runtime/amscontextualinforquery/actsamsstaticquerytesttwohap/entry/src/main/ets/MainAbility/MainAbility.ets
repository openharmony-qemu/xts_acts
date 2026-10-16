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
import UIAbility from '@ohos.app.ability.UIAbility';

export default class MainAbility extends Ability {
    private abilityWant: Want | undefined = undefined;

    onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
        console.log("MainAbility onCreate")
        this.abilityWant = want;
    }

    onDestroy() {
        console.log("MainAbility onDestroy")
    }

    onWindowStageCreate(windowStage: window.WindowStage): void {
        console.log("MainAbility onWindowStageCreate")
        windowStage.loadContent("pages/index/index", null)
    }

    onWindowStageDestroy() {
        console.log("MainAbility onWindowStageDestroy")
    }

    onForeground() {
        let action = this.abilityWant?.action;
        if (action == 'getglobalThis.abilityContext') {
            commonEvent.publish("MainAbility_Start_CommonEvent_ability", {
                parameters: {
                    hapModuleInfo: JSON.stringify(this.context.currentHapModuleInfo),
                    applicationInfo: JSON.stringify(this.context.applicationInfo),
                    abilityInfo: JSON.stringify(this.context.abilityInfo)
                }
            }, (err) => {
                console.log("MainAbility Publish CallBack MainAbility_Start_CommonEvent")
            });
            this.context.startAbility({
                bundleName: "com.example.staticquerytesttwo",
                abilityName: "com.example.staticquerytesttwo.SecondAbility",
                action: "getAbilityContext2"
            }, (error: BusinessError) => {
                console.log('ACTS_getAbilityInfo_0200_startSecondAbility: ' + JSON.stringify(error))
            })
            console.log('stub SerivceAbilityServer OnConnect start 2');
        }
        console.log("MainAbility onForeground")

        if (action == 'startmultiple') {
            this.context.startAbility({
                bundleName: "com.acts.stinformationmulapp",
                abilityName: "com.acts.stinformationmulapp.MainAbility",
                action: "multiple"
            }, (err: BusinessError) => {
                console.log('ACTS_getAbilityInfo_0500 MainAbility onForeground - startAbility restart singleton: ' +
                JSON.stringify(err))
            })
            commonEvent.publish("MainAbility_Start_CommonEvent_multi_hap_entryB", {
                parameters: {
                    hapModuleInfo: JSON.stringify(this.context.currentHapModuleInfo),
                    applicationInfo: JSON.stringify(this.context.applicationInfo),
                    abilityInfo: JSON.stringify(this.context.abilityInfo)
                }
            }, (err) => {
                console.log("ACTS_getAbilityInfo_0500 MainAbility Publish CallBack onForeground")
            });
        }
    }

    onBackground() {
        console.log("MainAbility onBackground")
    }
};
