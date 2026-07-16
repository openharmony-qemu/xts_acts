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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../../hypium/index';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest, startAbility } from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';

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

   
  })
}