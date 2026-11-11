/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';

export default function EnumTest() {

  describe('EnumTest', () => {

    beforeEach(async (done: Function) => {
      console.info("EnumTest beforeEach start");
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_INTERACTIVE_ATTRIBUTES_DRAG_PREVIEW_MODE_0100
     * @tc.name      DragPreviewMode_0100
     * @tc.desc      DragPreviewMode
     * @tc.level  LEVEL3
     * @tc.type
     * @tc.size
     */
    it('DragPreviewMode_0100', Level.LEVEL3, async (done: Function) => {
      console.info('DragPreviewMode_0100 START');
      expect(DragPreviewMode.ENABLE_DRAG_ITEM_GRAY_EFFECT).assertEqual(5);
      console.info("[DragPreviewMode_0100] end");
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_INTERACTIVE_ATTRIBUTES_DRAG_PREVIEW_MODE_0200
     * @tc.name      DragPreviewMode_0200
     * @tc.desc      DragPreviewMode
     * @tc.level  LEVEL3
     * @tc.type
     * @tc.size
     */
    it('DragPreviewMode_0200', Level.LEVEL3, async (done: Function) => {
      console.info('DragPreviewMode_0200 START');
      expect(DragPreviewMode.ENABLE_MULTI_TILE_EFFECT).assertEqual(6);
      console.info("[DragPreviewMode_0200] end");
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_INTERACTIVE_ATTRIBUTES_TOUCH_TYPE_0100
     * @tc.name      TouchType_0100
     * @tc.desc      TouchType
     * @tc.level  LEVEL3
     * @tc.type
     * @tc.size
     */
    it('TouchType_0100', Level.LEVEL3, async (done: Function) => {
      console.info('TouchType_0100 START');
      expect(TouchType.HOVER_ENTER).assertEqual(9);
      console.info("[TouchType_0100] end");
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_INTERACTIVE_ATTRIBUTES_TOUCH_TYPE_0200
     * @tc.name      TouchType_0200
     * @tc.desc      TouchType
     * @tc.level  LEVEL3
     * @tc.type
     * @tc.size
     */
    it('TouchType_0200', Level.LEVEL3, async (done: Function) => {
      console.info('TouchType_0200 START');
      expect(TouchType.HOVER_MOVE).assertEqual(10);
      console.info("[TouchType_0200] end");
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_INTERACTIVE_ATTRIBUTES_TOUCH_TYPE_0300
     * @tc.name      TouchType_0300
     * @tc.desc      TouchType
     * @tc.level  LEVEL3
     * @tc.type
     * @tc.size
     */
    it('TouchType_0300', Level.LEVEL3, async (done: Function) => {
      console.info('TouchType_0300 START');
      expect(TouchType.HOVER_EXIT).assertEqual(11);
      console.info("[TouchType_0300] end");
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_INTERACTIVE_ATTRIBUTES_TOUCH_TYPE_0400
     * @tc.name      TouchType_0400
     * @tc.desc      TouchType
     * @tc.level  LEVEL3
     * @tc.type
     * @tc.size
     */
    it('TouchType_0400', Level.LEVEL3, async (done: Function) => {
      console.info('TouchType_0400 START');
      expect(TouchType.HOVER_CANCEL).assertEqual(12);
      console.info("[TouchType_0400] end");
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_INTERACTIVE_ATTRIBUTES_INTERACTION_HAND_0100
     * @tc.name      InteractionHand_0100
     * @tc.desc      InteractionHand
     * @tc.level  LEVEL3
     * @tc.type
     * @tc.size
     */
    it('InteractionHand_0100', Level.LEVEL3, async (done: Function) => {
      console.info('InteractionHand_0100 START');
      expect(InteractionHand.NONE).assertEqual(0);
      console.info("[InteractionHand_0100] end");
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_INTERACTIVE_ATTRIBUTES_INTERACTION_HAND_0200
     * @tc.name      InteractionHand_0200
     * @tc.desc      InteractionHan
     * @tc.level  LEVEL3
     * @tc.type
     * @tc.size
     */
    it('InteractionHand_0200', Level.LEVEL3, async (done: Function) => {
      console.info('InteractionHand_0200 START');
      expect(InteractionHand.LEFT).assertEqual(1);
      console.info("[InteractionHand_0200] end");
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_INTERACTIVE_ATTRIBUTES_INTERACTION_HAND_0300
     * @tc.name      InteractionHand_0300
     * @tc.desc      InteractionHand
     * @tc.level  LEVEL3
     * @tc.type
     * @tc.size
     */
    it('InteractionHand_0300', Level.LEVEL3, async (done: Function) => {
      console.info('InteractionHand_0300 START');
      expect(InteractionHand.RIGHT).assertEqual(2);
      console.info("[InteractionHand_0300] end");
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_INTERACTIVE_ATTRIBUTES_MOUSE_ACTION_0100
     * @tc.name      MouseAction_0100
     * @tc.desc      TouchType
     * @tc.level  LEVEL3
     * @tc.type
     * @tc.size
     */
    it('MouseAction_0100', Level.LEVEL3, async (done: Function) => {
      console.info('MouseAction_0100 START');
      expect(MouseAction.CANCEL).assertEqual(13);
      console.info("[MouseAction_0100] end");
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_INTERACTIVE_ATTRIBUTES_KEY_SOURCE_0100
     * @tc.name      KeySource_0100
     * @tc.desc      KeySource
     * @tc.level  LEVEL3
     * @tc.type
     * @tc.size
     */
    it('KeySource_0100', Level.LEVEL3, async (done: Function) => {
      console.info('KeySource_0100 START');
      expect(KeySource.Unknown).assertEqual(0);
      console.info("[KeySource_0100] end");
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_INTERACTIVE_ATTRIBUTES_KEY_SOURCE_0200
     * @tc.name      KeySource_0200
     * @tc.desc      KeySource
     * @tc.level  LEVEL3
     * @tc.type
     * @tc.size
     */
    it('KeySource_0200', Level.LEVEL3, async (done: Function) => {
      console.info('KeySource_0200 START');
      expect(KeySource.JOYSTICK).assertEqual(5);
      console.info("[KeySource_0200] end");
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_INTERACTIVE_ATTRIBUTES_CROWN_ACTION_0100
     * @tc.name      CrownAction_0100
     * @tc.desc      CrownAction
     * @tc.level  LEVEL3
     * @tc.type
     * @tc.size
     */
    it('CrownAction_0100', Level.LEVEL3, async (done: Function) => {
      console.info('CrownAction_0100 START');
      expect(CrownAction.BEGIN).assertEqual(0);
      console.info("[CrownAction_0100] end");
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_INTERACTIVE_ATTRIBUTES_CROWN_ACTION_0200
     * @tc.name      CrownAction_0200
     * @tc.desc      CrownAction
     * @tc.level  LEVEL3
     * @tc.type
     * @tc.size
     */
    it('CrownAction_0200', Level.LEVEL3, async (done: Function) => {
      console.info('CrownAction_0200 START');
      expect(CrownAction.UPDATE).assertEqual(1);
      console.info("[CrownAction_0200] end");
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_INTERACTIVE_ATTRIBUTES_CROWN_ACTION_0300
     * @tc.name      CrownAction_0300
     * @tc.desc      CrownAction
     * @tc.level  LEVEL3
     * @tc.type
     * @tc.size
     */
    it('CrownAction_0300', Level.LEVEL3, async (done: Function) => {
      console.info('CrownAction_0300 START');
      expect(CrownAction.END).assertEqual(2);
      console.info("[CrownAction_0300] end");
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_INTERACTIVE_ATTRIBUTES_RESPONSE_REGION_TOOL_0100
     * @tc.name      ResponseRegionSupportedTool_0100
     * @tc.desc      ResponseRegionSupportedTool
     * @tc.level  LEVEL3
     * @tc.type
     * @tc.size
     */
    it('ResponseRegionSupportedTool_0100', Level.LEVEL3, async (done: Function) => {
      console.info('ResponseRegionSupportedTool_0100 START');
      expect(ResponseRegionSupportedTool.ALL).assertEqual(0);
      console.info("[ResponseRegionSupportedTool_0100] end");
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_INTERACTIVE_ATTRIBUTES_RESPONSE_REGION_TOOL_0200
     * @tc.name      ResponseRegionSupportedTool_0200
     * @tc.desc      ResponseRegionSupportedTool
     * @tc.level  LEVEL3
     * @tc.type
     * @tc.size
     */
    it('ResponseRegionSupportedTool_0200', Level.LEVEL3, async (done: Function) => {
      console.info('ResponseRegionSupportedTool_0200 START');
      expect(ResponseRegionSupportedTool.FINGER).assertEqual(1);
      console.info("[ResponseRegionSupportedTool_0200] end");
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_INTERACTIVE_ATTRIBUTES_RESPONSE_REGION_TOOL_0300
     * @tc.name      ResponseRegionSupportedTool_0300
     * @tc.desc      ResponseRegionSupportedTool
     * @tc.level  LEVEL3
     * @tc.type
     * @tc.size
     */
    it('ResponseRegionSupportedTool_0300', Level.LEVEL3, async (done: Function) => {
      console.info('ResponseRegionSupportedTool_0300 START');
      expect(ResponseRegionSupportedTool.PEN).assertEqual(2);
      console.info("[ResponseRegionSupportedTool_0300] end");
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_INTERACTIVE_ATTRIBUTES_RESPONSE_REGION_TOOL_0400
     * @tc.name      ResponseRegionSupportedTool_0400
     * @tc.desc      ResponseRegionSupportedTool
     * @tc.level  LEVEL3
     * @tc.type
     * @tc.size
     */
    it('ResponseRegionSupportedTool_0400', Level.LEVEL3, async (done: Function) => {
      console.info('ResponseRegionSupportedTool_0400 START');
      expect(ResponseRegionSupportedTool.MOUSE).assertEqual(3);
      console.info("[ResponseRegionSupportedTool_0400] end");
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_INTERACTIVE_ATTRIBUTES_AXIS_TYPE_0100
     * @tc.name      AxisType_0100
     * @tc.desc      ResponseRegionSupportedTool
     * @tc.level  LEVEL3
     * @tc.type
     * @tc.size
     */
    it('AxisType_0100', Level.LEVEL3, async (done: Function) => {
      console.info('AxisType_0100 START');
      expect(AxisType.VERTICAL_AXIS).assertEqual(0);
      console.info("[AxisType_0100] end");
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_INTERACTIVE_ATTRIBUTES_AXIS_TYPE_0200
     * @tc.name      AxisType_0200
     * @tc.desc      ResponseRegionSupportedTool
     * @tc.level  LEVEL3
     * @tc.type
     * @tc.size
     */
    it('AxisType_0200', Level.LEVEL3, async (done: Function) => {
      console.info('AxisType_0200 START');
      expect(AxisType.HORIZONTAL_AXIS).assertEqual(1);
      console.info("[AxisType_0200] end");
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_INTERACTIVE_ATTRIBUTES_AXIS_TYPE_0300
     * @tc.name      AxisType_0300
     * @tc.desc      ResponseRegionSupportedTool
     * @tc.level  LEVEL3
     * @tc.type
     * @tc.size
     */
    it('AxisType_0300', Level.LEVEL3, async (done: Function) => {
      console.info('AxisType_0300 START');
      expect(AxisType.PINCH_AXIS).assertEqual(2);
      console.info("[AxisType_0300] end");
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_INTERACTIVE_ATTRIBUTES_GESTURE_PRIORITY_0300
     * @tc.name      GesturePriority_0300
     * @tc.desc      GesturePriority
     * @tc.level  LEVEL3
     * @tc.type
     * @tc.size
     */
    it('GesturePriority_0300', Level.LEVEL3, async (done: Function) => {
      console.info('GesturePriority_0300 START');
      expect(GesturePriority.NORMAL).assertEqual(0);
      console.info("[GesturePriority_0300] end");
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_INTERACTIVE_ATTRIBUTES_SOURCE_TYPE_0100
     * @tc.name      SourceType_0100
     * @tc.desc      GesturePriority
     * @tc.level  LEVEL3
     * @tc.type
     * @tc.size
     */
    it('SourceType_0100', Level.LEVEL3, async (done: Function) => {
      console.info('SourceType_0100 START');
      expect(SourceType.KEY).assertEqual(4);
      console.info("[SourceType_0100] end");
      done();
    });

    /**
     * @tc.number    SUB_ARKUI_INTERACTIVE_ATTRIBUTES_SOURCE_TYPE_0200
     * @tc.name      SourceType_0200
     * @tc.desc      GesturePriority
     * @tc.level  LEVEL3
     * @tc.type
     * @tc.size
     */
    it('SourceType_0200', Level.LEVEL3, async (done: Function) => {
      console.info('SourceType_0200 START');
      expect(SourceType.JOYSTICK).assertEqual(5);
      console.info("[SourceType_0200] end");
      done();
    });
  })
}