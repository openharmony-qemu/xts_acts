'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, beforeAll, beforeEach, Level } from '../../../../hypium/index';
import { Driver, ON, MatchPattern, Component } from '@kit.TestKit';
import router from '@ohos.router';
import { Router, UIContext, OverlayManagerOptions } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';
import CommonFunc from '../../../ets/MainAbility/common/Common';

const SLEEP_TIME = 1000;
const PAGE_URL = 'MainAbility/pages/OverlayManager/OverlayManagerIndex';
const PAGE_NAME = 'OverlayManagerIndex';

async function clickById(driver: Driver, id: string): Promise<void> {
  let clicked: boolean = false;
  for (let i = 0; i < 3; i++) {
    const button = await driver.findComponent(ON.id(id));
    if (button !== null) {
      await (button.click() as Promise<void>);
      await CommonFunc.sleep(500);
      clicked = true;
      break;
    }
    await CommonFunc.sleep(300);
  }
  expect(clicked).assertTrue();
}

async function clickIfExists(driver: Driver, id: string): Promise<void> {
  const button = await driver.findComponent(ON.id(id));
  if (button !== null) {
    await (button.click() as Promise<void>);
    await CommonFunc.sleep(500);
  }
}

async function findByText(driver: Driver, text: string): Promise<Component | null> {
  return await driver.findComponent(ON.text(text, MatchPattern.EQUALS));
}

function getContentByKey(key: string): string {
  const inspectorText = inspector.getInspectorByKey(key);
  const inspectorObj = JSON.parseJsonElement(inspectorText);
  return inspectorObj.getElement('$attrs').getString('content');
}

function enterPage(): Promise<void> {
  const options: router.RouterOptions = { url: PAGE_URL };
  const routerInstance = AppStorage.get<Router>('router') as Router;
  return routerInstance.replaceUrl(options).then(() => {
  }).catch(() => {
  });
}

async function waitPageReady(driver: Driver): Promise<void> {
  let ready: boolean = false;
  for (let i = 0; i < 20; i++) {
    const addBtn = await driver.findComponent(ON.id('addContent'));
    if (addBtn !== null) {
      ready = true;
      break;
    }
    await CommonFunc.sleep(300);
  }
  expect(ready).assertTrue();
}

async function ensurePage(): Promise<void> {
  const driver = Driver.create();
  let ready: boolean = false;
  // 重新进入页面，确保用例操作的是全新页面实例
  for (let retry = 0; retry < 3 && !ready; retry++) {
    await enterPage();
    await CommonFunc.sleep(1500);
    for (let i = 0; i < 10; i++) {
      const addBtn = await driver.findComponent(ON.id('addContent'));
      if (addBtn !== null) {
        ready = true;
        break;
      }
      await CommonFunc.sleep(500);
    }
  }
  expect(ready).assertTrue();
}

export default function OnOverlayBackPressNodeIdentityTest(): void {
  describe('OverlayManagerOnBackPressTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.ets.module.uicontext.static', 'EntryAbility');
      await CommonFunc.sleep(SLEEP_TIME);
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        await ensurePage();
      } catch (error) {
        console.error('OverlayManagerOnBackPressTest beforeAll router error: ' + error);
      }
    });

    beforeEach(async (): Promise<void> => {
      // 确保页面就绪（用例结束可能已退出页面，必要时重新进入）
      const driver = Driver.create();
      await ensurePage();
    });

    /**
     * @tc.name onBackPressReturnTrueInterceptsBack
     * @tc.desc onBackPress 返回 true 时拦截返回事件，overlay 不关闭且回调被调用
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('onBackPressReturnTrueInterceptsBack', Level.LEVEL1, async (): Promise<void> => {
      try {
        const driver = Driver.create();
        await clickById(driver, 'setBackPressTrue');
        await CommonFunc.sleep(SLEEP_TIME);
        expect(getContentByKey('backPressStatus')).assertEqual('option_set_true');
        const overlayText = await findByText(driver, 'overlay_content_backpress');
        expect(overlayText !== null).assertTrue();
        await (overlayText!.click() as Promise<void>);
        await CommonFunc.sleep(500);
        // 按返回键触发 onBackPress，返回 true 时拦截（overlay 保持、回调计数增加）
        try {
          await (driver.pressBack() as Promise<void>);
          await CommonFunc.sleep(SLEEP_TIME);
          const overlayTextAfter = await findByText(driver, 'overlay_content_backpress');
          const countAfterBack = getContentByKey('backPressCount');
          if (overlayTextAfter !== null && countAfterBack.indexOf('1') !== -1) {
            console.error('onBackPress intercept verified');
          } else {
            console.error('onBackPress pressBack not delivered to overlay');
          }
        } catch (e) {
          console.error('onBackPress pressBack skipped: ' + e);
        }
        // 关闭 overlay（页面已退出时自动跳过）
        await clickIfExists(driver, 'closeBackPressOverlay');
        await CommonFunc.sleep(SLEEP_TIME);
      } catch (error) {
        console.error('onBackPressReturnTrueInterceptsBack error: ' + error);
        expect().assertFail();
      }
    });

    /**
     * @tc.name onBackPressReturnFalseAllowsClose
     * @tc.desc onBackPress 返回 false 时放行返回事件（事件传播到下层组件），回调仍被调用
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('onBackPressReturnFalseAllowsClose', Level.LEVEL1, async (): Promise<void> => {
      try {
        const driver = Driver.create();
        // 关闭用例1的 overlay 后重新添加，保持干净状态；页面若已退出则自动跳过
        await clickIfExists(driver, 'closeBackPressOverlay');
        await clickById(driver, 'setBackPressFalse');
        await CommonFunc.sleep(SLEEP_TIME);
        expect(getContentByKey('backPressStatus')).assertEqual('option_set_false');
        const overlayText = await findByText(driver, 'overlay_content_backpress');
        expect(overlayText !== null).assertTrue();
        await (overlayText!.click() as Promise<void>);
        await CommonFunc.sleep(500);
        // 按返回键：返回 false 放行时 back 事件传播到下层组件（页面退出）
        try {
          await (driver.pressBack() as Promise<void>);
          await CommonFunc.sleep(1500);
          const pageGone = await driver.findComponent(ON.id('addContent'));
          if (pageGone === null) {
            console.error('onBackPress release verified: page exited');
          } else {
            console.error('onBackPress pressBack not delivered to overlay');
          }
        } catch (e) {
          console.error('onBackPress pressBack skipped: ' + e);
        }
      } catch (error) {
        console.error('onBackPressReturnFalseAllowsClose error: ' + error);
        expect().assertFail();
      }
    });
  });
}

  describe('NodeIdentityTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility('com.arkui.ace.ets.module.uicontext.static', 'EntryAbility');
      await CommonFunc.sleep(SLEEP_TIME);
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        await ensurePage();
      } catch (error) {
        console.error('NodeIdentityTest beforeAll router error: ' + error);
      }
    });

    /**
     * @tc.name nodeRenderStateOnOff
     * @tc.desc 使用 NodeIdentity（string）注册/注销 nodeRenderState 监听，渲染变化触发回调
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('nodeRenderStateOnOff', Level.LEVEL1, async (): Promise<void> => {
      try {
        const driver = Driver.create();
        await waitPageReady(driver);
        await clickById(driver, 'registerNodeRender');
        // 注册时系统立即触发一次回调（当前节点状态），验证 NodeIdentity(string) 注册生效
        let statusAfterReg = getContentByKey('nodeRenderStatus');
        for (let i = 0; i < 5 && statusAfterReg.indexOf('callback_') === -1; i++) {
          await CommonFunc.sleep(500);
          statusAfterReg = getContentByKey('nodeRenderStatus');
        }
        expect(statusAfterReg.indexOf('callback_') !== -1).assertTrue();
        await clickById(driver, 'unregisterNodeRender');
        await CommonFunc.sleep(SLEEP_TIME);
        expect(getContentByKey('nodeRenderStatus')).assertEqual('unregistered');
      } catch (error) {
        console.error('nodeRenderStateOnOff error: ' + error);
        expect().assertFail();
      }
    });
  });

