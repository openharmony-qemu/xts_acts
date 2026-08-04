'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll, Level, beforeEach, afterEach, afterAll, Hypium } from '../../../../hypium/index'
import { common } from '@kit.AbilityKit';
import { fetchOption, getPermission, LOG_TAG } from '../common';
import { BusinessError } from '@kit.BasicServicesKit';
import { Context } from '@kit.ArkUI';
import dataSharePredicates from '@ohos.data.dataSharePredicates';

const TAG = LOG_TAG + 'getAssetsStaticTest';
interface ErrorCodeType{
  error_parm: string;
  Invalid_Parm: string;
}
const ErrorCode: ErrorCodeType = {
  error_parm: '13900020',
  Invalid_Parm: '401'
}

let testContext: Context = Hypium.get('Context') as Context;
const helper = photoAccessHelper.getPhotoAccessHelper(testContext);

export default function getAssetsStaticTest(): void {
  describe('getAssetsStaticTest', () => {
    const imageDisplayName = 'testGetAsset.jpg';
    const videoDisplayName = 'testGetAsset.mp4';
    const abnormalDisplayName = 'text';

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      await getPermission();
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0010
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0010
     * @tc.desc   callback, image, fetchOps -> normal image name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0010';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, imageDisplayName);
      try {
        helper!.getAssets(fetchOps, (error: BusinessError<void> | null,
          fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> | undefined) => {
          expect(fetchResult!.isAfterLast()).assertTrue();
          fetchResult!.close();
          done();
        });
      } catch (error) {
        console.error(TAG, `getAssets catch failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0020
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0020
     * @tc.desc   callback, image, fetchOps -> abnormal image name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0020';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, abnormalDisplayName);
      try {
        helper!.getAssets(fetchOps, (error: BusinessError<void> | null,
          fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> | undefined) => {
          expect(fetchResult!.isAfterLast()).assertTrue();
          done();
        });
      } catch (error) {
        console.error(TAG, `getAssets catch failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0040
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0040
     * @tc.desc   callback, video, fetchOps->normal video name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0040';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, videoDisplayName);
      try {
        helper!.getAssets(fetchOps, (error: BusinessError<void> | null,
          fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> | undefined) => {
          expect(fetchResult!.isAfterLast()).assertTrue();
          done();
        });
      } catch (error) {
        console.error(TAG, `getAssets catch failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0050
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0050
     * @tc.desc   callback, video, fetchOps -> abnormal video name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0050', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0050';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, abnormalDisplayName);
      try {
        helper!.getAssets(fetchOps, (error: BusinessError<void> | null,
          fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> | undefined) => {
          expect(fetchResult!.isAfterLast()).assertTrue();
          done();
        });
      } catch (error) {
        console.error(TAG, `getAssets catch failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0080
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0080
     * @tc.desc   promise, image, fetchOps -> normal image name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0080', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0080';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, imageDisplayName);
      try {
        const fetchResult = await helper!.getAssets(fetchOps);
        expect(fetchResult!.isAfterLast()).assertTrue();
        fetchResult.close();
        done();
      } catch (error) {
        console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0090
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0090
     * @tc.desc   promise, image, fetchOps -> abnormal image name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0090', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0090';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, abnormalDisplayName);
      try {
        const fetchResult = await helper!.getAssets(fetchOps);
        expect(fetchResult!.isAfterLast()).assertTrue();
        fetchResult.close();
        done();
      } catch (error) {
        console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0100
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0100
     * @tc.desc   promise, video, fetchOps -> normal video name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0100';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, videoDisplayName);
      try {
        const fetchResult = await helper!.getAssets(fetchOps);
        expect(fetchResult!.isAfterLast()).assertTrue();
        fetchResult.close();
        done();
      } catch (error) {
        console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0110
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0110
     * @tc.desc   promise, video, fetchOps -> abnormal video name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0110', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0110';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, abnormalDisplayName);
      try {
        const fetchResult = await helper!.getAssets(fetchOps);
        expect(fetchResult!.isAfterLast()).assertTrue();
        fetchResult.close();
        done();
      } catch (error) {
        console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0120
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0120
     * @tc.desc   promise, image, fetchOps->invalid strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0120', Level.LEVEL4, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ASSETS_STATIC_0120';
      console.info(TAG, testName);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [''],
        predicates: predicates
      };
      try {
        const fetchResult = await helper!.getAssets(fetchOps);
        expect().assertFail();
        fetchResult.close();
        done();
      } catch (error) {
        console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(13900020);
        done();
      }
    })

  })
}