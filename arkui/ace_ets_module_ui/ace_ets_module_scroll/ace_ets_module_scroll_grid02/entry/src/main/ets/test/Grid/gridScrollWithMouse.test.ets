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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

// 从H_GRID_OFFSET文本中解析当前水平滚动偏移量，如'offset=123'解析为123
function getHGridOffset(): number {
  let strJson: string = getInspectorByKey('H_GRID_OFFSET');
  let obj: Record<string, ESObject> = JSON.parse(strJson);
  let content: string = `${obj.$attrs.content}`;
  console.info("[gridScrollWithMouse] current offset content: " + content);
  return Number.parseInt(content.substring('offset='.length));
}

export default function gridScrollWithMouse() {
  describe('gridScrollWithMouse', () => {
    beforeEach(async (done: Function) => {
      console.info("gridScrollWithMouse beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/gridScrollWithMouse",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get state pages:" + JSON.stringify(pages));
        if (!("gridScrollWithMouse" == pages.name)) {
          console.info("get gridScrollWithMouse pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push gridScrollWithMouse page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gridScrollWithMouse page error:" + err);
      }
      console.info("gridScrollWithMouse beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let resetBtn: Component = await driver.findComponent(ON.id('H_GRID_RESET'));
      await resetBtn.click();
      await CommonFunc.sleep(1500);
      console.info("gridScrollWithMouse afterEach called");
    });

    /**
     * @tc.name   gridScrollWithMouse_0100
     * @tc.number gridScrollWithMouse_0100
     * @tc.desc   Test horizontal Grid supports mouse left button drag scrolling
     *            with default enableScrollWithMouse value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('gridScrollWithMouse_0100', Level.LEVEL1, async () => {
      console.info('[gridScrollWithMouse_0100] START');
      let driver = Driver.create();
      let defaultBtn = await driver.findComponent(ON.id('H_GRID_DEFAULT'));
      await defaultBtn.click();
      let resetBtn = await driver.findComponent(ON.id('H_GRID_RESET'));
      await resetBtn.click();
      await CommonFunc.sleep(500);
      expect(getHGridOffset()).assertEqual(0);

      let gridComp = await driver.findComponent(ON.id('H_GRID'))
      let gridRect = await gridComp.getBounds()
      let displayId = await gridComp.getDisplayId()
      let top = gridRect.top;
      let left = gridRect.left;
      let height = gridRect.bottom - gridRect.top;
      let width = gridRect.right - gridRect.left;
      console.info(`[gridScrollWithMouse_0100] grid rect: ${left}, ${top}, ${width}, ${height}`);
      await driver.mouseDrag(
        {x: Math.round(left + width * 0.7), y: Math.round(top + height / 2), displayId: displayId},
        {x: Math.round(left + width * 0.3), y: Math.round(top + height / 2), displayId: displayId});
      await CommonFunc.sleep(800);

      let offset: number = getHGridOffset();
      console.info('[gridScrollWithMouse_0100] offset after mouse drag: ' + offset);
      expect(offset > 0).assertTrue();
      console.info('[gridScrollWithMouse_0100] END');
    })

    /**
     * @tc.name   gridScrollWithMouse_0200
     * @tc.number gridScrollWithMouse_0200
     * @tc.desc   Test horizontal Grid supports mouse left button drag scrolling
     *            when enableScrollWithMouse is set to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('gridScrollWithMouse_0200', Level.LEVEL1, async () => {
      console.info('[gridScrollWithMouse_0200] START');
      let driver = Driver.create();
      let trueBtn = await driver.findComponent(ON.id('H_GRID_TRUE'));
      await trueBtn.click();
      let resetBtn = await driver.findComponent(ON.id('H_GRID_RESET'));
      await resetBtn.click();
      await CommonFunc.sleep(500);
      expect(getHGridOffset()).assertEqual(0);

      let gridComp = await driver.findComponent(ON.id('H_GRID'))
      let gridRect = await gridComp.getBounds()
      let displayId = await gridComp.getDisplayId()
      let top = gridRect.top;
      let left = gridRect.left;
      let height = gridRect.bottom - gridRect.top;
      let width = gridRect.right - gridRect.left;
      console.info(`[gridScrollWithMouse_0200] grid rect: ${left}, ${top}, ${width}, ${height}`);
      await driver.mouseDrag(
        {x: Math.round(left + width * 0.7), y: Math.round(top + height / 2), displayId: displayId},
        {x: Math.round(left + width * 0.3), y: Math.round(top + height / 2), displayId: displayId});
      await CommonFunc.sleep(800);

      let offset: number = getHGridOffset();
      console.info('[gridScrollWithMouse_0200] offset after mouse drag: ' + offset);
      expect(offset > 0).assertTrue();
      console.info('[gridScrollWithMouse_0200] END');
    })

    /**
     * @tc.name   gridScrollWithMouse_0300
     * @tc.number gridScrollWithMouse_0300
     * @tc.desc   Test horizontal Grid does not scroll with mouse left button drag
     *            when enableScrollWithMouse is set to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('gridScrollWithMouse_0300', Level.LEVEL1, async () => {
      console.info('[gridScrollWithMouse_0300] START');
      let driver = Driver.create();
      let falseBtn = await driver.findComponent(ON.id('H_GRID_FALSE'));
      await falseBtn.click();
      let resetBtn = await driver.findComponent(ON.id('H_GRID_RESET'));
      await resetBtn.click();
      await CommonFunc.sleep(500);
      expect(getHGridOffset()).assertEqual(0);

      let gridComp = await driver.findComponent(ON.id('H_GRID'))
      let gridRect = await gridComp.getBounds()
      let displayId = await gridComp.getDisplayId()
      let top = gridRect.top;
      let left = gridRect.left;
      let height = gridRect.bottom - gridRect.top;
      let width = gridRect.right - gridRect.left;
      console.info(`[gridScrollWithMouse_0300] grid rect: ${left}, ${top}, ${width}, ${height}`);
      await driver.mouseDrag(
        {x: Math.round(left + width * 0.7), y: Math.round(top + height / 2), displayId: displayId},
        {x: Math.round(left + width * 0.3), y: Math.round(top + height / 2), displayId: displayId});
      await CommonFunc.sleep(800);

      let offset: number = getHGridOffset();
      console.info('[gridScrollWithMouse_0300] offset after mouse drag: ' + offset);
      expect(offset).assertEqual(0);
      console.info('[gridScrollWithMouse_0300] END');
    })
  })
}
