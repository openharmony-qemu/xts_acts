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

export default function AccessibilityBindExportTreeTest() {

  describe('AccessibilityBindExportTreeTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number SUB_ACE_ARKUI_ACCESSIBILITY_BINDEXPORTTREE_0100
     * @tc.name   BindExportTreeTest001
     * @tc.desc   Bind export tree with valid owner, bindId and exportedRoot, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('BindExportTreeTest001', Level.LEVEL1, async (done: Function) => {
      console.info('[BindExportTreeTest001] START');
      expect(nativeFunc.BindExportTreeTest001()).assertEqual(0);
      console.info('[BindExportTreeTest001] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_ACCESSIBILITY_BINDEXPORTTREE_0200
     * @tc.name   BindExportTreeTest002
     * @tc.desc   Bind with same (owner, bindId) pair again, expect NO_ERROR (no replacement)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('BindExportTreeTest002', Level.LEVEL1, async (done: Function) => {
      console.info('[BindExportTreeTest002] START');
      expect(nativeFunc.BindExportTreeTest002()).assertEqual(0);
      console.info('[BindExportTreeTest002] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_ACCESSIBILITY_BINDEXPORTTREE_0300
     * @tc.name   BindExportTreeTest003
     * @tc.desc   Bind exportedRoot that already has a binding with different owner and bindId, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('BindExportTreeTest003', Level.LEVEL2, async (done: Function) => {
      console.info('[BindExportTreeTest003] START');
      expect(nativeFunc.BindExportTreeTest003()).assertEqual(0);
      console.info('[BindExportTreeTest003] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_ACCESSIBILITY_BINDEXPORTTREE_0400
     * @tc.name   BindExportTreeTest004
     * @tc.desc   Bind multiple export trees on same owner with different bindIds, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('BindExportTreeTest004', Level.LEVEL1, async (done: Function) => {
      console.info('[BindExportTreeTest004] START');
      expect(nativeFunc.BindExportTreeTest004()).assertEqual(0);
      console.info('[BindExportTreeTest004] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_ACCESSIBILITY_BINDEXPORTTREE_0500
     * @tc.name   BindExportTreeTest005
     * @tc.desc   Bind with bindId=0 (boundary value), expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('BindExportTreeTest005', Level.LEVEL1, async (done: Function) => {
      console.info('[BindExportTreeTest005] START');
      expect(nativeFunc.BindExportTreeTest005()).assertEqual(0);
      console.info('[BindExportTreeTest005] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_ACCESSIBILITY_BINDEXPORTTREE_0600
     * @tc.name   BindExportTreeTest006
     * @tc.desc   Bind with NULL owner, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('BindExportTreeTest006', Level.LEVEL2, async (done: Function) => {
      console.info('[BindExportTreeTest006] START');
      expect(nativeFunc.BindExportTreeTest006()).assertEqual(0);
      console.info('[BindExportTreeTest006] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_ACCESSIBILITY_BINDEXPORTTREE_0700
     * @tc.name   BindExportTreeTest007
     * @tc.desc   Bind with NULL exportedRoot, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('BindExportTreeTest007', Level.LEVEL2, async (done: Function) => {
      console.info('[BindExportTreeTest007] START');
      expect(nativeFunc.BindExportTreeTest007()).assertEqual(0);
      console.info('[BindExportTreeTest007] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_ACCESSIBILITY_BINDEXPORTTREE_0800
     * @tc.name   BindExportTreeTest008
     * @tc.desc   Bind with large bindId (INT64_MAX), expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('BindExportTreeTest008', Level.LEVEL1, async (done: Function) => {
      console.info('[BindExportTreeTest008] START');
      expect(nativeFunc.BindExportTreeTest008()).assertEqual(0);
      console.info('[BindExportTreeTest008] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_ACCESSIBILITY_BINDEXPORTTREE_0900
     * @tc.name   BindExportTreeTest009
     * @tc.desc   Bind with negative bindId (-1), expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('BindExportTreeTest009', Level.LEVEL1, async (done: Function) => {
      console.info('[BindExportTreeTest009] START');
      expect(nativeFunc.BindExportTreeTest009()).assertEqual(0);
      console.info('[BindExportTreeTest009] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_ACCESSIBILITY_BINDEXPORTTREE_1000
     * @tc.name   BindExportTreeTest010
     * @tc.desc   Bind with NULL owner and NULL exportedRoot, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('BindExportTreeTest010', Level.LEVEL2, async (done: Function) => {
      console.info('[BindExportTreeTest010] START');
      expect(nativeFunc.BindExportTreeTest010()).assertEqual(0);
      console.info('[BindExportTreeTest010] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_ACCESSIBILITY_UNBINDEXPORTTREE_0100
     * @tc.name   UnbindExportTreeTest001
     * @tc.desc   Unbind after successful bind, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UnbindExportTreeTest001', Level.LEVEL1, async (done: Function) => {
      console.info('[UnbindExportTreeTest001] START');
      expect(nativeFunc.UnbindExportTreeTest001()).assertEqual(0);
      console.info('[UnbindExportTreeTest001] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_ACCESSIBILITY_UNBINDEXPORTTREE_0200
     * @tc.name   UnbindExportTreeTest002
     * @tc.desc   Unbind unknown (owner, bindId) pair that was never bound, expect NO_ERROR (idempotent)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UnbindExportTreeTest002', Level.LEVEL1, async (done: Function) => {
      console.info('[UnbindExportTreeTest002] START');
      expect(nativeFunc.UnbindExportTreeTest002()).assertEqual(0);
      console.info('[UnbindExportTreeTest002] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_ACCESSIBILITY_UNBINDEXPORTTREE_0300
     * @tc.name   UnbindExportTreeTest003
     * @tc.desc   Unbind already-unbound pair (bind, unbind, unbind again), expect NO_ERROR (idempotent)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UnbindExportTreeTest003', Level.LEVEL1, async (done: Function) => {
      console.info('[UnbindExportTreeTest003] START');
      expect(nativeFunc.UnbindExportTreeTest003()).assertEqual(0);
      console.info('[UnbindExportTreeTest003] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_ACCESSIBILITY_UNBINDEXPORTTREE_0400
     * @tc.name   UnbindExportTreeTest004
     * @tc.desc   Rebind same (owner, bindId) after unbind, expect NO_ERROR (full registration)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UnbindExportTreeTest004', Level.LEVEL1, async (done: Function) => {
      console.info('[UnbindExportTreeTest004] START');
      expect(nativeFunc.UnbindExportTreeTest004()).assertEqual(0);
      console.info('[UnbindExportTreeTest004] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_ACCESSIBILITY_UNBINDEXPORTTREE_0500
     * @tc.name   UnbindExportTreeTest005
     * @tc.desc   Unbind with NULL owner, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UnbindExportTreeTest005', Level.LEVEL2, async (done: Function) => {
      console.info('[UnbindExportTreeTest005] START');
      expect(nativeFunc.UnbindExportTreeTest005()).assertEqual(0);
      console.info('[UnbindExportTreeTest005] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_ACCESSIBILITY_UNBINDEXPORTTREE_0600
     * @tc.name   UnbindExportTreeTest006
     * @tc.desc   Unbind one binding does not affect other bindings on same owner, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UnbindExportTreeTest006', Level.LEVEL1, async (done: Function) => {
      console.info('[UnbindExportTreeTest006] START');
      expect(nativeFunc.UnbindExportTreeTest006()).assertEqual(0);
      console.info('[UnbindExportTreeTest006] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_ACCESSIBILITY_UNBINDEXPORTTREE_0700
     * @tc.name   UnbindExportTreeTest007
     * @tc.desc   Unbind with bindId=0 after bind, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UnbindExportTreeTest007', Level.LEVEL1, async (done: Function) => {
      console.info('[UnbindExportTreeTest007] START');
      expect(nativeFunc.UnbindExportTreeTest007()).assertEqual(0);
      console.info('[UnbindExportTreeTest007] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_ACCESSIBILITY_UNBINDEXPORTTREE_0800
     * @tc.name   UnbindExportTreeTest008
     * @tc.desc   Unbind with large bindId (INT64_MAX), expect NO_ERROR (idempotent)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UnbindExportTreeTest008', Level.LEVEL1, async (done: Function) => {
      console.info('[UnbindExportTreeTest008] START');
      expect(nativeFunc.UnbindExportTreeTest008()).assertEqual(0);
      console.info('[UnbindExportTreeTest008] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_ACCESSIBILITY_UNBINDEXPORTTREE_0900
     * @tc.name   UnbindExportTreeTest009
     * @tc.desc   Unbind with negative bindId (-1), expect NO_ERROR (idempotent)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UnbindExportTreeTest009', Level.LEVEL1, async (done: Function) => {
      console.info('[UnbindExportTreeTest009] START');
      expect(nativeFunc.UnbindExportTreeTest009()).assertEqual(0);
      console.info('[UnbindExportTreeTest009] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_ACCESSIBILITY_UNBINDEXPORTTREE_1000
     * @tc.name   UnbindExportTreeTest010
     * @tc.desc   Bind-unbind-rebind-unbind-rebind cycle, expect NO_ERROR for each step
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UnbindExportTreeTest010', Level.LEVEL1, async (done: Function) => {
      console.info('[UnbindExportTreeTest010] START');
      expect(nativeFunc.UnbindExportTreeTest010()).assertEqual(0);
      console.info('[UnbindExportTreeTest010] END');
      done();
    })
  })
}
