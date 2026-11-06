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

export default function BufferQueueSizeTest() {

  describe('BufferQueueSizeTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number SUB_ACE_ARKUI_BUFFERQUEUESIZE_0100
     * @tc.name   BufferQueueSizeTest001
     * @tc.desc   Set buffer queue size to 2 (normal value), verify set success and get correct value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('BufferQueueSizeTest001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.BufferQueueSizeTest001()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_BUFFERQUEUESIZE_0200
     * @tc.name   BufferQueueSizeTest002
     * @tc.desc   Set buffer queue size to 3 (normal value), verify set success and get correct value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('BufferQueueSizeTest002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.BufferQueueSizeTest002()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_BUFFERQUEUESIZE_0300
     * @tc.name   BufferQueueSizeTest003
     * @tc.desc   Set buffer queue size to 4 (normal value), verify set success and get correct value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('BufferQueueSizeTest003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.BufferQueueSizeTest003()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_BUFFERQUEUESIZE_0400
     * @tc.name   BufferQueueSizeTest004
     * @tc.desc   Set buffer queue size to 5 (default/max value), verify set success and get correct value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('BufferQueueSizeTest004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.BufferQueueSizeTest004()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_BUFFERQUEUESIZE_0500
     * @tc.name   BufferQueueSizeTest005
     * @tc.desc   Set buffer queue size to 2 (minimum boundary), verify set success and get correct value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('BufferQueueSizeTest005', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.BufferQueueSizeTest005()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_BUFFERQUEUESIZE_0600
     * @tc.name   BufferQueueSizeTest006
     * @tc.desc   Set buffer queue size to 5 (maximum boundary), verify set success and get correct value
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('BufferQueueSizeTest006', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.BufferQueueSizeTest006()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_BUFFERQUEUESIZE_0700
     * @tc.name   BufferQueueSizeTest007
     * @tc.desc   Set buffer queue size to 1 (below minimum), verify clamped to 2
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('BufferQueueSizeTest007', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.BufferQueueSizeTest007()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_BUFFERQUEUESIZE_0800
     * @tc.name   BufferQueueSizeTest008
     * @tc.desc   Set buffer queue size to 0 (below minimum), verify clamped to 2
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('BufferQueueSizeTest008', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.BufferQueueSizeTest008()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_BUFFERQUEUESIZE_0900
     * @tc.name   BufferQueueSizeTest009
     * @tc.desc   Set buffer queue size to -1 (negative), verify clamped to 2
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('BufferQueueSizeTest009', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.BufferQueueSizeTest009()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_BUFFERQUEUESIZE_1000
     * @tc.name   BufferQueueSizeTest010
     * @tc.desc   Set buffer queue size to 6 (above maximum), verify clamped to 5
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('BufferQueueSizeTest010', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.BufferQueueSizeTest010()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_BUFFERQUEUESIZE_1100
     * @tc.name   BufferQueueSizeTest011
     * @tc.desc   Set buffer queue size to 100 (far above maximum), verify clamped to 5
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('BufferQueueSizeTest011', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.BufferQueueSizeTest011()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_BUFFERQUEUESIZE_1200
     * @tc.name   BufferQueueSizeTest012
     * @tc.desc   Get default buffer queue size without setting, verify default is 5
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('BufferQueueSizeTest012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.BufferQueueSizeTest012()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_BUFFERQUEUESIZE_1300
     * @tc.name   BufferQueueSizeTest013
     * @tc.desc   Set attribute with null item, verify returns INVALID_PARAM
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('BufferQueueSizeTest013', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.BufferQueueSizeTest013()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_BUFFERQUEUESIZE_1400
     * @tc.name   BufferQueueSizeTest014
     * @tc.desc   Reset attribute after setting, verify value returns to default 5
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('BufferQueueSizeTest014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.BufferQueueSizeTest014()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_BUFFERQUEUESIZE_1500
     * @tc.name   BufferQueueSizeTest015
     * @tc.desc   Dynamically switch buffer queue size from 2 to 5, verify value changes correctly
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('BufferQueueSizeTest015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.BufferQueueSizeTest015()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_BUFFERQUEUESIZE_1600
     * @tc.name   BufferQueueSizeTest016
     * @tc.desc   Set the same value 2 multiple times, verify value remains stable
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('BufferQueueSizeTest016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.BufferQueueSizeTest016()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_BUFFERQUEUESIZE_1700
     * @tc.name   BufferQueueSizeTest017
     * @tc.desc   Set, reset, then set again, verify the attribute can be repeatedly operated
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('BufferQueueSizeTest017', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.BufferQueueSizeTest017()).assertEqual(0)
      done()
    })
  })
}
