/**
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

import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import nativeFunc from 'libnativefunc.so'

export default function ImageSpanResizableTest() {
  describe('ImageSpanResizableTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ImageSpanResizableTest beforeEach start");
      done();
    })

    /**
     * @tc.name   SUB_ARKUI_NODE_IMAGE_SPAN_RESIZABLE_0100
     * @tc.number SUB_ARKUI_NODE_IMAGE_SPAN_RESIZABLE_0100
     * @tc.desc   Test NODE_IMAGE_SPAN_RESIZABLE setAttribute with float slice and getAttribute
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_IMAGE_SPAN_RESIZABLE_0100', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_IMAGE_SPAN_RESIZABLE_0100 START');
      expect(nativeFunc.ImageSpanResizableTest_001()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_IMAGE_SPAN_RESIZABLE_0100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_IMAGE_SPAN_RESIZABLE_0200
     * @tc.number SUB_ARKUI_NODE_IMAGE_SPAN_RESIZABLE_0200
     * @tc.desc   Test NODE_IMAGE_SPAN_RESIZABLE resetAttribute
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_NODE_IMAGE_SPAN_RESIZABLE_0200', Level.LEVEL2, async () => {
      console.info('SUB_ARKUI_NODE_IMAGE_SPAN_RESIZABLE_0200 START');
      expect(nativeFunc.ImageSpanResizableTest_002()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_IMAGE_SPAN_RESIZABLE_0200 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_IMAGE_SPAN_RESIZABLE_0300
     * @tc.number SUB_ARKUI_NODE_IMAGE_SPAN_RESIZABLE_0300
     * @tc.desc   Test NODE_IMAGE_SPAN_RESIZABLE set then reset and get default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_NODE_IMAGE_SPAN_RESIZABLE_0300', Level.LEVEL2, async () => {
      console.info('SUB_ARKUI_NODE_IMAGE_SPAN_RESIZABLE_0300 START');
      expect(nativeFunc.ImageSpanResizableTest_003()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_IMAGE_SPAN_RESIZABLE_0300 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_IMAGE_SPAN_RESIZABLE_0400
     * @tc.number SUB_ARKUI_NODE_IMAGE_SPAN_RESIZABLE_0400
     * @tc.desc   Test NODE_IMAGE_SPAN_RESIZABLE getAttribute default without setting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_NODE_IMAGE_SPAN_RESIZABLE_0400', Level.LEVEL3, async () => {
      console.info('SUB_ARKUI_NODE_IMAGE_SPAN_RESIZABLE_0400 START');
      expect(nativeFunc.ImageSpanResizableTest_004()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_IMAGE_SPAN_RESIZABLE_0400 END');
    });
  });
}
