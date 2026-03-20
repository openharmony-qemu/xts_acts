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
import {
  SegmentButtonItemOptionsArray,
  SegmentButtonTextItem,
  SegmentButtonIconItem,
  SegmentButtonIconTextItem
} from '@ohos.arkui.advanced.SegmentButton';

const SLEEP_TIME = 1000;

export default function SegmentButtonItemOptionsArrayTest() {
  describe('SegmentButtonItemOptionsArrayTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("SegmentButtonTest beforeAll start");
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.advanced.segmentButton.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("SegmentButtonTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/segmentButton/SegmentButtonIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("SegmentButtonTest state pages: " + JSON.stringify(pages));
        if (pages.name !== "SegmentButtonIndex") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("SegmentButtonTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info("SegmentButtonTest after each called");
    });

    /**
     * @tc.number SegmentButtonTest_001
     * @tc.name segmentButtonItemOptionsArray_create_text
     * @tc.desc Test SegmentButtonItemOptionsArray.create() with SegmentButtonTextItem array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('segmentButtonItemOptionsArray_create_text', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonTest execute: segmentButtonItemOptionsArray_create_text START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let item1: SegmentButtonTextItem = { text: 'Tab1' };
        let item2: SegmentButtonTextItem = { text: 'Tab2' };
        let items: Array<SegmentButtonTextItem> = [item1, item2];
        let arr = SegmentButtonItemOptionsArray.create(items);
        console.info('SegmentButtonTest: create_text arr.length=' + arr.length);
        expect(arr != null).assertTrue();
        expect(arr.length >= 2).assertTrue();
        console.info('SegmentButtonTest execute: segmentButtonItemOptionsArray_create_text END');
        done();
      } catch (error) {
        console.error('SegmentButtonTest execute: segmentButtonItemOptionsArray_create_text error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SegmentButtonTest_002
     * @tc.name segmentButtonItemOptionsArray_create_icon
     * @tc.desc Test SegmentButtonItemOptionsArray.create() with SegmentButtonIconItem array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('segmentButtonItemOptionsArray_create_icon', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonTest execute: segmentButtonItemOptionsArray_create_icon START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let item1: SegmentButtonIconItem = { icon: 'icon1.png', selectedIcon: 'icon1s.png' };
        let item2: SegmentButtonIconItem = { icon: 'icon2.png', selectedIcon: 'icon2s.png' };
        let items: Array<SegmentButtonIconItem> = [item1, item2];
        let arr = SegmentButtonItemOptionsArray.create(items);
        console.info('SegmentButtonTest: create_icon arr.length=' + arr.length);
        expect(arr != null).assertTrue();
        expect(arr.length >= 2).assertTrue();
        console.info('SegmentButtonTest execute: segmentButtonItemOptionsArray_create_icon END');
        done();
      } catch (error) {
        console.error('SegmentButtonTest execute: segmentButtonItemOptionsArray_create_icon error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SegmentButtonTest_003
     * @tc.name segmentButtonItemOptionsArray_create_icontext
     * @tc.desc Test SegmentButtonItemOptionsArray.create() with SegmentButtonIconTextItem array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('segmentButtonItemOptionsArray_create_icontext', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonTest execute: segmentButtonItemOptionsArray_create_icontext START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let item1: SegmentButtonIconTextItem = { icon: 'i1.png', selectedIcon: 'i1s.png', text: 'A' };
        let item2: SegmentButtonIconTextItem = { icon: 'i2.png', selectedIcon: 'i2s.png', text: 'B' };
        let items: Array<SegmentButtonIconTextItem> = [item1, item2];
        let arr = SegmentButtonItemOptionsArray.create(items);
        console.info('SegmentButtonTest: create_icontext arr.length=' + arr.length);
        expect(arr != null).assertTrue();
        expect(arr.length >= 2).assertTrue();
        console.info('SegmentButtonTest execute: segmentButtonItemOptionsArray_create_icontext END');
        done();
      } catch (error) {
        console.error('SegmentButtonTest execute: segmentButtonItemOptionsArray_create_icontext error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SegmentButtonTest_004
     * @tc.name segmentButtonItemOptionsArray_push2
     * @tc.desc Test SegmentButtonItemOptionsArray.push(item1, item2) appends 2 items
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('segmentButtonItemOptionsArray_push2', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonTest execute: segmentButtonItemOptionsArray_push2 START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let initItems: Array<SegmentButtonTextItem> = [
          { text: 'A' } as SegmentButtonTextItem,
          { text: 'B' } as SegmentButtonTextItem
        ];
        let arr = SegmentButtonItemOptionsArray.create(initItems);
        let initLen: int = arr.length;
        let item1: SegmentButtonTextItem = { text: 'C' };
        let item2: SegmentButtonTextItem = { text: 'D' };
        let newLen: int = arr.push(item1, item2);
        console.info('SegmentButtonTest: push2 initLen=' + initLen + ' newLen=' + newLen);
        expect(newLen).assertEqual(initLen + 2);
        console.info('SegmentButtonTest execute: segmentButtonItemOptionsArray_push2 END');
        done();
      } catch (error) {
        console.error('SegmentButtonTest execute: segmentButtonItemOptionsArray_push2 error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SegmentButtonTest_005
     * @tc.name segmentButtonItemOptionsArray_push3
     * @tc.desc Test SegmentButtonItemOptionsArray.push(item1, item2, item3) appends 3 items
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('segmentButtonItemOptionsArray_push3', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonTest execute: segmentButtonItemOptionsArray_push3 START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let initItems: Array<SegmentButtonTextItem> = [
          { text: 'A' } as SegmentButtonTextItem,
          { text: 'B' } as SegmentButtonTextItem
        ];
        let arr = SegmentButtonItemOptionsArray.create(initItems);
        let initLen: int = arr.length;
        let item1: SegmentButtonTextItem = { text: 'C' };
        let item2: SegmentButtonTextItem = { text: 'D' };
        let item3: SegmentButtonTextItem = { text: 'E' };
        let newLen: int = arr.push(item1, item2, item3);
        console.info('SegmentButtonTest: push3 initLen=' + initLen + ' newLen=' + newLen);
        expect(newLen).assertEqual(initLen + 3);
        console.info('SegmentButtonTest execute: segmentButtonItemOptionsArray_push3 END');
        done();
      } catch (error) {
        console.error('SegmentButtonTest execute: segmentButtonItemOptionsArray_push3 error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SegmentButtonTest_006
     * @tc.name segmentButtonItemOptionsArray_pop
     * @tc.desc Test SegmentButtonItemOptionsArray.pop() removes the last element (4-item array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('segmentButtonItemOptionsArray_pop', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonTest execute: segmentButtonItemOptionsArray_pop START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        // Use 4 items: SegmentButtonItemOptionsArray requires min 2, so pop from 4->3 is valid
        let items: Array<SegmentButtonTextItem> = [
          { text: 'A' } as SegmentButtonTextItem,
          { text: 'B' } as SegmentButtonTextItem,
          { text: 'C' } as SegmentButtonTextItem,
          { text: 'D' } as SegmentButtonTextItem
        ];
        let arr = SegmentButtonItemOptionsArray.create(items);
        let initLen: int = arr.length;
        let removed = arr.pop();
        console.info('SegmentButtonTest: pop initLen=' + initLen + ' afterLen=' + arr.length + ' removed=' + removed);
        expect(arr.length).assertEqual(initLen - 1);
        console.info('SegmentButtonTest execute: segmentButtonItemOptionsArray_pop END');
        done();
      } catch (error) {
        console.error('SegmentButtonTest execute: segmentButtonItemOptionsArray_pop error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SegmentButtonTest_007
     * @tc.name segmentButtonItemOptionsArray_shift
     * @tc.desc Test SegmentButtonItemOptionsArray.shift() removes the first element (4-item array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('segmentButtonItemOptionsArray_shift', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonTest execute: segmentButtonItemOptionsArray_shift START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        // Use 4 items: SegmentButtonItemOptionsArray requires min 2, so shift from 4->3 is valid
        let items: Array<SegmentButtonTextItem> = [
          { text: 'First' } as SegmentButtonTextItem,
          { text: 'Second' } as SegmentButtonTextItem,
          { text: 'Third' } as SegmentButtonTextItem,
          { text: 'Fourth' } as SegmentButtonTextItem
        ];
        let arr = SegmentButtonItemOptionsArray.create(items);
        let initLen: int = arr.length;
        let removed = arr.shift();
        console.info('SegmentButtonTest: shift initLen=' + initLen + ' afterLen=' + arr.length + ' removed=' + removed);
        expect(arr.length).assertEqual(initLen - 1);
        console.info('SegmentButtonTest execute: segmentButtonItemOptionsArray_shift END');
        done();
      } catch (error) {
        console.error('SegmentButtonTest execute: segmentButtonItemOptionsArray_shift error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SegmentButtonTest_008
     * @tc.name segmentButtonItemOptionsArray_unshift1
     * @tc.desc Test SegmentButtonItemOptionsArray.unshift(item) prepends 1 item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('segmentButtonItemOptionsArray_unshift1', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonTest execute: segmentButtonItemOptionsArray_unshift1 START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let initItems: Array<SegmentButtonTextItem> = [
          { text: 'A' } as SegmentButtonTextItem,
          { text: 'B' } as SegmentButtonTextItem
        ];
        let arr = SegmentButtonItemOptionsArray.create(initItems);
        let initLen: int = arr.length;
        let newItem: SegmentButtonTextItem = { text: 'New' };
        let newLen: int = arr.unshift(newItem);
        console.info('SegmentButtonTest: unshift1 initLen=' + initLen + ' newLen=' + newLen);
        expect(newLen).assertEqual(initLen + 1);
        console.info('SegmentButtonTest execute: segmentButtonItemOptionsArray_unshift1 END');
        done();
      } catch (error) {
        console.error('SegmentButtonTest execute: segmentButtonItemOptionsArray_unshift1 error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SegmentButtonTest_009
     * @tc.name segmentButtonItemOptionsArray_unshift2
     * @tc.desc Test SegmentButtonItemOptionsArray.unshift(item1, item2) prepends 2 items
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('segmentButtonItemOptionsArray_unshift2', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonTest execute: segmentButtonItemOptionsArray_unshift2 START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let initItems: Array<SegmentButtonTextItem> = [
          { text: 'A' } as SegmentButtonTextItem,
          { text: 'B' } as SegmentButtonTextItem
        ];
        let arr = SegmentButtonItemOptionsArray.create(initItems);
        let initLen: int = arr.length;
        let newItem1: SegmentButtonTextItem = { text: 'N1' };
        let newItem2: SegmentButtonTextItem = { text: 'N2' };
        let newLen: int = arr.unshift(newItem1, newItem2);
        console.info('SegmentButtonTest: unshift2 initLen=' + initLen + ' newLen=' + newLen);
        expect(newLen).assertEqual(initLen + 2);
        console.info('SegmentButtonTest execute: segmentButtonItemOptionsArray_unshift2 END');
        done();
      } catch (error) {
        console.error('SegmentButtonTest execute: segmentButtonItemOptionsArray_unshift2 error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SegmentButtonTest_010
     * @tc.name segmentButtonItemOptionsArray_unshift3
     * @tc.desc Test SegmentButtonItemOptionsArray.unshift(item1, item2, item3) prepends 3 items
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('segmentButtonItemOptionsArray_unshift3', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonTest execute: segmentButtonItemOptionsArray_unshift3 START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let initItems: Array<SegmentButtonTextItem> = [
          { text: 'A' } as SegmentButtonTextItem,
          { text: 'B' } as SegmentButtonTextItem
        ];
        let arr = SegmentButtonItemOptionsArray.create(initItems);
        let initLen: int = arr.length;
        let newItem1: SegmentButtonTextItem = { text: 'N1' };
        let newItem2: SegmentButtonTextItem = { text: 'N2' };
        let newItem3: SegmentButtonTextItem = { text: 'N3' };
        let newLen: int = arr.unshift(newItem1, newItem2, newItem3);
        console.info('SegmentButtonTest: unshift3 initLen=' + initLen + ' newLen=' + newLen);
        expect(newLen).assertEqual(initLen + 3);
        console.info('SegmentButtonTest execute: segmentButtonItemOptionsArray_unshift3 END');
        done();
      } catch (error) {
        console.error('SegmentButtonTest execute: segmentButtonItemOptionsArray_unshift3 error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SegmentButtonTest_011
     * @tc.name segmentButtonItemOptionsArray_splice_deleteOnly
     * @tc.desc Test SegmentButtonItemOptionsArray.splice(start, deleteCount) - delete only, no insert
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('segmentButtonItemOptionsArray_splice_deleteOnly', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SegmentButtonTest execute: segmentButtonItemOptionsArray_splice_deleteOnly START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let items: Array<SegmentButtonTextItem> = [
          { text: 'A' } as SegmentButtonTextItem,
          { text: 'B' } as SegmentButtonTextItem,
          { text: 'C' } as SegmentButtonTextItem,
          { text: 'D' } as SegmentButtonTextItem
        ];
        let arr = SegmentButtonItemOptionsArray.create(items);
        let initLen: int = arr.length;
        let deleted = arr.splice(1, 2);
        console.info('SegmentButtonTest: splice_deleteOnly initLen=' + initLen + ' deleted=' + deleted.length + ' afterLen=' + arr.length);
        expect(deleted.length).assertEqual(2);
        expect(arr.length).assertEqual(initLen - 2);
        console.info('SegmentButtonTest execute: segmentButtonItemOptionsArray_splice_deleteOnly END');
        done();
      } catch (error) {
        console.error('SegmentButtonTest execute: segmentButtonItemOptionsArray_splice_deleteOnly error:' + error);
        expect().assertFail();
        done();
      }
    });

  });
}
