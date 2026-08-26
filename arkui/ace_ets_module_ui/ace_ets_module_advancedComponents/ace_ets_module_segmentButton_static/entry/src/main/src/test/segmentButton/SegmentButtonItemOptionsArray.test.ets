'use static';
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


import { describe, it, expect, beforeEach, afterEach, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';

export default function SegmentButtonItemOptionsArrayTest() {
  describe('SegmentButtonItemOptionsArrayTest', () => {

    beforeEach(async (): Promise<void> => {
      console.info("SegmentButtonItemOptionsArrayTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/segmentButton/SegmentButtonIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("SegmentButtonItemOptionsArrayTest state pages: " + JSON.stringify(pages));
        if (pages.name !== "SegmentButtonIndex") {
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("SegmentButtonItemOptionsArrayTest pushUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('SegmentButtonItemOptionsArrayTest afterEach sleep err: ' + JSON.stringify(err));
      }
      console.info("SegmentButtonItemOptionsArrayTest after each called");
    });

    /**
     * @tc.number SegmentButtonItemOptionsArrayTest_001
     * @tc.name segmentButtonItemOptionsArray_create_text
     * @tc.desc SegmentButtonItemOptionsArray.create() with SegmentButtonTextItem array → length=2
     */
    it('segmentButtonItemOptionsArray_create_text', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonItemOptionsArrayTest: segmentButtonItemOptionsArray_create_text START');
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(500);
        let btn = await driver.findComponent(ON.id('btnCreateText'));
        if (!btn) {
          expect().assertFail();
          done();
          return;
        }
        await btn.click();
        await CommonFunc.sleep(1000);
        let mText = inspector.getInspectorByKey('btnCreateText');
        console.info('[create_text] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
        expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
          .assertEqual('create_text:2');
        console.info('SegmentButtonItemOptionsArrayTest: segmentButtonItemOptionsArray_create_text END');
      } catch (error) {
        console.error('[segmentButtonItemOptionsArray_create_text] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SegmentButtonItemOptionsArrayTest_002
     * @tc.name segmentButtonItemOptionsArray_create_icon
     * @tc.desc SegmentButtonItemOptionsArray.create() with SegmentButtonIconItem array → length=2
     */
    it('segmentButtonItemOptionsArray_create_icon', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonItemOptionsArrayTest: segmentButtonItemOptionsArray_create_icon START');
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(500);
        let btn = await driver.findComponent(ON.id('btnCreateIcon'));
        if (!btn) {
          expect().assertFail();
          done();
          return;
        }
        await btn.click();
        await CommonFunc.sleep(1000);
        let mText = inspector.getInspectorByKey('btnCreateIcon');
        console.info('[create_icon] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
        expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
          .assertEqual('create_icon:2');
        console.info('SegmentButtonItemOptionsArrayTest: segmentButtonItemOptionsArray_create_icon END');
      } catch (error) {
        console.error('[segmentButtonItemOptionsArray_create_icon] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SegmentButtonItemOptionsArrayTest_003
     * @tc.name segmentButtonItemOptionsArray_create_icontext
     * @tc.desc SegmentButtonItemOptionsArray.create() with SegmentButtonIconTextItem array → length=2
     */
    it('segmentButtonItemOptionsArray_create_icontext', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonItemOptionsArrayTest: segmentButtonItemOptionsArray_create_icontext START');
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(500);
        let btn = await driver.findComponent(ON.id('btnCreateIconText'));
        if (!btn) {
          expect().assertFail();
          done();
          return;
        }
        await btn.click();
        await CommonFunc.sleep(1000);
        let mText = inspector.getInspectorByKey('btnCreateIconText');
        console.info('[create_icontext] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
        expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
          .assertEqual('create_icontext:2');
        console.info('SegmentButtonItemOptionsArrayTest: segmentButtonItemOptionsArray_create_icontext END');
      } catch (error) {
        console.error('[segmentButtonItemOptionsArray_create_icontext] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SegmentButtonItemOptionsArrayTest_004
     * @tc.name segmentButtonItemOptionsArray_push2
     * @tc.desc push(item1, item2) on 2-item array → new length=4
     */
    it('segmentButtonItemOptionsArray_push2', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonItemOptionsArrayTest: segmentButtonItemOptionsArray_push2 START');
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(500);
        let btn = await driver.findComponent(ON.id('btnPush2'));
        if (!btn) {
          expect().assertFail();
          done();
          return;
        }
        await btn.click();
        await CommonFunc.sleep(1000);
        let mText = inspector.getInspectorByKey('btnPush2');
        console.info('[push2] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
        expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
          .assertEqual('push2:4');
        console.info('SegmentButtonItemOptionsArrayTest: segmentButtonItemOptionsArray_push2 END');
      } catch (error) {
        console.error('[segmentButtonItemOptionsArray_push2] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SegmentButtonItemOptionsArrayTest_005
     * @tc.name segmentButtonItemOptionsArray_push3
     * @tc.desc push(item1, item2, item3) on 2-item array → new length=5
     */
    it('segmentButtonItemOptionsArray_push3', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonItemOptionsArrayTest: segmentButtonItemOptionsArray_push3 START');
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(500);
        let btn = await driver.findComponent(ON.id('btnPush3'));
        if (!btn) {
          expect().assertFail();
          done();
          return;
        }
        await btn.click();
        await CommonFunc.sleep(1000);
        let mText = inspector.getInspectorByKey('btnPush3');
        console.info('[push3] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
        expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
          .assertEqual('push3:5');
        console.info('SegmentButtonItemOptionsArrayTest: segmentButtonItemOptionsArray_push3 END');
      } catch (error) {
        console.error('[segmentButtonItemOptionsArray_push3] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SegmentButtonItemOptionsArrayTest_006
     * @tc.name segmentButtonItemOptionsArray_pop
     * @tc.desc pop() on 4-item array → remaining length=3
     */
    it('segmentButtonItemOptionsArray_pop', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonItemOptionsArrayTest: segmentButtonItemOptionsArray_pop START');
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(500);
        let btn = await driver.findComponent(ON.id('btnPop'));
        if (!btn) {
          expect().assertFail();
          done();
          return;
        }
        await btn.click();
        await CommonFunc.sleep(1000);
        let mText = inspector.getInspectorByKey('btnPop');
        console.info('[pop] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
        expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
          .assertEqual('pop:3');
        console.info('SegmentButtonItemOptionsArrayTest: segmentButtonItemOptionsArray_pop END');
      } catch (error) {
        console.error('[segmentButtonItemOptionsArray_pop] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SegmentButtonItemOptionsArrayTest_007
     * @tc.name segmentButtonItemOptionsArray_shift
     * @tc.desc shift() on 4-item array → remaining length=3
     */
    it('segmentButtonItemOptionsArray_shift', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonItemOptionsArrayTest: segmentButtonItemOptionsArray_shift START');
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(500);
        let btn = await driver.findComponent(ON.id('btnShift'));
        if (!btn) {
          expect().assertFail();
          done();
          return;
        }
        await btn.click();
        await CommonFunc.sleep(1000);
        let mText = inspector.getInspectorByKey('btnShift');
        console.info('[shift] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
        expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
          .assertEqual('shift:3');
        console.info('SegmentButtonItemOptionsArrayTest: segmentButtonItemOptionsArray_shift END');
      } catch (error) {
        console.error('[segmentButtonItemOptionsArray_shift] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SegmentButtonItemOptionsArrayTest_008
     * @tc.name segmentButtonItemOptionsArray_unshift1
     * @tc.desc unshift(item) on 2-item array → new length=3
     */
    it('segmentButtonItemOptionsArray_unshift1', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonItemOptionsArrayTest: segmentButtonItemOptionsArray_unshift1 START');
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(500);
        let btn = await driver.findComponent(ON.id('btnUnshift1'));
        if (!btn) {
          expect().assertFail();
          done();
          return;
        }
        await btn.click();
        await CommonFunc.sleep(1000);
        let mText = inspector.getInspectorByKey('btnUnshift1');
        console.info('[unshift1] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
        expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
          .assertEqual('unshift1:3');
        console.info('SegmentButtonItemOptionsArrayTest: segmentButtonItemOptionsArray_unshift1 END');
      } catch (error) {
        console.error('[segmentButtonItemOptionsArray_unshift1] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SegmentButtonItemOptionsArrayTest_009
     * @tc.name segmentButtonItemOptionsArray_unshift2
     * @tc.desc unshift(item1, item2) on 2-item array → new length=4
     */
    it('segmentButtonItemOptionsArray_unshift2', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonItemOptionsArrayTest: segmentButtonItemOptionsArray_unshift2 START');
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(500);
        let btn = await driver.findComponent(ON.id('btnUnshift2'));
        if (!btn) {
          expect().assertFail();
          done();
          return;
        }
        await btn.click();
        await CommonFunc.sleep(1000);
        let mText = inspector.getInspectorByKey('btnUnshift2');
        console.info('[unshift2] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
        expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
          .assertEqual('unshift2:4');
        console.info('SegmentButtonItemOptionsArrayTest: segmentButtonItemOptionsArray_unshift2 END');
      } catch (error) {
        console.error('[segmentButtonItemOptionsArray_unshift2] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SegmentButtonItemOptionsArrayTest_010
     * @tc.name segmentButtonItemOptionsArray_unshift3
     * @tc.desc unshift(item1, item2, item3) on 2-item array → new length=5
     */
    it('segmentButtonItemOptionsArray_unshift3', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonItemOptionsArrayTest: segmentButtonItemOptionsArray_unshift3 START');
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(500);
        let btn = await driver.findComponent(ON.id('btnUnshift3'));
        if (!btn) {
          expect().assertFail();
          done();
          return;
        }
        await btn.click();
        await CommonFunc.sleep(1000);
        let mText = inspector.getInspectorByKey('btnUnshift3');
        console.info('[unshift3] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
        expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
          .assertEqual('unshift3:5');
        console.info('SegmentButtonItemOptionsArrayTest: segmentButtonItemOptionsArray_unshift3 END');
      } catch (error) {
        console.error('[segmentButtonItemOptionsArray_unshift3] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SegmentButtonItemOptionsArrayTest_011
     * @tc.name segmentButtonItemOptionsArray_splice_deleteOnly
     * @tc.desc splice(1,2) on 4-item array → deleted=2, remaining=2
     */
    it('segmentButtonItemOptionsArray_splice_deleteOnly', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonItemOptionsArrayTest: segmentButtonItemOptionsArray_splice_deleteOnly START');
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(500);
        let btn = await driver.findComponent(ON.id('btnSpliceDel'));
        if (!btn) {
          expect().assertFail();
          done();
          return;
        }
        await btn.click();
        await CommonFunc.sleep(1000);
        let mText = inspector.getInspectorByKey('btnSpliceDel');
        console.info('[splice_del] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
        expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
          .assertEqual('splice_del:2:2');
        console.info('SegmentButtonItemOptionsArrayTest: segmentButtonItemOptionsArray_splice_deleteOnly END');
      } catch (error) {
        console.error('[segmentButtonItemOptionsArray_splice_deleteOnly] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SegmentButtonItemOptionsArrayTest_012
     * @tc.name segmentButtonItemOptionsArray_splice_withInsert
     * @tc.desc splice(1,1,X) on 4-item array → deleted=1, length stays=4
     */
    it('segmentButtonItemOptionsArray_splice_withInsert', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonItemOptionsArrayTest: segmentButtonItemOptionsArray_splice_withInsert START');
      try {
        let driver: Driver = Driver.create();
        await CommonFunc.sleep(500);
        let btn = await driver.findComponent(ON.id('btnSpliceIns'));
        if (!btn) {
          expect().assertFail();
          done();
          return;
        }
        await btn.click();
        await CommonFunc.sleep(1000);
        let mText = inspector.getInspectorByKey('btnSpliceIns');
        console.info('[splice_ins] label=' + JSON.parseJsonElement(mText).getElement('$attrs').getString('label'));
        expect(JSON.parseJsonElement(mText).getElement('$attrs').getString('label'))
          .assertEqual('splice_ins:1:4');
        console.info('SegmentButtonItemOptionsArrayTest: segmentButtonItemOptionsArray_splice_withInsert END');
      } catch (error) {
        console.error('[segmentButtonItemOptionsArray_splice_withInsert] error: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      done();
    });

  });
}
