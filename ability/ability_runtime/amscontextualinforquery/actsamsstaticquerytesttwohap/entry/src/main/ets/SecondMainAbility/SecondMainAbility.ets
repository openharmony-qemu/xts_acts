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

export default class SecondAbility extends Ability {
    private abilityWant: Want | undefined = undefined;

    onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
        console.log("SecondAbility onCreate")
        this.abilityWant = want;
    }

    onDestroy() {
        console.log("SecondAbility onDestroy")
    }

    onWindowStageCreate(windowStage: window.WindowStage): void {
        console.log("SecondAbility onWindowStageCreate")
        windowStage.loadContent("pages/index", null)
    }

    onWindowStageDestroy() {
        console.log("SecondAbility onWindowStageDestroy")
    }

    onForeground() {
        console.log("SecondAbility onForeground")
        if (this.abilityWant?.action == 'getAbilityContext2') {
            commonEvent.publish("SecondAbility_Start_CommonEvent_ability", {
                parameters: {
                    hapModuleInfo: JSON.stringify(this.context.currentHapModuleInfo),
                    applicationInfo: JSON.stringify(this.context.applicationInfo),
                    abilityInfo: JSON.stringify(this.context.abilityInfo)
                }
            }, (err) => {
                console.log("MainAbility Publish CallBack MainAbility_Start_CommonEvent")
            });
            console.log('stub SerivceAbilityServer OnConnect start 2');
        }
    }

    onBackground() {
        console.log("SecondAbility onBackground")
    }
};
