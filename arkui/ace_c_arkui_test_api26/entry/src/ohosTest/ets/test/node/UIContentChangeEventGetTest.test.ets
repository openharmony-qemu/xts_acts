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

import { afterEach, beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';

export default function UIContentChangeEventGetTest() {

  describe('UIContentChangeEventGetTest', () => {
    beforeAll(async (done: Function) => {
      await Utils.pushPage('node/UIContentChangeEventGetTest');
      await Utils.sleep(2500);
      done();
    })

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   UIContentChangeEventGetTypeTest
     * @tc.number SUB_ACE_ARKUI_UICONTENTCHANGEEVENTGETTYPE_0100
     * @tc.desc   Get event type from valid content change event, expect NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UIContentChangeEventGetTypeTest', Level.LEVEL1, async (done: Function) => {
      expect(Utils.getComponentInfoByKey('getTypeResultNode').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    })

    /**
     * @tc.name   UIContentChangeEventGetTimestampTest
     * @tc.number SUB_ACE_ARKUI_UICONTENTCHANGEEVENTGETTIMESTAMP_0200
     * @tc.desc   Get monotonic timestamp from valid content change event, expect NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UIContentChangeEventGetTimestampTest', Level.LEVEL1, async (done: Function) => {
      expect(Utils.getComponentInfoByKey('getTimestampResultNode').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    })

    /**
     * @tc.name   UIContentChangeEventGetContextTest
     * @tc.number SUB_ACE_ARKUI_UICONTENTCHANGEEVENTGETCONTEXT_0300
     * @tc.desc   Get UI context from valid content change event, expect NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UIContentChangeEventGetContextTest', Level.LEVEL1, async (done: Function) => {
      expect(Utils.getComponentInfoByKey('getContextResultNode').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    })

    /**
     * @tc.name   UIContentChangeEventGetContentChangeEventJsonTest
     * @tc.number SUB_ACE_ARKUI_UICONTENTCHANGEEVENTGETCONTENTCHANGEEVENTJSON_0400
     * @tc.desc   Get content change event json from valid event, expect NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UIContentChangeEventGetContentChangeEventJsonTest', Level.LEVEL1, async (done: Function) => {
      expect(Utils.getComponentInfoByKey('getJsonResultNode').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    })
  })
}
