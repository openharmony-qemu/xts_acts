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

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function NavPathStackSupplement() {
  describe('NavPathStackSupplement', () => {
    beforeEach(async (done: () => void) => {
      console.info('NavPathStackSupplement beforeEach start');
      const options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/ClearContentStackPage',
      };
      try {
        router.clear();
        const pages = router.getState();
        console.info('NavPathStackSupplement state pages:' + JSON.stringify(pages));
        if (!('ClearContentStackPage' == pages.name)) {
          const result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push ClearContentStackPage result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ClearContentStackPage error:' + err);
      }
      console.info('NavPathStackSupplement beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(500);
      console.info('NavPathStackSupplement afterEach');
    });

    /**
     * @tc.number    SUB_ArkUI_NavPathStack_pushPathByName_PARAM_0001
     * @tc.name      testPushPathByNameParam0001
     * @tc.desc      Test NavPathStack.pushPathByName() animated parameter with null and undefined
     */
    it('testPushPathByNameParam0001', Level.LEVEL2, async (done: () => void) => {
      console.info('[testPushPathByNameParam0001] START');
      await CommonFunc.sleep(500);
      const navPathStack: NavPathStack = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPathByName('pageA', 'testParam', true);
        navPathStack.pushPathByName('pageB', 'testParam2', false);
        expect(navPathStack.size()).assertEqual(2);
        navPathStack.clear();
        expect(navPathStack.size()).assertEqual(0);
      } catch (error) {
        console.info('[testPushPathByNameParam0001] ERROR: ' + JSON.stringify(error));
      }
      console.info('[testPushPathByNameParam0001] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_NavPathStack_pushPathByName_PARAM_0002
     * @tc.name      testPushPathByNameParam0002
     * @tc.desc      Test NavPathStack.pushPathByName() animated parameter with null and undefined
     */
    it('testPushPathByNameParam0002', Level.LEVEL2, async (done: () => void) => {
      console.info('[testPushPathByNameParam0002] START');
      await CommonFunc.sleep(500);
      const navPathStack: NavPathStack = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPathByName('pageA', 'param1', undefined);
        expect(navPathStack.size()).assertEqual(1);
        navPathStack.clear();
      } catch (error) {
        console.info('[testPushPathByNameParam0002] ERROR: ' + JSON.stringify(error));
      }
      console.info('[testPushPathByNameParam0002] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_NavPathStack_replacePath_PARAM_0001
     * @tc.name      testReplacePathParam0001
     * @tc.desc      Test NavPathStack.replacePath() animated parameter with true and false
     */
    it('testReplacePathParam0001', Level.LEVEL2, async (done: () => void) => {
      console.info('[testReplacePathParam0001] START');
      await CommonFunc.sleep(500);
      const navPathStack: NavPathStack = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPathByName('pageA', 'param1');
        expect(navPathStack.size()).assertEqual(1);
        const info1: NavPathInfo = new NavPathInfo('pageB', 'replaceParam');
        navPathStack.replacePath(info1, true);
        expect(navPathStack.size()).assertEqual(1);
        navPathStack.clear();
      } catch (error) {
        console.info('[testReplacePathParam0001] ERROR: ' + JSON.stringify(error));
      }
      console.info('[testReplacePathParam0001] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_NavPathStack_replacePath_PARAM_0002
     * @tc.name      testReplacePathParam0002
     * @tc.desc      Test NavPathStack.replacePath() animated parameter with undefined and false
     */
    it('testReplacePathParam0002', Level.LEVEL2, async (done: () => void) => {
      console.info('[testReplacePathParam0002] START');
      await CommonFunc.sleep(500);
      const navPathStack: NavPathStack = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPathByName('pageA', 'param1');
        const info1: NavPathInfo = new NavPathInfo('pageB', 'replaceParam');
        navPathStack.replacePath(info1, undefined);
        expect(navPathStack.size()).assertEqual(1);
        navPathStack.clear();
      } catch (error) {
        console.info('[testReplacePathParam0002] ERROR: ' + JSON.stringify(error));
      }
      console.info('[testReplacePathParam0002] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_NavPathStack_replacePathByName_PARAM_0001
     * @tc.name      testReplacePathByNameParam0001
     * @tc.desc      Test NavPathStack.replacePathByName() animated parameter with true and false
     */
    it('testReplacePathByNameParam0001', Level.LEVEL2, async (done: () => void) => {
      console.info('[testReplacePathByNameParam0001] START');
      await CommonFunc.sleep(500);
      const navPathStack: NavPathStack = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPathByName('pageA', 'param1');
        expect(navPathStack.size()).assertEqual(1);
        navPathStack.replacePathByName('pageB', 'replaceParam', true);
        expect(navPathStack.size()).assertEqual(1);
        navPathStack.clear();
      } catch (error) {
        console.info('[testReplacePathByNameParam0001] ERROR: ' + JSON.stringify(error));
      }
      console.info('[testReplacePathByNameParam0001] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_NavPathStack_replacePathByName_PARAM_0002
     * @tc.name      testReplacePathByNameParam0002
     * @tc.desc      Test NavPathStack.replacePathByName() animated parameter with undefined
     */
    it('testReplacePathByNameParam0002', Level.LEVEL2, async (done: () => void) => {
      console.info('[testReplacePathByNameParam0002] START');
      await CommonFunc.sleep(500);
      const navPathStack: NavPathStack = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPathByName('pageA', 'param1');
        navPathStack.replacePathByName('pageB', 'replaceParam', undefined);
        expect(navPathStack.size()).assertEqual(1);
        navPathStack.clear();
      } catch (error) {
        console.info('[testReplacePathByNameParam0002] ERROR: ' + JSON.stringify(error));
      }
      console.info('[testReplacePathByNameParam0002] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_NavPathStack_removeByNavDestinationId_RETURN_0001
     * @tc.name      testRemoveByNavDestinationIdReturn0001
     * @tc.desc      Test NavPathStack.removeByNavDestinationId() returns true when id exists and false when not
     */
    it('testRemoveByNavDestinationIdReturn0001', Level.LEVEL2, async (done: () => void) => {
      console.info('[testRemoveByNavDestinationIdReturn0001] START');
      await CommonFunc.sleep(500);
      const navPathStack: NavPathStack = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPathByName('pageA', 'param1');
        navPathStack.pushPathByName('pageB', 'param2');
        const pathInfoArr: Array<NavPathInfo> = navPathStack.getPathStack();
        if (pathInfoArr.length > 0) {
          const destId: string = pathInfoArr[pathInfoArr.length - 1].navDestinationId as string;
          const result1: boolean = navPathStack.removeByNavDestinationId(destId);
          expect(result1).assertTrue();
        }
        const result2: boolean = navPathStack.removeByNavDestinationId('nonExistentId');
        expect(result2).assertFalse();
        navPathStack.clear();
      } catch (error) {
        console.info('[testRemoveByNavDestinationIdReturn0001] ERROR: ' + JSON.stringify(error));
      }
      console.info('[testRemoveByNavDestinationIdReturn0001] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_NavPathStack_pop_RETURN_0001
     * @tc.name      testPopReturn0001
     * @tc.desc      Test NavPathStack.pop() returns NavPathInfo when stack has elements and undefined when empty
     */
    it('testPopReturn0001', Level.LEVEL2, async (done: () => void) => {
      console.info('[testPopReturn0001] START');
      await CommonFunc.sleep(500);
      const navPathStack: NavPathStack = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPathByName('pageA', 'param1');
        navPathStack.pushPathByName('pageB', 'param2');
        const popResult1: NavPathInfo | undefined = navPathStack.pop();
        expect(popResult1 !== undefined).assertTrue();
        expect(popResult1!.name).assertEqual('pageB');
        navPathStack.clear();
        const popResult2: NavPathInfo | undefined = navPathStack.pop();
        expect(popResult2 === undefined).assertTrue();
      } catch (error) {
        console.info('[testPopReturn0001] ERROR: ' + JSON.stringify(error));
      }
      console.info('[testPopReturn0001] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_NavPathStack_pop_PARAM_0001
     * @tc.name      testPopParam0001
     * @tc.desc      Test NavPathStack.pop(result, animated) parameter specification
     */
    it('testPopParam0001', Level.LEVEL2, async (done: () => void) => {
      console.info('[testPopParam0001] START');
      await CommonFunc.sleep(500);
      const navPathStack: NavPathStack = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPathByName('pageA', 'param1');
        navPathStack.pushPathByName('pageB', 'param2');
        const resultObj: Record<string, string> = { 'key': 'value' };
        const popResult: NavPathInfo | undefined = navPathStack.pop(resultObj, true);
        expect(popResult !== undefined).assertTrue();
        navPathStack.clear();
      } catch (error) {
        console.info('[testPopParam0001] ERROR: ' + JSON.stringify(error));
      }
      console.info('[testPopParam0001] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_NavPathStack_pop_PARAM_0002
     * @tc.name      testPopParam0002
     * @tc.desc      Test NavPathStack.pop(result, animated) with undefined animated parameter
     */
    it('testPopParam0002', Level.LEVEL2, async (done: () => void) => {
      console.info('[testPopParam0002] START');
      await CommonFunc.sleep(500);
      const navPathStack: NavPathStack = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPathByName('pageA', 'param1');
        const resultObj: Record<string, string> = { 'key': 'value' };
        const popResult: NavPathInfo | undefined = navPathStack.pop(resultObj, undefined);
        expect(popResult !== undefined).assertTrue();
        navPathStack.clear();
      } catch (error) {
        console.info('[testPopParam0002] ERROR: ' + JSON.stringify(error));
      }
      console.info('[testPopParam0002] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_NavPathStack_pop_RETURN_0002
     * @tc.name      testPopReturn0002
     * @tc.desc      Test NavPathStack.pop() with empty stack returns undefined
     */
    it('testPopReturn0002', Level.LEVEL2, async (done: () => void) => {
      console.info('[testPopReturn0002] START');
      await CommonFunc.sleep(500);
      const navPathStack: NavPathStack = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.clear();
        const popResult: NavPathInfo | undefined = navPathStack.pop();
        expect(popResult === undefined).assertTrue();
      } catch (error) {
        console.info('[testPopReturn0002] ERROR: ' + JSON.stringify(error));
      }
      console.info('[testPopReturn0002] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_NavPathStack_popToIndex_PARAM_0001
     * @tc.name      testPopToIndexParam0001
     * @tc.desc      Test NavPathStack.popToIndex() animated parameter with undefined
     */
    it('testPopToIndexParam0001', Level.LEVEL2, async (done: () => void) => {
      console.info('[testPopToIndexParam0001] START');
      await CommonFunc.sleep(500);
      const navPathStack: NavPathStack = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPathByName('pageA', 'param1');
        navPathStack.pushPathByName('pageB', 'param2');
        navPathStack.popToIndex(0, undefined);
        expect(navPathStack.size()).assertEqual(1);
        navPathStack.clear();
      } catch (error) {
        console.info('[testPopToIndexParam0001] ERROR: ' + JSON.stringify(error));
      }
      console.info('[testPopToIndexParam0001] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_NavPathStack_popToIndex_PARAM_0002
     * @tc.name      testPopToIndexParam0002
     * @tc.desc      Test NavPathStack.popToIndex(index, result, animated) with animated null and undefined
     */
    it('testPopToIndexParam0002', Level.LEVEL2, async (done: () => void) => {
      console.info('[testPopToIndexParam0002] START');
      await CommonFunc.sleep(500);
      const navPathStack: NavPathStack = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPathByName('pageA', 'param1');
        navPathStack.pushPathByName('pageB', 'param2');
        const resultObj: Record<string, string> = { 'key': 'value' };
        navPathStack.popToIndex(0, resultObj, undefined);
        expect(navPathStack.size()).assertEqual(1);
        navPathStack.clear();
      } catch (error) {
        console.info('[testPopToIndexParam0002] ERROR: ' + JSON.stringify(error));
      }
      console.info('[testPopToIndexParam0002] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_NavPathStack_moveToTop_PARAM_0001
     * @tc.name      testMoveToTopParam0001
     * @tc.desc      Test NavPathStack.moveToTop() animated parameter with null and undefined
     */
    it('testMoveToTopParam0001', Level.LEVEL2, async (done: () => void) => {
      console.info('[testMoveToTopParam0001] START');
      await CommonFunc.sleep(500);
      const navPathStack: NavPathStack = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPathByName('pageA', 'param1');
        navPathStack.pushPathByName('pageB', 'param2');
        const idx: number = navPathStack.moveToTop('pageA', true);
        expect(idx).assertEqual(0);
        navPathStack.clear();
      } catch (error) {
        console.info('[testMoveToTopParam0001] ERROR: ' + JSON.stringify(error));
      }
      console.info('[testMoveToTopParam0001] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_NavPathStack_moveToTop_PARAM_0002
     * @tc.name      testMoveToTopParam0002
     * @tc.desc      Test NavPathStack.moveToTop() animated parameter with undefined and returns -1 for non-existent
     */
    it('testMoveToTopParam0002', Level.LEVEL2, async (done: () => void) => {
      console.info('[testMoveToTopParam0002] START');
      await CommonFunc.sleep(500);
      const navPathStack: NavPathStack = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPathByName('pageA', 'param1');
        const idx: number = navPathStack.moveToTop('pageA', undefined);
        expect(idx).assertEqual(0);
        const idxNotFound: number = navPathStack.moveToTop('nonExistentPage');
        expect(idxNotFound).assertEqual(-1);
        navPathStack.clear();
      } catch (error) {
        console.info('[testMoveToTopParam0002] ERROR: ' + JSON.stringify(error));
      }
      console.info('[testMoveToTopParam0002] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_NavPathStack_moveIndexToTop_PARAM_0001
     * @tc.name      testMoveIndexToTopParam0001
     * @tc.desc      Test NavPathStack.moveIndexToTop() animated parameter with true and false
     */
    it('testMoveIndexToTopParam0001', Level.LEVEL2, async (done: () => void) => {
      console.info('[testMoveIndexToTopParam0001] START');
      await CommonFunc.sleep(500);
      const navPathStack: NavPathStack = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPathByName('pageA', 'param1');
        navPathStack.pushPathByName('pageB', 'param2');
        navPathStack.moveIndexToTop(0, true);
        expect(navPathStack.size()).assertEqual(2);
        navPathStack.clear();
      } catch (error) {
        console.info('[testMoveIndexToTopParam0001] ERROR: ' + JSON.stringify(error));
      }
      console.info('[testMoveIndexToTopParam0001] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_NavPathStack_moveIndexToTop_PARAM_0002
     * @tc.name      testMoveIndexToTopParam0002
     * @tc.desc      Test NavPathStack.moveIndexToTop() animated parameter with undefined
     */
    it('testMoveIndexToTopParam0002', Level.LEVEL2, async (done: () => void) => {
      console.info('[testMoveIndexToTopParam0002] START');
      await CommonFunc.sleep(500);
      const navPathStack: NavPathStack = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPathByName('pageA', 'param1');
        navPathStack.pushPathByName('pageB', 'param2');
        navPathStack.moveIndexToTop(0, undefined);
        expect(navPathStack.size()).assertEqual(2);
        navPathStack.clear();
      } catch (error) {
        console.info('[testMoveIndexToTopParam0002] ERROR: ' + JSON.stringify(error));
      }
      console.info('[testMoveIndexToTopParam0002] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_NavPathStack_clear_PARAM_0001
     * @tc.name      testClearParam0001
     * @tc.desc      Test NavPathStack.clear() animated parameter with true, false and undefined
     */
    it('testClearParam0001', Level.LEVEL2, async (done: () => void) => {
      console.info('[testClearParam0001] START');
      await CommonFunc.sleep(500);
      const navPathStack: NavPathStack = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPathByName('pageA', 'param1');
        navPathStack.clear(true);
        expect(navPathStack.size()).assertEqual(0);
        navPathStack.pushPathByName('pageA', 'param1');
        navPathStack.clear(false);
        expect(navPathStack.size()).assertEqual(0);
        navPathStack.pushPathByName('pageA', 'param1');
        navPathStack.clear(undefined);
        expect(navPathStack.size()).assertEqual(0);
      } catch (error) {
        console.info('[testClearParam0001] ERROR: ' + JSON.stringify(error));
      }
      console.info('[testClearParam0001] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_NavPathStack_getAllPathName_RETURN_0001
     * @tc.name      testGetAllPathNameReturn0001
     * @tc.desc      Test NavPathStack.getAllPathName() returns empty array for empty stack and names for non-empty stack
     */
    it('testGetAllPathNameReturn0001', Level.LEVEL2, async (done: () => void) => {
      console.info('[testGetAllPathNameReturn0001] START');
      await CommonFunc.sleep(500);
      const navPathStack: NavPathStack = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.clear();
        const emptyNames: Array<string> = navPathStack.getAllPathName();
        expect(emptyNames.length).assertEqual(0);
        navPathStack.pushPathByName('pageA', 'param1');
        navPathStack.pushPathByName('pageB', 'param2');
        const pathNames: Array<string> = navPathStack.getAllPathName();
        expect(pathNames.length).assertEqual(2);
        expect(pathNames[0]).assertEqual('pageA');
        expect(pathNames[1]).assertEqual('pageB');
        navPathStack.clear();
      } catch (error) {
        console.info('[testGetAllPathNameReturn0001] ERROR: ' + JSON.stringify(error));
      }
      console.info('[testGetAllPathNameReturn0001] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_NavPathStack_getParamByIndex_RETURN_0001
     * @tc.name      testGetParamByIndexReturn0001
     * @tc.desc      Test NavPathStack.getParamByIndex() returns param value for valid index and undefined for invalid
     */
    it('testGetParamByIndexReturn0001', Level.LEVEL2, async (done: () => void) => {
      console.info('[testGetParamByIndexReturn0001] START');
      await CommonFunc.sleep(500);
      const navPathStack: NavPathStack = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPathByName('pageA', 'paramValue1');
        const param0: Object | undefined = navPathStack.getParamByIndex(0) as Object | undefined;
        expect(param0 !== undefined).assertTrue();
        const paramInvalid: Object | undefined = navPathStack.getParamByIndex(999) as Object | undefined;
        expect(paramInvalid === undefined).assertTrue();
        navPathStack.clear();
      } catch (error) {
        console.info('[testGetParamByIndexReturn0001] ERROR: ' + JSON.stringify(error));
      }
      console.info('[testGetParamByIndexReturn0001] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_NavPathStack_getParamByName_RETURN_0001
     * @tc.name      testGetParamByNameReturn0001
     * @tc.desc      Test NavPathStack.getParamByName() returns empty array for no match and params for match
     */
    it('testGetParamByNameReturn0001', Level.LEVEL2, async (done: () => void) => {
      console.info('[testGetParamByNameReturn0001] START');
      await CommonFunc.sleep(500);
      const navPathStack: NavPathStack = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPathByName('pageA', 'paramValue1');
        navPathStack.pushPathByName('pageA', 'paramValue2');
        const params: Array<Object> = navPathStack.getParamByName('pageA') as Array<Object>;
        expect(params.length).assertEqual(2);
        const emptyParams: Array<Object> = navPathStack.getParamByName('nonExistent') as Array<Object>;
        expect(emptyParams.length).assertEqual(0);
        navPathStack.clear();
      } catch (error) {
        console.info('[testGetParamByNameReturn0001] ERROR: ' + JSON.stringify(error));
      }
      console.info('[testGetParamByNameReturn0001] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_NavPathStack_getIndexByName_RETURN_0001
     * @tc.name      testGetIndexByNameReturn0001
     * @tc.desc      Test NavPathStack.getIndexByName() returns empty array for no match and indices for match
     */
    it('testGetIndexByNameReturn0001', Level.LEVEL2, async (done: () => void) => {
      console.info('[testGetIndexByNameReturn0001] START');
      await CommonFunc.sleep(500);
      const navPathStack: NavPathStack = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPathByName('pageA', 'param1');
        navPathStack.pushPathByName('pageB', 'param2');
        navPathStack.pushPathByName('pageA', 'param3');
        const indices: Array<number> = navPathStack.getIndexByName('pageA');
        expect(indices.length).assertEqual(2);
        expect(indices[0]).assertEqual(0);
        expect(indices[1]).assertEqual(2);
        const emptyIndices: Array<number> = navPathStack.getIndexByName('nonExistent');
        expect(emptyIndices.length).assertEqual(0);
        navPathStack.clear();
      } catch (error) {
        console.info('[testGetIndexByNameReturn0001] ERROR: ' + JSON.stringify(error));
      }
      console.info('[testGetIndexByNameReturn0001] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_NavPathStack_disableAnimation_PARAM_0001
     * @tc.name      testDisableAnimationParam0001
     * @tc.desc      Test NavPathStack.disableAnimation() parameter with true and false
     */
    it('testDisableAnimationParam0001', Level.LEVEL2, async (done: () => void) => {
      console.info('[testDisableAnimationParam0001] START');
      await CommonFunc.sleep(500);
      const navPathStack: NavPathStack = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      let noError = true;
      try {
        navPathStack.disableAnimation(true);
        navPathStack.disableAnimation(false);
      } catch (error) {
        console.info('[testDisableAnimationParam0001] ERROR: ' + JSON.stringify(error));
        noError = false;
      }
      expect(noError).assertTrue();
      console.info('[testDisableAnimationParam0001] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_NavPathStack_getPathStack_RETURN_0001
     * @tc.name      testGetPathStackReturn0001
     * @tc.desc      Test NavPathStack.getPathStack() returns empty for empty stack and NavPathInfo array for non-empty
     */
    it('testGetPathStackReturn0001', Level.LEVEL2, async (done: () => void) => {
      console.info('[testGetPathStackReturn0001] START');
      await CommonFunc.sleep(500);
      const navPathStack: NavPathStack = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.clear();
        const emptyStack: Array<NavPathInfo> = navPathStack.getPathStack();
        expect(emptyStack.length).assertEqual(0);
        navPathStack.pushPathByName('pageA', 'param1');
        navPathStack.pushPathByName('pageB', 'param2');
        const pathStackArr: Array<NavPathInfo> = navPathStack.getPathStack();
        expect(pathStackArr.length).assertEqual(2);
        expect(pathStackArr[0].name).assertEqual('pageA');
        expect(pathStackArr[1].name).assertEqual('pageB');
        navPathStack.clear();
      } catch (error) {
        console.info('[testGetPathStackReturn0001] ERROR: ' + JSON.stringify(error));
      }
      console.info('[testGetPathStackReturn0001] END');
      done();
    });

    /**
     * @tc.number    SUB_ArkUI_NavPathStack_setPathStack_PARAM_0001
     * @tc.name      testSetPathStackParam0001
     * @tc.desc      Test NavPathStack.setPathStack() animated parameter with true, false and undefined
     */
    it('testSetPathStackParam0001', Level.LEVEL2, async (done: () => void) => {
      console.info('[testSetPathStackParam0001] START');
      await CommonFunc.sleep(500);
      const navPathStack: NavPathStack = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        const pathArr: Array<NavPathInfo> = [
          new NavPathInfo('pageA', 'p1'),
          new NavPathInfo('pageB', 'p2')
        ];
        navPathStack.setPathStack(pathArr, true);
        expect(navPathStack.size()).assertEqual(2);
        navPathStack.clear();
        navPathStack.setPathStack(pathArr, false);
        expect(navPathStack.size()).assertEqual(2);
        navPathStack.clear();
        navPathStack.setPathStack(pathArr, undefined);
        expect(navPathStack.size()).assertEqual(2);
        navPathStack.clear();
      } catch (error) {
        console.info('[testSetPathStackParam0001] ERROR: ' + JSON.stringify(error));
      }
      console.info('[testSetPathStackParam0001] END');
      done();
    });

  });
}
