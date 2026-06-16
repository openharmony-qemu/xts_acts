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

export default function arcListSetHeaderTest() {

  describe('ArcListSetHeaderTest', () => {

    /**
     * @tc.name   testArcListSetHeaderSet001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_SET_HEADER_SET_0001
     * @tc.desc   testing set header for arcList with column node
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListSetHeaderSet001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListSetHeaderSet001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListSetHeaderSet002
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_SET_HEADER_SET_0002
     * @tc.desc   testing set header for arcList with text node
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListSetHeaderSet002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListSetHeaderSet002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListSetHeaderGet001
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_SET_HEADER_GET_0001
     * @tc.desc   testing get header for arcList with column node
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListSetHeaderGet001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListSetHeaderGet001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testArcListSetHeaderGet002
     * @tc.number SUB_ARKUI_CAPI_ARC_LIST_SET_HEADER_GET_0002
     * @tc.desc   testing get header for arcList default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListSetHeaderGet002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListSetHeaderGet002()).assertEqual(0)
      done()
    })
  })
}