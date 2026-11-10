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

export default function InspectorTreeGetterTest() {

  describe('InspectorTreeGetterTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number SUB_ACE_ARKUI_NATIVE_MODULE_REGISTER_INSPECTOR_TREE_GETTER_0100
     * @tc.name   RegisterInspectorTreeGetterTest001
     * @tc.desc   Register with valid CUSTOM node, valid userData and valid callback, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('RegisterInspectorTreeGetterTest001', Level.LEVEL1, async (done: Function) => {
      console.info('[RegisterInspectorTreeGetterTest001] START');
      expect(nativeFunc.RegisterInspectorTreeGetterTest001()).assertEqual(0);
      console.info('[RegisterInspectorTreeGetterTest001] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_NATIVE_MODULE_REGISTER_INSPECTOR_TREE_GETTER_0200
     * @tc.name   RegisterInspectorTreeGetterTest002
     * @tc.desc   Register multiple different callbacks on same node, expect NO_ERROR for each
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('RegisterInspectorTreeGetterTest002', Level.LEVEL1, async (done: Function) => {
      console.info('[RegisterInspectorTreeGetterTest002] START');
      expect(nativeFunc.RegisterInspectorTreeGetterTest002()).assertEqual(0);
      console.info('[RegisterInspectorTreeGetterTest002] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_NATIVE_MODULE_REGISTER_INSPECTOR_TREE_GETTER_0300
     * @tc.name   RegisterInspectorTreeGetterTest003
     * @tc.desc   Register same callback again on same node, expect NO_ERROR (multiple registration allowed)
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('RegisterInspectorTreeGetterTest003', Level.LEVEL1, async (done: Function) => {
      console.info('[RegisterInspectorTreeGetterTest003] START');
      expect(nativeFunc.RegisterInspectorTreeGetterTest003()).assertEqual(0);
      console.info('[RegisterInspectorTreeGetterTest003] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_NATIVE_MODULE_REGISTER_INSPECTOR_TREE_GETTER_0400
     * @tc.name   RegisterInspectorTreeGetterTest004
     * @tc.desc   Register with userData=nullptr, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('RegisterInspectorTreeGetterTest004', Level.LEVEL1, async (done: Function) => {
      console.info('[RegisterInspectorTreeGetterTest004] START');
      expect(nativeFunc.RegisterInspectorTreeGetterTest004()).assertEqual(0);
      console.info('[RegisterInspectorTreeGetterTest004] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_NATIVE_MODULE_REGISTER_INSPECTOR_TREE_GETTER_0500
     * @tc.name   RegisterInspectorTreeGetterTest005
     * @tc.desc   Register with nullptr node, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RegisterInspectorTreeGetterTest005', Level.LEVEL2, async (done: Function) => {
      console.info('[RegisterInspectorTreeGetterTest005] START');
      expect(nativeFunc.RegisterInspectorTreeGetterTest005()).assertEqual(0);
      console.info('[RegisterInspectorTreeGetterTest005] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_NATIVE_MODULE_REGISTER_INSPECTOR_TREE_GETTER_0600
     * @tc.name   RegisterInspectorTreeGetterTest006
     * @tc.desc   Register with nullptr callback, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RegisterInspectorTreeGetterTest006', Level.LEVEL2, async (done: Function) => {
      console.info('[RegisterInspectorTreeGetterTest006] START');
      expect(nativeFunc.RegisterInspectorTreeGetterTest006()).assertEqual(0);
      console.info('[RegisterInspectorTreeGetterTest006] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_NATIVE_MODULE_REGISTER_INSPECTOR_TREE_GETTER_0700
     * @tc.name   RegisterInspectorTreeGetterTest007
     * @tc.desc   Register with nullptr node, nullptr userData and nullptr callback, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RegisterInspectorTreeGetterTest007', Level.LEVEL2, async (done: Function) => {
      console.info('[RegisterInspectorTreeGetterTest007] START');
      expect(nativeFunc.RegisterInspectorTreeGetterTest007()).assertEqual(0);
      console.info('[RegisterInspectorTreeGetterTest007] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_NATIVE_MODULE_REGISTER_INSPECTOR_TREE_GETTER_0800
     * @tc.name   RegisterInspectorTreeGetterTest008
     * @tc.desc   Register on ARKUI_NODE_COLUMN (unsupported node type), expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RegisterInspectorTreeGetterTest008', Level.LEVEL2, async (done: Function) => {
      console.info('[RegisterInspectorTreeGetterTest008] START');
      expect(nativeFunc.RegisterInspectorTreeGetterTest008()).assertEqual(0);
      console.info('[RegisterInspectorTreeGetterTest008] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_NATIVE_MODULE_REGISTER_INSPECTOR_TREE_GETTER_0900
     * @tc.name   RegisterInspectorTreeGetterTest009
     * @tc.desc   Register on ARKUI_NODE_BUTTON (unsupported node type), expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RegisterInspectorTreeGetterTest009', Level.LEVEL2, async (done: Function) => {
      console.info('[RegisterInspectorTreeGetterTest009] START');
      expect(nativeFunc.RegisterInspectorTreeGetterTest009()).assertEqual(0);
      console.info('[RegisterInspectorTreeGetterTest009] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_NATIVE_MODULE_REGISTER_INSPECTOR_TREE_GETTER_1000
     * @tc.name   RegisterInspectorTreeGetterTest010
     * @tc.desc   Register on ARKUI_NODE_TEXT (unsupported node type), expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('RegisterInspectorTreeGetterTest010', Level.LEVEL2, async (done: Function) => {
      console.info('[RegisterInspectorTreeGetterTest010] START');
      expect(nativeFunc.RegisterInspectorTreeGetterTest010()).assertEqual(0);
      console.info('[RegisterInspectorTreeGetterTest010] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_NATIVE_MODULE_UNREGISTER_INSPECTOR_TREE_GETTER_0100
     * @tc.name   UnregisterInspectorTreeGetterTest001
     * @tc.desc   Unregister after successful register, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UnregisterInspectorTreeGetterTest001', Level.LEVEL1, async (done: Function) => {
      console.info('[UnregisterInspectorTreeGetterTest001] START');
      expect(nativeFunc.UnregisterInspectorTreeGetterTest001()).assertEqual(0);
      console.info('[UnregisterInspectorTreeGetterTest001] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_NATIVE_MODULE_UNREGISTER_INSPECTOR_TREE_GETTER_0200
     * @tc.name   UnregisterInspectorTreeGetterTest002
     * @tc.desc   Unregister one specific callback after registering multiple, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UnregisterInspectorTreeGetterTest002', Level.LEVEL1, async (done: Function) => {
      console.info('[UnregisterInspectorTreeGetterTest002] START');
      expect(nativeFunc.UnregisterInspectorTreeGetterTest002()).assertEqual(0);
      console.info('[UnregisterInspectorTreeGetterTest002] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_NATIVE_MODULE_UNREGISTER_INSPECTOR_TREE_GETTER_0300
     * @tc.name   UnregisterInspectorTreeGetterTest003
     * @tc.desc   Unregister with nullptr callback (unregister all) after registering multiple, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UnregisterInspectorTreeGetterTest003', Level.LEVEL1, async (done: Function) => {
      console.info('[UnregisterInspectorTreeGetterTest003] START');
      expect(nativeFunc.UnregisterInspectorTreeGetterTest003()).assertEqual(0);
      console.info('[UnregisterInspectorTreeGetterTest003] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_NATIVE_MODULE_UNREGISTER_INSPECTOR_TREE_GETTER_0400
     * @tc.name   UnregisterInspectorTreeGetterTest004
     * @tc.desc   Unregister then register then unregister again, expect NO_ERROR for each step
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UnregisterInspectorTreeGetterTest004', Level.LEVEL1, async (done: Function) => {
      console.info('[UnregisterInspectorTreeGetterTest004] START');
      expect(nativeFunc.UnregisterInspectorTreeGetterTest004()).assertEqual(0);
      console.info('[UnregisterInspectorTreeGetterTest004] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_NATIVE_MODULE_UNREGISTER_INSPECTOR_TREE_GETTER_0500
     * @tc.name   UnregisterInspectorTreeGetterTest005
     * @tc.desc   Register two callbacks, unregister all (nullptr), then register again, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UnregisterInspectorTreeGetterTest005', Level.LEVEL1, async (done: Function) => {
      console.info('[UnregisterInspectorTreeGetterTest005] START');
      expect(nativeFunc.UnregisterInspectorTreeGetterTest005()).assertEqual(0);
      console.info('[UnregisterInspectorTreeGetterTest005] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_NATIVE_MODULE_UNREGISTER_INSPECTOR_TREE_GETTER_0600
     * @tc.name   UnregisterInspectorTreeGetterTest006
     * @tc.desc   Unregister with nullptr node, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UnregisterInspectorTreeGetterTest006', Level.LEVEL2, async (done: Function) => {
      console.info('[UnregisterInspectorTreeGetterTest006] START');
      expect(nativeFunc.UnregisterInspectorTreeGetterTest006()).assertEqual(0);
      console.info('[UnregisterInspectorTreeGetterTest006] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_NATIVE_MODULE_UNREGISTER_INSPECTOR_TREE_GETTER_0700
     * @tc.name   UnregisterInspectorTreeGetterTest007
     * @tc.desc   Unregister on ARKUI_NODE_COLUMN (unsupported node type), expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UnregisterInspectorTreeGetterTest007', Level.LEVEL2, async (done: Function) => {
      console.info('[UnregisterInspectorTreeGetterTest007] START');
      expect(nativeFunc.UnregisterInspectorTreeGetterTest007()).assertEqual(0);
      console.info('[UnregisterInspectorTreeGetterTest007] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_NATIVE_MODULE_UNREGISTER_INSPECTOR_TREE_GETTER_0800
     * @tc.name   UnregisterInspectorTreeGetterTest008
     * @tc.desc   Unregister on ARKUI_NODE_BUTTON (unsupported node type), expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UnregisterInspectorTreeGetterTest008', Level.LEVEL2, async (done: Function) => {
      console.info('[UnregisterInspectorTreeGetterTest008] START');
      expect(nativeFunc.UnregisterInspectorTreeGetterTest008()).assertEqual(0);
      console.info('[UnregisterInspectorTreeGetterTest008] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_NATIVE_MODULE_UNREGISTER_INSPECTOR_TREE_GETTER_0900
     * @tc.name   UnregisterInspectorTreeGetterTest009
     * @tc.desc   Unregister with nullptr callback on node with no registered callbacks, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('UnregisterInspectorTreeGetterTest009', Level.LEVEL1, async (done: Function) => {
      console.info('[UnregisterInspectorTreeGetterTest009] START');
      expect(nativeFunc.UnregisterInspectorTreeGetterTest009()).assertEqual(0);
      console.info('[UnregisterInspectorTreeGetterTest009] END');
      done();
    })

    /**
     * @tc.number SUB_ACE_ARKUI_NATIVE_MODULE_UNREGISTER_INSPECTOR_TREE_GETTER_1000
     * @tc.name   UnregisterInspectorTreeGetterTest010
     * @tc.desc   Unregister never-registered non-null callback, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('UnregisterInspectorTreeGetterTest010', Level.LEVEL2, async (done: Function) => {
      console.info('[UnregisterInspectorTreeGetterTest010] START');
      expect(nativeFunc.UnregisterInspectorTreeGetterTest010()).assertEqual(0);
      console.info('[UnregisterInspectorTreeGetterTest010] END');
      done();
    })
  })
}
