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

import Ability from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import commonEvent from '@ohos.commonEvent';
import { CommonEventPublishData } from '@ohos.commonEventManager';
import Want from '@ohos.app.ability.Want';
import common from '@ohos.app.ability.common';
import window from '@ohos.window';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';


interface MultiInstanceParams {
  nextStep: number;
  stepNum: number;
  step: string[];
  startId?: number;
}

let callBackSeq = "";

function publishCallBack() {
  console.debug("====>AbilityMultiInstanceAppD Sec Publish CallBack ====>");
}

async function onShowProcess() {
  let abilityWant: Want = AppStorage.get("abilityWant")!;
  let callBackData = "AppD:";
  callBackSeq += AppStorage.get("onAcceptWantCalledSeq")!;
  callBackData += callBackSeq;
  let commonEventPublishData: CommonEventPublishData = {
    data: callBackData,
    parameters: abilityWant.parameters
  }

  console.log("AbilityMultiInstanceAppD Sec abilityWant = " + JSON.stringify(abilityWant));
  if (abilityWant.parameters!.nextStep >= abilityWant.parameters!.stepNum) {
    commonEvent.publish("MultiInstanceStartFinish", commonEventPublishData, publishCallBack);
  } else {
    commonEvent.publish("MultiInstanceStartNext", commonEventPublishData, () => {
      startAbilityProcess(AppStorage.get<common.UIAbilityContext>("AppDSecondAbilityContext")!, abilityWant.parameters! as unknown as MultiInstanceParams);
    })
  }
  AppStorage.setOrCreate("onAcceptWantCalledSeq", "");
  callBackSeq = "";
}

async function startAbilityProcess(appDSecondAbilityContext: common.UIAbilityContext, parameters: MultiInstanceParams) {
  let bundleName = "com.acts.abilitymultiinstancea";
  let abilityName = "com.acts.abilitymultiinstancea.MainAbility";

  let idx = parameters.nextStep;
  switch (parameters.step[idx]) {
    case "StartA1":
      parameters.startId = 1;
      break;
    case "StartA2":
      parameters.startId = 2;
      break;
    case "StartB":
      bundleName = "com.acts.abilitymultiinstanceb";
      abilityName = "com.acts.abilitymultiinstanceb.MainAbility";
      break;
    case "StartC":
      bundleName = "com.acts.abilitymultiinstancec";
      abilityName = "com.acts.abilitymultiinstancec.MainAbility";
      break;
    case "StartDMain1":
      bundleName = "com.acts.abilitymultiinstanced";
      abilityName = "com.acts.abilitymultiinstanced.MainAbility";
      parameters.startId = 1;
      break;
    case "StartDMain2":
      bundleName = "com.acts.abilitymultiinstanced";
      abilityName = "com.acts.abilitymultiinstanced.MainAbility";
      parameters.startId = 2;
      break;
    case "StartDSec":
      bundleName = "com.acts.abilitymultiinstanced";
      abilityName = "com.acts.abilitymultiinstanced.SecondAbility";
      break;
    case "StartDThd":
      bundleName = "com.acts.abilitymultiinstanced";
      abilityName = "com.acts.abilitymultiinstanced.ThirdAbility";
      break;
    case "StartE":
      bundleName = "com.acts.abilitymultiinstancee";
      abilityName = "com.acts.abilitymultiinstancee.MainAbility";
      break;
    default:
      break;
  }
  parameters.nextStep = ++idx;
  appDSecondAbilityContext.startAbility({
    bundleName: bundleName,
    abilityName: abilityName,
    parameters: parameters as Record<string, Object>
  }, (error: BusinessError, data: void) => {
    console.log('AppD startAbilityProcess result: ' + JSON.stringify(error) + ", " + JSON.stringify(data));
  })
}

export default class SecondAbility extends Ability {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    // Ability is creating, initialize resources for this ability
    console.log("AbilityMultiInstanceAppD Sec onCreate");
    callBackSeq += "onCreate";
    AppStorage.setOrCreate("abilityWant", want);
  }

  onDestroy() {
    // Ability is destroying, release resources for this ability
    console.log("AbilityMultiInstanceAppD Sec onDestroy");
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    console.log("AbilityMultiInstanceAppD Sec onWindowStageCreate");
    AppStorage.setOrCreate("AppDSecondAbilityContext", this.context);
    windowStage.loadContent("pages/index/index", null);
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    console.log("AbilityMultiInstanceAppD Sec onWindowStageDestroy");
  }

  onForeground() {
    // Ability has brought to foreground
    console.log("AbilityMultiInstanceAppD Sec onForeground");
    callBackSeq += "onForeground";
    onShowProcess();
  }

  onBackground() {
    // Ability has back to background
    console.log("AbilityMultiInstanceAppD Sec onBackground");
  }
}
