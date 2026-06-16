/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

export default function arcListItemAutoScaleTest() {

  describe('ArcListItemAutoScaleTest', () => {

    /**
     * @tc.name   testArcListItemAutoScaleSet001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ITEM_AUTO_SCALE_SET_0001
     * @tc.desc   testing item auto scale set for arcList with value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListItemAutoScaleSet001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListItemAutoScaleSet001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListItemAutoScaleSet002
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ITEM_AUTO_SCALE_SET_0002
     * @tc.desc   testing item auto scale set for arcList with value 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListItemAutoScaleSet002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListItemAutoScaleSet002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListItemAutoScaleGet001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ITEM_AUTO_SCALE_GET_0001
     * @tc.desc   testing item auto scale get for arcList with value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListItemAutoScaleGet001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListItemAutoScaleGet001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListItemAutoScaleGet002
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_ITEM_AUTO_SCALE_GET_0002
     * @tc.desc   testing item auto scale get for arcList default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListItemAutoScaleGet002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListItemAutoScaleGet002()).assertEqual(0)
      done()
    })
  })
}