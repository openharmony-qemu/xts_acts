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

export default function ArcListChildrenMainSizeTest() {

  describe('ArcListChildrenMainSizeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   ArcListChildrenMainSizeTest_001
     * @tc.number SUB_ARKUI_ARCLISTCHILDRENMAINSIZE_TEST_0100
     * @tc.desc   Test NODE_ARC_LIST_CHILDREN_MAIN_SIZE with created ListChildrenMainSize object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListChildrenMainSize001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListChildrenMainSize001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcListChildrenMainSizeTest_002
     * @tc.number SUB_ARKUI_ARCLISTCHILDRENMAINSIZE_TEST_0200
     * @tc.desc   Test NODE_ARC_LIST_CHILDREN_MAIN_SIZE with null object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArcListChildrenMainSize002', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.testArcListChildrenMainSize002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcListChildrenMainSizeTest_003
     * @tc.number SUB_ARKUI_ARCLISTCHILDRENMAINSIZE_TEST_0300
     * @tc.desc   Test NODE_ARC_LIST_CHILDREN_MAIN_SIZE with disposed object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListChildrenMainSize003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListChildrenMainSize003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcListChildrenMainSizeTest_004
     * @tc.number SUB_ARKUI_ARCLISTCHILDRENMAINSIZE_TEST_0400
     * @tc.desc   Test OH_ArkUI_ListChildrenMainSizeOption_SetDefaultMainSize and GetDefaultMainSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListChildrenMainSize004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListChildrenMainSize004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcListChildrenMainSizeTest_005
     * @tc.number SUB_ARKUI_ARCLISTCHILDRENMAINSIZE_TEST_0500
     * @tc.desc   Test OH_ArkUI_ListChildrenMainSizeOption_Resize with negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListChildrenMainSize005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListChildrenMainSize005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcListChildrenMainSizeTest_006
     * @tc.number SUB_ARKUI_ARCLISTCHILDRENMAINSIZE_TEST_0600
     * @tc.desc   Test OH_ArkUI_ListChildrenMainSizeOption_Resize with zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListChildrenMainSize006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListChildrenMainSize006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcListChildrenMainSizeTest_007
     * @tc.number SUB_ARKUI_ARCLISTCHILDRENMAINSIZE_TEST_0700
     * @tc.desc   Test OH_ArkUI_ListChildrenMainSizeOption_Resize with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListChildrenMainSize007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListChildrenMainSize007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcListChildrenMainSizeTest_008
     * @tc.number SUB_ARKUI_ARCLISTCHILDRENMAINSIZE_TEST_0800
     * @tc.desc   Test OH_ArkUI_ListChildrenMainSizeOption_UpdateSize and GetMainSize with index 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListChildrenMainSize008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListChildrenMainSize008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcListChildrenMainSizeTest_009
     * @tc.number SUB_ARKUI_ARCLISTCHILDRENMAINSIZE_TEST_0900
     * @tc.desc   Test OH_ArkUI_ListChildrenMainSizeOption_UpdateSize with invalid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArcListChildrenMainSize009', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.testArcListChildrenMainSize009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcListChildrenMainSizeTest_010
     * @tc.number SUB_ARKUI_ARCLISTCHILDRENMAINSIZE_TEST_1000
     * @tc.desc   Test OH_ArkUI_ListChildrenMainSizeOption_GetMainSize with negative index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArcListChildrenMainSize010', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.testArcListChildrenMainSize010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcListChildrenMainSizeTest_011
     * @tc.number SUB_ARKUI_ARCLISTCHILDRENMAINSIZE_TEST_1100
     * @tc.desc   Test OH_ArkUI_ListChildrenMainSizeOption_UpdateSize with negative size value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArcListChildrenMainSize011', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.testArcListChildrenMainSize011()).assertEqual(0)
      done()
    })
  })
}