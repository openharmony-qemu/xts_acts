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

  })
}