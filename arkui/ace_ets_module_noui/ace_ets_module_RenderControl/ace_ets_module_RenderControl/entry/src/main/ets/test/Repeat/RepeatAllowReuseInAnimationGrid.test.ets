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

export default function RepeatAllowReuseInAnimationGridTest() {
  describe('RepeatAllowReuseInAnimationGridTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RepeatAllowReuseInAnimationGridTest setup start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Repeat/RepeatAllowReuseInAnimationGrid",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("RepeatAllowReuseInAnimationGrid" == pages.name)) {
          console.info("get RepeatAllowReuseInAnimationGrid pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RepeatAllowReuseInAnimationGrid page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RepeatAllowReuseInAnimationGrid page error:" + err);
        expect().assertFail();
      }
      console.info("RepeatAllowReuseInAnimationGridTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RepeatAllowReuseInAnimationGridTest after each called");
    });

    /**
     * @tc.name     SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0100
     * @tc.number   SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0100
     * @tc.desc     Grid Repeat animateTo add item, new item appears with animation
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0100] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      // 记录新增前的项数
      let textBefore = await (await driver.findComponent(ON.id('createCountText'))).getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0100] textBefore: ' + textBefore);

      // 点击 Add 按钮触发 animateTo 新增
      let addBtn = await driver.findComponent(ON.id('addBtn'));
      await addBtn.click();
      await CommonFunc.sleep(1500); // 等待动画完成

      // 验证新增项存在
      let newItem = await driver.findComponent(ON.id('item_0'));
      expect(newItem != null).assertTrue();
      let newItemText = await newItem.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0100] newItemText: ' + newItemText);
      expect(newItemText.indexOf('New item') >= 0).assertTrue();

      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0100] END');
      done();
    });

    /**
     * @tc.name     SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0200
     * @tc.number   SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0200
     * @tc.desc     Grid Repeat animateTo delete item, deleted item moves out with animation
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0200] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      // 记录删除前的首项文本
      let firstItemBefore = await driver.findComponent(ON.id('item_0'));
      let textBefore = await firstItemBefore.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0200] textBefore: ' + textBefore);

      // 点击 Delete 按钮触发 animateTo 删除
      let deleteBtn = await driver.findComponent(ON.id('deleteBtn'));
      await deleteBtn.click();
      await CommonFunc.sleep(1500); // 等待动画完成

      // 验证首项已变化（原首项被删除）
      let firstItemAfter = await driver.findComponent(ON.id('item_0'));
      expect(firstItemAfter != null).assertTrue();
      let textAfter = await firstItemAfter.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0200] textAfter: ' + textAfter);
      expect(textAfter != textBefore).assertTrue();

      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0200] END');
      done();
    });

    /**
     * @tc.name     SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0300
     * @tc.number   SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0300
     * @tc.desc     Grid Repeat animateTo update item with same key (lazy load), transition animation
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0300] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      // 记录更新前的首项文本
      let firstItemBefore = await driver.findComponent(ON.id('item_0'));
      let textBefore = await firstItemBefore.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0300] textBefore: ' + textBefore);

      // 点击 UpdateSameKey 按钮触发 animateTo 更新（key 不变）
      let updateBtn = await driver.findComponent(ON.id('updateSameKeyBtn'));
      await updateBtn.click();
      await CommonFunc.sleep(1500); // 等待动画完成

      // 验证首项文本已更新
      let firstItemAfter = await driver.findComponent(ON.id('item_0'));
      expect(firstItemAfter != null).assertTrue();
      let textAfter = await firstItemAfter.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0300] textAfter: ' + textAfter);
      expect(textAfter).assertEqual('Item updated');

      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0300] END');
      done();
    });

    /**
     * @tc.name     SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0400
     * @tc.number   SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0400
     * @tc.desc     Grid Repeat animateTo update item with new key, old item delete anim + new item insert anim
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0400] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      // 记录更新前的首项文本
      let firstItemBefore = await driver.findComponent(ON.id('item_0'));
      let textBefore = await firstItemBefore.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0400] textBefore: ' + textBefore);

      // 点击 UpdateNewKey 按钮触发 animateTo 更新（key 变化）
      let updateBtn = await driver.findComponent(ON.id('updateNewKeyBtn'));
      await updateBtn.click();
      await CommonFunc.sleep(1500); // 等待动画完成

      // 验证首项文本已变为新值
      let firstItemAfter = await driver.findComponent(ON.id('item_0'));
      expect(firstItemAfter != null).assertTrue();
      let textAfter = await firstItemAfter.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0400] textAfter: ' + textAfter);
      expect(textAfter.indexOf('Replaced') >= 0).assertTrue();
      expect(textAfter != textBefore).assertTrue();

      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0400] END');
      done();
    });

    /**
     * @tc.name     SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0500
     * @tc.number   SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0500
     * @tc.desc     Grid Repeat animateTo exchange items, exchange animation (including cross-column)
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0500', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0500] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      // 记录交换前的 item_0 和 item_1 文本
      let item0Before = await driver.findComponent(ON.id('item_0'));
      let item1Before = await driver.findComponent(ON.id('item_1'));
      let text0Before = await item0Before.getText();
      let text1Before = await item1Before.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0500] text0Before: ' + text0Before + ', text1Before: ' + text1Before);

      // 点击 Exchange 按钮触发 animateTo 交换
      let exchangeBtn = await driver.findComponent(ON.id('exchangeBtn'));
      await exchangeBtn.click();
      await CommonFunc.sleep(1500); // 等待动画完成

      // 验证 item_0 和 item_1 文本已互换
      let item0After = await driver.findComponent(ON.id('item_0'));
      let item1After = await driver.findComponent(ON.id('item_1'));
      let text0After = await item0After.getText();
      let text1After = await item1After.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0500] text0After: ' + text0After + ', text1After: ' + text1After);
      expect(text0After).assertEqual(text1Before);
      expect(text1After).assertEqual(text0Before);

      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0500] END');
      done();
    });

    /**
     * @tc.name     SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0600
     * @tc.number   SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0600
     * @tc.desc     Grid Repeat createCount increments on add, verify reuse behavior with allowReuseInAnimation=true
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it('SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0600', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0600] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      // 记录初始 createCount
      let countTextBefore = await (await driver.findComponent(ON.id('createCountText'))).getText();
      let countBefore = Number(countTextBefore.split(':')[1].trim());
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0600] countBefore: ' + countBefore);

      // 连续点击 Add 3 次
      let addBtn = await driver.findComponent(ON.id('addBtn'));
      for (let i = 0; i < 3; i++) {
        await addBtn.click();
        await CommonFunc.sleep(1200);
      }

      // 验证 createCount 有增加（allowReuseInAnimation=true 时增量可能较少）
      let countTextAfter = await (await driver.findComponent(ON.id('createCountText'))).getText();
      let countAfter = Number(countTextAfter.split(':')[1].trim());
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0600] countAfter: ' + countAfter);
      expect(countAfter > countBefore).assertTrue();

      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0600] END');
      done();
    });

    /**
     * @tc.name     SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0700
     * @tc.number   SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0700
     * @tc.desc     Grid Repeat animateTo multiple operations sequence (add->update->delete->exchange)
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it('SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0700', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0700] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      // 1. Add
      let addBtn = await driver.findComponent(ON.id('addBtn'));
      await addBtn.click();
      await CommonFunc.sleep(1200);
      let item0AfterAdd = await driver.findComponent(ON.id('item_0'));
      expect(item0AfterAdd != null).assertTrue();
      let textAfterAdd = await item0AfterAdd.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0700] textAfterAdd: ' + textAfterAdd);
      expect(textAfterAdd.indexOf('New item') >= 0).assertTrue();

      // 2. UpdateSameKey
      let updateBtn = await driver.findComponent(ON.id('updateSameKeyBtn'));
      await updateBtn.click();
      await CommonFunc.sleep(1200);
      let item0AfterUpdate = await driver.findComponent(ON.id('item_0'));
      let textAfterUpdate = await item0AfterUpdate.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0700] textAfterUpdate: ' + textAfterUpdate);
      expect(textAfterUpdate).assertEqual('Item updated');

      // 3. Delete
      let deleteBtn = await driver.findComponent(ON.id('deleteBtn'));
      await deleteBtn.click();
      await CommonFunc.sleep(1200);
      let item0AfterDelete = await driver.findComponent(ON.id('item_0'));
      expect(item0AfterDelete != null).assertTrue();
      let textAfterDelete = await item0AfterDelete.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0700] textAfterDelete: ' + textAfterDelete);
      expect(textAfterDelete != 'Item updated').assertTrue();

      // 4. Exchange
      let exchangeBtn = await driver.findComponent(ON.id('exchangeBtn'));
      let item0BeforeExchange = await driver.findComponent(ON.id('item_0'));
      let item1BeforeExchange = await driver.findComponent(ON.id('item_1'));
      let text0BeforeEx = await item0BeforeExchange.getText();
      let text1BeforeEx = await item1BeforeExchange.getText();
      await exchangeBtn.click();
      await CommonFunc.sleep(1200);
      let item0AfterExchange = await driver.findComponent(ON.id('item_0'));
      let item1AfterExchange = await driver.findComponent(ON.id('item_1'));
      let text0AfterEx = await item0AfterExchange.getText();
      let text1AfterEx = await item1AfterExchange.getText();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0700] text0AfterEx: ' + text0AfterEx + ', text1AfterEx: ' + text1AfterEx);
      expect(text0AfterEx).assertEqual(text1BeforeEx);
      expect(text1AfterEx).assertEqual(text0BeforeEx);

      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0700] END');
      done();
    });

    /**
     * @tc.name     SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0800
     * @tc.number   SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0800
     * @tc.desc     Grid Repeat render normally after page load, verify initial state
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0800', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0800] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();

      // 验证 Grid 容器存在
      let grid = await driver.findComponent(ON.id('animReuseGrid'));
      expect(grid != null).assertTrue();
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0800] grid found');

      // 验证初始 5 个 item 存在
      for (let i = 0; i < 5; i++) {
        let item = await driver.findComponent(ON.id(`item_${i}`));
        expect(item != null).assertTrue();
        let text = await item.getText();
        console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0800] item_' + i + ' text: ' + text);
        expect(text.length > 0).assertTrue();
      }

      // 验证 createCount > 0
      let countText = await (await driver.findComponent(ON.id('createCountText'))).getText();
      let count = Number(countText.split(':')[1].trim());
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0800] createCount: ' + count);
      expect(count > 0).assertTrue();

      await CommonFunc.sleep(1000);
      console.info('[SUB_ARKUI_API_RepeatAllowReuseInAnimationGrid_0800] END');
      done();
    });
  })
}
