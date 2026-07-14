/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { Driver, ON } from '@ohos.UiTest';
import { router } from '@kit.ArkUI';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import CommonFunc from '../../MainAbility/common/Common';

export default class ErrorCodeAssert {
  static readonly PAGE_READY_MS: number = 2000;
  static readonly STATUS_WAIT_MS: number = 3000;
  static readonly BUNDLE_NAME: string = 'com.arkui.ace.dialog.errorcode';
  static readonly ABILITY_NAME: string = 'com.arkui.ace.dialog.errorcode.EntryAbility';

  private static async clickTextIfPresent(driver: Driver, text: string): Promise<boolean> {
    try {
      let btn = await driver.findComponent(ON.text(text));
      if (btn == null) {
        return false;
      }
      await btn.click();
      await CommonFunc.sleep(400);
      return true;
    } catch (_e) {
      return false;
    }
  }

  private static async findById(driver: Driver, componentId: string): Promise<boolean> {
    try {
      let btn = await driver.findComponent(ON.id(componentId));
      return btn != null;
    } catch (_e) {
      return false;
    }
  }

  /** aa start 拉回前台；禁止 pressBack（会 onBackground / 弹栈）。 */
  static async ensureForeground(): Promise<void> {
    try {
      let delegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmd: string = 'aa start -d 0 -a ' + ErrorCodeAssert.ABILITY_NAME +
        ' -b ' + ErrorCodeAssert.BUNDLE_NAME;
      await delegator.executeShellCommand(cmd);
      await CommonFunc.sleep(800);
    } catch (_e) {
      console.info('[ARKUI_DYN] ensureForeground ignored');
    }
  }

  /**
   * 只点一次关闭类文案；禁止 pressBack。
   * 不做多轮 findComponent，避免 beforeEach 拖垮 aa test timeout。
   */
  static async dismissSystemOverlay(driver: Driver): Promise<void> {
    if (await ErrorCodeAssert.clickTextIfPresent(driver, '取消')) {
      return;
    }
    if (await ErrorCodeAssert.clickTextIfPresent(driver, 'Cancel')) {
      return;
    }
    if (await ErrorCodeAssert.clickTextIfPresent(driver, 'OK')) {
      return;
    }
    if (await ErrorCodeAssert.clickTextIfPresent(driver, '确定')) {
      return;
    }
    console.info('[ARKUI_DYN] dismissSystemOverlay: no close button');
  }

  static async dismissOpenDialog(driver: Driver): Promise<void> {
    await ErrorCodeAssert.dismissSystemOverlay(driver);
  }

  static async dismissUecOverlay(driver: Driver): Promise<void> {
    await ErrorCodeAssert.dismissSystemOverlay(driver);
  }

  /** NORMAL 后等弹窗渲染再关（ActionMenu OK 常晚于 PASS）。 */
  static async dismissAfterNormal(driver: Driver): Promise<void> {
    await CommonFunc.sleep(800);
    await ErrorCodeAssert.dismissSystemOverlay(driver);
    await CommonFunc.sleep(400);
    await ErrorCodeAssert.dismissSystemOverlay(driver);
  }

  private static async pushPage(pageUrl: string, waitMs: number): Promise<void> {
    try {
      router.clear();
    } catch (_e) {
      console.info('[ARKUI_DYN] router.clear ignored');
    }
    try {
      await router.replaceUrl({ url: pageUrl });
    } catch (_e2) {
      await router.pushUrl({ url: pageUrl });
    }
    await CommonFunc.sleep(waitMs);
  }

  static async openTestPage(driver: Driver, pageUrl: string, probeId: string): Promise<void> {
    await ErrorCodeAssert.dismissSystemOverlay(driver);
    await ErrorCodeAssert.pushPage(pageUrl, ErrorCodeAssert.PAGE_READY_MS);
    if (await ErrorCodeAssert.findById(driver, probeId)) {
      return;
    }
    console.info('[ARKUI_DYN] openTestPage probe miss, recover id=' + probeId);
    await ErrorCodeAssert.ensureForeground();
    await ErrorCodeAssert.dismissSystemOverlay(driver);
    await ErrorCodeAssert.pushPage(pageUrl, ErrorCodeAssert.PAGE_READY_MS + 800);
    if (!(await ErrorCodeAssert.findById(driver, probeId))) {
      console.info('[ARKUI_DYN] openTestPage still miss id=' + probeId);
    }
  }

  static async clickById(driver: Driver, componentId: string): Promise<void> {
    if (await ErrorCodeAssert.findById(driver, componentId)) {
      let btn = await driver.findComponent(ON.id(componentId));
      await btn.click();
      return;
    }
    console.info('[ARKUI_DYN] clickById miss, recover id=' + componentId);
    await ErrorCodeAssert.dismissSystemOverlay(driver);
    await CommonFunc.sleep(600);
    if (!(await ErrorCodeAssert.findById(driver, componentId))) {
      await ErrorCodeAssert.ensureForeground();
      await CommonFunc.sleep(600);
    }
    if (!(await ErrorCodeAssert.findById(driver, componentId))) {
      throw new Error('clickById: component not found id=' + componentId);
    }
    let btn2 = await driver.findComponent(ON.id(componentId));
    await btn2.click();
  }

  /** 按文案点击（id 命中但未触发 onClick 时备用）。 */
  static async clickByText(driver: Driver, text: string): Promise<void> {
    let btn = await driver.findComponent(ON.text(text));
    await btn.click();
    await CommonFunc.sleep(400);
  }

  static async clickAndWaitStatus(
    driver: Driver,
    componentId: string,
    pagePrefix: string
  ): Promise<string> {
    await ErrorCodeAssert.clickById(driver, componentId);
    let status: string = await ErrorCodeAssert.waitStatus(pagePrefix, ErrorCodeAssert.STATUS_WAIT_MS);
    if (status !== 'IDLE' && status.length > 0) {
      return status;
    }
    console.info('[ARKUI_DYN] status still IDLE, retry click id=' + componentId);
    await ErrorCodeAssert.dismissSystemOverlay(driver);
    await CommonFunc.sleep(500);
    await ErrorCodeAssert.clickById(driver, componentId);
    return await ErrorCodeAssert.waitStatus(pagePrefix, ErrorCodeAssert.STATUS_WAIT_MS);
  }

  static async waitStatus(pagePrefix: string, timeoutMs: number): Promise<string> {
    let elapsed: number = 0;
    let status: string = ErrorCodeAssert.readStatus(pagePrefix);
    while (elapsed < timeoutMs) {
      if (status !== 'IDLE' && status.length > 0) {
        return status;
      }
      await CommonFunc.sleep(200);
      elapsed += 200;
      status = ErrorCodeAssert.readStatus(pagePrefix);
    }
    return status;
  }

  private static readContent(inspectorKey: string): string {
    let strJson: string = getInspectorByKey(inspectorKey);
    if (strJson === undefined || strJson === null || strJson.length === 0) {
      console.info('[ARKUI_DYN] getInspectorByKey empty key=' + inspectorKey);
      return '';
    }
    let obj: Record<string, Object> = JSON.parse(strJson);
    let attrs: Record<string, Object> = obj['$attrs'] as Record<string, Object>;
    let raw: string = JSON.stringify(attrs['content']);
    if (raw.length >= 2 && raw.charAt(0) === '\"') {
      return raw.substring(1, raw.length - 1);
    }
    return raw;
  }

  static readStatus(pagePrefix: string): string {
    return ErrorCodeAssert.readContent(pagePrefix + '_result_status');
  }

  static readLabel(pagePrefix: string): string {
    return ErrorCodeAssert.readContent(pagePrefix + '_result_label');
  }

  static readActualCode(pagePrefix: string): string {
    return ErrorCodeAssert.readContent(pagePrefix + '_result_actual');
  }
}
