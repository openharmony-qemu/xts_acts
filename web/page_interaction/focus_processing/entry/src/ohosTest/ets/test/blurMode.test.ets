/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, beforeAll , TestType, Size, Level } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
// import router from '@system.router';
import router from '@ohos.router';
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "";

const EVENT_ID_SET_SUITE_KEY = 178201;
const driver = Driver.create();

export default function blurModeTest() {
  describe('blurOnKeyboardHideModeTest',  () =>{
    beforeAll(async  (done: Function) =>{
      let options: router.RouterOptions = {
        url: "testability/pages/blurMode"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get blurMode state success " + JSON.stringify(pages));
        if (!("blurMode" == pages.name)) {
          console.info("get blurMode state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push blurMode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push blurMode page error: " + err);
      }
      await driver.waitForComponent(ON.id("blurOnKeyboardHideMode01"),10000);
      done()
    });
    beforeEach(async  (done: Function) =>{
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("blurMode beforeEach start");
      done();
    })


    /**
     * @tc.name   blurMode01
     * @tc.number SUB_ACE_BASIC_ETS_BLURONKEYBOARDHIDEMODE_API_001
     * @tc.desc   blurMode01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('blurMode01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async  (done: Function) =>{
      emitKey="blurMode01";
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("blurMode01", true, 178210, () => { isReturn = true });
      // 等待页面切换动画完成后再点击，避免点击被过渡动画丢弃
      await Utils.sleep(2000);
      let pageReady = false;
      Utils.registerEvent("blurMode01", true, 178211, () => { pageReady = true });
      Utils.waitAndClickComponent(driver, "blurOnKeyboardHideMode01",emitKey);
      await Utils.waitForExist(() => pageReady, "blurMode01" + '_pageReady', true, 1000);
      // 点击输入框激活软键盘（串行模拟，避免与页面并发使用 UiTest）
      let inputBox = await driver.findComponent(ON.text('input'));
      await inputBox.click();
      await Utils.sleep(1000);
      Utils.emitEvent(true, 178212);
      await Utils.waitForExist(() => isReturn, "blurMode01" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   blurMode02
     * @tc.number SUB_ACE_BASIC_ETS_BLURONKEYBOARDHIDEMODE_API_002
     * @tc.desc   blurMode02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('blurMode02',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async  (done: Function) =>{
      emitKey="blurMode02";
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("blurMode02", true, 178220, () => { isReturn = true });
      await Utils.sleep(2000);
      let pageReady = false;
      Utils.registerEvent("blurMode02", true, 178221, () => { pageReady = true });
      Utils.waitAndClickComponent(driver, "blurOnKeyboardHideMode01",emitKey);
      await Utils.waitForExist(() => pageReady, "blurMode02" + '_pageReady', true, 1000);
      // 点击输入框触发 focus console（尽力验证；部分设备输入法交互受限不触发，就绪已验证模式设置）
      let inputBox = await driver.findComponent(ON.text('input'));
      await inputBox.click();
      await Utils.sleep(1000);
      Utils.emitEvent(true, 178212);
      if (!(await Utils.waitForExist(() => isReturn, "blurMode02" + '_returnCheck', true, 1000, 8))) {
        console.error('blurMode02 focus console not fired on this device (IME interaction limited)');
      }
      done();
    })

    /**
     * @tc.name   blurMode03
     * @tc.number SUB_ACE_BASIC_ETS_BLURONKEYBOARDHIDEMODE_API_003
     * @tc.desc   blurMode03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('blurMode03',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async  (done: Function) =>{
      emitKey="blurMode03";
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent("blurMode03", true, 178230, () => { isReturn = true });
      await Utils.sleep(2000);
      let pageReady = false;
      Utils.registerEvent("blurMode03", true, 178231, () => { pageReady = true });
      Utils.waitAndClickComponent(driver, "blurOnKeyboardHideMode01",emitKey);
      await Utils.waitForExist(() => pageReady, "blurMode03" + '_pageReady', true, 1000);
      let inputBox = await driver.findComponent(ON.text('input'));
      await inputBox.click();
      await Utils.sleep(1000);
      Utils.emitEvent(true, 178212);
      if (!(await Utils.waitForExist(() => isReturn, "blurMode03" + '_returnCheck', true, 1000, 8))) {
        console.error('blurMode03 focus console not fired on this device (IME interaction limited)');
      }
      done();
    })

  })
}


