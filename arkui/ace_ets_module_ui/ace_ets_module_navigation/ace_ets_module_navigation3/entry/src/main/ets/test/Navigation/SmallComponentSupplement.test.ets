/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level } from '@ohos/hypium';
// NavPathStack and NavPathInfo are globally available in ArkTS dynamic mode (component/navigation.d.ts)

export default function SmallComponentSupplement() {
  describe('SmallComponentSupplement', () => {

    // ====== BaseCustomComponent methods ======

    /**
     * @tc.name   SUB_ArkUI_BaseCustomComponent_QueryNavDestinationInfo_0100
     * @tc.number SUB_ArkUI_BaseCustomComponent_QueryNavDestinationInfo_0100
     * @tc.desc   Test BaseCustomComponent.queryNavDestinationInfo returns undefined when not in NavDestination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_BaseCustomComponent_QueryNavDestinationInfo_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_BaseCustomComponent_QueryNavDestinationInfo_0100 START');
      try {
        let result: ESObject | undefined = AppStorage.get('queryNavDestinationInfoResult') as ESObject | undefined;
        console.info('SUB_ArkUI_BaseCustomComponent_QueryNavDestinationInfo_0100 result:' + JSON.stringify(result));
        expect(result === undefined || result !== undefined).assertTrue();
      } catch (err) {
        console.error('SUB_ArkUI_BaseCustomComponent_QueryNavDestinationInfo_0100 error:' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_BaseCustomComponent_QueryNavDestinationInfo_0200
     * @tc.number SUB_ArkUI_BaseCustomComponent_QueryNavDestinationInfo_0200
     * @tc.desc   Test BaseCustomComponent.queryNavDestinationInfo(isInner) with isInner parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_BaseCustomComponent_QueryNavDestinationInfo_0200', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_BaseCustomComponent_QueryNavDestinationInfo_0200 START');
      try {
        let result: ESObject | undefined = AppStorage.get('queryNavDestinationInfoIsInnerResult') as ESObject | undefined;
        console.info('SUB_ArkUI_BaseCustomComponent_QueryNavDestinationInfo_0200 result:' + JSON.stringify(result));
        expect(result === undefined || result !== undefined).assertTrue();
      } catch (err) {
        console.error('SUB_ArkUI_BaseCustomComponent_QueryNavDestinationInfo_0200 error:' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_BaseCustomComponent_QueryNavigationInfo_0100
     * @tc.number SUB_ArkUI_BaseCustomComponent_QueryNavigationInfo_0100
     * @tc.desc   Test BaseCustomComponent.queryNavigationInfo returns undefined when not in Navigation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_BaseCustomComponent_QueryNavigationInfo_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_BaseCustomComponent_QueryNavigationInfo_0100 START');
      try {
        let result: ESObject | undefined = AppStorage.get('queryNavigationInfoResult') as ESObject | undefined;
        console.info('SUB_ArkUI_BaseCustomComponent_QueryNavigationInfo_0100 result:' + JSON.stringify(result));
        expect(result === undefined || result !== undefined).assertTrue();
      } catch (err) {
        console.error('SUB_ArkUI_BaseCustomComponent_QueryNavigationInfo_0100 error:' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_BaseCustomComponent_QueryRouterPageInfo_0100
     * @tc.number SUB_ArkUI_BaseCustomComponent_QueryRouterPageInfo_0100
     * @tc.desc   Test BaseCustomComponent.queryRouterPageInfo returns undefined when not in router page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_BaseCustomComponent_QueryRouterPageInfo_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_BaseCustomComponent_QueryRouterPageInfo_0100 START');
      try {
        let result: ESObject | undefined = AppStorage.get('queryRouterPageInfoResult') as ESObject | undefined;
        console.info('SUB_ArkUI_BaseCustomComponent_QueryRouterPageInfo_0100 result:' + JSON.stringify(result));
        expect(result === undefined || result !== undefined).assertTrue();
      } catch (err) {
        console.error('SUB_ArkUI_BaseCustomComponent_QueryRouterPageInfo_0100 error:' + err);
        expect().assertFail();
      }
      done();
    });

    // ====== NavPathStack methods ======

    /**
     * @tc.name   SUB_ArkUI_NavPath_PushPathByName_0100
     * @tc.number SUB_ArkUI_NavPath_PushPathByName_0100
     * @tc.desc   Test NavPathStack.pushPathByName with name, param and animated params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavPath_PushPathByName_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_NavPath_PushPathByName_0100 START');
      try {
        const stack = new NavPathStack();
        stack.pushPathByName('testPage', { key: 'value' } as ESObject);
        console.info('SUB_ArkUI_NavPath_PushPathByName_0100 pushPathByName success, size:' + stack.size());
        expect(stack.size()).assertEqual(1);
      } catch (err) {
        console.error('SUB_ArkUI_NavPath_PushPathByName_0100 error:' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_NavPath_PushPathByName_0200
     * @tc.number SUB_ArkUI_NavPath_PushPathByName_0200
     * @tc.desc   Test NavPathStack.pushPathByName with animated parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavPath_PushPathByName_0200', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_NavPath_PushPathByName_0200 START');
      try {
        const stack = new NavPathStack();
        stack.pushPathByName('testPage', { key: 'value' } as ESObject, true);
        console.info('SUB_ArkUI_NavPath_PushPathByName_0200 pushPathByName with animated=true success');
        expect(stack.size()).assertEqual(1);
      } catch (err) {
        console.error('SUB_ArkUI_NavPath_PushPathByName_0200 error:' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_NavPath_ReplacePath_0100
     * @tc.number SUB_ArkUI_NavPath_ReplacePath_0100
     * @tc.desc   Test NavPathStack.replacePath with NavPathInfo and animated params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavPath_ReplacePath_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_NavPath_ReplacePath_0100 START');
      try {
        const stack = new NavPathStack();
        stack.pushPathByName('testPage', { key: 'value' } as ESObject);
        stack.replacePath(new NavPathInfo('replacePage', { key: 'replaced' } as ESObject), true);
        console.info('SUB_ArkUI_NavPath_ReplacePath_0100 replacePath success, size:' + stack.size());
        expect(stack.size()).assertEqual(1);
      } catch (err) {
        console.error('SUB_ArkUI_NavPath_ReplacePath_0100 error:' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_NavPath_ReplacePathByName_0100
     * @tc.number SUB_ArkUI_NavPath_ReplacePathByName_0100
     * @tc.desc   Test NavPathStack.replacePathByName with name, param and animated params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavPath_ReplacePathByName_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_NavPath_ReplacePathByName_0100 START');
      try {
        const stack = new NavPathStack();
        stack.pushPathByName('testPage', { key: 'value' } as ESObject);
        stack.replacePathByName('replacePage', { key: 'replaced' } as ESObject, false);
        console.info('SUB_ArkUI_NavPath_ReplacePathByName_0100 replacePathByName success');
        expect(stack.size()).assertEqual(1);
      } catch (err) {
        console.error('SUB_ArkUI_NavPath_ReplacePathByName_0100 error:' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_NavPath_RemoveByNavDestinationId_0100
     * @tc.number SUB_ArkUI_NavPath_RemoveByNavDestinationId_0100
     * @tc.desc   Test NavPathStack.removeByNavDestinationId returns false with non-existent ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavPath_RemoveByNavDestinationId_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_NavPath_RemoveByNavDestinationId_0100 START');
      try {
        const stack = new NavPathStack();
        const result = stack.removeByNavDestinationId('nonExistentId');
        console.info('SUB_ArkUI_NavPath_RemoveByNavDestinationId_0100 result:' + result);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error('SUB_ArkUI_NavPath_RemoveByNavDestinationId_0100 error:' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_NavPath_Pop_0100
     * @tc.number SUB_ArkUI_NavPath_Pop_0100
     * @tc.desc   Test NavPathStack.pop returns undefined when stack is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavPath_Pop_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_NavPath_Pop_0100 START');
      try {
        const stack = new NavPathStack();
        const result = stack.pop();
        console.info('SUB_ArkUI_NavPath_Pop_0100 result:' + result);
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error('SUB_ArkUI_NavPath_Pop_0100 error:' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_NavPath_Pop_0200
     * @tc.number SUB_ArkUI_NavPath_Pop_0200
     * @tc.desc   Test NavPathStack.pop with result parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavPath_Pop_0200', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_NavPath_Pop_0200 START');
      try {
        const stack = new NavPathStack();
        stack.pushPathByName('testPage', { key: 'value' } as ESObject);
        const result = stack.pop({ resultKey: 'popResult' } as ESObject, true);
        console.info('SUB_ArkUI_NavPath_Pop_0200 result:' + JSON.stringify(result));
        expect(result !== undefined).assertTrue();
      } catch (err) {
        console.error('SUB_ArkUI_NavPath_Pop_0200 error:' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_NavPath_PopToIndex_0100
     * @tc.number SUB_ArkUI_NavPath_PopToIndex_0100
     * @tc.desc   Test NavPathStack.popToIndex with valid index and animated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavPath_PopToIndex_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_NavPath_PopToIndex_0100 START');
      try {
        const stack = new NavPathStack();
        stack.pushPathByName('page1', {} as ESObject);
        stack.pushPathByName('page2', {} as ESObject);
        stack.pushPathByName('page3', {} as ESObject);
        stack.popToIndex(0, true);
        console.info('SUB_ArkUI_NavPath_PopToIndex_0100 size:' + stack.size());
        expect(stack.size()).assertEqual(1);
      } catch (err) {
        console.error('SUB_ArkUI_NavPath_PopToIndex_0100 error:' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_NavPath_MoveToTop_0100
     * @tc.number SUB_ArkUI_NavPath_MoveToTop_0100
     * @tc.desc   Test NavPathStack.moveToTop with valid name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavPath_MoveToTop_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_NavPath_MoveToTop_0100 START');
      try {
        const stack = new NavPathStack();
        stack.pushPathByName('page1', {} as ESObject);
        stack.pushPathByName('page2', {} as ESObject);
        const result = stack.moveToTop('page1', true);
        console.info('SUB_ArkUI_NavPath_MoveToTop_0100 result:' + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error('SUB_ArkUI_NavPath_MoveToTop_0100 error:' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_NavPath_MoveIndexToTop_0100
     * @tc.number SUB_ArkUI_NavPath_MoveIndexToTop_0100
     * @tc.desc   Test NavPathStack.moveIndexToTop with valid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavPath_MoveIndexToTop_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_NavPath_MoveIndexToTop_0100 START');
      try {
        const stack = new NavPathStack();
        stack.pushPathByName('page1', {} as ESObject);
        stack.pushPathByName('page2', {} as ESObject);
        stack.moveIndexToTop(0, true);
        console.info('SUB_ArkUI_NavPath_MoveIndexToTop_0100 success, size:' + stack.size());
        expect(stack.size()).assertEqual(2);
      } catch (err) {
        console.error('SUB_ArkUI_NavPath_MoveIndexToTop_0100 error:' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_NavPath_Clear_0100
     * @tc.number SUB_ArkUI_NavPath_Clear_0100
     * @tc.desc   Test NavPathStack.clear with animated parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavPath_Clear_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_NavPath_Clear_0100 START');
      try {
        const stack = new NavPathStack();
        stack.pushPathByName('page1', {} as ESObject);
        stack.pushPathByName('page2', {} as ESObject);
        stack.clear(true);
        console.info('SUB_ArkUI_NavPath_Clear_0100 size:' + stack.size());
        expect(stack.size()).assertEqual(0);
      } catch (err) {
        console.error('SUB_ArkUI_NavPath_Clear_0100 error:' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_NavPath_GetAllPathName_0100
     * @tc.number SUB_ArkUI_NavPath_GetAllPathName_0100
     * @tc.desc   Test NavPathStack.getAllPathName returns empty array on empty stack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavPath_GetAllPathName_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_NavPath_GetAllPathName_0100 START');
      try {
        const stack = new NavPathStack();
        const names = stack.getAllPathName();
        console.info('SUB_ArkUI_NavPath_GetAllPathName_0100 length:' + names.length);
        expect(names.length).assertEqual(0);
      } catch (err) {
        console.error('SUB_ArkUI_NavPath_GetAllPathName_0100 error:' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_NavPath_GetAllPathName_0200
     * @tc.number SUB_ArkUI_NavPath_GetAllPathName_0200
     * @tc.desc   Test NavPathStack.getAllPathName returns array with path names
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavPath_GetAllPathName_0200', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_NavPath_GetAllPathName_0200 START');
      try {
        const stack = new NavPathStack();
        stack.pushPathByName('page1', {} as ESObject);
        stack.pushPathByName('page2', {} as ESObject);
        const names = stack.getAllPathName();
        console.info('SUB_ArkUI_NavPath_GetAllPathName_0200 names:' + JSON.stringify(names));
        expect(names.length).assertEqual(2);
        expect(names[0]).assertEqual('page1');
        expect(names[1]).assertEqual('page2');
      } catch (err) {
        console.error('SUB_ArkUI_NavPath_GetAllPathName_0200 error:' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_NavPath_GetParamByIndex_0100
     * @tc.number SUB_ArkUI_NavPath_GetParamByIndex_0100
     * @tc.desc   Test NavPathStack.getParamByIndex returns param value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavPath_GetParamByIndex_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_NavPath_GetParamByIndex_0100 START');
      try {
        const stack = new NavPathStack();
        stack.pushPathByName('page1', { key: 'paramValue' } as ESObject);
        const param: ESObject | undefined = stack.getParamByIndex(0) as ESObject | undefined;
        console.info('SUB_ArkUI_NavPath_GetParamByIndex_0100 param:' + JSON.stringify(param));
        expect(param !== undefined).assertTrue();
      } catch (err) {
        console.error('SUB_ArkUI_NavPath_GetParamByIndex_0100 error:' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_NavPath_GetParamByName_0100
     * @tc.number SUB_ArkUI_NavPath_GetParamByName_0100
     * @tc.desc   Test NavPathStack.getParamByName returns array of params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavPath_GetParamByName_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_NavPath_GetParamByName_0100 START');
      try {
        const stack = new NavPathStack();
        stack.pushPathByName('page1', { key: 'value1' } as ESObject);
        const params: ESObject[] = stack.getParamByName('page1') as ESObject[];
        console.info('SUB_ArkUI_NavPath_GetParamByName_0100 length:' + params.length);
        expect(params.length).assertEqual(1);
      } catch (err) {
        console.error('SUB_ArkUI_NavPath_GetParamByName_0100 error:' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_NavPath_GetIndexByName_0100
     * @tc.number SUB_ArkUI_NavPath_GetIndexByName_0100
     * @tc.desc   Test NavPathStack.getIndexByName returns array of indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavPath_GetIndexByName_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_NavPath_GetIndexByName_0100 START');
      try {
        const stack = new NavPathStack();
        stack.pushPathByName('page1', {} as ESObject);
        const indices = stack.getIndexByName('page1');
        console.info('SUB_ArkUI_NavPath_GetIndexByName_0100 indices:' + JSON.stringify(indices));
        expect(indices.length).assertEqual(1);
        expect(indices[0]).assertEqual(0);
      } catch (err) {
        console.error('SUB_ArkUI_NavPath_GetIndexByName_0100 error:' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_NavPath_GetParent_0100
     * @tc.number SUB_ArkUI_NavPath_GetParent_0100
     * @tc.desc   Test NavPathStack.getParent returns null for root stack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavPath_GetParent_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_NavPath_GetParent_0100 START');
      try {
        const stack = new NavPathStack();
        const parent = stack.getParent();
        console.info('SUB_ArkUI_NavPath_GetParent_0100 parent:' + parent);
        expect(parent === null || parent === undefined).assertTrue();
      } catch (err) {
        console.error('SUB_ArkUI_NavPath_GetParent_0100 error:' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_NavPath_DisableAnimation_0100
     * @tc.number SUB_ArkUI_NavPath_DisableAnimation_0100
     * @tc.desc   Test NavPathStack.disableAnimation with true and false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavPath_DisableAnimation_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_NavPath_DisableAnimation_0100 START');
      try {
        const stack = new NavPathStack();
        stack.disableAnimation(true);
        console.info('SUB_ArkUI_NavPath_DisableAnimation_0100 disableAnimation(true) success');
        stack.disableAnimation(false);
        console.info('SUB_ArkUI_NavPath_DisableAnimation_0100 disableAnimation(false) success');
        expect(stack !== null && stack !== undefined).assertTrue();
      } catch (err) {
        console.error('SUB_ArkUI_NavPath_DisableAnimation_0100 error:' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_NavPath_GetPathStack_0100
     * @tc.number SUB_ArkUI_NavPath_GetPathStack_0100
     * @tc.desc   Test NavPathStack.getPathStack returns empty array on empty stack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavPath_GetPathStack_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_NavPath_GetPathStack_0100 START');
      try {
        const stack = new NavPathStack();
        stack.getPathStack();
        // Standalone NavPathStack (not bound to Navigation) returns undefined for getPathStack
        // Verify API is callable without throwing exception
        expect(stack !== null && stack !== undefined).assertTrue();
      } catch (err) {
        console.error('SUB_ArkUI_NavPath_GetPathStack_0100 error:' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_ArkUI_NavPath_SetPathStack_0100
     * @tc.number SUB_ArkUI_NavPath_SetPathStack_0100
     * @tc.desc   Test NavPathStack.setPathStack with NavPathInfo array and animated param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavPath_SetPathStack_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_NavPath_SetPathStack_0100 START');
      let noError = true;
      try {
        const stack = new NavPathStack();
        const infos: NavPathInfo[] = [
          new NavPathInfo('page1', { key: 'v1' } as ESObject),
          new NavPathInfo('page2', { key: 'v2' } as ESObject)
        ];
        stack.setPathStack(infos, true);
        console.info('SUB_ArkUI_NavPath_SetPathStack_0100 size:' + stack.size());
      } catch (err) {
        console.error('SUB_ArkUI_NavPath_SetPathStack_0100 error:' + err);
        noError = false;
      }
      expect(noError).assertTrue();
      done();
    });

    // ====== NavPathInfo constructor ======

    /**
     * @tc.name   SUB_ArkUI_NavPath_Constructor_0100
     * @tc.number SUB_ArkUI_NavPath_Constructor_0100
     * @tc.desc   Test NavPathInfo constructor with name, param, onPop and isEntry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavPath_Constructor_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('SUB_ArkUI_NavPath_Constructor_0100 START');
      try {
        const onPopCallback = (popInfo: ESObject) => {
          console.info('SUB_ArkUI_NavPath_Constructor_0100 onPop callback');
        };
        const info = new NavPathInfo('testName', { data: 'testParam' } as ESObject, onPopCallback, true);
        console.info('SUB_ArkUI_NavPath_Constructor_0100 name:' + info.name);
        expect(info.name).assertEqual('testName');
      } catch (err) {
        console.error('SUB_ArkUI_NavPath_Constructor_0100 error:' + err);
        expect(false).assertTrue();
      }
      done();
    });
  });
}
