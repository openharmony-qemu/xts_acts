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
  let str = inspector.getInspectorByKey('ChipGroupOnItemsChange_result');
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
  let x: number = rect.right - Math.round(chipWidth * 0.14);
  let y: number = rect.top + Math.round(chipHeight / 2);
  console.info('closeChipByText text=' + text + ' click close at x=' + x + ' y=' + y
    + ' bounds={left:' + rect.left + ',right:' + rect.right + ',top:' + rect.top + ',bottom:' + rect.bottom
    + '} chipWidth=' + chipWidth + ' chipHeight=' + chipHeight);
  await driver.mouseClick({x:Math.round(x).toInt(), y:Math.round(y).toInt(), displayId: displayID}, MouseButton.MOUSE_BUTTON_LEFT);
}

async function resetPage(driver: Driver): Promise<void> {
  let btnReset = await driver.findComponent(ON.id('ChipGroupOnItemsChange_btn_reset'));
  await (btnReset?.click() as Promise<void>);
  await CommonFunc.sleep(2000);
}

export default function ChipGroupOnItemsChangeTest(): void {
  describe('ChipGroupOnItemsChangeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('ChipGroupOnItemsChangeTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.advance.chip.static', 'EntryAbility');
      displayID = (AppStorage.get<number>('displayID') ?? 0).toInt();
      console.info("commonEventTest1 displayID: " + displayID.toString());
    });

    beforeEach(async (): Promise<void> => {
      console.info('ChipGroupOnItemsChangeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ChipGroup/ChipGroupOnItemsChange',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get ChipGroupOnItemsChangeTest state pages: ' + JSON.stringify(pages));
        if (!('ChipGroupOnItemsChange' == pages.name)) {
          console.info('get ChipGroupOnItemsChangeTest pages.name: ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push ChipGroupOnItemsChangeTest page error: ' + err);
      }
      console.info('ChipGroupOnItemsChangeTest beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(500);
      console.info('ChipGroupOnItemsChangeTest afterEach');
    });

    /**
     * @tc.name   SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0100
     * @tc.number SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0100
     * @tc.desc   User closes one chip via × icon, onItemsChange fires once with the closed item removed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await resetPage(driver);

      let beforeCount = getCount();
      let beforeText = getText();
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0100 before count: ' + beforeCount + ' text: ' + beforeText);

      await closeChipByText(driver, 'item0');
      await CommonFunc.sleep(1500);

      let afterCount = getCount();
      let afterText = getText();
      let afterItems = afterText.split('|');
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0100 after count: ' + afterCount + ' text: ' + afterText);

      expect(afterCount).assertEqual(beforeCount + 1);
      expect(afterText.indexOf('item0')).assertEqual(-1);
      expect(afterItems.length).assertEqual(2);

      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0100 END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0200
     * @tc.number SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0200
     * @tc.desc   User closes two chips successively, onItemsChange fires twice with correct items each time
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0200 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await resetPage(driver);

      let beforeCount = getCount();
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0200 before count: ' + beforeCount);

      await closeChipByText(driver, 'item0');
      await CommonFunc.sleep(1000);
      let midCount = getCount();
      let midText = getText();
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0200 mid count: ' + midCount + ' text: ' + midText);

      await closeChipByText(driver, 'item1');
      await CommonFunc.sleep(1500);

      let afterCount = getCount();
      let afterText = getText();
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0200 after count: ' + afterCount + ' text: ' + afterText);

      expect(midCount).assertEqual(beforeCount + 1);
      expect(afterCount).assertEqual(beforeCount + 2);
      expect(afterText.indexOf('item0')).assertEqual(-1);
      expect(afterText.indexOf('item1')).assertEqual(-1);
      expect(afterText.split('|').length).assertEqual(1);

      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0200 END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0300
     * @tc.number SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0300
     * @tc.desc   User closes a middle chip, onItemsChange returns items with correct order (前后项保持)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0300 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await resetPage(driver);

      let beforeCount = getCount();
      let beforeText = getText();
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0300 before count: ' + beforeCount + ' text: ' + beforeText);

      await closeChipByText(driver, 'item1');
      await CommonFunc.sleep(1500);

      let afterCount = getCount();
      let afterText = getText();
      let afterItems = afterText.split('|');
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0300 after count: ' + afterCount + ' text: ' + afterText);

      expect(afterCount).assertEqual(beforeCount + 1);
      expect(afterText.indexOf('item1')).assertEqual(-1);
      expect(afterItems.length).assertEqual(2);
      expect(afterItems[0]).assertEqual('item0');
      expect(afterItems[1]).assertEqual('item2');

      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0300 END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0400
     * @tc.number SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0400
     * @tc.desc   User closes the first chip, onItemsChange returns items with second chip moved to first
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0400 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await resetPage(driver);

      let beforeCount = getCount();
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0400 before count: ' + beforeCount);

      await closeChipByText(driver, 'item0');
      await CommonFunc.sleep(1500);

      let afterCount = getCount();
      let afterText = getText();
      let afterItems = afterText.split('|');
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0400 after count: ' + afterCount + ' text: ' + afterText);

      expect(afterCount).assertEqual(beforeCount + 1);
      expect(afterItems.length).assertEqual(2);
      expect(afterText.indexOf('item0')).assertEqual(-1);
      expect(afterItems[0]).assertEqual('item1');

      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0400 END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0500
     * @tc.number SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0500
     * @tc.desc   User closes the last chip, onItemsChange returns items with last item removed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0500 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await resetPage(driver);

      let beforeCount = getCount();
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0500 before count: ' + beforeCount);

      await closeChipByText(driver, 'item2');
      await CommonFunc.sleep(1500);

      let afterCount = getCount();
      let afterText = getText();
      let afterItems = afterText.split('|');
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0500 after count: ' + afterCount + ' text: ' + afterText);

      expect(afterCount).assertEqual(beforeCount + 1);
      expect(afterItems.length).assertEqual(2);
      expect(afterText.indexOf('item2')).assertEqual(-1);
      expect(afterItems[afterItems.length - 1]).assertEqual('item1');

      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0500 END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0600
     * @tc.number SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0600
     * @tc.desc   User closes all closable chips successively, onItemsChange fires each time
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0600 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await resetPage(driver);

      let beforeCount = getCount();
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0600 before count: ' + beforeCount);

      let labels = ['item0', 'item1', 'item2'];
      for (let i = 0; i < labels.length; i++) {
        await closeChipByText(driver, labels[i]);
        await CommonFunc.sleep(800);
      }
      await CommonFunc.sleep(1500);

      let afterCount = getCount();
      let afterText = getText();
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0600 after count: ' + afterCount + ' text: ' + afterText);

      expect(afterCount).assertEqual(beforeCount + 3);
      expect(afterText).assertEqual('');

      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeTest_static_0600 END');
      done();
    });
  })
}
