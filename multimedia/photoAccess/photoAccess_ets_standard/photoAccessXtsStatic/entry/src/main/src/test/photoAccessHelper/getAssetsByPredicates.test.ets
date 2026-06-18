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

import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { describe, it, expect, beforeAll, Level, beforeEach, afterEach, afterAll, Hypium } from '../../../../hypium';
import {
   getPermission, LOG_TAG, sleep
} from '../common';
import { common } from '@kit.AbilityKit';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import { Context } from '@kit.ArkUI';


const TAG = LOG_TAG + 'getAssetsTest';

let testContext: Context = Hypium.get('Context') as Context;
const helper = photoAccessHelper.getPhotoAccessHelper(testContext);

async function deleteAssets(phAccessHelper: photoAccessHelper.PhotoAccessHelper, testContext: common.Context) {
  let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
  let fetchOptions: photoAccessHelper.FetchOptions = {
    fetchColumns: [],
    predicates: predicates
  };
  try {
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
      await helper!.getAssets(fetchOptions);
    let assets: photoAccessHelper.PhotoAsset[] = await fetchResult.getAllObjects();
    await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(testContext, assets);
    console.info('deleteAssets successfully');
  } catch (err) {
    console.error(`deleteAssets failed with error: ${err.code}, ${err.message}`);
  }
}

async function createImageAsset(testContext: common.Context, phAccessHelper: photoAccessHelper.PhotoAccessHelper,
  title: string) {
  try {
    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest | null =
      photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext,
        photoAccessHelper.PhotoType.IMAGE, 'jpg', {
          title: title,
        });
    let buffer: ArrayBuffer = new ArrayBuffer(2048);
    assetChangeRequest!.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, buffer);
    await helper!.applyChanges(assetChangeRequest!);
  } catch (err) {
    console.error(`createImageAsset failed with error: ${err.code}, ${err.message}`);
  }
}

async function createAssets(testContext: common.Context, phAccessHelper: photoAccessHelper.PhotoAccessHelper) {
  await createImageAsset(testContext, helper!, 'a')
  await createImageAsset(testContext, helper!, 'b')
  await createImageAsset(testContext, helper!, 'c')
}

export default
function getAssetsByPredicatesTest(): void {
  describe('getAssetsByPredicatesTest', () => {
    let testContext: Context = Hypium.get('Context') as Context;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      await getPermission();
      await createAssets(testContext, helper!);
    });

    beforeEach(async () => {
      console.info(TAG, 'beforeEach case.')
    });

    afterEach(async () => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(async () => {
      await deleteAssets(helper!, testContext);
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0010
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0010
     * @tc.desc   fetchColumns->asset title is not equal to b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.notEqualTo(photoAccessHelper.PhotoKeys.TITLE, 'b')
          .and()
          .inValues(photoAccessHelper.PhotoKeys.TITLE, ['a', 'b', 'c'])
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult = await helper!.getAssets(fetchOptions);
        expect(assetResult.getCount()).assertEqual(2);
        expect((await assetResult.getNextObject()).displayName).assertEqual('c.jpg');
        expect((await assetResult.getNextObject()).displayName).assertEqual('a.jpg');
        const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0010';
        console.info(TAG, testName);
        done();
      } catch (error) {
        console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0020
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0020
     * @tc.desc   fetchColumns->asset title greaterThan b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.greaterThan(photoAccessHelper.PhotoKeys.TITLE, 'b')
          .and()
          .inValues(photoAccessHelper.PhotoKeys.TITLE, ['a', 'b', 'c']);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult = await helper!.getAssets(fetchOptions);
        expect(assetResult.getCount()).assertEqual(1);
        expect((await assetResult.getNextObject()).displayName).assertEqual('c.jpg');
        const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0020';
        console.info(TAG, testName);
        done();
      } catch (error) {
        console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0030
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0030
     * @tc.desc   fetchColumns->asset title lessThan b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.lessThan(photoAccessHelper.PhotoKeys.TITLE, 'b')
          .and()
          .inValues(photoAccessHelper.PhotoKeys.TITLE, ['a', 'b', 'c']);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult = await helper!.getAssets(fetchOptions);
        expect(assetResult.getCount()).assertEqual(1);
        expect((await assetResult.getNextObject()).displayName).assertEqual('a.jpg');
        const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0030';
        console.info(TAG, testName);
        done();
      } catch (error) {
        console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0040
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0040
     * @tc.desc   fetchColumns->asset title greaterThanOrEqualTo b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.greaterThanOrEqualTo(photoAccessHelper.PhotoKeys.TITLE, 'b')
          .and()
          .inValues(photoAccessHelper.PhotoKeys.TITLE, ['a', 'b', 'c']);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult = await helper!.getAssets(fetchOptions);
        expect(assetResult.getCount()).assertEqual(2);
        expect((await assetResult.getNextObject()).displayName).assertEqual('c.jpg');
        expect((await assetResult.getNextObject()).displayName).assertEqual('b.jpg');
        const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0040';
        console.info(TAG, testName);
        done();
      } catch (error) {
        console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0050
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0050
     * @tc.desc   fetchColumns->asset title lessThanOrEqualTo b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0050', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.lessThanOrEqualTo(photoAccessHelper.PhotoKeys.TITLE, 'b')
          .and()
          .inValues(photoAccessHelper.PhotoKeys.TITLE, ['a', 'b', 'c']);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult = await helper!.getAssets(fetchOptions);
        expect(assetResult.getCount()).assertEqual(2);
        expect((await assetResult.getNextObject()).displayName).assertEqual('b.jpg');
        expect((await assetResult.getNextObject()).displayName).assertEqual('a.jpg');
        const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0050';
        console.info(TAG, testName);
        done();
      } catch (error) {
        console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0060
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0060
     * @tc.desc   fetchColumns->asset title like b%
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0060', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.like(photoAccessHelper.PhotoKeys.TITLE, 'b%')
          .and()
          .inValues(photoAccessHelper.PhotoKeys.TITLE, ['a', 'b', 'c']);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult = await helper!.getAssets(fetchOptions);
        expect(assetResult.getCount()).assertEqual(1);
        expect((await assetResult.getNextObject()).displayName).assertEqual('b.jpg');
        const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0060';
        console.info(TAG, testName);
        done();
      } catch (error) {
        console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0070
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0070
     * @tc.desc   fetchColumns->asset title between a and b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0070', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.between(photoAccessHelper.PhotoKeys.TITLE, 'a', 'b')
          .and()
          .inValues(photoAccessHelper.PhotoKeys.TITLE, ['a', 'b', 'c']);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult = await helper!.getAssets(fetchOptions);
        expect(assetResult.getCount()).assertEqual(2);
        expect((await assetResult.getNextObject()).displayName).assertEqual('b.jpg');
        expect((await assetResult.getNextObject()).displayName).assertEqual('a.jpg');
        const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0070';
        console.info(TAG, testName);
        done();
      } catch (error) {
        console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0080
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0080
     * @tc.desc   fetchColumns->asset title notBetween a and b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0080', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.notBetween(photoAccessHelper.PhotoKeys.TITLE, 'a', 'b')
          .and()
          .inValues(photoAccessHelper.PhotoKeys.TITLE, ['a', 'b', 'c']);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult = await helper!.getAssets(fetchOptions);
        expect(assetResult.getCount()).assertEqual(1);
        expect((await assetResult.getNextObject()).displayName).assertEqual('c.jpg');
        const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0080';
        console.info(TAG, testName);
        done();
      } catch (error) {
        console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0090
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0090
     * @tc.desc   fetchColumns->asset title notIn [a,b]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0090', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.notInValues(photoAccessHelper.PhotoKeys.TITLE, ['a', 'b'])
          .and()
          .inValues(photoAccessHelper.PhotoKeys.TITLE, ['a', 'b', 'c']);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult = await helper!.getAssets(fetchOptions);
        expect(assetResult.getCount()).assertEqual(1);
        expect((await assetResult.getNextObject()).displayName).assertEqual('c.jpg');
        const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0090';
        console.info(TAG, testName);
        done();
      } catch (error) {
        console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0100
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0100
     * @tc.desc   fetchColumns-> predicates with or,beginWrap and endWrap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.beginWrap()
          .equalTo(photoAccessHelper.PhotoKeys.TITLE, 'a')
          .or()
          .equalTo(photoAccessHelper.PhotoKeys.TITLE, 'b')
          .endWrap()
          .and()
          .inValues(photoAccessHelper.PhotoKeys.TITLE, ['a', 'b', 'c']);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult = await helper!.getAssets(fetchOptions);
        expect(assetResult.getCount()).assertEqual(2);
        expect((await assetResult.getNextObject()).displayName).assertEqual('b.jpg');
        expect((await assetResult.getNextObject()).displayName).assertEqual('a.jpg');
        const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GET_ASSETS_BY_PREDICATES_STATIC_0100';
        console.info(TAG, testName);
        done();
      } catch (error) {
        console.error(TAG, `failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

  })
}