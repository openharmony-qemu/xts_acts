'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import manager from '@ohos.nearlink.manager';
import {
  Component,
  Driver,
  ON,
  On,
  MatchPattern,
  MouseButton,
  WindowMode,
  UIElementInfo,
  UiDirection,
  PointerMatrix,
  DisplayRotation
} from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';

import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import { Permissions } from 'permissions';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';

const DEMO_ABILITY_NAME = 'EntryAbility';
const DEMO_BUNDLE_NAME = 'hms.hcts.communication.nearlink.demo';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default class Utils {
  static async msSleep(count: int): Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }

  static async getbutton(driver: Driver, text: string): Promise<Component> {
    let i = 0;
    while (true) {
      hilog.info(0x0000, 'testTag', 'getbutton while time');
      let button1 = await driver.findComponent(ON.text(text));
      let button2 = await driver.findComponent(ON.id(text));
      await driver.delayMs(300);
      hilog.info(0x0000, 'testTag', `button1:${JSON.stringify(button1)}`);
      hilog.info(0x0000, 'testTag', `button2:${JSON.stringify(button2)}`);
      if (button1) {
        return button1;
      }
      if (button2) {
        return button2;
      }
      if (i > 200) {
        throw new Error(`200 attempts failed to find button: ${text}`);
      }
      i++;
    }
  }

  static async clickGetPermission(texting?: string): Promise<void> {
    let Get_Permission = "getpermission";
    try {
      let UI_CLICK_ALLOWED = "允许";
      let return_boolean: boolean;
      return_boolean = manager.isNearLinkSupported();
      if (return_boolean === false) {
        return;
      }
      hilog.info(0x0000, 'testTag', 'getPermission clickRequestPermission start');
      let cmd = `aa start -a ${DEMO_ABILITY_NAME} -b ${DEMO_BUNDLE_NAME}`;
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if(user !== undefined){
        cmd += ` -u ${user}`;
      }
      await abilityDelegatorRegistry.getAbilityDelegator().executeShellCommand(
        cmd);
      let driver = Driver.create();
      await driver.delayMs(1000);
      let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      let element = await Utils.getbutton(driver, 'tokenid');
      let tokenId: string = await element.getText();
      let data = await atManager.checkAccessToken(Number(tokenId).toInt(), 'ohos.permission.ACCESS_NEARLINK');
      if (data === 0) {
        hilog.info(0x0000, 'testTag', 'getSelfPermissionStatus success, result: %{public}d', data);
      } else {
        let button_demo = await Utils.getbutton(driver, Get_Permission);
        await button_demo.click();
        await driver.delayMs(2000);
        hilog.info(0x0000, 'testTag', 'get button_allow start');
        let button_allow = await Utils.getbutton(driver, UI_CLICK_ALLOWED);
        hilog.info(0x0000, 'testTag', 'get button_allow break %{public}s', JSON.stringify(button_allow));
        await button_allow.click();
        hilog.info(0x0000, 'testTag', 'click success');
        await driver.delayMs(1000);
        hilog.info(0x0000, 'testTag', 'clickRequestPermission end');
      }
    } catch (err) {
      hilog.error(0x0000, 'testTag', 'clickRequestPermission failed %{public}s', JSON.stringify(err));
    }
  }

  static async clickRequestPermission(texting?: string): Promise<void> {
    let UI_CLICK_ALLOWED = "允许";
    try {
      let return_boolean: boolean;
      return_boolean = manager.isNearLinkSupported();
      if (return_boolean === false) {
        return;
      }
      let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      let data: abilityAccessCtrl.PermissionStatus =
        atManager.getSelfPermissionStatus('ohos.permission.ACCESS_NEARLINK');
      hilog.info(0x0000, 'testTag', '[nearlink_Permission_test] getSelfPermissionStatus result is %{public}d', data);
      if (data === 0) {
        hilog.info(0x0000, 'testTag', '[nearlink_Permission_test] getSelfPermissionStatus success, result: %{public}d',
          data);
      } else {
        hilog.info(0x0000, 'testTag', '%{public}s', '[nearlink_Permission_test] clickRequestPermission start');
        let driver = Driver.create();
        await driver.delayMs(1000);
        let button = await Utils.getbutton(driver, UI_CLICK_ALLOWED);
        hilog.info(0x0000, 'testTag', '[nearlink_Permission_test] get button break %{public}s', JSON.stringify(button));
        await button.click();
        hilog.info(0x0000, 'testTag', '%{public}s', '[nearlink_Permission_test] click success');
        await driver.delayMs(2000);
        hilog.info(0x0000, 'testTag', '%{public}s', '[nearlink_Permission_test] clickRequestPermission end');
      }
      if (texting === "辅助包执行") {
        await Utils.clickGetPermission();
      } else {
        hilog.info(0x0000, 'testTag', '%{public}s', '[nearlink_Permission_test] 不用获取辅助包权限');
      }
    } catch (err) {
      hilog.error(0x0000, 'testTag', '[nearlink_Permission_test] clickGetPermission failed %{public}s',
        JSON.stringify(err));
    }
  }

  static async clickOpenNearLinkSwitch(): Promise<void> {
    let Get_Permission = "opennearlinkSwitch";
    try {
      hilog.info(0x0000, 'testTag', 'clickOpenNearLinkSwitch start');
      let cmd = `aa start -a ${DEMO_ABILITY_NAME} -b ${DEMO_BUNDLE_NAME}`;
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if(user !== undefined){
        cmd += ` -u ${user}`;
      }
      await abilityDelegatorRegistry.getAbilityDelegator().executeShellCommand(
        cmd);
      await Utils.clickGetPermission();
      let driver = Driver.create();
      await driver.delayMs(1000);
      let button = await Utils.getbutton(driver, Get_Permission);
      await button.click();
      await driver.delayMs(2000);
      hilog.info(0x0000, 'testTag', 'clickOpenNearLinkSwitch end');
    } catch (err) {
      hilog.error(0x0000, 'testTag', 'clickOpenNearLinkSwitch failed %{public}s', JSON.stringify(err));
    }
  }

  static async clickCloseNearLinkSwitch(): Promise<void> {
    let Get_Permission = "closenearlinkSwitch";
    try {
      hilog.info(0x0000, 'testTag', 'clickCloseNearLinkSwitch start');
      let cmd = `aa start -a ${DEMO_ABILITY_NAME} -b ${DEMO_BUNDLE_NAME}`;
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if(user !== undefined){
        cmd += ` -u ${user}`;
      }
      await abilityDelegatorRegistry.getAbilityDelegator().executeShellCommand(
        cmd);
      await Utils.clickGetPermission();
      let driver = Driver.create();
      await driver.delayMs(1000);
      let button = await Utils.getbutton(driver, Get_Permission);
      await button.click();
      await driver.delayMs(2000);
      hilog.info(0x0000, 'testTag', 'clickCloseNearLinkSwitch end');
    } catch (err) {
      hilog.error(0x0000, 'testTag', 'clickCloseNearLinkSwitch failed %{public}s', JSON.stringify(err));
    }
  }

  static async openNearLink(): Promise<void> {
    try {
      let state = manager.getState();
      let TIME_SLEEP = 2000;
      switch (state) {
        case manager.NearlinkState.STATE_TURNING_ON:
          await Utils.msSleep(TIME_SLEEP);
          let state0 = manager.getState();
          hilog.info(0x0000, 'testTag', 'nearLink state: %{public}d', state0);
          break;
        case manager.NearlinkState.STATE_ON:
          hilog.info(0x0000, 'testTag', 'nearLink state: %{public}d', state);
          break;
        case manager.NearlinkState.STATE_TURNING_OFF:
          await Utils.msSleep(TIME_SLEEP);
          await Utils.clickOpenNearLinkSwitch();
          await Utils.msSleep(TIME_SLEEP);
          let state2 = manager.getState();
          hilog.info(0x0000, 'testTag', 'nearLink state: %{public}d', state2);
          break;
        case manager.NearlinkState.STATE_OFF:
          await Utils.clickOpenNearLinkSwitch();
          await Utils.msSleep(TIME_SLEEP);
          let state3 = manager.getState();
          hilog.info(0x0000, 'testTag', 'nearLink state: %{public}d', state3);
          break;
        default:
          hilog.info(0x0000, 'testTag', 'enable success');
      }
    } catch (error) {
      if (error.code === 801) {
        return;
      }
    }
  }

  static async closeNearLink(): Promise<void> {
    try {
      let state = manager.getState();
      let TIME_SLEEP = 2000;
      switch (state) {
        case manager.NearlinkState.STATE_TURNING_OFF:
          await Utils.msSleep(TIME_SLEEP);
          let state0 = manager.getState();
          hilog.info(0x0000, 'testTag', 'nearLink state: %{public}s', JSON.stringify(state0));
          break;
        case manager.NearlinkState.STATE_OFF:
          hilog.info(0x0000, 'testTag', 'nearLink state: %{public}s', JSON.stringify(state));
          break;
        case manager.NearlinkState.STATE_TURNING_ON: 
          await Utils.msSleep(TIME_SLEEP);
          await Utils.clickCloseNearLinkSwitch();
          await Utils.msSleep(TIME_SLEEP);
          let state2 = manager.getState();
          hilog.info(0x0000, 'testTag', 'nearLink state: %{public}s', JSON.stringify(state2));
          break;
        case manager.NearlinkState.STATE_ON:
          await Utils.clickCloseNearLinkSwitch();
          await Utils.msSleep(TIME_SLEEP);
          let state3 = manager.getState();
          hilog.info(0x0000, 'testTag', 'nearLink state: %{public}s', JSON.stringify(state3));
          break;
        default:
          hilog.info(0x0000, 'testTag', 'enable success');
      }
    } catch (error) {
      if (error.code === 801) {
        return;
      }
    }
  }
}
