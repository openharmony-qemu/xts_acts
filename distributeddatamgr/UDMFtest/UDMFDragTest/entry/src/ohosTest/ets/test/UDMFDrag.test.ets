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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'
import { Driver, ON, PointerMatrix } from '@ohos.UiTest';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import Want from '@ohos.app.ability.Want';

// Log tag used by every case in this suite.
const TAG = 'DragTest: ';
// Identity of the HAP under test, must match module.json5 / app.json5.
const BUNDLE_NAME = 'com.example.udmfdragtest';
const ABILITY_NAME = 'EntryAbility';
// AppStorage key written by the drop target in pages/Index.ets.
const SUMMARY_KEY = 'dragSummary';
// AppStorage key written by the drag source before deferred data loading.
const SUMMARY_ON_START_KEY = 'dragSummary_start';

/**
 * Waits for the given duration so that the drag pipeline can finish
 * delivering the summary to the application storage.
 */
function sleep(ms: number): Promise<ESObject> {
  return new Promise<ESObject>(resolve => setTimeout(resolve, ms));
}

/**
 * Locates the drag source component by id and calculates the center point
 * of its bounding rectangle. Fails the current case when the component
 * cannot be found.
 */
async function queryComponentCenter(driver: Driver, componentId: string): Promise<[number, number]> {
  const component = await driver.findComponent(ON.id(componentId));
  expect(component !== null && component !== undefined).assertEqual(true);

  const rect = await component.getBounds();
  const centerX = Math.ceil((rect.left + rect.right) / 2);
  const centerY = Math.ceil((rect.top + rect.bottom) / 2);
  console.log(TAG, `component ${componentId} bounds: left=${rect.left} top=${rect.top} centerX=${centerX} centerY=${centerY}`);
  return [centerX, centerY];
}

/**
 * Drags the component identified by componentId by the given offset using a
 * two-point pointer matrix, which is how UiTest simulates a real drag gesture.
 */
async function performComponentDrag(driver: Driver, componentId: string, offsetX: number, offsetY: number): Promise<void> {
  const [startX, startY] = await queryComponentCenter(driver, componentId);
  const endX = startX + offsetX;
  const endY = startY + offsetY;

  const pointerMatrix = PointerMatrix.create(1, 2);
  pointerMatrix.setPoint(0, 0, { x: startX, y: startY });
  pointerMatrix.setPoint(0, 1, { x: endX, y: endY });

  await driver.injectMultiPointerAction(pointerMatrix);
  console.log(TAG, `drag finished: from (${startX}, ${startY}) to (${endX}, ${endY})`);
}

/**
 * Reads the summary object stored by the drop target. Returns an empty
 * object when nothing has been stored yet, so that field access yields
 * undefined in the same way as the legacy fallback did.
 */
function fetchStoredSummary(storageKey: string): Record<string, Object> {
  const storedSummary = AppStorage.get<Record<string, Object>>(storageKey);
  return storedSummary !== undefined && storedSummary !== null ? storedSummary : {} as Record<string, Object>;
}

/**
 * Verifies that every extension in the expected list is contained in the
 * serialized filenameExtensions array and returns the number of verified
 * entries.
 */
function verifyExtensionListCovered(filenameExtensions: Array<string>, expectedExtensions: string[]): number {
  const serializedExtensions = JSON.stringify(filenameExtensions);
  let verifiedCount = 0;
  for (let index = 0; index < expectedExtensions.length; index++) {
    expect(serializedExtensions).assertContain(expectedExtensions[index]);
    verifiedCount++;
  }
  expect(verifiedCount).assertEqual(expectedExtensions.length);
  return verifiedCount;
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

export default function DragTest() {
  describe('DragTest', () => {
    beforeAll(async () => {
      // Launch the entry ability so that the drag page is on screen.
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
     * @tc.name   DragTest01
     * @tc.number SUB_DistributedData_UDMF_SDK_DragFilenameExtensionsTest_0100
     * @tc.desc   Multiple records Drag Test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DragTest01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TAG, `DragTest01 begin`);

      let driver = Driver.create();
      expect(driver !== null && driver !== undefined).assertEqual(true);

      await queryComponentCenter(driver, 'startIcon');

      await performComponentDrag(driver, 'startIcon', 300, 400);

      await sleep(1000);

      let summaryStr = fetchStoredSummary(SUMMARY_KEY);
      console.log(TAG, `dragSummary=${JSON.stringify(summaryStr)}`);

      let totalSize = summaryStr['totalSize'] as number;
      let summaryRecord = summaryStr['summary'] as Record<string, number>;
      let overviewRecord = summaryStr['overview'] as Record<string, number>;
      let filenameExtensions = summaryStr['filenameExtensions'] as Array<string>;

      expect(totalSize > 0).assertEqual(true);
      expect(JSON.stringify(summaryRecord)).assertContain('general.audio');
      expect(JSON.stringify(overviewRecord)).assertContain('general.audio');
      expect(JSON.stringify(summaryRecord)).assertContain('general.video');
      expect(JSON.stringify(overviewRecord)).assertContain('general.video');
      expect(JSON.stringify(summaryRecord)).assertContain('general.image');
      expect(JSON.stringify(overviewRecord)).assertContain('general.image');
      expect(Array.isArray(filenameExtensions)).assertEqual(true);

      verifyExtensionListCovered(filenameExtensions, AUDIO_EXTENSIONS);
      verifyExtensionListCovered(filenameExtensions, VIDEO_EXTENSIONS);
      verifyExtensionListCovered(filenameExtensions, IMAGE_EXTENSIONS);

      console.log(TAG, `DragTest01 end`);
    });

    /**
     * @tc.name   DragTest02
     * @tc.number SUB_DistributedData_UDMF_SDK_DragFilenameExtensionsTest_0200
     * @tc.desc   Type is file-uri drag test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DragTest02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TAG, `DragTest02 begin`);

      let driver = Driver.create();
      expect(driver !== null && driver !== undefined).assertEqual(true);

      await queryComponentCenter(driver, 'startIcon2');

      await performComponentDrag(driver, 'startIcon2', 300, 400);

      await sleep(1000);

      let summaryStr = fetchStoredSummary(SUMMARY_KEY);
      console.log(TAG, `dragSummary=${JSON.stringify(summaryStr)}`);

      let totalSize = summaryStr['totalSize'] as number;
      let summaryRecord = summaryStr['summary'] as Record<string, number>;
      let overviewRecord = summaryStr['overview'] as Record<string, number>;
      let filenameExtensions = summaryStr['filenameExtensions'] as Array<string>;

      expect(totalSize > 0).assertEqual(true);
      expect(JSON.stringify(summaryRecord)).assertContain('general.audio');
      expect(JSON.stringify(overviewRecord)).assertContain('general.audio');
      expect(JSON.stringify(summaryRecord)).assertContain('general.video');
      expect(JSON.stringify(overviewRecord)).assertContain('general.video');
      expect(JSON.stringify(filenameExtensions)).assertContain('.mp3');
      expect(JSON.stringify(filenameExtensions)).assertContain('.mp4');

      console.log(TAG, `DragTest02 end`);
    });

    /**
     * @tc.name   DragTest03
     * @tc.number SUB_DistributedData_UDMF_SDK_DragFilenameExtensionsTest_0300
     * @tc.desc   Uri is photo.png?x=.jpg#y drag test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DragTest03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TAG, `DragTest03 begin`);

      let driver = Driver.create();
      expect(driver !== null && driver !== undefined).assertEqual(true);

      await queryComponentCenter(driver, 'startIcon3');

      await performComponentDrag(driver, 'startIcon3', 300, 400);

      await sleep(1000);

      let summaryStr = fetchStoredSummary(SUMMARY_KEY);
      console.log(TAG, `dragSummary=${JSON.stringify(summaryStr)}`);

      let totalSize = summaryStr['totalSize'] as number;
      let summaryRecord = summaryStr['summary'] as Record<string, number>;
      let overviewRecord = summaryStr['overview'] as Record<string, number>;
      let filenameExtensions = summaryStr['filenameExtensions'] as Array<string>;

      expect(totalSize > 0).assertEqual(true);
      expect(JSON.stringify(summaryRecord)).assertContain('general.image');
      expect(JSON.stringify(overviewRecord)).assertContain('general.image');
      expect(JSON.stringify(filenameExtensions)).assertContain('.png');

      console.log(TAG, `DragTest03 end`);
    });

    /**
     * @tc.name   DragTest04
     * @tc.number SUB_DistributedData_UDMF_SDK_DragFilenameExtensionsTest_0400
     * @tc.desc   Invalid filnameExtension drag test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DragTest04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TAG, `DragTest04 begin`);

      let driver = Driver.create();
      expect(driver !== null && driver !== undefined).assertEqual(true);

      await queryComponentCenter(driver, 'startIcon4');

      await performComponentDrag(driver, 'startIcon4', 300, 400);

      await sleep(1000);

      let summaryStr = fetchStoredSummary(SUMMARY_KEY);
      console.log(TAG, `dragSummary=${JSON.stringify(summaryStr)}`);

      let totalSize = summaryStr['totalSize'] as number;
      let filenameExtensions = summaryStr['filenameExtensions'] as Array<string>;

      expect(totalSize > 0).assertEqual(true);
      expect(JSON.stringify(filenameExtensions)).assertEqual('[".png"]');

      console.log(TAG, `DragTest04 end`);
    });

    /**
     * @tc.name   DragTest05
     * @tc.number SUB_DistributedData_UDMF_SDK_DragFilenameExtensionsTest_0500
     * @tc.desc   Image component drag test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DragTest05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TAG, `DragTest05 begin`);

      let driver = Driver.create();
      expect(driver !== null && driver !== undefined).assertEqual(true);

      await queryComponentCenter(driver, 'startIcon5');

      await performComponentDrag(driver, 'startIcon5', 300, 400);

      await sleep(1000);

      let summaryStr = fetchStoredSummary(SUMMARY_KEY);
      console.log(TAG, `dragSummary=${JSON.stringify(summaryStr)}`);

      let totalSize = summaryStr['totalSize'] as number;
      let summaryRecord = summaryStr['summary'] as Record<string, number>;
      let overviewRecord = summaryStr['overview'] as Record<string, number>;
      let filenameExtensions = summaryStr['filenameExtensions'] as Array<string>;

      expect(totalSize > 0).assertEqual(true);
      expect(JSON.stringify(summaryRecord)).assertContain('general.image');
      expect(JSON.stringify(overviewRecord)).assertContain('general.image');
      expect(JSON.stringify(filenameExtensions)).assertContain('.png');

      console.log(TAG, `DragTest05 end`);
    });

    /**
     * @tc.name   DragTest06
     * @tc.number SUB_DistributedData_UDMF_SDK_DragFilenameExtensionsTest_0600
     * @tc.desc   1000 records drag test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DragTest06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TAG, `DragTest06 begin`);

      let driver = Driver.create();
      expect(driver !== null && driver !== undefined).assertEqual(true);

      await queryComponentCenter(driver, 'startIcon6');

      await performComponentDrag(driver, 'startIcon6', 300, 400);

      await sleep(1000);

      let summaryStr = fetchStoredSummary(SUMMARY_KEY);
      console.log(TAG, `dragSummary=${JSON.stringify(summaryStr)}`);

      let totalSize = summaryStr['totalSize'] as number;
      let summaryRecord = summaryStr['summary'] as Record<string, number>;
      let overviewRecord = summaryStr['overview'] as Record<string, number>;
      let filenameExtensions = summaryStr['filenameExtensions'] as Array<string>;

      expect(totalSize > 0).assertEqual(true);
      expect(JSON.stringify(summaryRecord)).assertContain('general.image');
      expect(JSON.stringify(overviewRecord)).assertContain('general.image');
      expect(JSON.stringify(filenameExtensions)).assertEqual('[".png"]');

      console.log(TAG, `DragTest06 end`);
    });

    /**
     * @tc.name   DragTest07
     * @tc.number SUB_DistributedData_UDMF_SDK_DragFilenameExtensionsTest_0700
     * @tc.desc   Multiple records Drag Test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DragTest07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TAG, `DragTest07 begin`);

      let driver = Driver.create();
      expect(driver !== null && driver !== undefined).assertEqual(true);

      await queryComponentCenter(driver, 'startIcon7');

      await performComponentDrag(driver, 'startIcon7', 300, 400);

      await sleep(1000);

      let summaryStr = fetchStoredSummary(SUMMARY_KEY);
      console.log(TAG, `dragSummary=${JSON.stringify(summaryStr)}`);

      let filenameExtensions = summaryStr['filenameExtensions'] as Array<string>;

      expect(Array.isArray(filenameExtensions)).assertEqual(true);

      verifyExtensionListCovered(filenameExtensions, AUDIO_EXTENSIONS);
      verifyExtensionListCovered(filenameExtensions, VIDEO_EXTENSIONS);
      verifyExtensionListCovered(filenameExtensions, IMAGE_EXTENSIONS);

      console.log(TAG, `DragTest07 end`);
    });

    /**
     * @tc.name   DragTest08
     * @tc.number SUB_DistributedData_UDMF_SDK_DragFilenameExtensionsTest_0800
     * @tc.desc   Multiple records Drag Test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DragTest08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(TAG, `DragTest08 begin`);

      let driver = Driver.create();
      expect(driver !== null && driver !== undefined).assertEqual(true);

      await queryComponentCenter(driver, 'startIcon8');

      await performComponentDrag(driver, 'startIcon8', 300, 400);

      await sleep(1000);

      let summaryStr_start = fetchStoredSummary(SUMMARY_ON_START_KEY);
      let summaryStr = fetchStoredSummary(SUMMARY_KEY);
      console.log(TAG, `dragSummary_start=${JSON.stringify(summaryStr_start)}`);
      console.log(TAG, `dragSummary=${JSON.stringify(summaryStr)}`);

      let filenameExtensions_start = summaryStr_start['filenameExtensions'] as Array<string>;
      let filenameExtensions = summaryStr['filenameExtensions'] as Array<string>;

      expect(JSON.stringify(filenameExtensions_start)).assertEqual('[]');
      expect(JSON.stringify(filenameExtensions)).assertEqual('[".mp3"]');

      console.log(TAG, `DragTest08 end`);
    });
  })
}
