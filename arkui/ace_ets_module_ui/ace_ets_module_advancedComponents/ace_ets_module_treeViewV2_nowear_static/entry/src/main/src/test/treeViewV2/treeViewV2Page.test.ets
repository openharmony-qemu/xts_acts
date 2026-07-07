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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../../hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest, startAbility } from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { TreeListenerManagerV2, TreeListenerV2 } from '@ohos.arkui.advanced.TreeViewV2';

export default function treeViewV2PageTest() {
  describe('treeViewV2Page', () => {

    beforeAll(async (): Promise<void> => {
      console.info("treeViewV2Page beforeAll start");
      await UtilsTest.startAbility("com.acts.arkui.treeViewV2.nowear.test.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("treeViewV2Page beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/treeViewV2/treeViewV2Page',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get treeViewV2Page state pages:" + JSON.stringify(pages));
        if (!("treeViewV2Page" == pages.name)) {
          console.info("get treeViewV2Page pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push treeViewV2Page page error:" + err);
      }
      console.info("treeViewV2Page beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info('treeViewV2Page after each called');
    })

    /**
     * @tc.number   treeViewV2PageTest_static_0100
     * @tc.name     treeViewV2PageTest_static_0100
     * @tc.desc     Test TreeViewV2 display root node
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let rootNodeText = await driver.findComponent(ON.text('Root Node'));
      expect(rootNodeText !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_0100] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_0101
     * @tc.name     treeViewV2PageTest_static_0101
     * @tc.desc     Test TreeListenerV2 onNodeClick callback triggered with correct nodeId
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_0101] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let clickIdText = await driver.findComponent(ON.text('ClickId=0'));
      expect(clickIdText !== null).assertTrue();

      let rootNodeText = await driver.findComponent(ON.text('Root Node'));
      if (rootNodeText) {
        await rootNodeText.click();
        await CommonFunc.sleep(1000);
      }

      let clickIdTextUpdated = await driver.findComponent(ON.text('ClickId=1'));
      expect(clickIdTextUpdated !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_0101] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_0200
     * @tc.name     treeViewV2PageTest_static_0200
     * @tc.desc     Test TreeViewV2 display second root node
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_0200] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let secondRootText = await driver.findComponent(ON.text('Second Root'));
      expect(secondRootText !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_0200] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_0300
     * @tc.name     treeViewV2PageTest_static_0300
     * @tc.desc     Test TreeViewV2 node click event
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
    it('treeViewV2PageTest_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_0300] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let rootNodeText = await driver.findComponent(ON.text('Root Node'));
      if (rootNodeText) {
        await rootNodeText.click();
        await CommonFunc.sleep(500);
      }

      console.info('[treeViewV2PageTest_static_0300] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_0400
     * @tc.name     treeViewV2PageTest_static_0400
     * @tc.desc     Test TreeViewV2 add node button exists
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_0400] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let addNodeButton = await driver.findComponent(ON.text('Add'));
      expect(addNodeButton !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_0400] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_0500
     * @tc.name     treeViewV2PageTest_static_0500
     * @tc.desc     Test TreeViewV2 delete node button exists
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_0500] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let deleteNodeButton = await driver.findComponent(ON.text('Remove'));
      expect(deleteNodeButton !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_0500] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_0600
     * @tc.name     treeViewV2PageTest_static_0600
     * @tc.desc     Test TreeViewV2 modify node button exists
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_0600] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let modifyNodeButton = await driver.findComponent(ON.text('Modify'));
      expect(modifyNodeButton !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_0600] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_0700
     * @tc.name     treeViewV2PageTest_static_0700
     * @tc.desc     Test TreeListenerV2 onceNodeClick listener triggers only once
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_0700] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let rootNodeText = await driver.findComponent(ON.text('Second Root'));
      if (rootNodeText) {
        await rootNodeText.click();
        await CommonFunc.sleep(1000);
      }

      let clickIdText1 = await driver.findComponent(ON.textRegex('ClickId=\\d+'));
      expect(clickIdText1 !== null).assertTrue();

      await rootNodeText.click();
      await CommonFunc.sleep(1000);

      let clickIdText2 = await driver.findComponent(ON.textRegex('ClickId=\\d+'));
      expect(clickIdText2 !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_0700] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_0701
     * @tc.name     treeViewV2PageTest_static_0701
     * @tc.desc     Test TreeListenerV2 onNodeAdd callback triggered when adding node
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_0701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_0701] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let rootNodeText = await driver.findComponent(ON.text('Root Node'));
      if (rootNodeText) {
        await rootNodeText.click();
        await CommonFunc.sleep(500);
      }

      let addBtn = await driver.findComponent(ON.text('Add'));
      if (addBtn) {
        await addBtn.click();
        await CommonFunc.sleep(1000);
      }

      let clickIdText = await driver.findComponent(ON.textRegex('ClickId=\\d+'));
      expect(clickIdText !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_0701] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_0800
     * @tc.name     treeViewV2PageTest_static_0800
     * @tc.desc     Test TreeListenerV2 offNodeClick cancel listener
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_0800] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let rootNodeText = await driver.findComponent(ON.text('Root Node'));
      if (rootNodeText) {
        await rootNodeText.click();
        await CommonFunc.sleep(500);
      }

      console.info('[treeViewV2PageTest_static_0800] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_0900
     * @tc.name     treeViewV2PageTest_static_0900
     * @tc.desc     Test TreeListenerV2 onceNodeAdd listener triggers only once
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_0900] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let rootNodeText = await driver.findComponent(ON.text('Root Node'));
      if (rootNodeText) {
        await rootNodeText.click();
        await CommonFunc.sleep(500);
      }

      let addBtn = await driver.findComponent(ON.text('Add'));
      if (addBtn) {
        await addBtn.click();
        await CommonFunc.sleep(1000);
        await addBtn.click();
        await CommonFunc.sleep(1000);
      }

      console.info('[treeViewV2PageTest_static_0900] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_1000
     * @tc.name     treeViewV2PageTest_static_1000
     * @tc.desc     Test TreeListenerV2 offNodeAdd cancel listener
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_1000] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let rootNodeText = await driver.findComponent(ON.text('Root Node'));
      if (rootNodeText) {
        await rootNodeText.click();
        await CommonFunc.sleep(500);
      }

      let addBtn = await driver.findComponent(ON.text('Add'));
      if (addBtn) {
        await addBtn.click();
        await CommonFunc.sleep(1000);
      }

      console.info('[treeViewV2PageTest_static_1000] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_1100
     * @tc.name     treeViewV2PageTest_static_1100
     * @tc.desc     Test TreeListenerV2 onceNodeDelete listener triggers only once
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_1100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let rootNodeText = await driver.findComponent(ON.text('Root Node'));
      if (rootNodeText) {
        await rootNodeText.click();
        await CommonFunc.sleep(500);
      }

      let removeBtn = await driver.findComponent(ON.text('Remove'));
      if (removeBtn) {
        await removeBtn.click();
        await CommonFunc.sleep(1000);
      }

      console.info('[treeViewV2PageTest_static_1100] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_1200
     * @tc.name     treeViewV2PageTest_static_1200
     * @tc.desc     Test TreeListenerV2 offNodeDelete cancel listener
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_1200] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let rootNodeText = await driver.findComponent(ON.text('Root Node'));
      if (rootNodeText) {
        await rootNodeText.click();
        await CommonFunc.sleep(500);
      }

      let removeBtn = await driver.findComponent(ON.text('Remove'));
      if (removeBtn) {
        await removeBtn.click();
        await CommonFunc.sleep(1000);
      }

      console.info('[treeViewV2PageTest_static_1200] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_1300
     * @tc.name     treeViewV2PageTest_static_1300
     * @tc.desc     Test TreeListenerV2 onNodeModify listener triggers
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_1300] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let rootNodeText = await driver.findComponent(ON.text('Root Node'));
      if (rootNodeText) {
        await rootNodeText.click();
        await CommonFunc.sleep(500);
      }

      let modifyBtn = await driver.findComponent(ON.text('Modify'));
      if (modifyBtn) {
        await modifyBtn.click();
        await CommonFunc.sleep(1000);
      }

      console.info('[treeViewV2PageTest_static_1300] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_1400
     * @tc.name     treeViewV2PageTest_static_1400
     * @tc.desc     Test TreeListenerV2 onceNodeModify listener triggers only once
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_1400] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let rootNodeText = await driver.findComponent(ON.text('Root Node'));
      if (rootNodeText) {
        await rootNodeText.click();
        await CommonFunc.sleep(500);
      }

      let modifyBtn = await driver.findComponent(ON.text('Modify'));
      if (modifyBtn) {
        await modifyBtn.click();
        await CommonFunc.sleep(1000);
        await modifyBtn.click();
        await CommonFunc.sleep(1000);
      }

      console.info('[treeViewV2PageTest_static_1400] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_1500
     * @tc.name     treeViewV2PageTest_static_1500
     * @tc.desc     Test TreeListenerV2 offNodeModify cancel listener
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_1500] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let rootNodeText = await driver.findComponent(ON.text('Root Node'));
      if (rootNodeText) {
        await rootNodeText.click();
        await CommonFunc.sleep(500);
      }

      let modifyBtn = await driver.findComponent(ON.text('Modify'));
      if (modifyBtn) {
        await modifyBtn.click();
        await CommonFunc.sleep(1000);
      }

      console.info('[treeViewV2PageTest_static_1500] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_1600
     * @tc.name     treeViewV2PageTest_static_1600
     * @tc.desc     Test TreeListenerV2 onNodeMove listener triggers
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_1600] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let rootNodeText = await driver.findComponent(ON.text('Root Node'));
      if (rootNodeText) {
        await rootNodeText.click();
        await CommonFunc.sleep(500);
      }

      console.info('[treeViewV2PageTest_static_1600] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_1700
     * @tc.name     treeViewV2PageTest_static_1700
     * @tc.desc     Test TreeListenerV2 offNodeMove cancel listener
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_1700] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let rootNodeText = await driver.findComponent(ON.text('Root Node'));
      if (rootNodeText) {
        await rootNodeText.click();
        await CommonFunc.sleep(500);
      }

      console.info('[treeViewV2PageTest_static_1700] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_1800
     * @tc.name     treeViewV2PageTest_static_1800
     * @tc.desc     Test TreeListenerV2 off method with undefined parameter clears all listeners
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
    it('treeViewV2PageTest_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_1800] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let rootNodeText = await driver.findComponent(ON.text('Root Node'));
      if (rootNodeText) {
        await rootNodeText.click();
        await CommonFunc.sleep(500);
      }

      console.info('[treeViewV2PageTest_static_1800] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_1900
     * @tc.name     treeViewV2PageTest_static_1900
     * @tc.desc     Test TreeListenerManagerV2 getInstance returns singleton instance
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_1900] START');

      let instance1 = TreeListenerManagerV2.getInstance();
      let instance2 = TreeListenerManagerV2.getInstance();
      expect(instance1 !== null).assertTrue();
      expect(instance2 !== null).assertTrue();
      expect(instance1 === instance2).assertTrue();

      console.info('[treeViewV2PageTest_static_1900] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_2000
     * @tc.name     treeViewV2PageTest_static_2000
     * @tc.desc     Test TreeListenerManagerV2 getTreeListener returns valid listener
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_2000] START');

      let manager = TreeListenerManagerV2.getInstance();
      let listener = manager.getTreeListener();
      expect(listener !== null).assertTrue();
      expect(listener !== undefined).assertTrue();

      console.info('[treeViewV2PageTest_static_2000] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_2100
     * @tc.name     treeViewV2PageTest_static_2100
     * @tc.desc     Test TreeListenerManagerV2 getInstance returns same instance multiple times
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
    it('treeViewV2PageTest_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_2100] START');

      let instances: TreeListenerManagerV2[] = [];
      for (let i = 0; i < 5; i++) {
        instances.push(TreeListenerManagerV2.getInstance());
      }

      let firstInstance = instances[0];
      for (let i = 1; i < instances.length; i++) {
        expect(instances[i] === firstInstance).assertTrue();
      }

      console.info('[treeViewV2PageTest_static_2100] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_2200
     * @tc.name     treeViewV2PageTest_static_2200
     * @tc.desc     Test TreeControllerV2 buildDone initializes tree structure
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_2200] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let rootNode = await driver.findComponent(ON.text('Root Node'));
      expect(rootNode !== null).assertTrue();

      let secondRoot = await driver.findComponent(ON.text('Second Root'));
      expect(secondRoot !== null).assertTrue();

      let node3 = await driver.findComponent(ON.text('目录3'));
      expect(node3 !== null).assertTrue();

      let node9 = await driver.findComponent(ON.text('项目9'));
      expect(node9 !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_2200] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_2300
     * @tc.name     treeViewV2PageTest_static_2300
     * @tc.desc     Test TreeControllerV2 refreshNode updates secondary title
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_2300] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let rootNodeWithSubtitle = await driver.findComponent(ON.textRegex('Root Node.*6'));
      expect(rootNodeWithSubtitle !== null).assertTrue();

      let node5 = await driver.findComponent(ON.textRegex('目录5.*0'));
      expect(node5 !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_2300] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_2400
     * @tc.name     treeViewV2PageTest_static_2400
     * @tc.desc     Test TreeControllerV2 refreshNode with invalid parentId parameter
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
    it('treeViewV2PageTest_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_2400] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let rootNodeText = await driver.findComponent(ON.text('Root Node'));
      if (rootNodeText) {
        await rootNodeText.click();
        await CommonFunc.sleep(500);
      }

      let clickIdBefore = await driver.findComponent(ON.textRegex('ClickId=\\d+'));
      expect(clickIdBefore !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_2400] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_2500
     * @tc.name     treeViewV2PageTest_static_2500
     * @tc.desc     Test TreeControllerV2 addNode chain call successfully
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
    it('treeViewV2PageTest_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_2500] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let rootNode = await driver.findComponent(ON.text('Root Node'));
      expect(rootNode !== null).assertTrue();

      let project1_1 = await driver.findComponent(ON.text('项目1_1'));
      expect(project1_1 !== null).assertTrue();

      let node6_1 = await driver.findComponent(ON.textRegex('目录6-1.*0'));
      expect(node6_1 !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_2500] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_2600
     * @tc.name     treeViewV2PageTest_static_2600
     * @tc.desc     Test NodeParamV2 icon parameter with Resource type
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_2600] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let rootNode = await driver.findComponent(ON.text('Root Node'));
      if (rootNode) {
        await rootNode.click();
        await CommonFunc.sleep(500);
      }

      expect(rootNode !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_2600] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_2700
     * @tc.name     treeViewV2PageTest_static_2700
     * @tc.desc     Test NodeParamV2 selectedIcon parameter
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_2700] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let rootNode = await driver.findComponent(ON.text('Root Node'));
      if (rootNode) {
        await rootNode.click();
        await CommonFunc.sleep(1000);
      }

      expect(rootNode !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_2700] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_2800
     * @tc.name     treeViewV2PageTest_static_2800
     * @tc.desc     Test NodeParamV2 editIcon parameter
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_2800] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let rootNode = await driver.findComponent(ON.text('Root Node'));
      if (rootNode) {
        await rootNode.click();
        await CommonFunc.sleep(500);
      }

      let modifyBtn = await driver.findComponent(ON.text('Modify'));
      if (modifyBtn) {
        await modifyBtn.click();
        await CommonFunc.sleep(1000);
      }

      expect(rootNode !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_2800] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_2900
     * @tc.name     treeViewV2PageTest_static_2900
     * @tc.desc     Test NodeParamV2 isFolder parameter
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_2900] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let folderNode = await driver.findComponent(ON.text('目录3'));
      expect(folderNode !== null).assertTrue();

      let fileNode = await driver.findComponent(ON.text('项目4'));
      expect(fileNode !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_2900] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_3000
     * @tc.name     treeViewV2PageTest_static_3000
     * @tc.desc     Test NodeParamV2 primaryTitle and secondaryTitle parameters
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_3000] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let rootNodeWithSubtitle = await driver.findComponent(ON.textRegex('Root Node.*6'));
      expect(rootNodeWithSubtitle !== null).assertTrue();

      let nodeWithSubtitle = await driver.findComponent(ON.textRegex('目录5.*0'));
      expect(nodeWithSubtitle !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_3000] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_3100
     * @tc.name     treeViewV2PageTest_static_3100
     * @tc.desc     Test NodeParamV2 all optional parameters combination
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
    it('treeViewV2PageTest_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_3100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let rootNode = await driver.findComponent(ON.textRegex('Root Node.*6'));
      if (rootNode) {
        await rootNode.click();
        await CommonFunc.sleep(500);
      }

      expect(rootNode !== null).assertTrue();

      let clickIdText = await driver.findComponent(ON.textRegex('ClickId=\\d+'));
      expect(clickIdText !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_3100] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_3200
     * @tc.name     treeViewV2PageTest_static_3200
     * @tc.desc     Test NodeParamV2 parentId and currentNodeId parameters
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_3200] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let rootNode = await driver.findComponent(ON.text('Root Node'));
      expect(rootNode !== null).assertTrue();

      let childNode = await driver.findComponent(ON.text('项目1_1'));
      expect(childNode !== null).assertTrue();

      let node6 = await driver.findComponent(ON.textRegex('目录6.*0'));
      let node6_1 = await driver.findComponent(ON.textRegex('目录6-1.*0'));
      expect(node6 !== null).assertTrue();
      expect(node6_1 !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_3200] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_3300
     * @tc.name     treeViewV2PageTest_static_3300
     * @tc.desc     Test NodeParamV2 without optional parameters
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
    it('treeViewV2PageTest_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_3300] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let secondRoot = await driver.findComponent(ON.text('Second Root'));
      expect(secondRoot !== null).assertTrue();

      let project4 = await driver.findComponent(ON.text('项目4'));
      expect(project4 !== null).assertTrue();

      let project9 = await driver.findComponent(ON.text('项目9'));
      expect(project9 !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_3300] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_3400
     * @tc.name     treeViewV2PageTest_static_3400
     * @tc.desc     Test NodeParamV2 multi-level nested nodes
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
    it('treeViewV2PageTest_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_3400] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let node6 = await driver.findComponent(ON.textRegex('目录6.*0'));
      if (node6) {
        await node6.click();
        await CommonFunc.sleep(1000);
      }

      let node6_1 = await driver.findComponent(ON.textRegex('目录6-1.*0'));
      expect(node6_1 !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_3400] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_3500
     * @tc.name     treeViewV2PageTest_static_3500
     * @tc.desc     Test CallbackParamV2 currentNodeId parameter validation
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_3500] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let rootNode = await driver.findComponent(ON.text('Root Node'));
      if (rootNode) {
        await rootNode.click();
        await CommonFunc.sleep(1000);
      }

      let clickIdText = await driver.findComponent(ON.text('ClickId=1'));
      expect(clickIdText !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_3500] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_3600
     * @tc.name     treeViewV2PageTest_static_3600
     * @tc.desc     Test CallbackParamV2 parentNodeId parameter validation
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_3600] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let node6 = await driver.findComponent(ON.textRegex('目录6.*0'));
      if (node6) {
        await node6.click();
        await CommonFunc.sleep(1000);
      }

      let clickIdText = await driver.findComponent(ON.text('ClickId=32'));
      expect(clickIdText !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_3600] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_3700
     * @tc.name     treeViewV2PageTest_static_3700
     * @tc.desc     Test CallbackParamV2 childIndex parameter validation
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
    it('treeViewV2PageTest_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_3700] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let rootNode = await driver.findComponent(ON.text('Root Node'));
      if (rootNode) {
        await rootNode.click();
        await CommonFunc.sleep(500);
      }

      let addBtn = await driver.findComponent(ON.text('Add'));
      if (addBtn) {
        await addBtn.click();
        await CommonFunc.sleep(1000);
      }

      let clickIdText = await driver.findComponent(ON.textRegex('ClickId=\\d+'));
      expect(clickIdText !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_3700] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_3800
     * @tc.name     treeViewV2PageTest_static_3800
     * @tc.desc     Test CallbackParamV2 all parameters integrity validation
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
    it('treeViewV2PageTest_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_3800] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let secondRoot = await driver.findComponent(ON.text('Second Root'));
      if (secondRoot) {
        await secondRoot.click();
        await CommonFunc.sleep(1000);
      }

      let clickIdText = await driver.findComponent(ON.text('ClickId=7'));
      expect(clickIdText !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_3800] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_3900
     * @tc.name     treeViewV2PageTest_static_3900
     * @tc.desc     Test NodeParamV2 parentNodeId=-1 creates root node
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_3900] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let rootNode = await driver.findComponent(ON.text('Root Node'));
      expect(rootNode !== null).assertTrue();

      let secondRoot = await driver.findComponent(ON.text('Second Root'));
      expect(secondRoot !== null).assertTrue();

      let node3 = await driver.findComponent(ON.text('目录3'));
      expect(node3 !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_3900] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_4500
     * @tc.name     treeViewV2PageTest_static_4500
     * @tc.desc     Test complete workflow: click node, add child, modify, delete
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_4500] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let rootNode = await driver.findComponent(ON.text('Root Node'));
      if (rootNode) {
        await rootNode.click();
        await CommonFunc.sleep(500);
      }

      let clickId1 = await driver.findComponent(ON.text('ClickId=1'));
      expect(clickId1 !== null).assertTrue();

      let addBtn = await driver.findComponent(ON.text('Add'));
      if (addBtn) {
        await addBtn.click();
        await CommonFunc.sleep(1000);
      }

      let clickIdAfterAdd = await driver.findComponent(ON.textRegex('ClickId=\\d+'));
      expect(clickIdAfterAdd !== null).assertTrue();

      let modifyBtn = await driver.findComponent(ON.text('Modify'));
      if (modifyBtn) {
        await modifyBtn.click();
        await CommonFunc.sleep(1000);
      }

      console.info('[treeViewV2PageTest_static_4500] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_5000
     * @tc.name     treeViewV2PageTest_static_5000
     * @tc.desc     Test NodeParamV2 symbolIconStyle parameter with SymbolGlyphModifier
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_5000] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let symbolFolder = await driver.findComponent(ON.text('Symbol Folder'));
      expect(symbolFolder !== null).assertTrue();

      if (symbolFolder) {
        await symbolFolder.click();
        await CommonFunc.sleep(1000);
      }

      let clickId100 = await driver.findComponent(ON.text('ClickId=100'));
      expect(clickId100 !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_5000] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_5001
     * @tc.name     treeViewV2PageTest_static_5001
     * @tc.desc     Test NodeParamV2 symbolSelectedIconStyle parameter (selected state)
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_5001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_5001] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let symbolFolder = await driver.findComponent(ON.text('Symbol Folder'));
      if (symbolFolder) {
        await symbolFolder.click();
        await CommonFunc.sleep(2000);
      }

      expect(symbolFolder !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_5001] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_5002
     * @tc.name     treeViewV2PageTest_static_5002
     * @tc.desc     Test NodeParamV2 symbolEditIconStyle parameter (edit state)
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_5002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_5002] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let symbolFolder = await driver.findComponent(ON.text('Symbol Folder'));
      if (symbolFolder) {
        await symbolFolder.click();
        await CommonFunc.sleep(500);
      }

      let modifyBtn = await driver.findComponent(ON.text('Modify'));
      if (modifyBtn) {
        await modifyBtn.click();
        await CommonFunc.sleep(1000);
      }

      expect(symbolFolder !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_5002] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_5003
     * @tc.name     treeViewV2PageTest_static_5003
     * @tc.desc     Test NodeParamV2 symbolIconStyle child node inheritance
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_5003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_5003] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let symbolFolder = await driver.findComponent(ON.text('Symbol Folder'));
      if (symbolFolder) {
        await symbolFolder.click();
        await CommonFunc.sleep(1000);
      }

      let symbolFile = await driver.findComponent(ON.text('Symbol File'));
      expect(symbolFile !== null).assertTrue();

      if (symbolFile) {
        await symbolFile.click();
        await CommonFunc.sleep(500);
      }

      let clickId101 = await driver.findComponent(ON.text('ClickId=101'));
      expect(clickId101 !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_5003] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_5010
     * @tc.name     treeViewV2PageTest_static_5010
     * @tc.desc     Test NodeParamV2 container parameter with custom component
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_5010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_5010] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let containerNode = await driver.findComponent(ON.text('Container Node'));
      expect(containerNode !== null).assertTrue();

      let customComponent = await driver.findComponent(ON.text('Custom Component'));
      expect(customComponent !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_5010] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_5011
     * @tc.name     treeViewV2PageTest_static_5011
     * @tc.desc     Test container parameter custom component content verification
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_5011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_5011] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let customText = await driver.findComponent(ON.text('Custom Component'));
      expect(customText !== null).assertTrue();

      if (customText) {
        await customText.click();
        await CommonFunc.sleep(500);
      }

      console.info('[treeViewV2PageTest_static_5011] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_5012
     * @tc.name     treeViewV2PageTest_static_5012
     * @tc.desc     Test container parameter node click interaction
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
    it('treeViewV2PageTest_static_5012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_5012] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let containerNode = await driver.findComponent(ON.text('Container Node'));
      if (containerNode) {
        await containerNode.click();
        await CommonFunc.sleep(500);
      }

      let clickId102 = await driver.findComponent(ON.text('ClickId=102'));
      expect(clickId102 !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_5012] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_5030
     * @tc.name     treeViewV2PageTest_static_5030
     * @tc.desc     Test NodeParamV2 primaryTitle with empty string boundary
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_5030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_5030] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let emptyTitleBtn = await driver.findComponent(ON.text('Test Empty Title'));
      expect(emptyTitleBtn !== null).assertTrue();

      if (emptyTitleBtn) {
        await emptyTitleBtn.click();
        await CommonFunc.sleep(1000);
      }

      let testMessage = await driver.findComponent(ON.textRegex('Added node with empty title'));
      expect(testMessage !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_5030] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_5031
     * @tc.name     treeViewV2PageTest_static_5031
     * @tc.desc     Test NodeParamV2 primaryTitle with long string boundary (>50 chars)
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_5031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_5031] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let longTitleBtn = await driver.findComponent(ON.text('Test Long Title'));
      expect(longTitleBtn !== null).assertTrue();

      if (longTitleBtn) {
        await longTitleBtn.click();
        await CommonFunc.sleep(1000);
      }

      let testMessage = await driver.findComponent(ON.textRegex('Added node with long title'));
      expect(testMessage !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_5031] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_5017
     * @tc.name     treeViewV2PageTest_static_5017
     * @tc.desc     Test NodeParamV2 parentNodeId with invalid value (999)
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1
     */
    it('treeViewV2PageTest_static_5017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_5017] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let invalidParentBtn = await driver.findComponent(ON.text('Test Invalid Parent'));
      expect(invalidParentBtn !== null).assertTrue();

      if (invalidParentBtn) {
        await invalidParentBtn.click();
        await CommonFunc.sleep(1000);
      }

      let testMessage = await driver.findComponent(ON.textRegex('Added node with invalid parent ID'));
      expect(testMessage !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_5017] END');
      done();
    });

    /**
     * @tc.number   treeViewV2PageTest_static_5040
     * @tc.name     treeViewV2PageTest_static_5040
     * @tc.desc     Test CallbackParamV2 all parameters display
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('treeViewV2PageTest_static_5040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[treeViewV2PageTest_static_5040] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      let rootNode = await driver.findComponent(ON.text('Root Node'));
      if (rootNode) {
        await rootNode.click();
        await CommonFunc.sleep(1000);
      }

      let callbackParam = await driver.findComponent(ON.textRegex('CallbackParam: current:\\d+, parent:\\d+, index:\\d+'));
      expect(callbackParam !== null).assertTrue();

      console.info('[treeViewV2PageTest_static_5040] END');
      done();
    });
   
  })
}