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

import router from '@ohos.router';
import { Driver, ON, Component, MatchPattern } from '@ohos.UiTest';
import { expect } from '@ohos/hypium';
import CommonFunc from '../../MainAbility/common/Common';

/**
 * Fast path helpers for dialog_api26: stay on page within a suite,
 * prefer waitForComponent over long fixed sleeps.
 */
export default class DialogApi26TestHelper {
  static readonly PAGE_READY_MS: number = 800;
  static readonly SETTLE_MS: number = 300;
  static readonly DIALOG_MS: number = 400;

  static async openPageIfNeeded(pageName: string, url: string): Promise<void> {
    try {
      let pages = router.getState();
      if (pages.name === pageName) {
        return;
      }
      let options: router.RouterOptions = { url: url };
      await router.pushUrl(options);
      await CommonFunc.sleep(DialogApi26TestHelper.PAGE_READY_MS);
    } catch (err) {
      console.error('[ARKUI_DYN] openPageIfNeeded ' + pageName + ' error: ' + err);
      expect().assertFail();
    }
  }

  static async settle(ms: number = DialogApi26TestHelper.SETTLE_MS): Promise<void> {
    await CommonFunc.sleep(ms);
  }

  static async clickId(driver: Driver, id: string): Promise<Component> {
    let btn = await driver.waitForComponent(ON.id(id), 5000);
    expect(btn !== null).assertTrue();
    await btn.click();
    await CommonFunc.sleep(DialogApi26TestHelper.DIALOG_MS);
    return btn;
  }

  static async dismissByText(driver: Driver, text: string): Promise<void> {
    let act = await driver.waitForComponent(ON.text(text), 3000);
    expect(act !== null).assertTrue();
    await act.click();
    await CommonFunc.sleep(DialogApi26TestHelper.SETTLE_MS);
  }

  /** Click OK by contains-match; never pressBack (avoids leaving the page). */
  static async dismissDialogSoft(driver: Driver, okHint: string): Promise<void> {
    try {
      let act = await driver.findComponent(ON.text(okHint, MatchPattern.CONTAINS));
      if (act !== null) {
        await act.click();
        await CommonFunc.sleep(DialogApi26TestHelper.SETTLE_MS);
        return;
      }
    } catch (e1) {
    }
    try {
      let anyOk = await driver.findComponent(ON.text('AbnOK', MatchPattern.CONTAINS));
      if (anyOk !== null) {
        await anyOk.click();
        await CommonFunc.sleep(DialogApi26TestHelper.SETTLE_MS);
      }
    } catch (e2) {
    }
  }

  /** anyMatch=true: pass if any needle hits; false: all needles required. */
  static async expectIdTextContains(driver: Driver, id: string, needles: string[],
    anyMatch: boolean = false): Promise<string> {
    let label = await driver.waitForComponent(ON.id(id), 5000);
    expect(label !== null).assertTrue();
    let txt = await label.getText();
    let ok = anyMatch ? false : true;
    for (let i = 0; i < needles.length; i++) {
      let hit = txt.indexOf(needles[i]) >= 0;
      if (anyMatch) {
        if (hit) {
          ok = true;
          break;
        }
      } else if (!hit) {
        ok = false;
        break;
      }
    }
    expect(ok).assertTrue();
    return txt;
  }

  static async expectTextVisible(driver: Driver, text: string): Promise<void> {
    let node = await driver.waitForComponent(ON.text(text), 3000);
    expect(node !== null).assertTrue();
  }

  static async leavePage(): Promise<void> {
    try {
      let driver = await Driver.create();
      await driver.pressBack();
      await CommonFunc.sleep(200);
    } catch (e) {
      console.info('[ARKUI_DYN] leavePage skip');
    }
  }
}
