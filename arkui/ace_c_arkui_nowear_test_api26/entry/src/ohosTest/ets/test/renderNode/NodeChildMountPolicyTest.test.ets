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
import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function NodeChildMountPolicyTest(){
  describe('NodeChildMountPolicyTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   SUB_ACE_ARKUI_NativeModule_SetChildMountPolicy_0100
     * @tc.number SUB_ACE_ARKUI_NativeModule_SetChildMountPolicy_0100
     * @tc.desc   Test OH_ArkUI_NativeModule_SetChildMountPolicy with ARKUI_CHILD_MOUNT_POLICY_TO_FRONT
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_NativeModule_SetChildMountPolicy_0100', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestSetChildMountPolicy_001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_ACE_ARKUI_NativeModule_SetChildMountPolicy_0200
     * @tc.number SUB_ACE_ARKUI_NativeModule_SetChildMountPolicy_0200
     * @tc.desc   Test OH_ArkUI_NativeModule_SetChildMountPolicy with ARKUI_CHILD_MOUNT_POLICY_TO_BACK
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_NativeModule_SetChildMountPolicy_0200', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestSetChildMountPolicy_002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_ACE_ARKUI_NativeModule_SetChildMountPolicy_0300
     * @tc.number SUB_ACE_ARKUI_NativeModule_SetChildMountPolicy_0300
     * @tc.desc   Test OH_ArkUI_NativeModule_SetChildMountPolicy with nullptr node
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_ARKUI_NativeModule_SetChildMountPolicy_0300', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestSetChildMountPolicy_003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_ACE_ARKUI_NativeModule_SetChildMountPolicy_0400
     * @tc.number SUB_ACE_ARKUI_NativeModule_SetChildMountPolicy_0400
     * @tc.desc   Test OH_ArkUI_NativeModule_SetChildMountPolicy with nullptr node
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_ARKUI_NativeModule_SetChildMountPolicy_0400', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestSetChildMountPolicy_004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_ACE_ARKUI_NativeModule_GetChildMountPolicy_0100
     * @tc.number SUB_ACE_ARKUI_NativeModule_GetChildMountPolicy_0100
     * @tc.desc   Test OH_ArkUI_NativeModule_GetChildMountPolicy with valid parameters
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_NativeModule_GetChildMountPolicy_0100', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestGetChildMountPolicy_001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_ACE_ARKUI_NativeModule_GetChildMountPolicy_0200
     * @tc.number SUB_ACE_ARKUI_NativeModule_GetChildMountPolicy_0200
     * @tc.desc   Test OH_ArkUI_NativeModule_GetChildMountPolicy with nullptr node
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_ARKUI_NativeModule_GetChildMountPolicy_0200', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestGetChildMountPolicy_002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_ACE_ARKUI_NativeModule_GetChildMountPolicy_0300
     * @tc.number SUB_ACE_ARKUI_NativeModule_GetChildMountPolicy_0300
     * @tc.desc   Test OH_ArkUI_NativeModule_GetChildMountPolicy with nullptr policy pointer
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_ARKUI_NativeModule_GetChildMountPolicy_0300', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestGetChildMountPolicy_003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_ACE_ARKUI_NativeModule_GetChildMountPolicy_0400
     * @tc.number SUB_ACE_ARKUI_NativeModule_GetChildMountPolicy_0400
     * @tc.desc   Test OH_ArkUI_NativeModule_GetChildMountPolicy with nullptr policy pointer
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_ARKUI_NativeModule_GetChildMountPolicy_0400', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestGetChildMountPolicy_004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_ACE_ARKUI_RenderNodeUtils_InsertRenderNodeAt_0100
     * @tc.number SUB_ACE_ARKUI_RenderNodeUtils_InsertRenderNodeAt_0100
     * @tc.desc   Test OH_ArkUI_RenderNodeUtils_InsertRenderNodeAt with valid parameters
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_RenderNodeUtils_InsertRenderNodeAt_0100', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestInsertRenderNodeAt_001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_ACE_ARKUI_RenderNodeUtils_InsertRenderNodeAt_0200
     * @tc.number SUB_ACE_ARKUI_RenderNodeUtils_InsertRenderNodeAt_0200
     * @tc.desc   Test OH_ArkUI_RenderNodeUtils_InsertRenderNodeAt with nullptr parent
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_ARKUI_RenderNodeUtils_InsertRenderNodeAt_0200', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestInsertRenderNodeAt_002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_ACE_ARKUI_RenderNodeUtils_InsertRenderNodeAt_0300
     * @tc.number SUB_ACE_ARKUI_RenderNodeUtils_InsertRenderNodeAt_0300
     * @tc.desc   Test OH_ArkUI_RenderNodeUtils_InsertRenderNodeAt with nullptr child
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_ARKUI_RenderNodeUtils_InsertRenderNodeAt_0300', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestInsertRenderNodeAt_003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_ACE_ARKUI_RenderNodeUtils_InsertRenderNodeAt_0400
     * @tc.number SUB_ACE_ARKUI_RenderNodeUtils_InsertRenderNodeAt_0400
     * @tc.desc   Test OH_ArkUI_RenderNodeUtils_InsertRenderNodeAt with negative index
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_ARKUI_RenderNodeUtils_InsertRenderNodeAt_0400', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestInsertRenderNodeAt_004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_ACE_ARKUI_RenderNodeUtils_InsertRenderNodeAt_0500
     * @tc.number SUB_ACE_ARKUI_RenderNodeUtils_InsertRenderNodeAt_0500
     * @tc.desc   Test OH_ArkUI_RenderNodeUtils_InsertRenderNodeAt with negative index
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_ARKUI_RenderNodeUtils_InsertRenderNodeAt_0500', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestInsertRenderNodeAt_005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_ACE_ARKUI_RenderNodeUtils_InsertRenderNodeAt_0600
     * @tc.number SUB_ACE_ARKUI_RenderNodeUtils_InsertRenderNodeAt_0600
     * @tc.desc   Test OH_ArkUI_RenderNodeUtils_InsertRenderNodeAt with negative index
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_ARKUI_RenderNodeUtils_InsertRenderNodeAt_0600', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestInsertRenderNodeAt_006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_ACE_ARKUI_RenderNodeUtils_InsertRenderNodeAt_0700
     * @tc.number SUB_ACE_ARKUI_RenderNodeUtils_InsertRenderNodeAt_0700
     * @tc.desc   Test OH_ArkUI_RenderNodeUtils_InsertRenderNodeAt with negative index
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_ARKUI_RenderNodeUtils_InsertRenderNodeAt_0700', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestInsertRenderNodeAt_007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_ACE_ARKUI_RenderNodeUtils_InsertRenderNodeAt_0800
     * @tc.number SUB_ACE_ARKUI_RenderNodeUtils_InsertRenderNodeAt_0800
     * @tc.desc   Test OH_ArkUI_RenderNodeUtils_InsertRenderNodeAt with negative index
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_ARKUI_RenderNodeUtils_InsertRenderNodeAt_0800', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestInsertRenderNodeAt_008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_ACE_ARKUI_RenderNodeUtils_GetRenderNodeChildrenCount_0100
     * @tc.number SUB_ACE_ARKUI_RenderNodeUtils_GetRenderNodeChildrenCount_0100
     * @tc.desc   Test OH_ArkUI_RenderNodeUtils_GetRenderNodeChildrenCount with children
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_RenderNodeUtils_GetRenderNodeChildrenCount_0100', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestGetRenderNodeChildrenCount_001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_ACE_ARKUI_RenderNodeUtils_GetRenderNodeChildrenCount_0200
     * @tc.number SUB_ACE_ARKUI_RenderNodeUtils_GetRenderNodeChildrenCount_0200
     * @tc.desc   Test OH_ArkUI_RenderNodeUtils_GetRenderNodeChildrenCount with empty parent
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_RenderNodeUtils_GetRenderNodeChildrenCount_0200', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestGetRenderNodeChildrenCount_002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_ACE_ARKUI_RenderNodeUtils_GetRenderNodeChildrenCount_0300
     * @tc.number SUB_ACE_ARKUI_RenderNodeUtils_GetRenderNodeChildrenCount_0300
     * @tc.desc   Test OH_ArkUI_RenderNodeUtils_GetRenderNodeChildrenCount with nullptr node
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_ARKUI_RenderNodeUtils_GetRenderNodeChildrenCount_0300', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestGetRenderNodeChildrenCount_003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_ACE_ARKUI_RenderNodeUtils_GetRenderNodeChildrenCount_0400
     * @tc.number SUB_ACE_ARKUI_RenderNodeUtils_GetRenderNodeChildrenCount_0400
     * @tc.desc   Test OH_ArkUI_RenderNodeUtils_GetRenderNodeChildrenCount with nullptr count pointer
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_ARKUI_RenderNodeUtils_GetRenderNodeChildrenCount_0400', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestGetRenderNodeChildrenCount_004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_ACE_ARKUI_RenderNodeUtils_GetRenderNodeAt_0100
     * @tc.number SUB_ACE_ARKUI_RenderNodeUtils_GetRenderNodeAt_0100
     * @tc.desc   Test OH_ArkUI_RenderNodeUtils_GetRenderNodeAt with valid parameters
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_ARKUI_RenderNodeUtils_GetRenderNodeAt_0100', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestGetRenderNodeAt_001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_ACE_ARKUI_RenderNodeUtils_GetRenderNodeAt_0200
     * @tc.number SUB_ACE_ARKUI_RenderNodeUtils_GetRenderNodeAt_0200
     * @tc.desc   Test OH_ArkUI_RenderNodeUtils_GetRenderNodeAt with nullptr parent
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_ARKUI_RenderNodeUtils_GetRenderNodeAt_0200', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestGetRenderNodeAt_002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_ACE_ARKUI_RenderNodeUtils_GetRenderNodeAt_0300
     * @tc.number SUB_ACE_ARKUI_RenderNodeUtils_GetRenderNodeAt_0300
     * @tc.desc   Test OH_ArkUI_RenderNodeUtils_GetRenderNodeAt with nullptr child pointer
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_ARKUI_RenderNodeUtils_GetRenderNodeAt_0300', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestGetRenderNodeAt_003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_ACE_ARKUI_RenderNodeUtils_GetRenderNodeAt_0400
     * @tc.number SUB_ACE_ARKUI_RenderNodeUtils_GetRenderNodeAt_0400
     * @tc.desc   Test OH_ArkUI_RenderNodeUtils_GetRenderNodeAt with negative index
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_ARKUI_RenderNodeUtils_GetRenderNodeAt_0400', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestGetRenderNodeAt_004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   SUB_ACE_ARKUI_RenderNodeUtils_GetRenderNodeAt_0500
     * @tc.number SUB_ACE_ARKUI_RenderNodeUtils_GetRenderNodeAt_0500
     * @tc.desc   Test OH_ArkUI_RenderNodeUtils_GetRenderNodeAt with out of range index
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_ARKUI_RenderNodeUtils_GetRenderNodeAt_0500', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.TestGetRenderNodeAt_005()).assertEqual(0)
      done()
    })
  })
}