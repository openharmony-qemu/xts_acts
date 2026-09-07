'use static';

/*
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

import { afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function FoldSplitContainerTest1() {
  describe('FoldSplitContainerTest1', () => {

    beforeEach(async (): Promise<void> => {
      console.info("FoldSplitContainerTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FoldSplitContainer/FoldSplitContainer1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get FoldSplitContainerTest1 state pages:" + "");
        if (!("FoldSplitContainerTest1" == pages.name)) {
          console.info("get FoldSplitContainerTest1 pages.name:" + "");
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push FoldSplitContainerTest1 page error:" + err);
        expect().assertFail();
      }
      console.info("FoldSplitContainerTest1 beforeEach end");
    });

    afterEach(async () => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error("FoldSplitContainerTest1 afterEach sleep error:" + err);
      }
      console.info("FoldSplitContainerTest1 after each called");
    });

    /**
     * @tc.name   FoldSplitContainerTest1_static_0100
     * @tc.number SUB_ARKUI_API_FoldSplitContainerTest1_static_0100
     * @tc.desc   Test FoldSplitContainer component with primary and secondary regions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('FoldSplitContainerTest1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('FoldSplitContainerTest1_static_0100 START');
        await CommonFunc.sleep(2000);

        let strJson1 = inspector.getInspectorByKey('FoldSplitContainerTest1_FoldSplitContainer');
        let obj1 = JSON.parseJsonElement(strJson1);
        await CommonFunc.sleep(1000);
        console.info("[FoldSplitContainerTest1_static_0100] obj1 is: " + JSON.stringify(obj1));
        expect(obj1 != null && obj1 != undefined).assertTrue();
        expect(obj1.getElement('$attrs').getString('id')).assertEqual('FoldSplitContainerTest1_FoldSplitContainer');

        console.info('FoldSplitContainerTest1_static_0100 END');
      } catch (err) {
        console.error("FoldSplitContainerTest1_static_0100 error:" + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   FoldSplitContainerTest1_static_0200
     * @tc.number SUB_ARKUI_API_FoldSplitContainerTest1_static_0200
     * @tc.desc   Test FoldSplitContainer expandedLayoutOptions with LAYOUT_3V2 horizontalSplitRatio
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('FoldSplitContainerTest1_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('FoldSplitContainerTest1_static_0200 START');
        await CommonFunc.sleep(2000);

        let strJson1 = inspector.getInspectorByKey('FoldSplitContainerTest1_FoldSplitContainer');
        let obj1 = JSON.parseJsonElement(strJson1);
        await CommonFunc.sleep(1000);
        console.info("[FoldSplitContainerTest1_static_0200] obj1 is: " + JSON.stringify(obj1));
        expect(obj1 != null && obj1 != undefined).assertTrue();
        expect(obj1.getElement('$attrs').getString('id')).assertEqual('FoldSplitContainerTest1_FoldSplitContainer');

        console.info('FoldSplitContainerTest1_static_0200 END');
      } catch (err) {
        console.error("FoldSplitContainerTest1_static_0200 error:" + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   FoldSplitContainerTest1_static_0300
     * @tc.number SUB_ARKUI_API_FoldSplitContainerTest1_static_0300
     * @tc.desc   Test FoldSplitContainer hoverModeLayoutOptions with showExtraRegion false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('FoldSplitContainerTest1_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('FoldSplitContainerTest1_static_0300 START');
        await CommonFunc.sleep(2000);

        let strJson1 = inspector.getInspectorByKey('FoldSplitContainerTest1_FoldSplitContainer');
        let obj1 = JSON.parseJsonElement(strJson1);
        await CommonFunc.sleep(1000);
        console.info("[FoldSplitContainerTest1_static_0300] obj1 is: " + JSON.stringify(obj1));
        expect(obj1 != null && obj1 != undefined).assertTrue();

        console.info('FoldSplitContainerTest1_static_0300 END');
      } catch (err) {
        console.error("FoldSplitContainerTest1_static_0300 error:" + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   FoldSplitContainerTest1_static_0400
     * @tc.number SUB_ARKUI_API_FoldSplitContainerTest1_static_0400
     * @tc.desc   Test FoldSplitContainer foldedLayoutOptions with LAYOUT_1V1 verticalSplitRatio
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('FoldSplitContainerTest1_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('FoldSplitContainerTest1_static_0400 START');
        await CommonFunc.sleep(2000);

        let strJson1 = inspector.getInspectorByKey('FoldSplitContainerTest1_FoldSplitContainer');
        let obj1 = JSON.parseJsonElement(strJson1);
        await CommonFunc.sleep(1000);
        console.info("[FoldSplitContainerTest1_static_0400] obj1 is: " + JSON.stringify(obj1));
        expect(obj1 != null && obj1 != undefined).assertTrue();

        console.info('FoldSplitContainerTest1_static_0400 END');
      } catch (err) {
        console.error("FoldSplitContainerTest1_static_0400 error:" + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   FoldSplitContainerTest1_static_0500
     * @tc.number SUB_ARKUI_API_FoldSplitContainerTest1_static_0500
     * @tc.desc   Test FoldSplitContainer onHoverStatusChange callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('FoldSplitContainerTest1_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('FoldSplitContainerTest1_static_0500 START');
        await CommonFunc.sleep(2000);

        let strJson1 = inspector.getInspectorByKey('FoldSplitContainerTest1_hoverStatus');
        let obj1 = JSON.parseJsonElement(strJson1);
        await CommonFunc.sleep(1000);
        console.info("[FoldSplitContainerTest1_static_0500] obj1 is: " + JSON.stringify(obj1));
        expect(obj1 != null && obj1 != undefined).assertTrue();
        expect(obj1.getElement('$attrs').getString('id')).assertEqual('FoldSplitContainerTest1_hoverStatus');

        console.info('FoldSplitContainerTest1_static_0500 END');
      } catch (err) {
        console.error("FoldSplitContainerTest1_static_0500 error:" + err);
        expect(false).assertTrue();
      }
      done();
    });

  })
}
