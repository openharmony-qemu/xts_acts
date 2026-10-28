'use static';

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
 
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-static/src/main/indexStatic';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix, MouseButton } from '@ohos.UiTest';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest, startAbility } from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

let displayID: Int = 0;

function getResult(): string {
  let str = inspector.getInspectorByKey('ChipGroupOnItemsChangeAbnormal_result');
  let obj = JSON.parseJsonElement(str);
  let attrs = obj.tryGetElement('$attrs');
  if (!attrs) { return ''; }
  return attrs.getString('content');
}

function getCount(): number {
  let s = getResult();
  let prefix = 'count=';
  let idx = s.indexOf(prefix);
  if (idx < 0) {
    return -1;
  }
  let start = idx + prefix.length;
  let end = start;
  while (end < s.length && s.charCodeAt(end) >= 48 && s.charCodeAt(end) <= 57) {
    end++;
  }
  if (end === start) {
    return -1;
  }
  return parseInt(s.substring(start, end), 10);
}

function getText(): string {
  let s = getResult();
  let idx = s.indexOf('|text=');
  return idx >= 0 ? s.substring(idx + 6) : '';
}

async function closeChipByText(driver: Driver, text: string): Promise<void> {
  let chipComp: Component | null = null;
  for (let i = 0; i < 5; i++) {
    chipComp = await driver.findComponent(ON.text(text));
    if (chipComp !== null) {
      break;
    }
    console.info('closeChipByText text=' + text + ' not found, retry ' + (i + 1));
    await CommonFunc.sleep(500);
  }
  if (chipComp === null) {
    throw new Error('closeChipByText: chip text=' + text + ' not found after retries');
  }
  let rect = await chipComp!.getBounds();
  let chipWidth: number = rect.right - rect.left;
  let chipHeight: number = rect.bottom - rect.top;
  let x: number = rect.right - Math.round(chipWidth * 0.14) + (AppStorage.get<number>('winLeft') ?? 0);
  let y: number = rect.top + Math.round(chipHeight / 2) + (AppStorage.get<number>('winTop') ?? 0);
  console.info('closeChipByText text=' + text + ' click close at x=' + x + ' y=' + y
    + ' bounds={left:' + rect.left + ',right:' + rect.right + ',top:' + rect.top + ',bottom:' + rect.bottom
    + '} chipWidth=' + chipWidth + ' chipHeight=' + chipHeight);
  await driver.mouseClick({x:Math.round(x).toInt(), y:Math.round(y).toInt(), displayId: displayID}, MouseButton.MOUSE_BUTTON_LEFT);
}

async function resetPage(driver: Driver): Promise<void> {
  let btnReset = await driver.findComponent(ON.id('ChipGroupOnItemsChangeAbnormal_btn_reset'));
  await (btnReset?.click() as Promise<void>);
  await CommonFunc.sleep(2000);
}

export default function ChipGroupOnItemsChangeAbnormalTest(): void {
  describe('ChipGroupOnItemsChangeAbnormalTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('ChipGroupOnItemsChangeAbnormalTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.advance.chip.static', 'EntryAbility');
      displayID = (AppStorage.get<number>('displayID') ?? 0).toInt();
      console.info("commonEventTest1 displayID: " + displayID.toString());
    });

    beforeEach(async (): Promise<void> => {
      console.info('ChipGroupOnItemsChangeAbnormalTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ChipGroup/abnormal/ChipGroupOnItemsChangeAbnormal',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get ChipGroupOnItemsChangeAbnormal state pages: ' + JSON.stringify(pages));
        if (!('ChipGroupOnItemsChangeAbnormal' == pages.name)) {
          console.info('get ChipGroupOnItemsChangeAbnormal pages.name: ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push ChipGroupOnItemsChangeAbnormalTest page error: ' + err);
      }
      console.info('ChipGroupOnItemsChangeAbnormalTest beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(500);
      console.info('ChipGroupOnItemsChangeAbnormalTest afterEach');
    });

    /**
     * @tc.name   SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_static_0100
     * @tc.number SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_static_0100
     * @tc.desc   Pass undefined to onItemsChange, treated as unset, user close does not fire callback, no crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_static_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await resetPage(driver);

      let btnSetUndef = await driver.findComponent(ON.id('ChipGroupOnItemsChangeAbnormal_btn_setUndefined'));
      await (btnSetUndef?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let beforeCount = getCount();
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_static_0100 before count: ' + beforeCount);

      await closeChipByText(driver, 'item0');
      await CommonFunc.sleep(1500);

      let afterCount = getCount();
      let afterResult = getResult();
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_static_0100 after count: ' + afterCount + ' result: ' + afterResult);

      expect(afterCount).assertEqual(beforeCount);
      expect(afterResult.indexOf('count=') !== -1).assertTrue();

      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_static_0100 END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_static_0200
     * @tc.number SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_static_0200
     * @tc.desc   After undefined, restore valid callback, user close fires onItemsChange again
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_static_0200 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await resetPage(driver);

      let btnSetUndef = await driver.findComponent(ON.id('ChipGroupOnItemsChangeAbnormal_btn_setUndefined'));
      await (btnSetUndef?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let countAfterUndef = getCount();
      await closeChipByText(driver, 'item0');
      await CommonFunc.sleep(1500);
      let countAfterCloseUndef = getCount();
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_static_0200 after undef close count: ' + countAfterCloseUndef);
      expect(countAfterCloseUndef).assertEqual(countAfterUndef);

      let btnSetValid = await driver.findComponent(ON.id('ChipGroupOnItemsChangeAbnormal_btn_setValid'));
      await (btnSetValid?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let countAfterValid = getCount();

      await closeChipByText(driver, 'item1');
      await CommonFunc.sleep(1500);

      let finalCount = getCount();
      let finalText = getText();
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_static_0200 final count: ' + finalCount + ' text: ' + finalText);

      expect(finalCount).assertEqual(countAfterValid + 1);
      expect(finalText.indexOf('item1')).assertEqual(-1);

      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_static_0200 END');
      done();
    });
  })
}
