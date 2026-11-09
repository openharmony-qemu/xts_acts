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
 
export default function CollectionEnumTest() {
  describe('CollectionEnumTest', () => {
    beforeEach(async (done: Function) => {
      console.info("CollectionEnumTest beforeEach start");
      done();
    })
 
    // ==================== CollectionEnumTest 枚举值测试 ====================
 
    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_NONE_0010
     * @tc.number SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_NONE_0010
     * @tc.desc   Test OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_NONE == 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_NONE_0010', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_NONE_0010 START');
      expect(nativeFunc.CollectionEnumTest_001()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_NONE_0010 END');
    });
 
    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_TAP_0020
     * @tc.number SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_TAP_0020
     * @tc.desc   Test OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_TAP == 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_TAP_0020', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_TAP_0020 START');
      expect(nativeFunc.CollectionEnumTest_002()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_TAP_0020 END');
    });
 
    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_CLICK_0030
     * @tc.number SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_CLICK_0030
     * @tc.desc   Test OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_CLICK == 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_CLICK_0030', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_CLICK_0030 START');
      expect(nativeFunc.CollectionEnumTest_003()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_CLICK_0030 END');
    });
 
    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_LONG_PRESS_0040
     * @tc.number SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_LONG_PRESS_0040
     * @tc.desc   Test OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_LONG_PRESS == 4
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_LONG_PRESS_0040', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_LONG_PRESS_0040 START');
      expect(nativeFunc.CollectionEnumTest_004()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_LONG_PRESS_0040 END');
    });
 
    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_PAN_0050
     * @tc.number SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_PAN_0050
     * @tc.desc   Test OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_PAN == 8
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_PAN_0050', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_PAN_0050 START');
      expect(nativeFunc.CollectionEnumTest_005()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_PAN_0050 END');
    });
 
    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_PINCH_0060
     * @tc.number SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_PINCH_0060
     * @tc.desc   Test OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_PINCH == 16
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_PINCH_0060', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_PINCH_0060 START');
      expect(nativeFunc.CollectionEnumTest_006()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_PINCH_0060 END');
    });
 
    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_ROTATION_0070
     * @tc.number SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_ROTATION_0070
     * @tc.desc   Test OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_ROTATION == 32
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_ROTATION_0070', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_ROTATION_0070 START');
      expect(nativeFunc.CollectionEnumTest_007()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_ROTATION_0070 END');
    });
 
    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_SWIPE_0080
     * @tc.number SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_SWIPE_0080
     * @tc.desc   Test OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_SWIPE == 64
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_SWIPE_0080', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_SWIPE_0080 START');
      expect(nativeFunc.CollectionEnumTest_008()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_SWIPE_0080 END');
    });
 
    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_DRAG_0090
     * @tc.number SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_DRAG_0090
     * @tc.desc   Test OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_DRAG == 128
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_DRAG_0090', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_DRAG_0090 START');
      expect(nativeFunc.CollectionEnumTest_009()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_DRAG_0090 END');
    });
 
    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_TOUCH_0100
     * @tc.number SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_TOUCH_0100
     * @tc.desc   Test OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_TOUCH == 256
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_TOUCH_0100', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_TOUCH_0100 START');
      expect(nativeFunc.CollectionEnumTest_010()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_UIINFOCOLLECTION_INTERACTION_EVENT_TOUCH_0100 END');
    });
 
    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_PAGE_0110
     * @tc.number SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_PAGE_0110
     * @tc.desc   Test OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_PAGE == 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_PAGE_0110', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_PAGE_0110 START');
      expect(nativeFunc.CollectionEnumTest_011()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_PAGE_0110 END');
    });
 
    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_SCROLL_0120
     * @tc.number SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_SCROLL_0120
     * @tc.desc   Test OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_SCROLL == 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_SCROLL_0120', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_SCROLL_0120 START');
      expect(nativeFunc.CollectionEnumTest_012()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_SCROLL_0120 END');
    });
 
    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_OVERLAY_0130
     * @tc.number SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_OVERLAY_0130
     * @tc.desc   Test OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_OVERLAY == 4
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_OVERLAY_0130', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_OVERLAY_0130 START');
      expect(nativeFunc.CollectionEnumTest_013()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_OVERLAY_0130 END');
    });
 
    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_ALL_0140
     * @tc.number SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_ALL_0140
     * @tc.desc   Test OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_ALL == 4294967295
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_ALL_0140', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_ALL_0140 START');
      expect(nativeFunc.CollectionEnumTest_014()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_ALL_0140 END');
    });
 
    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_NATIVEMODULE_CONTENTCHANGE_IGNORE_SCROLLBY_0150
     * @tc.number SUB_ARKUI_OH_ARKUI_NATIVEMODULE_CONTENTCHANGE_IGNORE_SCROLLBY_0150
     * @tc.desc   Test OH_ARKUI_NATIVEMODULE_CONTENTCHANGE_IGNORE_SCROLLBY == 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_CONTENTCHANGE_IGNORE_SCROLLBY_0150', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_CONTENTCHANGE_IGNORE_SCROLLBY_0150 START');
      expect(nativeFunc.CollectionEnumTest_015()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_CONTENTCHANGE_IGNORE_SCROLLBY_0150 END');
    });
 
    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_NATIVEMODULE_CONTENTCHANGE_IGNORE_SCROLLTO_0160
     * @tc.number SUB_ARKUI_OH_ARKUI_NATIVEMODULE_CONTENTCHANGE_IGNORE_SCROLLTO_0160
     * @tc.desc   Test OH_ARKUI_NATIVEMODULE_CONTENTCHANGE_IGNORE_SCROLLTO == 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_CONTENTCHANGE_IGNORE_SCROLLTO_0160', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_CONTENTCHANGE_IGNORE_SCROLLTO_0160 START');
      expect(nativeFunc.CollectionEnumTest_016()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_CONTENTCHANGE_IGNORE_SCROLLTO_0160 END');
    });
 
    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_NATIVEMODULE_CONTENTCHANGE_IGNORE_TOAST_0170
     * @tc.number SUB_ARKUI_OH_ARKUI_NATIVEMODULE_CONTENTCHANGE_IGNORE_TOAST_0170
     * @tc.desc   Test OH_ARKUI_NATIVEMODULE_CONTENTCHANGE_IGNORE_TOAST == 4
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_CONTENTCHANGE_IGNORE_TOAST_0170', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_CONTENTCHANGE_IGNORE_TOAST_0170 START');
      expect(nativeFunc.CollectionEnumTest_017()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_CONTENTCHANGE_IGNORE_TOAST_0170 END');
    });
 
    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_PAGE_CHANGE_START_0180
     * @tc.number SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_PAGE_CHANGE_START_0180
     * @tc.desc   Test OH_ARKUI_NATIVEMODULE_EVENT_PAGE_CHANGE_START == 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_PAGE_CHANGE_START_0180', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_PAGE_CHANGE_START_0180 START');
      expect(nativeFunc.CollectionEnumTest_018()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_PAGE_CHANGE_START_0180 END');
    });
 
    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_PAGE_CHANGE_END_0190
     * @tc.number SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_PAGE_CHANGE_END_0190
     * @tc.desc   Test OH_ARKUI_NATIVEMODULE_EVENT_PAGE_CHANGE_END == 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_PAGE_CHANGE_END_0190', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_PAGE_CHANGE_END_0190 START');
      expect(nativeFunc.CollectionEnumTest_019()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_PAGE_CHANGE_END_0190 END');
    });
 
    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_SCROLL_START_0200
     * @tc.number SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_SCROLL_START_0200
     * @tc.desc   Test OH_ARKUI_NATIVEMODULE_EVENT_SCROLL_START == 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_SCROLL_START_0200', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_SCROLL_START_0200 START');
      expect(nativeFunc.CollectionEnumTest_020()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_SCROLL_START_0200 END');
    });
 
    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_SCROLL_END_0210
     * @tc.number SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_SCROLL_END_0210
     * @tc.desc   Test OH_ARKUI_NATIVEMODULE_EVENT_SCROLL_END == 3
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_SCROLL_END_0210', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_SCROLL_END_0210 START');
      expect(nativeFunc.CollectionEnumTest_021()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_SCROLL_END_0210 END');
    });
 
    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_OVERLAY_SHOW_0220
     * @tc.number SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_OVERLAY_SHOW_0220
     * @tc.desc   Test OH_ARKUI_NATIVEMODULE_EVENT_OVERLAY_SHOW == 4
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_OVERLAY_SHOW_0220', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_OVERLAY_SHOW_0220 START');
      expect(nativeFunc.CollectionEnumTest_022()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_OVERLAY_SHOW_0220 END');
    });
 
    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_OVERLAY_HIDE_0230
     * @tc.number SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_OVERLAY_HIDE_0230
     * @tc.desc   Test OH_ARKUI_NATIVEMODULE_EVENT_OVERLAY_HIDE == 5
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_OVERLAY_HIDE_0230', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_OVERLAY_HIDE_0230 START');
      expect(nativeFunc.CollectionEnumTest_023()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_OVERLAY_HIDE_0230 END');
    });
 
    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_SWIPER_START_0240
     * @tc.number SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_SWIPER_START_0240
     * @tc.desc   Test OH_ARKUI_NATIVEMODULE_EVENT_SWIPER_START == 6
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_SWIPER_START_0240', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_SWIPER_START_0240 START');
      expect(nativeFunc.CollectionEnumTest_024()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_SWIPER_START_0240 END');
    });
 
    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_SWIPER_END_0250
     * @tc.number SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_SWIPER_END_0250
     * @tc.desc   Test OH_ARKUI_NATIVEMODULE_EVENT_SWIPER_END == 7
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_SWIPER_END_0250', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_SWIPER_END_0250 START');
      expect(nativeFunc.CollectionEnumTest_025()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_SWIPER_END_0250 END');
    });
 
    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_SWIPER_CANCEL_0260
     * @tc.number SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_SWIPER_CANCEL_0260
     * @tc.desc   Test OH_ARKUI_NATIVEMODULE_EVENT_SWIPER_CANCEL == 8
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_SWIPER_CANCEL_0260', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_SWIPER_CANCEL_0260 START');
      expect(nativeFunc.CollectionEnumTest_026()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_SWIPER_CANCEL_0260 END');
    });
 
    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_TABS_START_0270
     * @tc.number SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_TABS_START_0270
     * @tc.desc   Test OH_ARKUI_NATIVEMODULE_EVENT_TABS_START == 9
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_TABS_START_0270', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_TABS_START_0270 START');
      expect(nativeFunc.CollectionEnumTest_027()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_TABS_START_0270 END');
    });
 
    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_TABS_END_0280
     * @tc.number SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_TABS_END_0280
     * @tc.desc   Test OH_ARKUI_NATIVEMODULE_EVENT_TABS_END == 10
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_TABS_END_0280', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_TABS_END_0280 START');
      expect(nativeFunc.CollectionEnumTest_028()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_TABS_END_0280 END');
    });
 
    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_TABS_CANCEL_0290
     * @tc.number SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_TABS_CANCEL_0290
     * @tc.desc   Test OH_ARKUI_NATIVEMODULE_EVENT_TABS_CANCEL == 11
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_TABS_CANCEL_0290', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_TABS_CANCEL_0290 START');
      expect(nativeFunc.CollectionEnumTest_029()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_NATIVEMODULE_EVENT_TABS_CANCEL_0290 END');
    });

    /**
     * @tc.name   SUB_ARKUI_ARKUI_ERROR_CODE_COMMAND_UNFINISHED_0300
     * @tc.number SUB_ARKUI_ARKUI_ERROR_CODE_COMMAND_UNFINISHED_0300
     * @tc.desc   Test ARKUI_ERROR_CODE_COMMAND_UNFINISHED == 106409
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_ARKUI_ERROR_CODE_COMMAND_UNFINISHED_0300', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_ARKUI_ERROR_CODE_COMMAND_UNFINISHED_0300 START');
      expect(nativeFunc.CollectionEnumTest_030()).assertEqual(0)
      console.info('SUB_ARKUI_ARKUI_ERROR_CODE_COMMAND_UNFINISHED_0300 END');
    });

    /**
     * @tc.name   SUB_ARKUI_ERROR_CODE_NODE_NOT_FOUND_0310
     * @tc.number SUB_ARKUI_ERROR_CODE_NODE_NOT_FOUND_0310
     * @tc.desc   Test ARKUI_ERROR_CODE_NODE_NOT_FOUND == 106410
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_ERROR_CODE_NODE_NOT_FOUND_0310', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_ERROR_CODE_NODE_NOT_FOUND_0310 START');
      expect(nativeFunc.CollectionEnumTest_031()).assertEqual(0)
      console.info('SUB_ARKUI_ERROR_CODE_NODE_NOT_FOUND_0310 END');
    });

    /**
     * @tc.name   SUB_ARKUI_ERROR_CODE_RESULT_TOO_LARGE_0320
     * @tc.number SUB_ARKUI_ERROR_CODE_RESULT_TOO_LARGE_0320
     * @tc.desc   Test ARKUI_ERROR_CODE_RESULT_TOO_LARGE == 106411
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_ERROR_CODE_RESULT_TOO_LARGE_0320', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_ERROR_CODE_RESULT_TOO_LARGE_0320 START');
      expect(nativeFunc.CollectionEnumTest_032()).assertEqual(0)
      console.info('SUB_ARKUI_ERROR_CODE_RESULT_TOO_LARGE_0320 END');
    });

    /**
     * @tc.name   SUB_ARKUI_ERROR_CODE_RESOURCE_EXHAUSTED_0330
     * @tc.number SUB_ARKUI_ERROR_CODE_RESOURCE_EXHAUSTED_0330
     * @tc.desc   Test ARKUI_ERROR_CODE_RESOURCE_EXHAUSTED == 106412
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_ERROR_CODE_RESOURCE_EXHAUSTED_0330', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_ERROR_CODE_RESOURCE_EXHAUSTED_0330 START');
      expect(nativeFunc.CollectionEnumTest_033()).assertEqual(0)
      console.info('SUB_ARKUI_ERROR_CODE_RESOURCE_EXHAUSTED_0330 END');
    });

    /**
     * @tc.name   SUB_ARKUI_ERROR_CODE_DUPLICATE_NODE_ID_0340
     * @tc.number SUB_ARKUI_ERROR_CODE_DUPLICATE_NODE_ID_0340
     * @tc.desc   Test ARKUI_ERROR_CODE_DUPLICATE_NODE_ID == 106413
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_ERROR_CODE_DUPLICATE_NODE_ID_0340', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_ERROR_CODE_DUPLICATE_NODE_ID_0340 START');
      expect(nativeFunc.CollectionEnumTest_034()).assertEqual(0)
      console.info('SUB_ARKUI_ERROR_CODE_DUPLICATE_NODE_ID_0340 END');
    });

    /**
     * @tc.name   SUB_ARKUI_ERROR_CODE_COLLECTION_PARTIAL_FAILED_0350
     * @tc.number SUB_ARKUI_ERROR_CODE_COLLECTION_PARTIAL_FAILED_0350
     * @tc.desc   Test ARKUI_ERROR_CODE_COLLECTION_PARTIAL_FAILED == 106414
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_ERROR_CODE_COLLECTION_PARTIAL_FAILED_0350', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_ERROR_CODE_COLLECTION_PARTIAL_FAILED_0350 START');
      expect(nativeFunc.CollectionEnumTest_035()).assertEqual(0)
      console.info('SUB_ARKUI_ERROR_CODE_COLLECTION_PARTIAL_FAILED_0350 END');
    });

    /**
     * @tc.name   SUB_ARKUI_ERROR_CODE_COLLECTION_ITEM_NOT_FOUND_0360
     * @tc.number SUB_ARKUI_ERROR_CODE_COLLECTION_ITEM_NOT_FOUND_0360
     * @tc.desc   Test ARKUI_ERROR_CODE_COLLECTION_ITEM_NOT_FOUND == 106415
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_ERROR_CODE_COLLECTION_ITEM_NOT_FOUND_0360', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_ERROR_CODE_COLLECTION_ITEM_NOT_FOUND_0360 START');
      expect(nativeFunc.CollectionEnumTest_036()).assertEqual(0)
      console.info('SUB_ARKUI_ERROR_CODE_COLLECTION_ITEM_NOT_FOUND_0360 END');
    });

    /**
     * @tc.name   SUB_ARKUI_ERROR_CODE_COLLECTION_ITEM_ALREADY_TAKEN_0370
     * @tc.number SUB_ARKUI_ERROR_CODE_COLLECTION_ITEM_ALREADY_TAKEN_0370
     * @tc.desc   Test ARKUI_ERROR_CODE_COLLECTION_ITEM_ALREADY_TAKEN == 106416
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_ERROR_CODE_COLLECTION_ITEM_ALREADY_TAKEN_0370', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_ERROR_CODE_COLLECTION_ITEM_ALREADY_TAKEN_0370 START');
      expect(nativeFunc.CollectionEnumTest_037()).assertEqual(0)
      console.info('SUB_ARKUI_ERROR_CODE_COLLECTION_ITEM_ALREADY_TAKEN_0370 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_LEFT_0380
     * @tc.number SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_LEFT_0380
     * @tc.desc   Test OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_LEFT == 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_LEFT_0380', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_LEFT_0380 START');
      expect(nativeFunc.CollectionEnumTest_038()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_LEFT_0380 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_TOP_0390
     * @tc.number SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_TOP_0390
     * @tc.desc   Test OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_TOP == 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_TOP_0390', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_TOP_0390 START');
      expect(nativeFunc.CollectionEnumTest_039()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_TOP_0390 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_RIGHT_0400
     * @tc.number SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_RIGHT_0400
     * @tc.desc   Test OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_RIGHT == 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_RIGHT_0400', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_RIGHT_0400 START');
      expect(nativeFunc.CollectionEnumTest_040()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_RIGHT_0400 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_BOTTOM_0410
     * @tc.number SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_BOTTOM_0410
     * @tc.desc   Test OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_BOTTOM == 3
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_BOTTOM_0410', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_BOTTOM_0410 START');
      expect(nativeFunc.CollectionEnumTest_041()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_BOTTOM_0410 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_LEFT_TOP_0420
     * @tc.number SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_LEFT_TOP_0420
     * @tc.desc   Test OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_LEFT_TOP == 4
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_LEFT_TOP_0420', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_LEFT_TOP_0420 START');
      expect(nativeFunc.CollectionEnumTest_042()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_LEFT_TOP_0420 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_LEFT_BOTTOM_0430
     * @tc.number SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_LEFT_BOTTOM_0430
     * @tc.desc   Test OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_LEFT_BOTTOM == 5
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_LEFT_BOTTOM_0430', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_LEFT_BOTTOM_0430 START');
      expect(nativeFunc.CollectionEnumTest_043()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_LEFT_BOTTOM_0430 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_RIGHT_TOP_0440
     * @tc.number SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_RIGHT_TOP_0440
     * @tc.desc   Test OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_RIGHT_TOP == 6
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_RIGHT_TOP_0440', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_RIGHT_TOP_0440 START');
      expect(nativeFunc.CollectionEnumTest_044()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_RIGHT_TOP_0440 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_RIGHT_BOTTOM_0450
     * @tc.number SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_RIGHT_BOTTOM_0450
     * @tc.desc   Test OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_RIGHT_BOTTOM == 7
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_RIGHT_BOTTOM_0450', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_RIGHT_BOTTOM_0450 START');
      expect(nativeFunc.CollectionEnumTest_045()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_LINEAR_GRADIENT_BLUR_DIRECTION_RIGHT_BOTTOM_0450 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_NATIVE_MODULE_UI_JSON_COMPACT_0460
     * @tc.number SUB_ARKUI_OH_ARKUI_NATIVE_MODULE_UI_JSON_COMPACT_0460
     * @tc.desc   Test OH_ARKUI_NATIVE_MODULE_UI_JSON_COMPACT == 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_NATIVE_MODULE_UI_JSON_COMPACT_0460', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_NATIVE_MODULE_UI_JSON_COMPACT_0460 START');
      expect(nativeFunc.CollectionEnumTest_046()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_NATIVE_MODULE_UI_JSON_COMPACT_0460 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_NATIVE_MODULE_UI_JSON_PRETTY_0470
     * @tc.number SUB_ARKUI_OH_ARKUI_NATIVE_MODULE_UI_JSON_PRETTY_0470
     * @tc.desc   Test OH_ARKUI_NATIVE_MODULE_UI_JSON_PRETTY == 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_NATIVE_MODULE_UI_JSON_PRETTY_0470', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_NATIVE_MODULE_UI_JSON_PRETTY_0470 START');
      expect(nativeFunc.CollectionEnumTest_047()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_NATIVE_MODULE_UI_JSON_PRETTY_0470 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NAV_DESTINATION_STATE_ON_ACTIVE_0480
     * @tc.number SUB_ARKUI_NAV_DESTINATION_STATE_ON_ACTIVE_0480
     * @tc.desc   Test ARKUI_NAV_DESTINATION_STATE_ON_ACTIVE == 8
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NAV_DESTINATION_STATE_ON_ACTIVE_0480', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NAV_DESTINATION_STATE_ON_ACTIVE_0480 START');
      expect(nativeFunc.CollectionEnumTest_048()).assertEqual(0)
      console.info('SUB_ARKUI_NAV_DESTINATION_STATE_ON_ACTIVE_0480 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NAV_DESTINATION_STATE_ON_INACTIVE_0490
     * @tc.number SUB_ARKUI_NAV_DESTINATION_STATE_ON_INACTIVE_0490
     * @tc.desc   Test ARKUI_NAV_DESTINATION_STATE_ON_INACTIVE == 9
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NAV_DESTINATION_STATE_ON_INACTIVE_0490', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NAV_DESTINATION_STATE_ON_INACTIVE_0490 START');
      expect(nativeFunc.CollectionEnumTest_049()).assertEqual(0)
      console.info('SUB_ARKUI_NAV_DESTINATION_STATE_ON_INACTIVE_0490 END');
    });
  });
}
