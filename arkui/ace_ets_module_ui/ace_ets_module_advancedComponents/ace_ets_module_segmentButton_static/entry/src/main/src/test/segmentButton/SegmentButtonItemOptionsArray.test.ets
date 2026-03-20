/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static';

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';

export default function SegmentButtonTest() {
  describe('SegmentButtonTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("SegmentButtonTest beforeAll start");
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.segmentButton.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("SegmentButtonTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SegmentButton/SegmentButtonIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("SegmentButtonTest state pages: " + JSON.stringify(pages));
        if (pages.name !== "SegmentButtonIndex") {
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("SegmentButtonTest pushUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("SegmentButtonTest after each called");
    });

    /**
     * @tc.number SegmentButtonTest_001
     * @tc.name segmentButtonItemOptionsArray_create_text
     * @tc.desc SegmentButtonItemOptionsArray.create() with SegmentButtonTextItem array → length=2
     */
    it('segmentButtonItemOptionsArray_create_text', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonTest: segmentButtonItemOptionsArray_create_text START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('btnCreateText'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnCreateText');
      console.info('[create_text] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('create_text:2');
      console.info('SegmentButtonTest: segmentButtonItemOptionsArray_create_text END');
      done();
    });

    /**
     * @tc.number SegmentButtonTest_002
     * @tc.name segmentButtonItemOptionsArray_create_icon
     * @tc.desc SegmentButtonItemOptionsArray.create() with SegmentButtonIconItem array → length=2
     */
    it('segmentButtonItemOptionsArray_create_icon', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonTest: segmentButtonItemOptionsArray_create_icon START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('btnCreateIcon'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnCreateIcon');
      console.info('[create_icon] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('create_icon:2');
      console.info('SegmentButtonTest: segmentButtonItemOptionsArray_create_icon END');
      done();
    });

    /**
     * @tc.number SegmentButtonTest_003
     * @tc.name segmentButtonItemOptionsArray_create_icontext
     * @tc.desc SegmentButtonItemOptionsArray.create() with SegmentButtonIconTextItem array → length=2
     */
    it('segmentButtonItemOptionsArray_create_icontext', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonTest: segmentButtonItemOptionsArray_create_icontext START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('btnCreateIconText'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnCreateIconText');
      console.info('[create_icontext] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('create_icontext:2');
      console.info('SegmentButtonTest: segmentButtonItemOptionsArray_create_icontext END');
      done();
    });

    /**
     * @tc.number SegmentButtonTest_004
     * @tc.name segmentButtonItemOptionsArray_push2
     * @tc.desc push(item1, item2) on 2-item array → new length=4
     */
    it('segmentButtonItemOptionsArray_push2', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonTest: segmentButtonItemOptionsArray_push2 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('btnPush2'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnPush2');
      console.info('[push2] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('push2:4');
      console.info('SegmentButtonTest: segmentButtonItemOptionsArray_push2 END');
      done();
    });

    /**
     * @tc.number SegmentButtonTest_005
     * @tc.name segmentButtonItemOptionsArray_push3
     * @tc.desc push(item1, item2, item3) on 2-item array → new length=5
     */
    it('segmentButtonItemOptionsArray_push3', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonTest: segmentButtonItemOptionsArray_push3 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('btnPush3'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnPush3');
      console.info('[push3] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('push3:5');
      console.info('SegmentButtonTest: segmentButtonItemOptionsArray_push3 END');
      done();
    });

    /**
     * @tc.number SegmentButtonTest_006
     * @tc.name segmentButtonItemOptionsArray_pop
     * @tc.desc pop() on 4-item array → remaining length=3
     */
    it('segmentButtonItemOptionsArray_pop', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonTest: segmentButtonItemOptionsArray_pop START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('btnPop'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnPop');
      console.info('[pop] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('pop:3');
      console.info('SegmentButtonTest: segmentButtonItemOptionsArray_pop END');
      done();
    });

    /**
     * @tc.number SegmentButtonTest_007
     * @tc.name segmentButtonItemOptionsArray_shift
     * @tc.desc shift() on 4-item array → remaining length=3
     */
    it('segmentButtonItemOptionsArray_shift', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonTest: segmentButtonItemOptionsArray_shift START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('btnShift'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnShift');
      console.info('[shift] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('shift:3');
      console.info('SegmentButtonTest: segmentButtonItemOptionsArray_shift END');
      done();
    });

    /**
     * @tc.number SegmentButtonTest_008
     * @tc.name segmentButtonItemOptionsArray_unshift1
     * @tc.desc unshift(item) on 2-item array → new length=3
     */
    it('segmentButtonItemOptionsArray_unshift1', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonTest: segmentButtonItemOptionsArray_unshift1 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('btnUnshift1'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnUnshift1');
      console.info('[unshift1] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('unshift1:3');
      console.info('SegmentButtonTest: segmentButtonItemOptionsArray_unshift1 END');
      done();
    });

    /**
     * @tc.number SegmentButtonTest_009
     * @tc.name segmentButtonItemOptionsArray_unshift2
     * @tc.desc unshift(item1, item2) on 2-item array → new length=4
     */
    it('segmentButtonItemOptionsArray_unshift2', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonTest: segmentButtonItemOptionsArray_unshift2 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('btnUnshift2'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnUnshift2');
      console.info('[unshift2] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('unshift2:4');
      console.info('SegmentButtonTest: segmentButtonItemOptionsArray_unshift2 END');
      done();
    });

    /**
     * @tc.number SegmentButtonTest_010
     * @tc.name segmentButtonItemOptionsArray_unshift3
     * @tc.desc unshift(item1, item2, item3) on 2-item array → new length=5
     */
    it('segmentButtonItemOptionsArray_unshift3', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonTest: segmentButtonItemOptionsArray_unshift3 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('btnUnshift3'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnUnshift3');
      console.info('[unshift3] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('unshift3:5');
      console.info('SegmentButtonTest: segmentButtonItemOptionsArray_unshift3 END');
      done();
    });

    /**
     * @tc.number SegmentButtonTest_011
     * @tc.name segmentButtonItemOptionsArray_splice_deleteOnly
     * @tc.desc splice(1,2) on 4-item array → deleted=2, remaining=2
     */
    it('segmentButtonItemOptionsArray_splice_deleteOnly', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonTest: segmentButtonItemOptionsArray_splice_deleteOnly START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('btnSpliceDel'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnSpliceDel');
      console.info('[splice_del] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('splice_del:2:2');
      console.info('SegmentButtonTest: segmentButtonItemOptionsArray_splice_deleteOnly END');
      done();
    });

    /**
     * @tc.number SegmentButtonTest_012
     * @tc.name segmentButtonItemOptionsArray_splice_withInsert
     * @tc.desc splice(1,1,X) on 4-item array → deleted=1, length stays=4
     */
    it('segmentButtonItemOptionsArray_splice_withInsert', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonTest: segmentButtonItemOptionsArray_splice_withInsert START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('btnSpliceIns'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let mText = inspector.getInspectorByKey('btnSpliceIns');
      console.info('[splice_ins] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
      expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
        .assertEqual('splice_ins:1:4');
      console.info('SegmentButtonTest: segmentButtonItemOptionsArray_splice_withInsert END');
      done();
    });

  });
}
