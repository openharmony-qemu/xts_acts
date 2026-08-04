/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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

export default function ListEditModeOptionsTest() {
  describe('ListEditModeOptionsTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   ListEditModeOptionsTest_001
     * @tc.number SUB_ARKUI_LISTEDITMODEOPTIONS_TEST_0100
     * @tc.desc   ListEditModeOptionsTest_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ListEditModeOptionsTest_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ListEditModeOptionsTest_001()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ListEditModeOptionsTest_002
     * @tc.number SUB_ARKUI_LISTEDITMODEOPTIONS_TEST_0200
     * @tc.desc   Test the NODE_LIST_EDIT_MODE_OPTIONS with normal values(ARKUI_LIST_EDIT_MODE_OPTION_DELETE)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ListEditModeOptionsTest_002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ListEditModeOptionsTest_002()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ListEditModeOptionsTest_003
     * @tc.number SUB_ARKUI_LISTEDITMODEOPTIONS_TEST_0300
     * @tc.desc   Test the NODE_LIST_EDIT_MODE_OPTIONS with normal values(ARKUI_LIST_EDIT_MODE_OPTION_NONE)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ListEditModeOptionsTest_003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ListEditModeOptionsTest_003()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ListEditModeOptionsTest_004
     * @tc.number SUB_ARKUI_LISTEDITMODEOPTIONS_TEST_0400
     * @tc.desc   Test the NODE_LIST_EDIT_MODE_OPTIONS with values(undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ListEditModeOptionsTest_004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ListEditModeOptionsTest_004()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ListEditModeChangeTest_001
     * @tc.number SUB_ARKUI_LISTONEDITMODECHANGE_TEST_0100
     * @tc.desc   Test the NODE_LIST_ON_EDIT_MODE_CHANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ListEditModeChangeTest_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ListEditModeChangeTest_001()).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ListItemSelectTest_001
     * @tc.number SUB_ARKUI_LISTITEMONSELECT_TEST_0100
     * @tc.desc   Test the NODE_LIST_ITEM_ON_SELECT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ListItemSelectTest_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ListItemSelectTest_001()).assertEqual(0);
      done();
    });
  })
}