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

export default function ContentChangeEventTest() {

  describe('ContentChangeEventTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.number SUB_ACE_ARKUI_CONTENTCHANGEEVENT_0100
     * @tc.name   ContentChangeEventTest001
     * @tc.desc   Register with null uiContext, expect UI_CONTEXT_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ContentChangeEventTest001', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.ContentChangeEventTest001()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_CONTENTCHANGEEVENT_0200
     * @tc.name   ContentChangeEventTest002
     * @tc.desc   Register with null callback, expect CALLBACK_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ContentChangeEventTest002', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.ContentChangeEventTest002()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_CONTENTCHANGEEVENT_0300
     * @tc.name   ContentChangeEventTest003
     * @tc.desc   Register with eventMask 0, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ContentChangeEventTest003', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.ContentChangeEventTest003()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_CONTENTCHANGEEVENT_0400
     * @tc.name   ContentChangeEventTest004
     * @tc.desc   Register with invalid eventMask, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ContentChangeEventTest004', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.ContentChangeEventTest004()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_CONTENTCHANGEEVENT_0500
     * @tc.name   ContentChangeEventTest005
     * @tc.desc   Register with invalid ignoreMask, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ContentChangeEventTest005', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.ContentChangeEventTest005()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_CONTENTCHANGEEVENT_0600
     * @tc.name   ContentChangeEventTest006
     * @tc.desc   Register with null subscriptionId, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ContentChangeEventTest006', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.ContentChangeEventTest006()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_CONTENTCHANGEEVENT_0700
     * @tc.name   ContentChangeEventTest007
     * @tc.desc   Register with multiple invalid params, expect one of the documented error codes
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ContentChangeEventTest007', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.ContentChangeEventTest007()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_CONTENTCHANGEEVENT_0800
     * @tc.name   ContentChangeEventTest008
     * @tc.desc   Register with ALL event categories and unregister, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('ContentChangeEventTest008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ContentChangeEventTest008()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_CONTENTCHANGEEVENT_0900
     * @tc.name   ContentChangeEventTest009
     * @tc.desc   Register with PAGE category and unregister, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('ContentChangeEventTest009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ContentChangeEventTest009()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_CONTENTCHANGEEVENT_1000
     * @tc.name   ContentChangeEventTest010
     * @tc.desc   Register with SCROLL category and unregister, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('ContentChangeEventTest010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ContentChangeEventTest010()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_CONTENTCHANGEEVENT_1100
     * @tc.name   ContentChangeEventTest011
     * @tc.desc   Register with OVERLAY category and unregister, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('ContentChangeEventTest011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ContentChangeEventTest011()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_CONTENTCHANGEEVENT_1200
     * @tc.name   ContentChangeEventTest012
     * @tc.desc   Register with combined PAGE|SCROLL|OVERLAY categories and unregister, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('ContentChangeEventTest012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ContentChangeEventTest012()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_CONTENTCHANGEEVENT_1300
     * @tc.name   ContentChangeEventTest013
     * @tc.desc   Register with withStart false and unregister, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('ContentChangeEventTest013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ContentChangeEventTest013()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_CONTENTCHANGEEVENT_1400
     * @tc.name   ContentChangeEventTest014
     * @tc.desc   Register with ignoreMask IGNORE_SCROLLBY and unregister, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('ContentChangeEventTest014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ContentChangeEventTest014()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_CONTENTCHANGEEVENT_1500
     * @tc.name   ContentChangeEventTest015
     * @tc.desc   Register with ignoreMask IGNORE_SCROLLTO|IGNORE_TOAST and unregister, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('ContentChangeEventTest015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ContentChangeEventTest015()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_CONTENTCHANGEEVENT_1600
     * @tc.name   ContentChangeEventTest016
     * @tc.desc   Register with non-null userData and unregister, expect NO_ERROR
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('ContentChangeEventTest016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ContentChangeEventTest016()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_CONTENTCHANGEEVENT_1700
     * @tc.name   ContentChangeEventTest017
     * @tc.desc   Register two subscriptions, expect distinct subscription ids, unregister both
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('ContentChangeEventTest017', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ContentChangeEventTest017()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_CONTENTCHANGEEVENT_1800
     * @tc.name   ContentChangeEventTest018
     * @tc.desc   Unregister with null uiContext, expect UI_CONTEXT_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ContentChangeEventTest018', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.ContentChangeEventTest018()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_CONTENTCHANGEEVENT_1900
     * @tc.name   ContentChangeEventTest019
     * @tc.desc   Unregister with subscriptionId 0, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ContentChangeEventTest019', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.ContentChangeEventTest019()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_CONTENTCHANGEEVENT_2000
     * @tc.name   ContentChangeEventTest020
     * @tc.desc   Unregister with unknown subscriptionId, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ContentChangeEventTest020', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.ContentChangeEventTest020()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_CONTENTCHANGEEVENT_2100
     * @tc.name   ContentChangeEventTest021
     * @tc.desc   Unregister an already removed subscription, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ContentChangeEventTest021', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.ContentChangeEventTest021()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_CONTENTCHANGEEVENT_2200
     * @tc.name   ContentChangeEventTest022
     * @tc.desc   Verify event category enum values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('ContentChangeEventTest022', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ContentChangeEventTest022()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_CONTENTCHANGEEVENT_2300
     * @tc.name   ContentChangeEventTest023
     * @tc.desc   Verify ignore type enum values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('ContentChangeEventTest023', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ContentChangeEventTest023()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_CONTENTCHANGEEVENT_2400
     * @tc.name   ContentChangeEventTest024
     * @tc.desc   Verify event type enum values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('ContentChangeEventTest024', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.ContentChangeEventTest024()).assertEqual(0)
      done()
    })

    /**
     * @tc.number SUB_ACE_ARKUI_CONTENTCHANGEEVENT_2500
     * @tc.name   ContentChangeEventTest025
     * @tc.desc   Snapshot getters with null event, expect PARAM_INVALID
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('ContentChangeEventTest025', Level.LEVEL2, async (done: Function) => {
      expect(nativeFunc.ContentChangeEventTest025()).assertEqual(0)
      done()
    })
  })
}
