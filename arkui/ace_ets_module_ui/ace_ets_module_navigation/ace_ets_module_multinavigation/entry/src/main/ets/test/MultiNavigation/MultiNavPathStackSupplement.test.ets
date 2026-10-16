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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import { MultiNavPathStack } from '@ohos.arkui.advanced.MultiNavigation';

export default function MultiNavPathStackSupplement() {
  describe('MultiNavPathStackSupplement', () => {

    beforeEach(async (done: Function) => {
      console.info('MultiNavPathStackSupplement beforeEach start');
      const options: router.RouterOptions = {
        url: 'MainAbility/pages/MultiNavigation/MultiNavPathStackSupplement',
      };
      try {
        router.clear();
        const pages = router.getState();
        console.info('MultiNavPathStackSupplement state pages:' + JSON.stringify(pages));
        if (!('MultiNavPathStackSupplement' == pages.name)) {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push MultiNavPathStackSupplement page error:' + err);
      }
      console.info('MultiNavPathStackSupplement beforeEach end');
      done();
    });

    afterEach(async () => {
      const stack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('multiNavPathStack') as MultiNavPathStack;
      if (stack) {
        stack.keepBottomPage(false);
        stack.clear(false);
      }
      AppStorage.delete('switchFullScreenResult');
      await CommonFunc.sleep(500);
      console.info('MultiNavPathStackSupplement afterEach');
    });

    /**
     * @tc.number    SUB_ArkUI_MultiNavPathStack_pushPath_PARAM_0001
     * @tc.name      testPushPathParam0001
     * @tc.desc      Test MultiNavPathStack.pushPath with SplitPolicy.HOME_PAGE
     */
    it('testPushPathParam0001', Level.LEVEL0, async (done: Function) => {
      console.info('[testPushPathParam0001] START');
      await CommonFunc.sleep(500);
      sendEventByKey('btn_pushPath_HomePage', 10, '');
      await CommonFunc.sleep(1000);
      const stack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('multiNavPathStack') as MultiNavPathStack;
      expect(stack.size()).assertEqual(1);
      console.info('[testPushPathParam0001] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_MultiNavPathStack_pushPath_PARAM_0002
     * @tc.name      testPushPathParam0002
     * @tc.desc      Test MultiNavPathStack.pushPath with SplitPolicy.DETAIL_PAGE
     */
    it('testPushPathParam0002', Level.LEVEL0, async (done: Function) => {
      console.info('[testPushPathParam0002] START');
      await CommonFunc.sleep(500);
      sendEventByKey('btn_pushPath_HomePage', 10, '');
      await CommonFunc.sleep(500);
      sendEventByKey('btn_pushPath_DetailPage', 10, '');
      await CommonFunc.sleep(1000);
      const stack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('multiNavPathStack') as MultiNavPathStack;
      expect(stack.size()).assertEqual(2);
      console.info('[testPushPathParam0002] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_MultiNavPathStack_pushPath_PARAM_0003
     * @tc.name      testPushPathParam0003
     * @tc.desc      Test MultiNavPathStack.pushPath with SplitPolicy.FULL_PAGE
     */
    it('testPushPathParam0003', Level.LEVEL0, async (done: Function) => {
      console.info('[testPushPathParam0003] START');
      await CommonFunc.sleep(500);
      sendEventByKey('btn_pushPath_FullPage', 10, '');
      await CommonFunc.sleep(1000);
      const stack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('multiNavPathStack') as MultiNavPathStack;
      expect(stack.size()).assertEqual(1);
      console.info('[testPushPathParam0003] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_MultiNavPathStack_pushPathByName_PARAM_0004
     * @tc.name      testPushPathByNameParam0004
     * @tc.desc      Test MultiNavPathStack.pushPathByName with SplitPolicy.HOME_PAGE
     */
    it('testPushPathByNameParam0004', Level.LEVEL0, async (done: Function) => {
      console.info('[testPushPathByNameParam0004] START');
      await CommonFunc.sleep(500);
      sendEventByKey('btn_pushPathByName_HomePage', 10, '');
      await CommonFunc.sleep(1000);
      const stack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('multiNavPathStack') as MultiNavPathStack;
      expect(stack.size()).assertEqual(1);
      console.info('[testPushPathByNameParam0004] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_MultiNavPathStack_pushPathByName_PARAM_0005
     * @tc.name      testPushPathByNameParam0005
     * @tc.desc      Test MultiNavPathStack.pushPathByName with SplitPolicy.DETAIL_PAGE
     */
    it('testPushPathByNameParam0005', Level.LEVEL0, async (done: Function) => {
      console.info('[testPushPathByNameParam0005] START');
      await CommonFunc.sleep(500);
      sendEventByKey('btn_pushPathByName_HomePage', 10, '');
      await CommonFunc.sleep(500);
      sendEventByKey('btn_pushPathByName_DetailPage', 10, '');
      await CommonFunc.sleep(1000);
      const stack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('multiNavPathStack') as MultiNavPathStack;
      expect(stack.size()).assertEqual(2);
      console.info('[testPushPathByNameParam0005] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_MultiNavPathStack_switchFullScreenState_PARAM_0006
     * @tc.name      testSwitchFullScreenStateParam0006
     * @tc.desc      Test MultiNavPathStack.switchFullScreenState with true
     */
    it('testSwitchFullScreenStateParam0006', Level.LEVEL0, async (done: Function) => {
      console.info('[testSwitchFullScreenStateParam0006] START');
      await CommonFunc.sleep(500);
      sendEventByKey('btn_pushPath_HomePage', 10, '');
      await CommonFunc.sleep(500);
      sendEventByKey('btn_switchFullScreen', 10, '');
      await CommonFunc.sleep(1000);
      const result = AppStorage.get<boolean>('switchFullScreenResult');
      expect(result !== null && result !== undefined).assertTrue();
      console.info('[testSwitchFullScreenStateParam0006] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_MultiNavPathStack_switchFullScreenState_PARAM_0007
     * @tc.name      testSwitchFullScreenStateParam0007
     * @tc.desc      Test MultiNavPathStack.switchFullScreenState with false
     */
    it('testSwitchFullScreenStateParam0007', Level.LEVEL0, async (done: Function) => {
      console.info('[testSwitchFullScreenStateParam0007] START');
      await CommonFunc.sleep(500);
      sendEventByKey('btn_pushPath_HomePage', 10, '');
      await CommonFunc.sleep(500);
      sendEventByKey('btn_switchFullScreen_false', 10, '');
      await CommonFunc.sleep(1000);
      const result = AppStorage.get<boolean>('switchFullScreenResult');
      expect(result !== null && result !== undefined).assertTrue();
      console.info('[testSwitchFullScreenStateParam0007] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_MultiNavPathStack_setHomeWidthRange_PARAM_0008
     * @tc.name      testSetHomeWidthRangeParam0008
     * @tc.desc      Test MultiNavPathStack.setHomeWidthRange with valid range
     */
    it('testSetHomeWidthRangeParam0008', Level.LEVEL0, async (done: Function) => {
      console.info('[testSetHomeWidthRangeParam0008] START');
      await CommonFunc.sleep(500);
      sendEventByKey('btn_setHomeWidthRange', 10, '');
      await CommonFunc.sleep(1000);
      const stack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('multiNavPathStack') as MultiNavPathStack;
      expect(stack !== null && stack !== undefined).assertTrue();
      console.info('[testSetHomeWidthRangeParam0008] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_MultiNavPathStack_keepBottomPage_PARAM_0009
     * @tc.name      testKeepBottomPageParam0009
     * @tc.desc      Test MultiNavPathStack.keepBottomPage with true
     */
    it('testKeepBottomPageParam0009', Level.LEVEL0, async (done: Function) => {
      console.info('[testKeepBottomPageParam0009] START');
      await CommonFunc.sleep(500);
      sendEventByKey('btn_keepBottomPage_true', 10, '');
      await CommonFunc.sleep(1000);
      const stack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('multiNavPathStack') as MultiNavPathStack;
      expect(stack !== null && stack !== undefined).assertTrue();
      console.info('[testKeepBottomPageParam0009] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_MultiNavPathStack_keepBottomPage_PARAM_0010
     * @tc.name      testKeepBottomPageParam0010
     * @tc.desc      Test MultiNavPathStack.keepBottomPage with false
     */
    it('testKeepBottomPageParam0010', Level.LEVEL0, async (done: Function) => {
      console.info('[testKeepBottomPageParam0010] START');
      await CommonFunc.sleep(500);
      sendEventByKey('btn_keepBottomPage_false', 10, '');
      await CommonFunc.sleep(1000);
      const stack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('multiNavPathStack') as MultiNavPathStack;
      expect(stack !== null && stack !== undefined).assertTrue();
      console.info('[testKeepBottomPageParam0010] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_MultiNavPathStack_getAllPathName_RETURN_0012
     * @tc.name      testGetAllPathNameReturn0012
     * @tc.desc      Test MultiNavPathStack.getAllPathName after pushPath
     */
    it('testGetAllPathNameReturn0012', Level.LEVEL0, async (done: Function) => {
      console.info('[testGetAllPathNameReturn0012] START');
      await CommonFunc.sleep(500);
      sendEventByKey('btn_pushPath_HomePage', 10, '');
      await CommonFunc.sleep(500);
      sendEventByKey('btn_pushPath_DetailPage', 10, '');
      await CommonFunc.sleep(1000);
      const stack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('multiNavPathStack') as MultiNavPathStack;
      const names: string[] = stack.getAllPathName();
      expect(names.length).assertEqual(2);
      console.info('[testGetAllPathNameReturn0012] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_MultiNavPathStack_size_RETURN_0013
     * @tc.name      testSizeReturn0013
     * @tc.desc      Test MultiNavPathStack.size after pushPath and clear
     */
    it('testSizeReturn0013', Level.LEVEL0, async (done: Function) => {
      console.info('[testSizeReturn0013] START');
      await CommonFunc.sleep(500);
      sendEventByKey('btn_pushPath_HomePage', 10, '');
      await CommonFunc.sleep(500);
      const stack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('multiNavPathStack') as MultiNavPathStack;
      expect(stack.size()).assertEqual(1);
      sendEventByKey('btn_clear', 10, '');
      await CommonFunc.sleep(500);
      expect(stack.size()).assertEqual(0);
      console.info('[testSizeReturn0013] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_MultiNavPathStack_setPlaceholderPage_PARAM_0011
     * @tc.name      testSetPlaceholderPageParam0011
     * @tc.desc      Test MultiNavPathStack.setPlaceholderPage
     */
    it('testSetPlaceholderPageParam0011', Level.LEVEL0, async (done: Function) => {
      console.info('[testSetPlaceholderPageParam0011] START');
      await CommonFunc.sleep(500);
      sendEventByKey('btn_setPlaceholderPage', 10, '');
      await CommonFunc.sleep(1000);
      const stack: MultiNavPathStack = AppStorage.get<MultiNavPathStack>('multiNavPathStack') as MultiNavPathStack;
      expect(stack !== null && stack !== undefined).assertTrue();
      console.info('[testSetPlaceholderPageParam0011] END');
      done();
    });
  });
}
