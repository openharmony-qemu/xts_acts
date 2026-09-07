/**
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

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';

export default function SideBarNavDestSupplement() {
  describe('SideBarNavDestSupplement', () => {

    beforeEach(() => {
      console.info('SideBarNavDestSupplement beforeEach');
    });

    afterEach(() => {
      console.info('SideBarNavDestSupplement afterEach');
    });

    // ==================== SideBarContainerType enum ====================

    /**
     * @tc.name   SUB_ArkUI_SideBar_ContainerType_0100
     * @tc.number SUB_ArkUI_SideBar_ContainerType_0100
     * @tc.desc   Test SideBarContainerType enum values Overlay and Embed are defined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_SideBar_ContainerType_0100', Level.LEVEL2, () => {
      console.info('SUB_ArkUI_SideBar_ContainerType_0100 START');
      expect(SideBarContainerType.Overlay !== undefined).assertTrue();
      expect(SideBarContainerType.Embed !== undefined).assertTrue();
      console.info('SUB_ArkUI_SideBar_ContainerType_0100 END');
    });

    // ==================== SideBarPosition enum ====================

    /**
     * @tc.name   SUB_ArkUI_SideBar_Position_0100
     * @tc.number SUB_ArkUI_SideBar_Position_0100
     * @tc.desc   Test SideBarPosition enum values Start and End are defined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_SideBar_Position_0100', Level.LEVEL2, () => {
      console.info('SUB_ArkUI_SideBar_Position_0100 START');
      expect(SideBarPosition.Start !== undefined).assertTrue();
      expect(SideBarPosition.End !== undefined).assertTrue();
      console.info('SUB_ArkUI_SideBar_Position_0100 END');
    });

    // ==================== NavDestinationMode enum ====================

    /**
     * @tc.name   SUB_ArkUI_NavDest_Mode_0100
     * @tc.number SUB_ArkUI_NavDest_Mode_0100
     * @tc.desc   Test NavDestinationMode enum values STANDARD and DIALOG are defined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavDest_Mode_0100', Level.LEVEL2, () => {
      console.info('SUB_ArkUI_NavDest_Mode_0100 START');
      expect(NavDestinationMode.STANDARD !== undefined).assertTrue();
      expect(NavDestinationMode.DIALOG !== undefined).assertTrue();
      console.info('SUB_ArkUI_NavDest_Mode_0100 END');
    });

    // ==================== NavigationSystemTransitionType enum ====================

    /**
     * @tc.name   SUB_ArkUI_NavDest_SystemTransition_0100
     * @tc.number SUB_ArkUI_NavDest_SystemTransition_0100
     * @tc.desc   Test NavigationSystemTransitionType enum values are defined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavDest_SystemTransition_0100', Level.LEVEL2, () => {
      console.info('SUB_ArkUI_NavDest_SystemTransition_0100 START');
      expect(NavigationSystemTransitionType.DEFAULT !== undefined).assertTrue();
      expect(NavigationSystemTransitionType.NONE !== undefined).assertTrue();
      expect(NavigationSystemTransitionType.FADE !== undefined).assertTrue();
      expect(NavigationSystemTransitionType.EXPLODE !== undefined).assertTrue();
      expect(NavigationSystemTransitionType.SLIDE_RIGHT !== undefined).assertTrue();
      expect(NavigationSystemTransitionType.SLIDE_BOTTOM !== undefined).assertTrue();
      console.info('SUB_ArkUI_NavDest_SystemTransition_0100 END');
    });

    // ==================== NavPathStack API tests ====================

    /**
     * @tc.name   SUB_ArkUI_NavDest_NavPathStack_size_0100
     * @tc.number SUB_ArkUI_NavDest_NavPathStack_size_0100
     * @tc.desc   Test NavPathStack.size() returns 0 for empty stack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavDest_NavPathStack_size_0100', Level.LEVEL2, () => {
      console.info('SUB_ArkUI_NavDest_NavPathStack_size_0100 START');
      const stack = new NavPathStack();
      expect(stack.size()).assertEqual(0);
      console.info('SUB_ArkUI_NavDest_NavPathStack_size_0100 END');
    });

    /**
     * @tc.name   SUB_ArkUI_NavDest_NavPathStack_pushPathByName_0100
     * @tc.number SUB_ArkUI_NavDest_NavPathStack_pushPathByName_0100
     * @tc.desc   Test NavPathStack.pushPathByName adds path to stack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavDest_NavPathStack_pushPathByName_0100', Level.LEVEL2, () => {
      console.info('SUB_ArkUI_NavDest_NavPathStack_pushPathByName_0100 START');
      const stack = new NavPathStack();
      const param: ESObject = { key: 'value' };
      stack.pushPathByName('testPage', param);
      expect(stack.size()).assertEqual(1);
      console.info('SUB_ArkUI_NavDest_NavPathStack_pushPathByName_0100 END');
    });

    /**
     * @tc.name   SUB_ArkUI_NavDest_NavPathStack_pop_0100
     * @tc.number SUB_ArkUI_NavDest_NavPathStack_pop_0100
     * @tc.desc   Test NavPathStack.pop returns undefined on empty stack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavDest_NavPathStack_pop_0100', Level.LEVEL2, () => {
      console.info('SUB_ArkUI_NavDest_NavPathStack_pop_0100 START');
      const stack = new NavPathStack();
      const result = stack.pop();
      expect(result).assertEqual(undefined);
      console.info('SUB_ArkUI_NavDest_NavPathStack_pop_0100 END');
    });

    /**
     * @tc.name   SUB_ArkUI_NavDest_NavPathStack_clear_0100
     * @tc.number SUB_ArkUI_NavDest_NavPathStack_clear_0100
     * @tc.desc   Test NavPathStack.clear empties the stack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavDest_NavPathStack_clear_0100', Level.LEVEL2, () => {
      console.info('SUB_ArkUI_NavDest_NavPathStack_clear_0100 START');
      const stack = new NavPathStack();
      const emptyParam: ESObject = {};
      stack.pushPathByName('page1', emptyParam);
      stack.pushPathByName('page2', emptyParam);
      stack.clear(true);
      expect(stack.size()).assertEqual(0);
      console.info('SUB_ArkUI_NavDest_NavPathStack_clear_0100 END');
    });

    /**
     * @tc.name   SUB_ArkUI_NavDest_NavPathStack_getAllPathName_0100
     * @tc.number SUB_ArkUI_NavDest_NavPathStack_getAllPathName_0100
     * @tc.desc   Test NavPathStack.getAllPathName returns path names
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavDest_NavPathStack_getAllPathName_0100', Level.LEVEL2, () => {
      console.info('SUB_ArkUI_NavDest_NavPathStack_getAllPathName_0100 START');
      const stack = new NavPathStack();
      stack.pushPathByName('page1', {} as ESObject);
      stack.pushPathByName('page2', {} as ESObject);
      const names = stack.getAllPathName();
      expect(names.length).assertEqual(2);
      expect(names[0]).assertEqual('page1');
      expect(names[1]).assertEqual('page2');
      console.info('SUB_ArkUI_NavDest_NavPathStack_getAllPathName_0100 END');
    });

    /**
     * @tc.name   SUB_ArkUI_NavDest_NavPathStack_getParent_0100
     * @tc.number SUB_ArkUI_NavDest_NavPathStack_getParent_0100
     * @tc.desc   Test NavPathStack.getParent returns null for root stack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavDest_NavPathStack_getParent_0100', Level.LEVEL2, () => {
      console.info('SUB_ArkUI_NavDest_NavPathStack_getParent_0100 START');
      const stack = new NavPathStack();
      const parent = stack.getParent();
      expect(parent === null || parent === undefined).assertTrue();
      console.info('SUB_ArkUI_NavDest_NavPathStack_getParent_0100 END');
    });

    /**
     * @tc.name   SUB_ArkUI_NavDest_NavPathStack_disableAnimation_0100
     * @tc.number SUB_ArkUI_NavDest_NavPathStack_disableAnimation_0100
     * @tc.desc   Test NavPathStack.disableAnimation with true and false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavDest_NavPathStack_disableAnimation_0100', Level.LEVEL2, () => {
      console.info('SUB_ArkUI_NavDest_NavPathStack_disableAnimation_0100 START');
      const stack = new NavPathStack();
      let noError = true;
      try {
        stack.disableAnimation(true);
        stack.disableAnimation(false);
      } catch (err) {
        noError = false;
      }
      expect(noError).assertTrue();
      console.info('SUB_ArkUI_NavDest_NavPathStack_disableAnimation_0100 END');
    });

    // ==================== NavPathInfo constructor ====================

    /**
     * @tc.name   SUB_ArkUI_NavDest_NavPathInfo_0100
     * @tc.number SUB_ArkUI_NavDest_NavPathInfo_0100
     * @tc.desc   Test NavPathInfo constructor with name and param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavDest_NavPathInfo_0100', Level.LEVEL2, () => {
      console.info('SUB_ArkUI_NavDest_NavPathInfo_0100 START');
      const info = new NavPathInfo('testPage', { key: 'value' } as ESObject);
      expect(info.name).assertEqual('testPage');
      console.info('SUB_ArkUI_NavDest_NavPathInfo_0100 END');
    });

    /**
     * @tc.name   SUB_ArkUI_NavDest_NavPathInfo_0200
     * @tc.number SUB_ArkUI_NavDest_NavPathInfo_0200
     * @tc.desc   Test NavPathInfo constructor with name, param, onPop and isEntry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavDest_NavPathInfo_0200', Level.LEVEL2, () => {
      console.info('SUB_ArkUI_NavDest_NavPathInfo_0200 START');
      const onPopCallback = (popInfo: ESObject) => {
        console.info('SUB_ArkUI_NavDest_NavPathInfo_0200 onPop callback');
      };
      const info = new NavPathInfo('testPage', { data: 'testParam' } as ESObject, onPopCallback, true);
      expect(info.name).assertEqual('testPage');
      console.info('SUB_ArkUI_NavDest_NavPathInfo_0200 END');
    });

    // ==================== NavPathStack setPathStack ====================

    /**
     * @tc.name   SUB_ArkUI_NavDest_NavPathStack_setPathStack_0100
     * @tc.number SUB_ArkUI_NavDest_NavPathStack_setPathStack_0100
     * @tc.desc   Test NavPathStack.setPathStack with NavPathInfo array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ArkUI_NavDest_NavPathStack_setPathStack_0100', Level.LEVEL2, () => {
      console.info('SUB_ArkUI_NavDest_NavPathStack_setPathStack_0100 START');
      const stack = new NavPathStack();
      const infos: NavPathInfo[] = [
        new NavPathInfo('page1', { key: 'v1' } as ESObject),
        new NavPathInfo('page2', { key: 'v2' } as ESObject)
      ];
      let noError = true;
      try {
        stack.setPathStack(infos, true);
        console.info('SUB_ArkUI_NavDest_NavPathStack_setPathStack_0100 size:' + stack.size());
      } catch (err) {
        noError = false;
      }
      expect(noError).assertTrue();
      console.info('SUB_ArkUI_NavDest_NavPathStack_setPathStack_0100 END');
    });
  });
}
