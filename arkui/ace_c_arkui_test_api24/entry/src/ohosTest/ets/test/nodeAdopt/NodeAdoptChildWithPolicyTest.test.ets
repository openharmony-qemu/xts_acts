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

export default function nodeAdoptChildWithPolicyTest() {

  describe('nodeAdoptChildWithPolicyTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   nodeAdoptChildWithPolicyTest_001
     * @tc.number SUB_ACE_C_ARKUI_NODE_ADOPT_CHILD_WITH_POLICY_0100
     * @tc.desc   call OH_ArkUI_NativeModule_AdoptChildWithPolicy before
     *             OH_ArkUI_QueryModuleInterfaceByName, expect ARKUI_ERROR_CODE_CAPI_INIT_ERROR(500);
     *             then adopt with valid nodes after module interface query, expect
     *             ARKUI_ERROR_CODE_NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('nodeAdoptChildWithPolicyTest_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChildWithPolicy001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   nodeAdoptChildWithPolicyTest_002
     * @tc.number SUB_ACE_C_ARKUI_NODE_ADOPT_CHILD_WITH_POLICY_0200
     * @tc.desc   adopt a child which already has a parent, expect ARKUI_ERROR_CODE_NODE_HAS_PARENT(106207)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('nodeAdoptChildWithPolicyTest_002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChildWithPolicy002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   nodeAdoptChildWithPolicyTest_003
     * @tc.number SUB_ACE_C_ARKUI_NODE_ADOPT_CHILD_WITH_POLICY_0300
     * @tc.desc   adopt with null child, expect ARKUI_ERROR_CODE_NODE_CAN_NOT_BE_ADOPTED(106208)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('nodeAdoptChildWithPolicyTest_003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChildWithPolicy003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   nodeAdoptChildWithPolicyTest_004
     * @tc.number SUB_ACE_C_ARKUI_NODE_ADOPT_CHILD_WITH_POLICY_0400
     * @tc.desc   adopt with null parent node, expect ARKUI_ERROR_CODE_NODE_CAN_NOT_ADOPT_TO(106209)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('nodeAdoptChildWithPolicyTest_004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChildWithPolicy004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   nodeAdoptChildWithPolicyTest_005
     * @tc.number SUB_ACE_C_ARKUI_NODE_ADOPT_CHILD_WITH_POLICY_0500
     * @tc.desc   adopt with policy then remove the adopted child, expect ARKUI_ERROR_CODE_NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('nodeAdoptChildWithPolicyTest_005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestNodeAdoptChildWithPolicy005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   nodeAdoptChildWithPolicyTest_006
     * @tc.number SUB_ACE_C_ARKUI_NODE_ADOPT_CHILD_WITH_POLICY_0600
     * @tc.desc   set compensation with offset(10,20) and scale matrix S(2,3) on child adopted
     *             with policy, expect ARKUI_ERROR_CODE_NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('nodeAdoptChildWithPolicyTest_006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestSetAdoptedChildOverlayPositionCompensation001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   nodeAdoptChildWithPolicyTest_007
     * @tc.number SUB_ACE_C_ARKUI_NODE_ADOPT_CHILD_WITH_POLICY_0700
     * @tc.desc   set compensation with negative offset(-50.5,-100) and identity matrix, then
     *             reset with zero offset, expect ARKUI_ERROR_CODE_NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('nodeAdoptChildWithPolicyTest_007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestSetAdoptedChildOverlayPositionCompensation002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   nodeAdoptChildWithPolicyTest_008
     * @tc.number SUB_ACE_C_ARKUI_NODE_ADOPT_CHILD_WITH_POLICY_0800
     * @tc.desc   set compensation on a node never adopted, expect
     *             ARKUI_ERROR_CODE_NODE_IS_NOT_IN_ADOPTED_CHILDREN(106210)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('nodeAdoptChildWithPolicyTest_008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestSetAdoptedChildOverlayPositionCompensation003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   nodeAdoptChildWithPolicyTest_009
     * @tc.number SUB_ACE_C_ARKUI_NODE_ADOPT_CHILD_WITH_POLICY_0900
     * @tc.desc   set compensation on a node adopted by OH_ArkUI_NativeModule_AdoptChild
     *             without policy, expect ARKUI_ERROR_CODE_NODE_IS_NOT_IN_ADOPTED_CHILDREN(106210)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('nodeAdoptChildWithPolicyTest_009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestSetAdoptedChildOverlayPositionCompensation004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   nodeAdoptChildWithPolicyTest_010
     * @tc.number SUB_ACE_C_ARKUI_NODE_ADOPT_CHILD_WITH_POLICY_1000
     * @tc.desc   set compensation with null adoptedChild / null offset / null transform,
     *             expect ARKUI_ERROR_CODE_PARAM_INVALID(401)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('nodeAdoptChildWithPolicyTest_010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestSetAdoptedChildOverlayPositionCompensation005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   nodeAdoptChildWithPolicyTest_011
     * @tc.number SUB_ACE_C_ARKUI_NODE_ADOPT_CHILD_WITH_POLICY_1100
     * @tc.desc   set compensation after the adopted child is removed by
     *             OH_ArkUI_NativeModule_RemoveAdoptedChild, expect
     *             ARKUI_ERROR_CODE_NODE_IS_NOT_IN_ADOPTED_CHILDREN(106210)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('nodeAdoptChildWithPolicyTest_011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.TestSetAdoptedChildOverlayPositionCompensation006()).assertEqual(0)
      done()
    })
  })
}
