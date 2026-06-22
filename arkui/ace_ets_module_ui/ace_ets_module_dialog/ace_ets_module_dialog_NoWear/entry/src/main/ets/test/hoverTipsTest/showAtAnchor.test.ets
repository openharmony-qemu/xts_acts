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
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON, Component, Point } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';
import { PointValue } from '../../MainAbility/common/Rect';

const SLEEP_TIME = 1500;
const POSITION_X = 80;
const UI_EVENT_CLICK: number = 10;
const ORI_BTN_KEY: string = 'showAtAnchor_oriBtn';
const CYCLE_BTN_KEY: string = 'showAtAnchor_button';

function assertPageComponents(): void {
  console.info('[showAtAnchor] check keys on page');
  expect(Utils.isKeyReadable(ORI_BTN_KEY)).assertTrue();
  expect(Utils.isKeyReadable(CYCLE_BTN_KEY)).assertTrue();
}

function getOriBtnCenter(): PointValue {
  return Utils.getRectCenter(ORI_BTN_KEY);
}

async function moveMouseAway(driver: Driver): Promise<void> {
  await driver.mouseMoveTo({ x: 0, y: 0 });
  await Utils.sleep(SLEEP_TIME);
}

async function hoverAt(driver: Driver, x: number, y: number): Promise<void> {
  await driver.mouseMoveTo({ x: x, y: y });
  await Utils.sleep(SLEEP_TIME);
}

async function readTipsCenter(driver: Driver): Promise<PointValue> {
  const tips: Component = await driver.findComponent(
    ON.type('Column').isAfter(ON.text('hover tips')));
  expect(!!tips).assertTrue();
  const center: Point = await tips.getBoundsCenter();
  const pt: PointValue = new PointValue();
  pt.x = center.x;
  pt.y = center.y;
  return pt;
}

async function clickCycleButton(): Promise<void> {
  expect(sendEventByKey(CYCLE_BTN_KEY, UI_EVENT_CLICK, '')).assertTrue();
  await Utils.sleep(SLEEP_TIME);
}

async function runAnchorCompare(
  driver: Driver, expectSame: boolean, clickCycleBtn: boolean
): Promise<void> {
  assertPageComponents();
  if (clickCycleBtn) {
    await clickCycleButton();
  }
  let center1: PointValue = getOriBtnCenter();
  console.info('[showAtAnchor] oriBtn center: ' + JSON.stringify(center1));
  await hoverAt(driver, center1.x, center1.y);
  let tipsPoint1: PointValue = await readTipsCenter(driver);
  await moveMouseAway(driver);
  await hoverAt(driver, center1.x + POSITION_X, center1.y);
  let tipsPoint2: PointValue = await readTipsCenter(driver);
  console.info('[showAtAnchor] tips1=' + JSON.stringify(tipsPoint1) +
    ' tips2=' + JSON.stringify(tipsPoint2));
  let same: boolean = tipsPoint1.x === tipsPoint2.x && tipsPoint1.y === tipsPoint2.y;
  if (expectSame) {
    expect(same).assertTrue();
  } else {
    expect(same).assertFalse();
  }
  await moveMouseAway(driver);
}

export default function showAtAnchorTest() {
  describe('showAtAnchorTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/tips/showAtAnchor',
      };
      router.clear();
      let pages = router.getState();
      if (pages.name !== 'showAtAnchor') {
        await router.pushUrl(options);
        await Utils.sleep(SLEEP_TIME);
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_Tips_showAtAnchor_0100
     * @tc.name      showAtAnchor_value_0001
     * @tc.desc      set undefined,The center position of the two pop-up tips is the same
     * @tc.level     Level 3
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('showAtAnchor_value_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let driver: Driver = await Driver.create();
      await runAnchorCompare(driver, true, false);
      done();
    });

    /**
     * @tc.number    SUB_ACE_Tips_showAtAnchor_0200
     * @tc.name      showAtAnchor_value_0002
     * @tc.desc      set null,The center position of the two pop-up tips is the same
     * @tc.level     Level 3
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('showAtAnchor_value_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let driver: Driver = await Driver.create();
      await runAnchorCompare(driver, true, true);
      done();
    });

    /**
     * @tc.number    SUB_ACE_Tips_showAtAnchor_0300
     * @tc.name      showAtAnchor_value_0003
     * @tc.desc      set TARGET,The center position of the two pop-up tips is the same
     * @tc.level     Level 3
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('showAtAnchor_value_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let driver: Driver = await Driver.create();
      await runAnchorCompare(driver, true, true);
      done();
    });

    /**
     * @tc.number    SUB_ACE_Tips_showAtAnchor_0400
     * @tc.name      showAtAnchor_value_0004
     * @tc.desc      set CURSOR,The center position of the two pop-up tips is inconsistent
     * @tc.level     Level 3
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('showAtAnchor_value_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let driver: Driver = await Driver.create();
      await runAnchorCompare(driver, false, true);
      done();
    });

    /**
     * @tc.number    SUB_ACE_Tips_showAtAnchor_0500
     * @tc.name      showAtAnchor_value_0005
     * @tc.desc      set -9,The center position of the two pop-up tips is the same
     * @tc.level     Level 3
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('showAtAnchor_value_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let driver: Driver = await Driver.create();
      await runAnchorCompare(driver, true, true);
      done();
    });
  })
}
