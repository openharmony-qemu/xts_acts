'use static'
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

import { describe, it, expect, TestType, Size, Level, beforeAll} from '../../../hypium/index';
import { Driver, ON, PointerMatrix } from '@ohos.UiTest';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { unifiedDataChannel, uniformDataStruct, uniformTypeDescriptor } from '@kit.ArkData';

// Log tag shared by all cases of the static drag suite.
const TAG = 'DragTest: ';
// Identity of the static HAP under test.
const BUNDLE_NAME = 'com.example.udmfdragtest.static';
const ABILITY_NAME = 'EntryAbility';
// AppStorage keys written by the drag page.
const SUMMARY_KEY = 'dragSummary';
const SUMMARY_ON_START_KEY = 'dragSummary_start';

/**
 * Waits for the given duration so the drag pipeline can store the summary.
 */
function sleep(count: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  })
}

/**
 * Simulates a drag gesture on the component with the given id by injecting a
 * two-point pointer matrix that moves by (dx, dy).
 */
async function performComponentDrag(driver: Driver, componentId: string, offsetX: number, offsetY: number): Promise<void> {
  let component = await driver.findComponent(ON.id(componentId));
  expect(component !== null && component !== undefined).assertEqual(true);

  let rect = await component!.getBounds();
  let centerX = Math.ceil((rect.left + rect.right) / 2);
  let centerY = Math.ceil((rect.top + rect.bottom) / 2);

  let endX = centerX + offsetX;
  let endY = centerY + offsetY;

  let pointerMatrix = PointerMatrix.create(1, 2);
  pointerMatrix.setPoint(0, 0, { x: Double.toInt(centerX), y: Double.toInt(centerY) });
  pointerMatrix.setPoint(0, 1, { x: Double.toInt(endX), y: Double.toInt(endY) });

  await driver.injectMultiPointerAction(pointerMatrix);
  console.log(TAG, `drag done: from (${centerX}, ${centerY}) to (${endX}, ${endY})`);
}

/**
 * Verifies that each entry of the expected extension list is contained in the
 * serialized drag summary.
 */
function verifyExtensionsInSummary(serializedSummary: string, expectedExtensions: string[]): void {
  let verifiedCount = 0;
  for (let index = 0; index < expectedExtensions.length; index++) {
    expect(serializedSummary).assertContain(expectedExtensions[index]);
    verifiedCount++;
  }
  expect(verifiedCount).assertEqual(expectedExtensions.length);
}

// Complete audio extension set recognized by the UDMF summary.
const AUDIO_EXTENSIONS: string[] = [
  'ogg', 'aiff', 'pcm', 'flac', 'alac', 'mp3', 'aac', 'au', 'snd', 'aifc',
  'aif', 'amr', 'awb', 'gsm', 'imy', 'kar', 'm3u', 'm4a', 'm4b', 'mid',
  'midi', 'mp2', 'mpga', 'mxmf', 'ota', 'pls', 'rtttl', 'sid', 'psid', 'ulw',
  'xmf', 'ac3', 'caf', 'wav', 'wave', 'wma', 'wax', 'm4p', 'ram', 'ra',
  'sd2', 'mka', 'mmf', 'oga', 'skd', 'skm', 'skp', 'skt', 'ape', 'opus'
];

// Complete video extension set recognized by the UDMF summary.
const VIDEO_EXTENSIONS: string[] = [
  'avi', 'vfw', 'mpg', 'mpeg', 'm75', 'm15', 'mpe', 'mp4', 'mp4v', 'mpeg4',
  '3gp', '3gpp', '3g2', '3gp2', '3gpp2', 'vob', 'dif', 'dv', 'fli', 'flc',
  'mng', 'mxu', 'm4u', 'ts', 'm2ts', 'mts', 'm2t', 'mpeg2', 'mpv2', 'mp2v',
  'm2v', 'mpv', 'mpeg1', 'mpv1', 'mp1v', 'm1v', 'divx', 'ogv', 'h264',
  'wm', 'wmv', 'wmp', 'wmx', 'wvx', 'asx', 'lsf', 'lsx', 'dcr', 'dir',
  'dxr', 'spl', 'swf', 'flv', 'f4v', 'rm', 'rmvb', 'rv', 'mkv', 'movie',
  'webm', 'm4v', 'mov', 'qt', 'yt', 'vt', 'wrf', 'axv'
];

// Complete image extension set recognized by the UDMF summary.
const IMAGE_EXTENSIONS: string[] = [
  'png', 'jpg', 'jpeg', 'jpe', 'tif', 'tiff', 'xbm', 'gif', 'djv', 'djvu',
  'jng', 'pcx', 'pbm', 'pgm', 'pnm', 'ppm', 'rgb', 'svg', 'svgz', 'wbmp',
  'xpm', 'xwd', 'heif', 'heifs', 'hif', 'heic', 'heics', 'jp2', 'jpg2', 'jpx',
  'jpf', 'jpm', 'ief', 'bmp', 'bm', 'ico', 'cur', 'dds', 'odi', 'oti',
  'psd', 'ai', 'ras', 'tga', 'sgi', 'exr', 'fpx', 'cdr', 'cdt', 'cpt',
  'pat', 'ilbm', 'avif', 'webp', 'xcf', 'art'
];

export default function DragTestStatic(): void {
  describe('DragTestStatic', (): void => {
    beforeAll(async () => {
      // Launch the static entry ability hosting the drag sources.
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

    /**
      * @tc.name   DragTestStatic01
      * @tc.number SUB_DistributedData_UDMF_SDK_DragFilenameExtensionsStaticTest_0100
      * @tc.desc   Multiple records Drag Test.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('DragTestStatic01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TAG, `DragTestStatic01 begin`);

      let driver = Driver.create();
      expect(driver !== null && driver !== undefined).assertEqual(true);

      let iconBefore = await driver.findComponent(ON.id('startIcon'));
      expect(iconBefore !== null && iconBefore !== undefined).assertEqual(true);

      let rectBefore = await iconBefore!.getBounds();
      let beforeCenterX = Math.ceil((rectBefore.left + rectBefore.right) / 2);
      let beforeCenterY = Math.ceil((rectBefore.top + rectBefore.bottom) / 2);
      console.log(TAG, `before drag: left=${rectBefore.left} top=${rectBefore.top} centerX=${beforeCenterX} centerY=${beforeCenterY}`);

      await performComponentDrag(driver, 'startIcon', 300, 400);

      await sleep(1000);

      let summaryStr = AppStorage.get<Record<string, Object>>(SUMMARY_KEY) ?? '';
      console.log(TAG, `dragSummary=${JSON.stringify(summaryStr)}`);

      verifyExtensionsInSummary(JSON.stringify(summaryStr), AUDIO_EXTENSIONS);
      verifyExtensionsInSummary(JSON.stringify(summaryStr), VIDEO_EXTENSIONS);
      verifyExtensionsInSummary(JSON.stringify(summaryStr), IMAGE_EXTENSIONS);

      console.log(TAG, `DragTest01 end`);
    });

    /**
      * @tc.name   DragTestStatic02
      * @tc.number SUB_DistributedData_UDMF_SDK_DragFilenameExtensionsStaticTest_0200
      * @tc.desc   Type is file-uri drag test.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('DragTestStatic02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TAG, `DragTestStatic02 begin`);

      let driver = Driver.create();
      expect(driver !== null && driver !== undefined).assertEqual(true);

      let iconBefore = await driver.findComponent(ON.id('startIcon2'));
      expect(iconBefore !== null && iconBefore !== undefined).assertEqual(true);

      let rectBefore = await iconBefore!.getBounds();
      let beforeCenterX = Math.ceil((rectBefore.left + rectBefore.right) / 2);
      let beforeCenterY = Math.ceil((rectBefore.top + rectBefore.bottom) / 2);
      console.log(TAG, `before drag: left=${rectBefore.left} top=${rectBefore.top} centerX=${beforeCenterX} centerY=${beforeCenterY}`);

      await performComponentDrag(driver, 'startIcon2', 300, 400);

      await sleep(1000);

      let summaryStr = AppStorage.get<Record<string, Object>>(SUMMARY_KEY) ?? '';
      console.log(TAG, `dragSummary=${JSON.stringify(summaryStr)}`);

      expect(JSON.stringify(summaryStr)).assertContain('.mp3');
      expect(JSON.stringify(summaryStr)).assertContain('.mp4');

      console.log(TAG, `DragTestStatic02 end`);
    });

    /**
      * @tc.name   DragTestStatic03
      * @tc.number SUB_DistributedData_UDMF_SDK_DragFilenameExtensionsStaticTest_0300
      * @tc.desc   Uri is photo.png?x=.jpg#y drag test.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('DragTestStatic03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TAG, `DragTestStatic03 begin`);

      let driver = Driver.create();
      expect(driver !== null && driver !== undefined).assertEqual(true);

      let iconBefore = await driver.findComponent(ON.id('startIcon3'));
      expect(iconBefore !== null && iconBefore !== undefined).assertEqual(true);

      let rectBefore = await iconBefore!.getBounds();
      let beforeCenterX = Math.ceil((rectBefore.left + rectBefore.right) / 2);
      let beforeCenterY = Math.ceil((rectBefore.top + rectBefore.bottom) / 2);
      console.log(TAG, `before drag: left=${rectBefore.left} top=${rectBefore.top} centerX=${beforeCenterX} centerY=${beforeCenterY}`);

      await performComponentDrag(driver, 'startIcon3', 300, 400);

      await sleep(1000);

      let summaryStr = AppStorage.get<Record<string, Object>>(SUMMARY_KEY) ?? '';
      console.log(TAG, `dragSummary=${JSON.stringify(summaryStr)}`);

      expect(JSON.stringify(summaryStr)).assertContain('.png');

      console.log(TAG, `DragTestStatic03 end`);
    });

    /**
      * @tc.name   DragTestStatic04
      * @tc.number SUB_DistributedData_UDMF_SDK_DragFilenameExtensionsStaticTest_0400
      * @tc.desc   Invalid filnameExtension drag test.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('DragTestStatic04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TAG, `DragTestStatic04 begin`);

      let driver = Driver.create();
      expect(driver !== null && driver !== undefined).assertEqual(true);

      let iconBefore = await driver.findComponent(ON.id('startIcon4'));
      expect(iconBefore !== null && iconBefore !== undefined).assertEqual(true);

      let rectBefore = await iconBefore!.getBounds();
      let beforeCenterX = Math.ceil((rectBefore.left + rectBefore.right) / 2);
      let beforeCenterY = Math.ceil((rectBefore.top + rectBefore.bottom) / 2);
      console.log(TAG, `before drag: left=${rectBefore.left} top=${rectBefore.top} centerX=${beforeCenterX} centerY=${beforeCenterY}`);

      await performComponentDrag(driver, 'startIcon4', 300, 400);

      await sleep(1000);

      let summaryStr = AppStorage.get<Record<string, Object>>(SUMMARY_KEY) ?? '';
      console.log(TAG, `dragSummary=${JSON.stringify(summaryStr)}`);

      expect(JSON.stringify(summaryStr)).assertContain('.png');

      console.log(TAG, `DragTestStatic04 end`);
    });

    /**
      * @tc.name   DragTestStatic05
      * @tc.number SUB_DistributedData_UDMF_SDK_DragFilenameExtensionsStaticTest_0500
      * @tc.desc   Image component drag test.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('DragTestStatic05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TAG, `DragTestStatic05 begin`);

      let driver = Driver.create();
      expect(driver !== null && driver !== undefined).assertEqual(true);

      let iconBefore = await driver.findComponent(ON.id('startIcon5'));
      expect(iconBefore !== null && iconBefore !== undefined).assertEqual(true);

      let rectBefore = await iconBefore!.getBounds();
      let beforeCenterX = Math.ceil((rectBefore.left + rectBefore.right) / 2);
      let beforeCenterY = Math.ceil((rectBefore.top + rectBefore.bottom) / 2);
      console.log(TAG, `before drag: left=${rectBefore.left} top=${rectBefore.top} centerX=${beforeCenterX} centerY=${beforeCenterY}`);

      await performComponentDrag(driver, 'startIcon5', 300, 400);

      await sleep(1000);

      let summaryStr = AppStorage.get<Record<string, Object>>(SUMMARY_KEY) ?? '';
      console.log(TAG, `dragSummary=${JSON.stringify(summaryStr)}`);

      expect(JSON.stringify(summaryStr)).assertContain('.png');

      console.log(TAG, `DragTestStatic05 end`);
    });

    /**
      * @tc.name   DragTestStatic06
      * @tc.number SUB_DistributedData_UDMF_SDK_DragFilenameExtensionsStaticTest_0600
      * @tc.desc   1000 records drag test.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('DragTestStatic06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TAG, `DragTestStatic06 begin`);

      let driver = Driver.create();
      expect(driver !== null && driver !== undefined).assertEqual(true);

      let iconBefore = await driver.findComponent(ON.id('startIcon6'));
      expect(iconBefore !== null && iconBefore !== undefined).assertEqual(true);

      let rectBefore = await iconBefore!.getBounds();
      let beforeCenterX = Math.ceil((rectBefore.left + rectBefore.right) / 2);
      let beforeCenterY = Math.ceil((rectBefore.top + rectBefore.bottom) / 2);
      console.log(TAG, `before drag: left=${rectBefore.left} top=${rectBefore.top} centerX=${beforeCenterX} centerY=${beforeCenterY}`);

      await performComponentDrag(driver, 'startIcon6', 300, 400);

      await sleep(1000);

      let summaryStr = AppStorage.get<Record<string, Object>>(SUMMARY_KEY) ?? '';
      console.log(TAG, `dragSummary=${JSON.stringify(summaryStr)}`);

      expect(JSON.stringify(summaryStr)).assertContain('.png');

      console.log(TAG, `DragTestStatic06 end`);
    });

    /**
      * @tc.name   DragTestStatic07
      * @tc.number SUB_DistributedData_UDMF_SDK_DragFilenameExtensionsStaticTest_0700
      * @tc.desc   Multiple records Delay Drag Test.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('DragTestStatic07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TAG, `DragTestStatic07 begin`);

      let driver = Driver.create();
      expect(driver !== null && driver !== undefined).assertEqual(true);

      let iconBefore = await driver.findComponent(ON.id('startIcon7'));
      expect(iconBefore !== null && iconBefore !== undefined).assertEqual(true);

      let rectBefore = await iconBefore!.getBounds();
      let beforeCenterX = Math.ceil((rectBefore.left + rectBefore.right) / 2);
      let beforeCenterY = Math.ceil((rectBefore.top + rectBefore.bottom) / 2);
      console.log(TAG, `before drag: left=${rectBefore.left} top=${rectBefore.top} centerX=${beforeCenterX} centerY=${beforeCenterY}`);

      await performComponentDrag(driver, 'startIcon7', 300, 400);

      await sleep(1000);

      let summaryStr = AppStorage.get<Record<string, Object>>(SUMMARY_KEY) ?? '';
      console.log(TAG, `dragSummary=${JSON.stringify(summaryStr)}`);

      verifyExtensionsInSummary(JSON.stringify(summaryStr), AUDIO_EXTENSIONS);
      verifyExtensionsInSummary(JSON.stringify(summaryStr), VIDEO_EXTENSIONS);
      verifyExtensionsInSummary(JSON.stringify(summaryStr), IMAGE_EXTENSIONS);

      console.log(TAG, `DragTestStatic07 end`);
    });

    /**
      * @tc.name   DragTestStatic08
      * @tc.number SUB_DistributedData_UDMF_SDK_DragFilenameExtensionsStaticTest_0800
      * @tc.desc   Delay Drag Test.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('DragTestStatic08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TAG, `DragTestStatic08 begin`);

      let driver = Driver.create();
      expect(driver !== null && driver !== undefined).assertEqual(true);

      let iconBefore = await driver.findComponent(ON.id('startIcon8'));
      expect(iconBefore !== null && iconBefore !== undefined).assertEqual(true);

      let rectBefore = await iconBefore!.getBounds();
      let beforeCenterX = Math.ceil((rectBefore.left + rectBefore.right) / 2);
      let beforeCenterY = Math.ceil((rectBefore.top + rectBefore.bottom) / 2);
      console.log(TAG, `before drag: left=${rectBefore.left} top=${rectBefore.top} centerX=${beforeCenterX} centerY=${beforeCenterY}`);

      await performComponentDrag(driver, 'startIcon8', 300, 400);

      await sleep(1000);

      // Summary captured at drag start must not expose the deferred record,
      // while the summary captured on the drop target must contain .mp3.
      let summaryStr_start = AppStorage.get<Record<string, Object>>(SUMMARY_ON_START_KEY) ?? '';
      let summaryStr = AppStorage.get<Record<string, Object>>(SUMMARY_KEY) ?? '';
      console.log(TAG, `dragSummary_start=${JSON.stringify(summaryStr_start)}`);
      console.log(TAG, `dragSummary=${JSON.stringify(summaryStr)}`);

      expect(JSON.stringify(summaryStr_start)).not().assertContain('.mp3');
      expect(JSON.stringify(summaryStr)).assertContain('.mp3');

      console.log(TAG, `DragTestStatic08 end`);
    });
  })
}
