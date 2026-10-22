/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import testNapi from 'libentry.so';
import Want from '@ohos.app.ability.Want';
import { Driver, ON, PointerMatrix } from '@ohos.UiTest';
import { abilityDelegatorRegistry } from '@kit.TestKit';

let TAG = 'DragTest: ';
let BUNDLE_NAME = 'ohos.acts.udmfndkdragtest';
let ABILITY_NAME = 'EntryAbility';

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

let sleep = (ms:number) => {
  return new Promise<ESObject>(resolve => setTimeout(resolve, ms));
}

export default function UDMFNdkDragTest() {
  describe('UDMFNdkDragTest', () => {
    beforeAll(async () => {
      let delegator = abilityDelegatorRegistry.getAbilityDelegator();
      let want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: ABILITY_NAME
      };
      try {
        await delegator.startAbility(want);
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
      console.log(TAG, `OH_UDMF_CreateSummary_001 start ====`)
      let result = testNapi.OH_UDMF_CreateSummary_001();
      console.log(TAG, `OH_UDMF_CreateSummary_001 result ==== ${result}`)
      expect(result).assertEqual(1);
      console.log(TAG, `OH_UDMF_CreateSummary_001 end ====`)
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
      console.log(TAG, `OH_UDMF_GetSummaryOverviewTypes_001 start ====`)
      let result = testNapi.OH_UDMF_GetSummaryOverviewTypes_001();
      console.log(TAG, `OH_UDMF_GetSummaryOverviewTypes_001 result ==== ${result}`)
      expect(result).assertEqual(1);
      console.log(TAG, `OH_UDMF_GetSummaryOverviewTypes_001 end ====`)
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
      console.log(TAG, `OH_UDMF_GetSummaryOverviewTypes_002 start ====`)
      let result = testNapi.OH_UDMF_GetSummaryOverviewTypes_002();
      console.log(TAG, `OH_UDMF_GetSummaryOverviewTypes_002 result ==== ${result}`)
      expect(result).assertEqual(1);
      console.log(TAG, `OH_UDMF_GetSummaryOverviewTypes_002 end ====`)
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
      console.log(TAG, `OH_UDMF_GetSummaryOverviewTypes_003 start ====`)
      let result = testNapi.OH_UDMF_GetSummaryOverviewTypes_003();
      console.log(TAG, `OH_UDMF_GetSummaryOverviewTypes_003 result ==== ${result}`)
      expect(result).assertEqual(1);
      console.log(TAG, `OH_UDMF_GetSummaryOverviewTypes_003 end ====`)
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
      console.log(TAG, `OH_UDMF_GetSummaryOverviewTypes_004 start ====`)
      let result = testNapi.OH_UDMF_GetSummaryOverviewTypes_004();
      console.log(TAG, `OH_UDMF_GetSummaryOverviewTypes_004 result ==== ${result}`)
      expect(result).assertEqual(1);
      console.log(TAG, `OH_UDMF_GetSummaryOverviewTypes_004 end ====`)
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
      console.log(TAG, `OH_UDMF_GetSummaryOverviewSize_001 start ====`)
      let result = testNapi.OH_UDMF_GetSummaryOverviewSize_001();
      console.log(TAG, `OH_UDMF_GetSummaryOverviewSize_001 result ==== ${result}`)
      expect(result).assertEqual(1);
      console.log(TAG, `OH_UDMF_GetSummaryOverviewSize_001 end ====`)
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
      console.log(TAG, `OH_UDMF_GetSummaryOverviewSize_002 start ====`)
      let result = testNapi.OH_UDMF_GetSummaryOverviewSize_002();
      console.log(TAG, `OH_UDMF_GetSummaryOverviewSize_002 result ==== ${result}`)
      expect(result).assertEqual(1);
      console.log(TAG, `OH_UDMF_GetSummaryOverviewSize_002 end ====`)
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
      console.log(TAG, `OH_UDMF_GetSummaryOverviewSize_003 start ====`)
      let result = testNapi.OH_UDMF_GetSummaryOverviewSize_003();
      console.log(TAG, `OH_UDMF_GetSummaryOverviewSize_003 result ==== ${result}`)
      expect(result).assertEqual(1);
      console.log(TAG, `OH_UDMF_GetSummaryOverviewSize_003 end ====`)
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
      console.log(TAG, `OH_UDMF_GetSummaryOverviewSize_004 start ====`)
      let result = testNapi.OH_UDMF_GetSummaryOverviewSize_004();
      console.log(TAG, `OH_UDMF_GetSummaryOverviewSize_004 result ==== ${result}`)
      expect(result).assertEqual(1);
      console.log(TAG, `OH_UDMF_GetSummaryOverviewSize_004 end ====`)
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

      let driver = Driver.create();
      expect(driver !== null && driver !== undefined).assertEqual(true);

      let iconBefore = await driver.findComponent(ON.id('icon'));
      expect(iconBefore !== null && iconBefore !== undefined).assertEqual(true);

      let rectBefore = await iconBefore.getBounds();
      let beforeCenterX = Math.ceil((rectBefore.left + rectBefore.right) / 2);
      let beforeCenterY = Math.ceil((rectBefore.top + rectBefore.bottom) / 2);
      console.log(TAG, `before drag: left=${rectBefore.left} top=${rectBefore.top} centerX=${beforeCenterX} centerY=${beforeCenterY}`);

      await dragToTarget(driver, 'icon', 'nativeDropArea');

      await sleep(1000);
      console.log(TAG, `OH_UDMF_GetSummaryOverviewSize_005 start ====`)
      let result = testNapi.GetOverviewSizeResult_001();
      console.log(TAG, `OH_UDMF_GetSummaryOverviewSize_005 result ==== ${result}`)
      expect(result).assertEqual(1);
      console.log(TAG, `OH_UDMF_GetSummaryOverviewSize_005 end ====`)
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
      console.log(TAG, `OH_UDMF_GetSummaryFilenameExtensions_001 start ====`)
      let result = testNapi.OH_UDMF_GetSummaryFilenameExtensions_001();
      console.log(TAG, `OH_UDMF_GetSummaryFilenameExtensions_001 result ==== ${result}`)
      expect(result).assertEqual(1);
      console.log(TAG, `OH_UDMF_GetSummaryFilenameExtensions_001 end ====`)
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
      console.log(TAG, `OH_UDMF_GetSummaryFilenameExtensions_002 start ====`)
      let result = testNapi.OH_UDMF_GetSummaryFilenameExtensions_002();
      console.log(TAG, `OH_UDMF_GetSummaryFilenameExtensions_002 result ==== ${result}`)
      expect(result).assertEqual(1);
      console.log(TAG, `OH_UDMF_GetSummaryFilenameExtensions_002 end ====`)
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
      console.log(TAG, `OH_UDMF_GetSummaryFilenameExtensions_003 start ====`)
      let result = testNapi.OH_UDMF_GetSummaryFilenameExtensions_003();
      console.log(TAG, `OH_UDMF_GetSummaryFilenameExtensions_003 result ==== ${result}`)
      expect(result).assertEqual(1);
      console.log(TAG, `OH_UDMF_GetSummaryFilenameExtensions_003 end ====`)
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
      console.log(TAG, `OH_UDMF_GetSummaryFilenameExtensions_004 start ====`)
      let result = testNapi.OH_UDMF_GetSummaryFilenameExtensions_004();
      console.log(TAG, `OH_UDMF_GetSummaryFilenameExtensions_004 result ==== ${result}`)
      expect(result).assertEqual(1);
      console.log(TAG, `OH_UDMF_GetSummaryFilenameExtensions_004 end ====`)
    });

    /**
     * @tc.name   DragTest_001
     * @tc.number SUB_DistributedData_UDMF_OH_UDMF_SummaryDragTest_0100
     * @tc.desc   SummaryDragTest.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DragTest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let driver = Driver.create();
      expect(driver !== null && driver !== undefined).assertEqual(true);

      let iconBefore = await driver.findComponent(ON.id('icon2'));
      expect(iconBefore !== null && iconBefore !== undefined).assertEqual(true);

      let rectBefore = await iconBefore.getBounds();
      let beforeCenterX = Math.ceil((rectBefore.left + rectBefore.right) / 2);
      let beforeCenterY = Math.ceil((rectBefore.top + rectBefore.bottom) / 2);
      console.log(TAG, `before drag: left=${rectBefore.left} top=${rectBefore.top} centerX=${beforeCenterX} centerY=${beforeCenterY}`);

      await dragToTarget(driver, 'icon2', 'nativeDropArea');

      await sleep(1000);

      console.log(TAG, `DragTest_001 start ====`)
      let result = testNapi.DragTest_001();
      console.log(TAG, `DragTest_001 result ==== ${result}`)
      expect(result).assertEqual(1);
      console.log(TAG, `DragTest_001 end ====`)
    });

    /**
     * @tc.name   DragTest_002
     * @tc.number SUB_DistributedData_UDMF_OH_UDMF_SummaryDragTest_0200
     * @tc.desc   SummaryDragTest.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DragTest_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let driver = Driver.create();
      expect(driver !== null && driver !== undefined).assertEqual(true);

      let iconBefore = await driver.findComponent(ON.id('icon3'));
      expect(iconBefore !== null && iconBefore !== undefined).assertEqual(true);

      let rectBefore = await iconBefore.getBounds();
      let beforeCenterX = Math.ceil((rectBefore.left + rectBefore.right) / 2);
      let beforeCenterY = Math.ceil((rectBefore.top + rectBefore.bottom) / 2);
      console.log(TAG, `before drag: left=${rectBefore.left} top=${rectBefore.top} centerX=${beforeCenterX} centerY=${beforeCenterY}`);

      await dragToTarget(driver, 'icon3', 'nativeDropArea');

      await sleep(1000);

      console.log(TAG, `DragTest_002 start ====`)
      let result = testNapi.DragTest_002();
      console.log(TAG, `DragTest_002 result ==== ${result}`)
      expect(result).assertEqual(1);
      console.log(TAG, `DragTest_002 end ====`)
    });

    /**
     * @tc.name   DragTest_003
     * @tc.number SUB_DistributedData_UDMF_OH_UDMF_SummaryDragTest_0300
     * @tc.desc   SummaryDragTest.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DragTest_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let driver = Driver.create();
      expect(driver !== null && driver !== undefined).assertEqual(true);

      let iconBefore = await driver.findComponent(ON.id('icon4'));
      expect(iconBefore !== null && iconBefore !== undefined).assertEqual(true);

      let rectBefore = await iconBefore.getBounds();
      let beforeCenterX = Math.ceil((rectBefore.left + rectBefore.right) / 2);
      let beforeCenterY = Math.ceil((rectBefore.top + rectBefore.bottom) / 2);
      console.log(TAG, `before drag: left=${rectBefore.left} top=${rectBefore.top} centerX=${beforeCenterX} centerY=${beforeCenterY}`);

      await dragToTarget(driver, 'icon4', 'nativeDropArea');

      await sleep(1000);

      console.log(TAG, `DragTest_003 start ====`)
      let result = testNapi.DragTest_003();
      console.log(TAG, `DragTest_003 result ==== ${result}`)
      expect(result).assertEqual(1);
      console.log(TAG, `DragTest_003 end ====`)
    });

    /**
     * @tc.name   DragTest_004
     * @tc.number SUB_DistributedData_UDMF_OH_UDMF_SummaryDragTest_0400
     * @tc.desc   SummaryDragTest for default draggable image (general.image).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DragTest_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let driver = Driver.create();
      expect(driver !== null && driver !== undefined).assertEqual(true);

      let iconBefore = await driver.findComponent(ON.id('icon5'));
      expect(iconBefore !== null && iconBefore !== undefined).assertEqual(true);

      let rectBefore = await iconBefore.getBounds();
      let beforeCenterX = Math.ceil((rectBefore.left + rectBefore.right) / 2);
      let beforeCenterY = Math.ceil((rectBefore.top + rectBefore.bottom) / 2);
      console.log(TAG, `before drag: left=${rectBefore.left} top=${rectBefore.top} centerX=${beforeCenterX} centerY=${beforeCenterY}`);

      await dragToTarget(driver, 'icon5', 'nativeDropArea');

      await sleep(1000);

      console.log(TAG, `DragTest_004 start ====`)
      let result = testNapi.DragTest_004();
      console.log(TAG, `DragTest_004 result ==== ${result}`)
      expect(result).assertEqual(1);
      console.log(TAG, `DragTest_004 end ====`)
    });

    /**
     * @tc.name   DragTest_005
     * @tc.number SUB_DistributedData_UDMF_OH_UDMF_SummaryDragTest_0500
     * @tc.desc   SummaryDragTest for 1000 image records.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DragTest_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let driver = Driver.create();
      expect(driver !== null && driver !== undefined).assertEqual(true);

      let iconBefore = await driver.findComponent(ON.id('icon6'));
      expect(iconBefore !== null && iconBefore !== undefined).assertEqual(true);

      let rectBefore = await iconBefore.getBounds();
      let beforeCenterX = Math.ceil((rectBefore.left + rectBefore.right) / 2);
      let beforeCenterY = Math.ceil((rectBefore.top + rectBefore.bottom) / 2);
      console.log(TAG, `before drag: left=${rectBefore.left} top=${rectBefore.top} centerX=${beforeCenterX} centerY=${beforeCenterY}`);

      await dragToTarget(driver, 'icon6', 'nativeDropArea');

      await sleep(1000);

      console.log(TAG, `DragTest_005 start ====`)
      let result = testNapi.DragTest_005();
      console.log(TAG, `DragTest_005 result ==== ${result}`)
      expect(result).assertEqual(1);
      console.log(TAG, `DragTest_005 end ====`)
    });

    /**
     * @tc.name   DragTest_006
     * @tc.number SUB_DistributedData_UDMF_OH_UDMF_SummaryDragTest_0600
     * @tc.desc   SummaryDragTest for setDataLoadParams with audio/video/image records.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DragTest_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let driver = Driver.create();
      expect(driver !== null && driver !== undefined).assertEqual(true);

      let iconBefore = await driver.findComponent(ON.id('icon7'));
      expect(iconBefore !== null && iconBefore !== undefined).assertEqual(true);

      let rectBefore = await iconBefore.getBounds();
      let beforeCenterX = Math.ceil((rectBefore.left + rectBefore.right) / 2);
      let beforeCenterY = Math.ceil((rectBefore.top + rectBefore.bottom) / 2);
      console.log(TAG, `before drag: left=${rectBefore.left} top=${rectBefore.top} centerX=${beforeCenterX} centerY=${beforeCenterY}`);

      await dragToTarget(driver, 'icon7', 'nativeDropArea');

      await sleep(1000);

      console.log(TAG, `DragTest_006 start ====`)
      let result = testNapi.DragTest_006();
      console.log(TAG, `DragTest_006 result ==== ${result}`)
      expect(result).assertEqual(1);
      console.log(TAG, `DragTest_006 end ====`)
    });

    /**
     * @tc.name   DragTest_007
     * @tc.number SUB_DistributedData_UDMF_OH_UDMF_SummaryDragTest_0700
     * @tc.desc   SummaryDragTest for setData with 164 audio/video/image records.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DragTest_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let driver = Driver.create();
      expect(driver !== null && driver !== undefined).assertEqual(true);

      let iconBefore = await driver.findComponent(ON.id('icon8'));
      expect(iconBefore !== null && iconBefore !== undefined).assertEqual(true);

      let rectBefore = await iconBefore.getBounds();
      let beforeCenterX = Math.ceil((rectBefore.left + rectBefore.right) / 2);
      let beforeCenterY = Math.ceil((rectBefore.top + rectBefore.bottom) / 2);
      console.log(TAG, `before drag: left=${rectBefore.left} top=${rectBefore.top} centerX=${beforeCenterX} centerY=${beforeCenterY}`);

      await dragToTarget(driver, 'icon8', 'nativeDropArea');

      await sleep(1000);

      console.log(TAG, `DragTest_007 start ====`)
      let result = testNapi.DragTest_007();
      console.log(TAG, `DragTest_007 result ==== ${result}`)
      expect(result).assertEqual(1);
      console.log(TAG, `DragTest_007 end ====`)
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
      console.log(TAG, `OH_Utd_BelongsTo_006 start ====`)
      let result = testNapi.OH_Utd_BelongsTo_006();
      console.log(TAG, `OH_Utd_BelongsTo_006 result ==== ${result}`)
      expect(result).assertEqual(1);
      console.log(TAG, `OH_Utd_BelongsTo_006 end ====`)
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
      console.log(TAG, `OH_Utd_BelongsTo_007 start ====`)
      let result = testNapi.OH_Utd_BelongsTo_007();
      console.log(TAG, `OH_Utd_BelongsTo_007 result ==== ${result}`)
      expect(result).assertEqual(1);
      console.log(TAG, `OH_Utd_BelongsTo_007 end ====`)
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
      console.log(TAG, `OH_Utd_GetTypesByFilenameExtension_004 start ====`)
      let result = testNapi.OH_Utd_GetTypesByFilenameExtension_004();
      console.log(TAG, `OH_Utd_GetTypesByFilenameExtension_004 result ==== ${result}`)
      expect(result).assertEqual(1);
      console.log(TAG, `OH_Utd_GetTypesByFilenameExtension_004 end ====`)
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
      console.log(TAG, `OH_Utd_GetTypesByMimeType_004 start ====`)
      let result = testNapi.OH_Utd_GetTypesByMimeType_004();
      console.log(TAG, `OH_Utd_GetTypesByMimeType_004 result ==== ${result}`)
      expect(result).assertEqual(1);
      console.log(TAG, `OH_Utd_GetTypesByMimeType_004 end ====`)
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
      console.log(TAG, `OH_Utd_IsHigher_007 start ====`)
      let result = testNapi.OH_Utd_IsHigher_007();
      console.log(TAG, `OH_Utd_IsHigher_007 result ==== ${result}`)
      expect(result).assertEqual(1);
      console.log(TAG, `OH_Utd_IsHigher_007 end ====`)
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
      console.log(TAG, `OH_Utd_IsHigher_008 start ====`)
      let result = testNapi.OH_Utd_IsHigher_008();
      console.log(TAG, `OH_Utd_IsHigher_008 result ==== ${result}`)
      expect(result).assertEqual(1);
      console.log(TAG, `OH_Utd_IsHigher_008 end ====`)
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
      console.log(TAG, `OH_Utd_IsLower_007 start ====`)
      let result = testNapi.OH_Utd_IsLower_007();
      console.log(TAG, `OH_Utd_IsLower_007 result ==== ${result}`)
      expect(result).assertEqual(1);
      console.log(TAG, `OH_Utd_IsLower_007 end ====`)
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
      console.log(TAG, `OH_Utd_IsLower_008 start ====`)
      let result = testNapi.OH_Utd_IsLower_008();
      console.log(TAG, `OH_Utd_IsLower_008 result ==== ${result}`)
      expect(result).assertEqual(1);
      console.log(TAG, `OH_Utd_IsLower_008 end ====`)
    });
  })
}