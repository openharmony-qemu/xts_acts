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
import { UiComponent, Driver, Component, UiWindow, ON, UIElementInfo } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function RepeatAllowReuseInAnimationWaterFlowTest() {
  describe('RepeatAllowReuseInAnimationWaterFlowTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RepeatAllowReuseInAnimationWaterFlowTest setup start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Repeat/RepeatAllowReuseInAnimationWaterFlow",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("RepeatAllowReuseInAnimationWaterFlow" == pages.name)) {
          console.info("get RepeatAllowReuseInAnimationWaterFlow pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RepeatAllowReuseInAnimationWaterFlow page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RepeatAllowReuseInAnimationWaterFlow page error:" + err);
        expect().assertFail();
      }
      console.info("RepeatAllowReuseInAnimationWaterFlowTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RepeatAllowReuseInAnimationWaterFlowTest after each called");
    });

    /**
     * @tc.name     SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0100
     * @tc.number   SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0100
     * @tc.desc     WaterFlow Repeat animateTo add item, new item appears with animation
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0100] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      let addBtn = await driver.findComponent(ON.id('flowAddBtn'));
      await addBtn.click();
      await CommonFunc.sleep(1500);

      let newItem = await driver.findComponent(ON.id('flowItem_0'));
      expect(newItem != null).assertTrue();
      let newItemText = await newItem.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0100] newItemText: ' + newItemText);
      expect(newItemText.indexOf('New item') >= 0).assertTrue();

      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0100] END');
      done();
    });

    /**
     * @tc.name     SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0200
     * @tc.number   SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0200
     * @tc.desc     WaterFlow Repeat animateTo delete item, deleted item moves out with animation
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0200] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      let firstItemBefore = await driver.findComponent(ON.id('flowItem_0'));
      let textBefore = await firstItemBefore.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0200] textBefore: ' + textBefore);

      let deleteBtn = await driver.findComponent(ON.id('flowDeleteBtn'));
      await deleteBtn.click();
      await CommonFunc.sleep(1500);

      let firstItemAfter = await driver.findComponent(ON.id('flowItem_0'));
      expect(firstItemAfter != null).assertTrue();
      let textAfter = await firstItemAfter.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0200] textAfter: ' + textAfter);
      expect(textAfter != textBefore).assertTrue();

      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0200] END');
      done();
    });

    /**
     * @tc.name     SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0300
     * @tc.number   SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0300
     * @tc.desc     WaterFlow Repeat animateTo update item with same key (lazy load), transition animation
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0300] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      let firstItemBefore = await driver.findComponent(ON.id('flowItem_0'));
      let textBefore = await firstItemBefore.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0300] textBefore: ' + textBefore);

      let updateBtn = await driver.findComponent(ON.id('flowUpdateSameKeyBtn'));
      await updateBtn.click();
      await CommonFunc.sleep(1500);

      let firstItemAfter = await driver.findComponent(ON.id('flowItem_0'));
      expect(firstItemAfter != null).assertTrue();
      let textAfter = await firstItemAfter.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0300] textAfter: ' + textAfter);
      expect(textAfter).assertEqual('Item updated');

      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0300] END');
      done();
    });

    /**
     * @tc.name     SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0400
     * @tc.number   SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0400
     * @tc.desc     WaterFlow Repeat animateTo update item with new key, old item delete anim + new item insert anim
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0400] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      let firstItemBefore = await driver.findComponent(ON.id('flowItem_0'));
      let textBefore = await firstItemBefore.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0400] textBefore: ' + textBefore);

      let updateBtn = await driver.findComponent(ON.id('flowUpdateNewKeyBtn'));
      await updateBtn.click();
      await CommonFunc.sleep(1500);

      let firstItemAfter = await driver.findComponent(ON.id('flowItem_0'));
      expect(firstItemAfter != null).assertTrue();
      let textAfter = await firstItemAfter.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0400] textAfter: ' + textAfter);
      expect(textAfter.indexOf('Replaced') >= 0).assertTrue();
      expect(textAfter != textBefore).assertTrue();

      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0400] END');
      done();
    });

    /**
     * @tc.name     SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0500
     * @tc.number   SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0500
     * @tc.desc     WaterFlow Repeat animateTo exchange items, exchange animation
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0500', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0500] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      let item0Before = await driver.findComponent(ON.id('flowItem_0'));
      let item1Before = await driver.findComponent(ON.id('flowItem_1'));
      let text0Before = await item0Before.getText();
      let text1Before = await item1Before.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0500] text0Before: ' + text0Before + ', text1Before: ' + text1Before);

      let exchangeBtn = await driver.findComponent(ON.id('flowExchangeBtn'));
      await exchangeBtn.click();
      await CommonFunc.sleep(1500);

      let item0After = await driver.findComponent(ON.id('flowItem_0'));
      let item1After = await driver.findComponent(ON.id('flowItem_1'));
      let text0After = await item0After.getText();
      let text1After = await item1After.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0500] text0After: ' + text0After + ', text1After: ' + text1After);
      expect(text0After).assertEqual(text1Before);
      expect(text1After).assertEqual(text0Before);

      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0500] END');
      done();
    });

    /**
     * @tc.name     SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0600
     * @tc.number   SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0600
     * @tc.desc     WaterFlow Repeat createCount increments on add, verify reuse behavior with allowReuseInAnimation=true
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it('SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0600', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0600] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      let countTextBefore = await (await driver.findComponent(ON.id('flowCreateCountText'))).getText();
      let countBefore = Number(countTextBefore.split(':')[1].trim());
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0600] countBefore: ' + countBefore);

      let addBtn = await driver.findComponent(ON.id('flowAddBtn'));
      for (let i = 0; i < 3; i++) {
        await addBtn.click();
        await CommonFunc.sleep(1200);
      }

      let countTextAfter = await (await driver.findComponent(ON.id('flowCreateCountText'))).getText();
      let countAfter = Number(countTextAfter.split(':')[1].trim());
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0600] countAfter: ' + countAfter);
      expect(countAfter > countBefore).assertTrue();

      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0600] END');
      done();
    });

    /**
     * @tc.name     SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0700
     * @tc.number   SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0700
     * @tc.desc     WaterFlow Repeat animateTo multiple operations sequence (add->update->delete->exchange)
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it('SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0700', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0700] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      // 1. Add
      let addBtn = await driver.findComponent(ON.id('flowAddBtn'));
      await addBtn.click();
      await CommonFunc.sleep(1200);
      let item0AfterAdd = await driver.findComponent(ON.id('flowItem_0'));
      expect(item0AfterAdd != null).assertTrue();
      let textAfterAdd = await item0AfterAdd.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0700] textAfterAdd: ' + textAfterAdd);
      expect(textAfterAdd.indexOf('New item') >= 0).assertTrue();

      // 2. UpdateSameKey
      let updateBtn = await driver.findComponent(ON.id('flowUpdateSameKeyBtn'));
      await updateBtn.click();
      await CommonFunc.sleep(1200);
      let item0AfterUpdate = await driver.findComponent(ON.id('flowItem_0'));
      let textAfterUpdate = await item0AfterUpdate.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0700] textAfterUpdate: ' + textAfterUpdate);
      expect(textAfterUpdate).assertEqual('Item updated');

      // 3. Delete
      let deleteBtn = await driver.findComponent(ON.id('flowDeleteBtn'));
      await deleteBtn.click();
      await CommonFunc.sleep(1200);
      let item0AfterDelete = await driver.findComponent(ON.id('flowItem_0'));
      expect(item0AfterDelete != null).assertTrue();
      let textAfterDelete = await item0AfterDelete.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0700] textAfterDelete: ' + textAfterDelete);
      expect(textAfterDelete != 'Item updated').assertTrue();

      // 4. Exchange
      let exchangeBtn = await driver.findComponent(ON.id('flowExchangeBtn'));
      let item0BeforeExchange = await driver.findComponent(ON.id('flowItem_0'));
      let item1BeforeExchange = await driver.findComponent(ON.id('flowItem_1'));
      let text0BeforeEx = await item0BeforeExchange.getText();
      let text1BeforeEx = await item1BeforeExchange.getText();
      await exchangeBtn.click();
      await CommonFunc.sleep(1200);
      let item0AfterExchange = await driver.findComponent(ON.id('flowItem_0'));
      let item1AfterExchange = await driver.findComponent(ON.id('flowItem_1'));
      let text0AfterEx = await item0AfterExchange.getText();
      let text1AfterEx = await item1AfterExchange.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0700] text0AfterEx: ' + text0AfterEx + ', text1AfterEx: ' + text1AfterEx);
      expect(text0AfterEx).assertEqual(text1BeforeEx);
      expect(text1AfterEx).assertEqual(text0BeforeEx);

      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0700] END');
      done();
    });

    /**
     * @tc.name     SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0800
     * @tc.number   SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0800
     * @tc.desc     WaterFlow Repeat render normally after page load, verify initial state
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0800', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0800] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      let waterFlow = await driver.findComponent(ON.id('animReuseWaterFlow'));
      expect(waterFlow != null).assertTrue();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0800] waterFlow found');

      for (let i = 0; i < 5; i++) {
        let item = await driver.findComponent(ON.id(`flowItem_${i}`));
        expect(item != null).assertTrue();
        let text = await item.getText();
        console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0800] flowItem_' + i + ' text: ' + text);
        expect(text.length > 0).assertTrue();
      }

      let countText = await (await driver.findComponent(ON.id('flowCreateCountText'))).getText();
      let count = Number(countText.split(':')[1].trim());
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0800] createCount: ' + count);
      expect(count > 0).assertTrue();

      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationWaterFlow_0800] END');
      done();
    });
  })
}
