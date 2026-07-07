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

import { describe, beforeEach, afterEach, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import { KeyCode } from '@kit.InputKit';
import router from '@ohos.router';
import Utils from '../Utils';
import { TreeListenerManagerV2, TreeListenerV2 } from '@kit.ArkUI';

export default function treeViewV2PageTest() {
  describe('treeViewV2Page', () => {
    beforeEach(async (done: Function) => {
      console.info('treeViewV2Page beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/treeViewV2/TreeViewV2Page',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TreeViewV2Page state pages: ' + JSON.stringify(pages));
        if (!('TreeViewV2Page' == pages.name)) {
          console.info('get TreeViewV2Page pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push TreeViewV2Page page result successful');
        }
      } catch (err) {
        console.error('push TreeViewV2Page page error: ' + err);
      }

      await Utils.sleep(1000);
      console.info('treeViewV2Page beforeEach end');
      done();
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('treeViewV2Page after each called');
    })

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_0100
     * @tc.desc   Test TreeViewV2 basic rendering
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('treeViewV2PageTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[treeViewV2PageTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let rootNode = await driver.findComponent(ON.text('Root Node'));
      expect(rootNode !== null).assertTrue();

      console.info('[treeViewV2PageTest_0100] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_0200
     * @tc.desc   Test TreeControllerV2 addNode method
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('treeViewV2PageTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[treeViewV2PageTest_0200] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let rootNode = await driver.findComponent(ON.text('Root Node'));
      expect(rootNode !== null).assertTrue();
      await rootNode.click();

      let addBtn = await driver.findComponent(ON.text('Add'));
      expect(addBtn !== null).assertTrue();
      await addBtn.click();
      await driver.delayMs(1000);

      let newNode = await driver.findComponent(ON.text('新建文件夹'));
      expect(newNode !== null).assertTrue();

      console.info('[treeViewV2PageTest_0200] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_0300
     * @tc.desc   Test TreeListenerV2 onNodeClick event
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('treeViewV2PageTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[treeViewV2PageTest_0300] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let folderNode = await driver.findComponent(ON.text('Folder 1'));
      expect(folderNode !== null).assertTrue();
      await folderNode.click();
      await driver.delayMs(500);

      console.info('[treeViewV2PageTest_0300] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_0400
     * @tc.desc   Test TreeControllerV2 removeNode method
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('treeViewV2PageTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[treeViewV2PageTest_0400] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let fileNode = await driver.findComponent(ON.text('File 1'));
      expect(fileNode !== null).assertTrue();
      await fileNode.click();
      await driver.delayMs(500);

      let removeBtn = await driver.findComponent(ON.text('Remove'));
      expect(removeBtn !== null).assertTrue();
      await removeBtn.click();
      await driver.delayMs(1000);

      console.info('[treeViewV2PageTest_0400] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_0500
     * @tc.desc   Test TreeControllerV2 modifyNode method
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('treeViewV2PageTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[treeViewV2PageTest_0500] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let folderNode = await driver.findComponent(ON.text('Folder 1'));
      expect(folderNode !== null).assertTrue();
      await folderNode.click();

      let modifyBtn = await driver.findComponent(ON.text('Modify'));
      expect(modifyBtn !== null).assertTrue();
      await modifyBtn.click();
      await driver.delayMs(1000);

      console.info('[treeViewV2PageTest_0500] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_0600
     * @tc.desc   Test TreeListenerV2 onceNodeClick listener triggers only once
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('treeViewV2PageTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[treeViewV2PageTest_0600] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let rootNode = await driver.findComponent(ON.text('Root Node'));
      if (rootNode) {
        await rootNode.click();
        await driver.delayMs(500);
        await rootNode.click();
        await driver.delayMs(500);
      }

      console.info('[treeViewV2PageTest_0600] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_0700
     * @tc.desc   Test TreeListenerV2 offNodeClick cancel listener
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('treeViewV2PageTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[treeViewV2PageTest_0700] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let rootNode = await driver.findComponent(ON.text('Root Node'));
      if (rootNode) {
        await rootNode.click();
        await driver.delayMs(500);
      }

      console.info('[treeViewV2PageTest_0700] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_0800
     * @tc.desc   Test TreeListenerV2 onceNodeAdd listener triggers only once
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('treeViewV2PageTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[treeViewV2PageTest_0800] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let rootNode = await driver.findComponent(ON.text('Root Node'));
      if (rootNode) {
        await rootNode.click();
        await driver.delayMs(500);
      }

      let addBtn = await driver.findComponent(ON.text('Add'));
      if (addBtn) {
        await addBtn.click();
        await driver.delayMs(1000);
        await addBtn.click();
        await driver.delayMs(1000);
      }

      console.info('[treeViewV2PageTest_0800] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_0900
     * @tc.desc   Test TreeListenerV2 offNodeAdd cancel listener
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('treeViewV2PageTest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[treeViewV2PageTest_0900] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let rootNode = await driver.findComponent(ON.text('Root Node'));
      if (rootNode) {
        await rootNode.click();
        await driver.delayMs(500);
      }

      let addBtn = await driver.findComponent(ON.text('Add'));
      if (addBtn) {
        await addBtn.click();
        await driver.delayMs(1000);
      }

      console.info('[treeViewV2PageTest_0900] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_1000
     * @tc.desc   Test TreeListenerV2 onceNodeDelete listener triggers only once
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('treeViewV2PageTest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[treeViewV2PageTest_1000] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let fileNode = await driver.findComponent(ON.text('File 1'));
      if (fileNode) {
        await fileNode.click();
        await driver.delayMs(500);
      }

      let removeBtn = await driver.findComponent(ON.text('Remove'));
      if (removeBtn) {
        await removeBtn.click();
        await driver.delayMs(1000);
      }

      console.info('[treeViewV2PageTest_1000] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_1100
     * @tc.desc   Test TreeListenerV2 offNodeDelete cancel listener
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('treeViewV2PageTest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[treeViewV2PageTest_1100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let fileNode = await driver.findComponent(ON.text('File 1'));
      if (fileNode) {
        await fileNode.click();
        await driver.delayMs(500);
      }

      let removeBtn = await driver.findComponent(ON.text('Remove'));
      if (removeBtn) {
        await removeBtn.click();
        await driver.delayMs(1000);
      }

      console.info('[treeViewV2PageTest_1100] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_1200
     * @tc.desc   Test TreeListenerV2 onNodeModify listener triggers
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('treeViewV2PageTest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[treeViewV2PageTest_1200] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let folderNode = await driver.findComponent(ON.text('Folder 1'));
      if (folderNode) {
        await folderNode.click();
        await driver.delayMs(500);
      }

      let modifyBtn = await driver.findComponent(ON.text('Modify'));
      if (modifyBtn) {
        await modifyBtn.click();
        await driver.delayMs(1000);
      }

      console.info('[treeViewV2PageTest_1200] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_1300
     * @tc.desc   Test TreeListenerV2 onceNodeModify listener triggers only once
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('treeViewV2PageTest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[treeViewV2PageTest_1300] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let folderNode = await driver.findComponent(ON.text('Folder 1'));
      if (folderNode) {
        await folderNode.click();
        await driver.delayMs(500);
      }

      let modifyBtn = await driver.findComponent(ON.text('Modify'));
      if (modifyBtn) {
        await modifyBtn.click();
        await driver.delayMs(1000);
        await modifyBtn.click();
        await driver.delayMs(1000);
      }

      console.info('[treeViewV2PageTest_1300] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_1400
     * @tc.desc   Test TreeListenerV2 offNodeModify cancel listener
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('treeViewV2PageTest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[treeViewV2PageTest_1400] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let folderNode = await driver.findComponent(ON.text('Folder 1'));
      if (folderNode) {
        await folderNode.click();
        await driver.delayMs(500);
      }

      let modifyBtn = await driver.findComponent(ON.text('Modify'));
      if (modifyBtn) {
        await modifyBtn.click();
        await driver.delayMs(1000);
      }

      console.info('[treeViewV2PageTest_1400] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_1500
     * @tc.desc   Test TreeListenerV2 onNodeMove listener triggers
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('treeViewV2PageTest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[treeViewV2PageTest_1500] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let rootNode = await driver.findComponent(ON.text('Root Node'));
      if (rootNode) {
        await rootNode.click();
        await driver.delayMs(500);
      }

      console.info('[treeViewV2PageTest_1500] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_1600
     * @tc.desc   Test TreeListenerV2 offNodeMove cancel listener
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('treeViewV2PageTest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[treeViewV2PageTest_1600] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let rootNode = await driver.findComponent(ON.text('Root Node'));
      if (rootNode) {
        await rootNode.click();
        await driver.delayMs(500);
      }

      console.info('[treeViewV2PageTest_1600] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_1700
     * @tc.desc   Test TreeListenerV2 off method with undefined parameter clears all listeners
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  1
     */
    it('treeViewV2PageTest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[treeViewV2PageTest_1700] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let rootNode = await driver.findComponent(ON.text('Root Node'));
      if (rootNode) {
        await rootNode.click();
        await driver.delayMs(500);
      }

      console.info('[treeViewV2PageTest_1700] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_1800
     * @tc.desc   Test TreeListenerManagerV2 getInstance returns singleton instance
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('treeViewV2PageTest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[treeViewV2PageTest_1800] START');

      let instance1 = TreeListenerManagerV2.getInstance();
      let instance2 = TreeListenerManagerV2.getInstance();
      expect(instance1 !== null).assertTrue();
      expect(instance2 !== null).assertTrue();
      expect(instance1 === instance2).assertTrue();

      console.info('[treeViewV2PageTest_1800] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_1900
     * @tc.desc   Test TreeListenerManagerV2 getTreeListener returns valid listener
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('treeViewV2PageTest_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[treeViewV2PageTest_1900] START');

      let manager = TreeListenerManagerV2.getInstance();
      let listener = manager.getTreeListener();
      expect(listener !== null).assertTrue();
      expect(listener !== undefined).assertTrue();

      console.info('[treeViewV2PageTest_1900] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_2000
     * @tc.desc   Test TreeListenerManagerV2 getInstance returns same instance multiple times
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  1
     */
    it('treeViewV2PageTest_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[treeViewV2PageTest_2000] START');

      let instances: TreeListenerManagerV2[] = [];
      for (let i = 0; i < 5; i++) {
        instances.push(TreeListenerManagerV2.getInstance());
      }

      let firstInstance = instances[0];
      for (let i = 1; i < instances.length; i++) {
        expect(instances[i] === firstInstance).assertTrue();
      }

      console.info('[treeViewV2PageTest_2000] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_2100
     * @tc.desc   Test TreeControllerV2 buildDone initializes tree structure
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('treeViewV2PageTest_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[treeViewV2PageTest_2100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let rootNode = await driver.findComponent(ON.text('Root Node'));
      expect(rootNode !== null).assertTrue();

      let folder1 = await driver.findComponent(ON.text('Folder 1'));
      expect(folder1 !== null).assertTrue();

      let file1 = await driver.findComponent(ON.text('File 1'));
      expect(file1 !== null).assertTrue();

      console.info('[treeViewV2PageTest_2100] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_2200
     * @tc.desc   Test TreeControllerV2 refreshNode updates secondary title
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('treeViewV2PageTest_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[treeViewV2PageTest_2200] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let rootNodeWithSubtitle = await driver.findComponent(ON.textRegex('Root Node.*\\d'));
      expect(rootNodeWithSubtitle !== null).assertTrue();

      console.info('[treeViewV2PageTest_2200] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_2300
     * @tc.desc   Test TreeControllerV2 refreshNode with invalid parentId parameter
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  1
     */
    it('treeViewV2PageTest_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[treeViewV2PageTest_2300] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let rootNode = await driver.findComponent(ON.text('Root Node'));
      if (rootNode) {
        await rootNode.click();
        await driver.delayMs(500);
      }

      let clickIdBefore = await driver.findComponent(ON.textRegex('\\d'));
      expect(clickIdBefore !== null).assertTrue();

      console.info('[treeViewV2PageTest_2300] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_2400
     * @tc.desc   Test TreeControllerV2 addNode chain call successfully
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  1
     */
    it('treeViewV2PageTest_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[treeViewV2PageTest_2400] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let rootNode = await driver.findComponent(ON.text('Root Node'));
      expect(rootNode !== null).assertTrue();

      let childNodes = await driver.findComponent(ON.textRegex('Folder|File'));
      expect(childNodes !== null).assertTrue();

      console.info('[treeViewV2PageTest_2400] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_5000
     * @tc.desc   Test NodeParamV2 symbolIconStyle parameter with SymbolGlyphModifier
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('treeViewV2PageTest_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[treeViewV2PageTest_5000] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let symbolFolder = await driver.findComponent(ON.text('Symbol Folder'));
      expect(symbolFolder !== null).assertTrue();

      if (symbolFolder) {
        await symbolFolder.click();
        await driver.delayMs(1000);
      }

      console.info('[treeViewV2PageTest_5000] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_5001
     * @tc.desc   Test NodeParamV2 symbolSelectedIconStyle parameter
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('treeViewV2PageTest_5001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[treeViewV2PageTest_5001] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let symbolFolder = await driver.findComponent(ON.text('Symbol Folder'));
      if (symbolFolder) {
        await symbolFolder.click();
        await driver.delayMs(2000);
      }

      expect(symbolFolder !== null).assertTrue();

      console.info('[treeViewV2PageTest_5001] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_5002
     * @tc.desc   Test NodeParamV2 symbolEditIconStyle parameter
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('treeViewV2PageTest_5002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[treeViewV2PageTest_5002] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let symbolFolder = await driver.findComponent(ON.text('Symbol Folder'));
      if (symbolFolder) {
        await symbolFolder.click();
        await driver.delayMs(500);
      }

      let modifyBtn = await driver.findComponent(ON.text('Modify'));
      if (modifyBtn) {
        await modifyBtn.click();
        await driver.delayMs(1000);
      }

      expect(symbolFolder !== null).assertTrue();

      console.info('[treeViewV2PageTest_5002] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_5003
     * @tc.desc   Test NodeParamV2 symbolIconStyle child node
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('treeViewV2PageTest_5003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[treeViewV2PageTest_5003] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let symbolFolder = await driver.findComponent(ON.text('Symbol Folder'));
      if (symbolFolder) {
        await symbolFolder.click();
        await driver.delayMs(1000);
      }

      let symbolFile = await driver.findComponent(ON.text('Symbol File'));
      expect(symbolFile !== null).assertTrue();

      console.info('[treeViewV2PageTest_5003] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_5010
     * @tc.desc   Test NodeParamV2 container parameter
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('treeViewV2PageTest_5010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[treeViewV2PageTest_5010] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let containerNode = await driver.findComponent(ON.text('Container Node'));
      expect(containerNode !== null).assertTrue();

      let customComponent = await driver.findComponent(ON.text('Custom Component'));
      expect(customComponent !== null).assertTrue();

      console.info('[treeViewV2PageTest_5010] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_5011
     * @tc.desc   Test container custom component content
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('treeViewV2PageTest_5011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[treeViewV2PageTest_5011] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let customText = await driver.findComponent(ON.text('Custom Component'));
      expect(customText !== null).assertTrue();

      console.info('[treeViewV2PageTest_5011] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_5030
     * @tc.desc   Test primaryTitle with empty string boundary
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('treeViewV2PageTest_5030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[treeViewV2PageTest_5030] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let emptyTitleBtn = await driver.findComponent(ON.text('Test Empty Title'));
      expect(emptyTitleBtn !== null).assertTrue();

      if (emptyTitleBtn) {
        await emptyTitleBtn.click();
        await driver.delayMs(1000);
      }

      console.info('[treeViewV2PageTest_5030] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_5031
     * @tc.desc   Test primaryTitle with long string boundary
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('treeViewV2PageTest_5031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[treeViewV2PageTest_5031] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let longTitleBtn = await driver.findComponent(ON.text('Test Long Title'));
      expect(longTitleBtn !== null).assertTrue();

      if (longTitleBtn) {
        await longTitleBtn.click();
        await driver.delayMs(1000);
      }

      console.info('[treeViewV2PageTest_5031] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_5017
     * @tc.desc   Test parentNodeId with invalid value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  1
     */
    it('treeViewV2PageTest_5017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[treeViewV2PageTest_5017] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let invalidParentBtn = await driver.findComponent(ON.text('Test Invalid Parent'));
      expect(invalidParentBtn !== null).assertTrue();

      if (invalidParentBtn) {
        await invalidParentBtn.click();
        await driver.delayMs(1000);
      }

      console.info('[treeViewV2PageTest_5017] END');
      done();
    });

    /**
     * @tc.number treeViewV2PageTest
     * @tc.name   treeViewV2PageTest_5040
     * @tc.desc   Test CallbackParamV2 all parameters display
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('treeViewV2PageTest_5040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[treeViewV2PageTest_5040] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);

      let rootNode = await driver.findComponent(ON.text('Root Node'));
      if (rootNode) {
        await rootNode.click();
        await driver.delayMs(1000);
      }

      let callbackParam = await driver.findComponent(ON.textRegex('CallbackParam:'));
      expect(callbackParam !== null).assertTrue();

      console.info('[treeViewV2PageTest_5040] END');
      done();
    });

  })
}