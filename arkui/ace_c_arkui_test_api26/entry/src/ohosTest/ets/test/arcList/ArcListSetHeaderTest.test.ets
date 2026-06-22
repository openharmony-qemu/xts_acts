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

export default function ArcListSetHeaderTest() {

  describe('ArcListSetHeaderTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   ArcListSetHeaderTest_001
     * @tc.number SUB_ARKUI_ARCLISTSETHEADER_TEST_0100
     * @tc.desc   Test NODE_ARC_LIST_SET_HEADER with normal header node
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListSetHeader001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListSetHeader001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcListSetHeaderTest_002
     * @tc.number SUB_ARKUI_ARCLISTSETHEADER_TEST_0200
     * @tc.desc   Test NODE_ARC_LIST_SET_HEADER with null header node
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListSetHeader002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListSetHeader002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   ArcListSetHeaderTest_003
     * @tc.number SUB_ARKUI_ARCLISTSETHEADER_TEST_0300
     * @tc.desc   Test NODE_ARC_LIST_SET_HEADER reset attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArcListSetHeader003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testArcListSetHeader003()).assertEqual(0)
      done()
    })
  })
}