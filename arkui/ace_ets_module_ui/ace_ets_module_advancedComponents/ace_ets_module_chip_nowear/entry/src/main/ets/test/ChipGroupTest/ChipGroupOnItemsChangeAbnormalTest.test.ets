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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  MouseButton,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

let displayID: number = AppStorage.get('displayID') ? AppStorage.get('displayID') as number : 0;

function getResult(): string {
  let str = getInspectorByKey('ChipGroupOnItemsChangeAbnormal_result');
  let obj: ESObject = JSON.parse(str);
  return (obj?.$attrs?.content ?? '') as string;
}

function getCount(): number {
  let s = getResult();
  let m: RegExpMatchArray | null = s.match(/count=(\d+)/);
  if (m === null) {
    return -1;
  }
  let v: string = m[0].substring('count='.length);
  return parseInt(v, 10);
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
  let rect = await chipComp.getBounds();
  let chipWidth: number = rect.right - rect.left;
  let chipHeight: number = rect.bottom - rect.top;
  let x: number = rect.right - Math.round(chipWidth * 0.14);
  let y: number = rect.top + Math.round(chipHeight / 2);
  console.info('closeChipByText text=' + text + ' click close at x=' + x + ' y=' + y
    + ' bounds={left:' + rect.left + ',right:' + rect.right + ',top:' + rect.top + ',bottom:' + rect.bottom
    + '} chipWidth=' + chipWidth + ' chipHeight=' + chipHeight);
  await driver.mouseClick({ x: Math.round(x), y: Math.round(y), displayId: displayID }, MouseButton.MOUSE_BUTTON_LEFT);
}

async function resetPage(driver: Driver): Promise<void> {
  let btnReset = await driver.findComponent(ON.id('ChipGroupOnItemsChangeAbnormal_btn_reset'));
  await btnReset.click();
  await CommonFunc.sleep(2000);
}

export default function ChipGroupOnItemsChangeAbnormalTest() {
  describe('ChipGroupOnItemsChangeAbnormalTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ChipGroupOnItemsChangeAbnormalTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ChipGroup/ChipGroupOnItemsChangeAbnormal',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ChipGroupOnItemsChangeAbnormal state pages: " + JSON.stringify(pages));
        if (!("ChipGroupOnItemsChangeAbnormal" == pages.name)) {
          console.info("get ChipGroupOnItemsChangeAbnormal pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ChipGroupOnItemsChangeAbnormal page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ChipGroupOnItemsChangeAbnormal page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(500);
      console.info("ChipGroupOnItemsChangeAbnormalTest afterEach");
    });

    /**
     * @tc.name   SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_0100
     * @tc.number SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_0100
     * @tc.desc   Pass null to onItemsChange, treated as unset, user close does not fire callback, no crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await resetPage(driver);

      let btnSetNull = await driver.findComponent(ON.id('ChipGroupOnItemsChangeAbnormal_btn_setNull'));
      await btnSetNull.click();
      await CommonFunc.sleep(500);

      let beforeCount = getCount();
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_0100 before count: ' + beforeCount);

      await closeChipByText(driver, 'item0');
      await CommonFunc.sleep(1500);

      let afterCount = getCount();
      let afterResult = getResult();
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_0100 after count: ' + afterCount + ' result: ' + afterResult);

      expect(afterCount).assertEqual(beforeCount);
      expect(afterResult.indexOf('count=') !== -1).assertTrue();

      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_0100 END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_0200
     * @tc.number SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_0200
     * @tc.desc   Pass undefined to onItemsChange, treated as unset, user close does not fire callback, no crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_0200 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await resetPage(driver);

      let btnSetUndef = await driver.findComponent(ON.id('ChipGroupOnItemsChangeAbnormal_btn_setUndefined'));
      await btnSetUndef.click();
      await CommonFunc.sleep(500);

      let beforeCount = getCount();
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_0200 before count: ' + beforeCount);

      await closeChipByText(driver, 'item0');
      await CommonFunc.sleep(1500);

      let afterCount = getCount();
      let afterResult = getResult();
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_0200 after count: ' + afterCount + ' result: ' + afterResult);

      expect(afterCount).assertEqual(beforeCount);
      expect(afterResult.indexOf('count=') !== -1).assertTrue();

      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_0200 END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_0300
     * @tc.number SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_0300
     * @tc.desc   After null, restore valid callback, user close fires onItemsChange again
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_0300 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await resetPage(driver);

      let btnSetNull = await driver.findComponent(ON.id('ChipGroupOnItemsChangeAbnormal_btn_setNull'));
      await btnSetNull.click();
      await CommonFunc.sleep(500);

      let countAfterNull = getCount();
      await closeChipByText(driver, 'item0');
      await CommonFunc.sleep(1500);
      let countAfterCloseNull = getCount();
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_0300 after null close count: ' + countAfterCloseNull);
      expect(countAfterCloseNull).assertEqual(countAfterNull);

      let btnSetValid = await driver.findComponent(ON.id('ChipGroupOnItemsChangeAbnormal_btn_setValid'));
      await btnSetValid.click();
      await CommonFunc.sleep(500);
      let countAfterValid = getCount();

      await closeChipByText(driver, 'item1');
      await CommonFunc.sleep(1500);

      let finalCount = getCount();
      let finalText = getText();
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_0300 final count: ' + finalCount + ' text: ' + finalText);

      expect(finalCount).assertEqual(countAfterValid + 1);
      expect(finalText.indexOf('item1')).assertEqual(-1);

      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_0300 END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_0400
     * @tc.number SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_0400
     * @tc.desc   After undefined, restore valid callback, user close fires onItemsChange again
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_0400 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await resetPage(driver);

      let btnSetUndef = await driver.findComponent(ON.id('ChipGroupOnItemsChangeAbnormal_btn_setUndefined'));
      await btnSetUndef.click();
      await CommonFunc.sleep(500);

      let countAfterUndef = getCount();
      await closeChipByText(driver, 'item0');
      await CommonFunc.sleep(1500);
      let countAfterCloseUndef = getCount();
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_0400 after undef close count: ' + countAfterCloseUndef);
      expect(countAfterCloseUndef).assertEqual(countAfterUndef);

      let btnSetValid = await driver.findComponent(ON.id('ChipGroupOnItemsChangeAbnormal_btn_setValid'));
      await btnSetValid.click();
      await CommonFunc.sleep(500);
      let countAfterValid = getCount();

      await closeChipByText(driver, 'item1');
      await CommonFunc.sleep(1500);

      let finalCount = getCount();
      let finalText = getText();
      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_0400 final count: ' + finalCount + ' text: ' + finalText);

      expect(finalCount).assertEqual(countAfterValid + 1);
      expect(finalText.indexOf('item1')).assertEqual(-1);

      console.info('SUB_ARKUI_API_ChipGroupOnItemsChangeAbnormalTest_0400 END');
      done();
    });
  })
}
