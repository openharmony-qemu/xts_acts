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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import testNapi from 'libentry.so';
import Want from '@ohos.app.ability.Want';
import { Driver, ON, PointerMatrix } from '@ohos.UiTest';
import { abilityDelegatorRegistry } from '@kit.TestKit';

let TAG = 'DragTest: ';
let BUNDLE_NAME = 'ohos.acts.udmfndkdragtest';
let ABILITY_NAME = 'EntryAbility';

async function dragComponent(driver: Driver, componentId: string, offsetX: number, offsetY: number): Promise<void> {
  let component = await driver.findComponent(ON.id(componentId));
  expect(component !== null && component !== undefined).assertEqual(true);

  let componentRect = await component.getBounds();
  let centerX = Math.ceil((componentRect.left + componentRect.right) / 2);
  let centerY = Math.ceil((componentRect.top + componentRect.bottom) / 2);

  let endX = centerX + offsetX;
  let endY = centerY + offsetY;

  let pointerMatrix = PointerMatrix.create(1, 2);
  pointerMatrix.setPoint(0, 0, { x: centerX, y: centerY });
  pointerMatrix.setPoint(0, 1, { x: endX, y: endY });

  await driver.injectMultiPointerAction(pointerMatrix);
  console.log(TAG, `dragComponent done: from (${centerX}, ${centerY}) to (${endX}, ${endY})`);
}

async function dragToTarget(driver: Driver, sourceId: string, targetId: string): Promise<void> {
  let source = await driver.findComponent(ON.id(sourceId));
  expect(source !== null && source !== undefined).assertEqual(true);

  let target = await driver.findComponent(ON.id(targetId));
  expect(target !== null && target !== undefined).assertEqual(true);

  let sourceRect = await source.getBounds();
  let sourceCenterX = Math.ceil((sourceRect.left + sourceRect.right) / 2);
  let sourceCenterY = Math.ceil((sourceRect.top + sourceRect.bottom) / 2);

  let targetRect = await target.getBounds();
  let targetCenterX = Math.ceil((targetRect.left + targetRect.right) / 2);
  let targetCenterY = Math.ceil((targetRect.top + targetRect.bottom) / 2);

  await driver.drag(sourceCenterX, sourceCenterY, targetCenterX, targetCenterY);
  console.log(TAG, `dragToTarget done: from (${sourceCenterX}, ${sourceCenterY}) to (${targetCenterX}, ${targetCenterY})`);
}

function sleep(ms: number): Promise<ESObject> {
  return new Promise<ESObject>(resolve => setTimeout(resolve, ms));
}

export default function UDMFNdkDragTest() {
  describe('UDMFNdkDragTest', () => {
    beforeAll(async () => {
      let delegator = abilityDelegatorRegistry.getAbilityDelegator();
      let startWant: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: ABILITY_NAME
      };
      try {
        await delegator.startAbility(startWant);
        console.log(TAG, `EntryAbility started`);
      } catch (error) {
        console.error(TAG, `startAbility failed, ERROR: ${error.code}, message: ${error.message}`);
        expect().assertFail();
      }
      let driver = Driver.create();
      await driver.delayMs(2000);
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   OH_UDMF_CreateSummary_001
     * @tc.number SUB_DistributedData_UDMF_OH_UDMF_CreateSummary_0100
     * @tc.desc   OH_UDMF_CreateSummary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UDMF_CreateSummary_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG, 'Start executing OH_UDMF_CreateSummary_001');
      let nativeResult = testNapi.OH_UDMF_CreateSummary_001();
      console.log(TAG, `OH_UDMF_CreateSummary_001 execution result: ${nativeResult}`);
      expect(nativeResult).assertEqual(1);
      console.log(TAG, 'OH_UDMF_CreateSummary_001 execution completed');
    });

    /**
     * @tc.name   OH_UDMF_GetSummaryOverviewTypes_001
     * @tc.number SUB_DistributedData_UDMF_OH_UDMF_GetSummaryOverviewTypes_0100
     * @tc.desc   OH_UDMF_GetSummaryOverviewTypes test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UDMF_GetSummaryOverviewTypes_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG, 'Start executing OH_UDMF_GetSummaryOverviewTypes_001');
      let nativeResult = testNapi.OH_UDMF_GetSummaryOverviewTypes_001();
      console.log(TAG, `OH_UDMF_GetSummaryOverviewTypes_001 execution result: ${nativeResult}`);
      expect(nativeResult).assertEqual(1);
      console.log(TAG, 'OH_UDMF_GetSummaryOverviewTypes_001 execution completed');
    });

    /**
     * @tc.name   OH_UDMF_GetSummaryOverviewTypes_002
     * @tc.number SUB_DistributedData_UDMF_OH_UDMF_GetSummaryOverviewTypes_0200
     * @tc.desc   OH_UDMF_GetSummaryOverviewTypes test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UDMF_GetSummaryOverviewTypes_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG, 'Start executing OH_UDMF_GetSummaryOverviewTypes_002');
      let nativeResult = testNapi.OH_UDMF_GetSummaryOverviewTypes_002();
      console.log(TAG, `OH_UDMF_GetSummaryOverviewTypes_002 execution result: ${nativeResult}`);
      expect(nativeResult).assertEqual(1);
      console.log(TAG, 'OH_UDMF_GetSummaryOverviewTypes_002 execution completed');
    });

    /**
     * @tc.name   OH_UDMF_GetSummaryOverviewTypes_003
     * @tc.number SUB_DistributedData_UDMF_OH_UDMF_GetSummaryOverviewTypes_0300
     * @tc.desc   OH_UDMF_GetSummaryOverviewTypes test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UDMF_GetSummaryOverviewTypes_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG, 'Start executing OH_UDMF_GetSummaryOverviewTypes_003');
      let nativeResult = testNapi.OH_UDMF_GetSummaryOverviewTypes_003();
      console.log(TAG, `OH_UDMF_GetSummaryOverviewTypes_003 execution result: ${nativeResult}`);
      expect(nativeResult).assertEqual(1);
      console.log(TAG, 'OH_UDMF_GetSummaryOverviewTypes_003 execution completed');
    });

    /**
     * @tc.name   OH_UDMF_GetSummaryOverviewTypes_004
     * @tc.number SUB_DistributedData_UDMF_OH_UDMF_GetSummaryOverviewTypes_0400
     * @tc.desc   OH_UDMF_GetSummaryOverviewTypes test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UDMF_GetSummaryOverviewTypes_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG, 'Start executing OH_UDMF_GetSummaryOverviewTypes_004');
      let nativeResult = testNapi.OH_UDMF_GetSummaryOverviewTypes_004();
      console.log(TAG, `OH_UDMF_GetSummaryOverviewTypes_004 execution result: ${nativeResult}`);
      expect(nativeResult).assertEqual(1);
      console.log(TAG, 'OH_UDMF_GetSummaryOverviewTypes_004 execution completed');
    });

    /**
     * @tc.name   OH_UDMF_GetSummaryOverviewSize_001
     * @tc.number SUB_DistributedData_UDMF_OH_UDMF_GetSummaryOverviewSize_0100
     * @tc.desc   OH_UDMF_GetSummaryOverviewSize test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UDMF_GetSummaryOverviewSize_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG, 'Start executing OH_UDMF_GetSummaryOverviewSize_001');
      let nativeResult = testNapi.OH_UDMF_GetSummaryOverviewSize_001();
      console.log(TAG, `OH_UDMF_GetSummaryOverviewSize_001 execution result: ${nativeResult}`);
      expect(nativeResult).assertEqual(1);
      console.log(TAG, 'OH_UDMF_GetSummaryOverviewSize_001 execution completed');
    });

    /**
     * @tc.name   OH_UDMF_GetSummaryOverviewSize_002
     * @tc.number SUB_DistributedData_UDMF_OH_UDMF_GetSummaryOverviewSize_0200
     * @tc.desc   OH_UDMF_GetSummaryOverviewSize test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UDMF_GetSummaryOverviewSize_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG, 'Start executing OH_UDMF_GetSummaryOverviewSize_002');
      let nativeResult = testNapi.OH_UDMF_GetSummaryOverviewSize_002();
      console.log(TAG, `OH_UDMF_GetSummaryOverviewSize_002 execution result: ${nativeResult}`);
      expect(nativeResult).assertEqual(1);
      console.log(TAG, 'OH_UDMF_GetSummaryOverviewSize_002 execution completed');
    });

    /**
     * @tc.name   OH_UDMF_GetSummaryOverviewSize_003
     * @tc.number SUB_DistributedData_UDMF_OH_UDMF_GetSummaryOverviewSize_0300
     * @tc.desc   OH_UDMF_GetSummaryOverviewSize test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UDMF_GetSummaryOverviewSize_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG, 'Start executing OH_UDMF_GetSummaryOverviewSize_003');
      let nativeResult = testNapi.OH_UDMF_GetSummaryOverviewSize_003();
      console.log(TAG, `OH_UDMF_GetSummaryOverviewSize_003 execution result: ${nativeResult}`);
      expect(nativeResult).assertEqual(1);
      console.log(TAG, 'OH_UDMF_GetSummaryOverviewSize_003 execution completed');
    });

    /**
     * @tc.name   OH_UDMF_GetSummaryOverviewSize_004
     * @tc.number SUB_DistributedData_UDMF_OH_UDMF_GetSummaryOverviewSize_0400
     * @tc.desc   OH_UDMF_GetSummaryOverviewSize test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UDMF_GetSummaryOverviewSize_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG, 'Start executing OH_UDMF_GetSummaryOverviewSize_004');
      let nativeResult = testNapi.OH_UDMF_GetSummaryOverviewSize_004();
      console.log(TAG, `OH_UDMF_GetSummaryOverviewSize_004 execution result: ${nativeResult}`);
      expect(nativeResult).assertEqual(1);
      console.log(TAG, 'OH_UDMF_GetSummaryOverviewSize_004 execution completed');
    });

    /**
     * @tc.name   OH_UDMF_GetSummaryOverviewSize_005
     * @tc.number SUB_DistributedData_UDMF_OH_UDMF_GetSummaryOverviewSize_0500
     * @tc.desc   OH_UDMF_GetSummaryOverviewSize test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UDMF_GetSummaryOverviewSize_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Prepare the UiTest driver and locate the draggable icon before the gesture.
      let driver = Driver.create();
      expect(driver !== null && driver !== undefined).assertEqual(true);

      let iconBeforeDrag = await driver.findComponent(ON.id('icon'));
      expect(iconBeforeDrag !== null && iconBeforeDrag !== undefined).assertEqual(true);

      // Record the icon bounds before dragging for troubleshooting.
      let rectBefore = await iconBeforeDrag.getBounds();
      let beforeCenterX = Math.ceil((rectBefore.left + rectBefore.right) / 2);
      let beforeCenterY = Math.ceil((rectBefore.top + rectBefore.bottom) / 2);
      console.log(TAG, `before drag: left=${rectBefore.left} top=${rectBefore.top} centerX=${beforeCenterX} centerY=${beforeCenterY}`);

      // Drag the icon onto the native drop area built by the native module.
      await dragToTarget(driver, 'icon', 'nativeDropArea');

      // Wait for the native drop handling to complete before reading the result.
      await sleep(1000);

      console.log(TAG, 'Start executing OH_UDMF_GetSummaryOverviewSize_005');
      let nativeResult = testNapi.GetOverviewSizeResult_001();
      console.log(TAG, `OH_UDMF_GetSummaryOverviewSize_005 execution result: ${nativeResult}`);
      expect(nativeResult).assertEqual(1);
      console.log(TAG, 'OH_UDMF_GetSummaryOverviewSize_005 execution completed');
    });

    /**
     * @tc.name   OH_UDMF_GetSummaryFilenameExtensions_001
     * @tc.number SUB_DistributedData_UDMF_OH_UDMF_GetSummaryFilenameExtensions_0100
     * @tc.desc   OH_UDMF_GetSummaryFilenameExtensions test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UDMF_GetSummaryFilenameExtensions_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG, 'Start executing OH_UDMF_GetSummaryFilenameExtensions_001');
      let nativeResult = testNapi.OH_UDMF_GetSummaryFilenameExtensions_001();
      console.log(TAG, `OH_UDMF_GetSummaryFilenameExtensions_001 execution result: ${nativeResult}`);
      expect(nativeResult).assertEqual(1);
      console.log(TAG, 'OH_UDMF_GetSummaryFilenameExtensions_001 execution completed');
    });

    /**
     * @tc.name   OH_UDMF_GetSummaryFilenameExtensions_002
     * @tc.number SUB_DistributedData_UDMF_OH_UDMF_GetSummaryFilenameExtensions_0200
     * @tc.desc   OH_UDMF_GetSummaryFilenameExtensions test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UDMF_GetSummaryFilenameExtensions_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG, 'Start executing OH_UDMF_GetSummaryFilenameExtensions_002');
      let nativeResult = testNapi.OH_UDMF_GetSummaryFilenameExtensions_002();
      console.log(TAG, `OH_UDMF_GetSummaryFilenameExtensions_002 execution result: ${nativeResult}`);
      expect(nativeResult).assertEqual(1);
      console.log(TAG, 'OH_UDMF_GetSummaryFilenameExtensions_002 execution completed');
    });

    /**
     * @tc.name   OH_UDMF_GetSummaryFilenameExtensions_003
     * @tc.number SUB_DistributedData_UDMF_OH_UDMF_GetSummaryFilenameExtensions_0300
     * @tc.desc   OH_UDMF_GetSummaryFilenameExtensions test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UDMF_GetSummaryFilenameExtensions_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG, 'Start executing OH_UDMF_GetSummaryFilenameExtensions_003');
      let nativeResult = testNapi.OH_UDMF_GetSummaryFilenameExtensions_003();
      console.log(TAG, `OH_UDMF_GetSummaryFilenameExtensions_003 execution result: ${nativeResult}`);
      expect(nativeResult).assertEqual(1);
      console.log(TAG, 'OH_UDMF_GetSummaryFilenameExtensions_003 execution completed');
    });

    /**
     * @tc.name   OH_UDMF_GetSummaryFilenameExtensions_004
     * @tc.number SUB_DistributedData_UDMF_OH_UDMF_GetSummaryFilenameExtensions_0400
     * @tc.desc   OH_UDMF_GetSummaryFilenameExtensions test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_UDMF_GetSummaryFilenameExtensions_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG, 'Start executing OH_UDMF_GetSummaryFilenameExtensions_004');
      let nativeResult = testNapi.OH_UDMF_GetSummaryFilenameExtensions_004();
      console.log(TAG, `OH_UDMF_GetSummaryFilenameExtensions_004 execution result: ${nativeResult}`);
      expect(nativeResult).assertEqual(1);
      console.log(TAG, 'OH_UDMF_GetSummaryFilenameExtensions_004 execution completed');
    });

    /**
     * @tc.name   OH_Utd_BelongsTo_006
     * @tc.number SUB_DistributedData_UDMF_OH_Utd_BelongsTo_0600
     * @tc.desc   OH_Utd_BelongsTo test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Utd_BelongsTo_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG, 'Start executing OH_Utd_BelongsTo_006');
      let nativeResult = testNapi.OH_Utd_BelongsTo_006();
      console.log(TAG, `OH_Utd_BelongsTo_006 execution result: ${nativeResult}`);
      expect(nativeResult).assertEqual(1);
      console.log(TAG, 'OH_Utd_BelongsTo_006 execution completed');
    });

    /**
     * @tc.name   OH_Utd_BelongsTo_007
     * @tc.number SUB_DistributedData_UDMF_OH_Utd_BelongsTo_0700
     * @tc.desc   OH_Utd_BelongsTo test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Utd_BelongsTo_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG, 'Start executing OH_Utd_BelongsTo_007');
      let nativeResult = testNapi.OH_Utd_BelongsTo_007();
      console.log(TAG, `OH_Utd_BelongsTo_007 execution result: ${nativeResult}`);
      expect(nativeResult).assertEqual(1);
      console.log(TAG, 'OH_Utd_BelongsTo_007 execution completed');
    });

    /**
     * @tc.name   OH_Utd_GetTypesByFilenameExtension_004
     * @tc.number SUB_DistributedData_UDMF_OH_Utd_GetTypesByFilenameExtension_0400
     * @tc.desc   OH_Utd_GetTypesByFilenameExtension test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Utd_GetTypesByFilenameExtension_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG, 'Start executing OH_Utd_GetTypesByFilenameExtension_004');
      let nativeResult = testNapi.OH_Utd_GetTypesByFilenameExtension_004();
      console.log(TAG, `OH_Utd_GetTypesByFilenameExtension_004 execution result: ${nativeResult}`);
      expect(nativeResult).assertEqual(1);
      console.log(TAG, 'OH_Utd_GetTypesByFilenameExtension_004 execution completed');
    });

    /**
     * @tc.name   OH_Utd_GetTypesByMimeType_004
     * @tc.number SUB_DistributedData_UDMF_OH_Utd_GetTypesByMimeType_0400
     * @tc.desc   OH_Utd_GetTypesByMimeType test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Utd_GetTypesByMimeType_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG, 'Start executing OH_Utd_GetTypesByMimeType_004');
      let nativeResult = testNapi.OH_Utd_GetTypesByMimeType_004();
      console.log(TAG, `OH_Utd_GetTypesByMimeType_004 execution result: ${nativeResult}`);
      expect(nativeResult).assertEqual(1);
      console.log(TAG, 'OH_Utd_GetTypesByMimeType_004 execution completed');
    });

    /**
     * @tc.name   OH_Utd_IsHigher_007
     * @tc.number SUB_DistributedData_UDMF_OH_Utd_IsHigher_0700
     * @tc.desc   OH_Utd_IsHigher test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Utd_IsHigher_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG, 'Start executing OH_Utd_IsHigher_007');
      let nativeResult = testNapi.OH_Utd_IsHigher_007();
      console.log(TAG, `OH_Utd_IsHigher_007 execution result: ${nativeResult}`);
      expect(nativeResult).assertEqual(1);
      console.log(TAG, 'OH_Utd_IsHigher_007 execution completed');
    });

    /**
     * @tc.name   OH_Utd_IsHigher_008
     * @tc.number SUB_DistributedData_UDMF_OH_Utd_IsHigher_0800
     * @tc.desc   OH_Utd_IsHigher test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Utd_IsHigher_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG, 'Start executing OH_Utd_IsHigher_008');
      let nativeResult = testNapi.OH_Utd_IsHigher_008();
      console.log(TAG, `OH_Utd_IsHigher_008 execution result: ${nativeResult}`);
      expect(nativeResult).assertEqual(1);
      console.log(TAG, 'OH_Utd_IsHigher_008 execution completed');
    });

    /**
     * @tc.name   OH_Utd_IsLower_007
     * @tc.number SUB_DistributedData_UDMF_OH_Utd_IsLower_0700
     * @tc.desc   OH_Utd_IsLower test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Utd_IsLower_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG, 'Start executing OH_Utd_IsLower_007');
      let nativeResult = testNapi.OH_Utd_IsLower_007();
      console.log(TAG, `OH_Utd_IsLower_007 execution result: ${nativeResult}`);
      expect(nativeResult).assertEqual(1);
      console.log(TAG, 'OH_Utd_IsLower_007 execution completed');
    });

    /**
     * @tc.name   OH_Utd_IsLower_008
     * @tc.number SUB_DistributedData_UDMF_OH_Utd_IsLower_0800
     * @tc.desc   OH_Utd_IsLower test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Utd_IsLower_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.log(TAG, 'Start executing OH_Utd_IsLower_008');
      let nativeResult = testNapi.OH_Utd_IsLower_008();
      console.log(TAG, `OH_Utd_IsLower_008 execution result: ${nativeResult}`);
      expect(nativeResult).assertEqual(1);
      console.log(TAG, 'OH_Utd_IsLower_008 execution completed');
    });
  })
}
