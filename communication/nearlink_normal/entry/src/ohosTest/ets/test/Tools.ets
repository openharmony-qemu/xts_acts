/**
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
import {Component, Driver, ON } from '@ohos.UiTest';
import {abilityDelegatorRegistry} from '@kit.TestKit';
import { abilityAccessCtrl } from '@kit.AbilityKit';
const DEMO_ABILITY_NAME = 'EntryAbility';
const DEMO_BUNDLE_NAME = 'hms.hcts.communication.nearlink.demo';
export async function getbutton(driver: Driver, text: string): Promise<Component> {
  let i = 0;
  while (true) {
    console.info("getbutton while time")
    let button1 = await driver.findComponent(ON.text(text));
    let button2 = await driver.findComponent(ON.id(text));
    await driver.delayMs(300);
    if(button1){
      return button1;
    }
    if(button2){
      return button2;
    }
    if(i > 200){
      throw new Error(`在 200 次尝试后未找到按钮: ${text}`);
    }
    i++;
  }
}
export async function clickGetPermission(): Promise<void> {
  let Get_Permission = "getpermission";
  try {
    // 打开demo界面
    let UI_CLICK_ALLOWED = "允许";
    console.info('[nearlink_Permission_demo] getPermission clickRequestPermission start');
    await abilityDelegatorRegistry.getAbilityDelegator().executeShellCommand(
      `aa start -a ${DEMO_ABILITY_NAME} -b ${DEMO_BUNDLE_NAME}`);
    let driver = Driver.create();
    await driver.delayMs(1000);
    // 当demo有权限时，跳过，否则点击获取权限，
    let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
    let element = await getbutton(driver,'tokenid');
    let tokenId = Number(await element.getText());
    let data = await atManager.checkAccessToken(tokenId, 'ohos.permission.ACCESS_NEARLINK');
    if (data === 0) {
      console.info(`[nearlink_Permission_demo] getSelfPermissionStatus success, result: ${data}`);
    } else {
      let button_demo = await getbutton(driver,Get_Permission);
      await button_demo.click();
      await driver.delayMs(2000);
      console.info('[nearlink_Permission_demo] get button_allow start');
      let button_allow = await getbutton(driver,UI_CLICK_ALLOWED);
      console.info("[nearlink_Permission_demo] get button_allow break" + JSON.stringify(button_allow));
      await button_allow.click();
      console.info('[nearlink_Permission_demo] click success');
      await driver.delayMs(2000);
      console.info('[nearlink_Permission_demo] clickRequestPermission end');
    }
  } catch (err) {
    console.info('[nearlink_Permission_demo] clickRequestPermission failed' + err);
  }
}

export async function clickOpenNearLinkSwitch(): Promise<void> {
  let Get_Permission = "opennearlinkSwitch";
  try {
    console.info('nearLink clickOpenNearLinkSwitch start');
    await abilityDelegatorRegistry.getAbilityDelegator().executeShellCommand(
      `aa start -a ${DEMO_ABILITY_NAME} -b ${DEMO_BUNDLE_NAME}`);
    let driver = Driver.create();
    await driver.delayMs(1000);
    let button = await getbutton(driver,Get_Permission);
    await button.click();
    await driver.delayMs(2000);
    console.info('nearLink clickOpenNearLinkSwitch end');
  } catch (err) {
    console.info('nearLink clickOpenNearLinkSwitch failed' + err);
  }
}
export async function clickCloseNearLinkSwitch(): Promise<void> {
  let Get_Permission = "closenearlinkSwitch";
  try {
    console.info('nearLink clickCloseNearLinkSwitch start');
    await abilityDelegatorRegistry.getAbilityDelegator().executeShellCommand(
      `aa start -a ${DEMO_ABILITY_NAME} -b ${DEMO_BUNDLE_NAME}`);
    let driver = Driver.create();
    await driver.delayMs(1000);
    let button = await getbutton(driver,Get_Permission);
    await button.click();
    await driver.delayMs(2000);
    console.info('nearLink clickCloseNearLinkSwitch end');
  } catch (err) {
    console.info('nearLink clickCloseNearLinkSwitch failed' + err);
  }
}
export async function system_support_nearlink(): Promise<string> {
  let Get_support = "supportnearlink";
  try {
    console.info('nearLink clickCloseNearLinkSwitch start');
    await abilityDelegatorRegistry.getAbilityDelegator().executeShellCommand(
      `aa start -a ${DEMO_ABILITY_NAME} -b ${DEMO_BUNDLE_NAME}`);
    let driver = Driver.create();
    await driver.delayMs(1000);
    let button = await getbutton(driver,Get_support);
    await button.click();
    await driver.delayMs(2000);
    // 先定位元素
    let element = await getbutton(driver,'issupportresult');
    let text = await element.getText();
    console.info('nearLink clickCloseNearLinkSwitch end');
    return text;
  } catch (err) {
    console.info('nearLink clickCloseNearLinkSwitch failed' + err);
    return `Error: ${err.message}`
  }
}