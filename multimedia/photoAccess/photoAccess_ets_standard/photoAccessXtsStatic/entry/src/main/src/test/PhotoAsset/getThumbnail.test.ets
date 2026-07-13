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

import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { describe, it, expect, beforeAll, Level, beforeEach, afterEach, afterAll, Hypium } from '@ohos/hypium-binary/src/main/indexStatic';
import { fetchOption, getPermission, LOG_TAG } from '../common';
import { Context } from '@kit.ArkUI';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import { BusinessError } from '@kit.BasicServicesKit';
import { image } from '@kit.ImageKit';
import { ErrorCode } from '@kit.AbilityKit';

const TAG = LOG_TAG + 'getThumbnail';
const IMAGE_TEST_FILE = 'getThumb.jpg';
const VIDEO_TEST_FILE = 'getThumb.mp4';

export default function getThumbnailStaticTest(): void {
  describe('getThumbnailStaticTest', () => {
    const fileNameList = [IMAGE_TEST_FILE, VIDEO_TEST_FILE];
    let testContext: Context = Hypium.get('Context') as Context;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);

    beforeAll(async () => {
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
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0010
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0010
     * @tc.desc   getThumbnail(image) by no size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0010';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        asset.getThumbnail((err: BusinessError<void> | null, pixelMap: image.PixelMap | undefined) => {
          console.info(TAG, testName, 'getThumbnail successful');
          expect(pixelMap!.isEditable !== undefined).assertTrue();
          expect(pixelMap!.isStrideAlignment !== undefined).assertTrue();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0020
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0020
     * @tc.desc   getThumbnail(video) by no size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0020';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        asset.getThumbnail((err: BusinessError<void> | null, pixelMap: image.PixelMap | undefined) => {
          console.info(TAG, testName, 'getThumbnail successful');
          expect(pixelMap!.isEditable !== undefined).assertTrue();
          expect(pixelMap!.isStrideAlignment !== undefined).assertTrue();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0030
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0030
     * @tc.desc   getThumbnail(image) by { width: 128, height: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0030';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let size: image.Size = { width: 128, height: 128 }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        asset.getThumbnail(size, (err: BusinessError<void> | null, pixelMap: image.PixelMap | undefined) => {
          console.info(TAG, testName, 'getThumbnail successful');
          expect(pixelMap!.isEditable !== undefined).assertTrue();
          expect(pixelMap!.isStrideAlignment !== undefined).assertTrue();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0040
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0040
     * @tc.desc   getThumbnail(image) by { width: 1, height: 1024 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0040', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0040';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let size: image.Size = { width: 1, height: 1024 }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        asset.getThumbnail(size, (err: BusinessError<void> | null, pixelMap: image.PixelMap | undefined) => {
          console.info(TAG, testName, 'getThumbnail successful');
          expect(pixelMap!.isEditable !== undefined).assertTrue();
          expect(pixelMap!.isStrideAlignment !== undefined).assertTrue();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0050
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0050
     * @tc.desc   getThumbnail(image) by { width: 1024, height: 1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0050', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0050';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let size: image.Size = { width: 1024, height: 1 }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        asset.getThumbnail(size, (err: BusinessError<void> | null, pixelMap: image.PixelMap | undefined) => {
          console.info(TAG, testName, 'getThumbnail successful');
          expect(pixelMap!.isEditable !== undefined).assertTrue();
          expect(pixelMap!.isStrideAlignment !== undefined).assertTrue();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0060
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0060
     * @tc.desc   getThumbnail(image) by { width: 1024, height: 1024 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0060', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0060';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let size: image.Size = { width: 1024, height: 1024 }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        asset.getThumbnail(size, (err: BusinessError<void> | null, pixelMap: image.PixelMap | undefined) => {
          console.info(TAG, testName, 'getThumbnail successful');
          expect(pixelMap!.isEditable !== undefined).assertTrue();
          expect(pixelMap!.isStrideAlignment !== undefined).assertTrue();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0070
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0070
     * @tc.desc   getThumbnail(image) by { width: 1, height: 1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0070', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0070';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let size: image.Size = { width: 1, height: 1 }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        asset.getThumbnail(size, (err: BusinessError<void> | null, pixelMap: image.PixelMap | undefined) => {
          console.info(TAG, testName, 'getThumbnail successful');
          expect(pixelMap!.isEditable !== undefined).assertTrue();
          expect(pixelMap!.isStrideAlignment !== undefined).assertTrue();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0080
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0080
     * @tc.desc   getThumbnail(image) by { height: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0080', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0080';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let size: image.Size = { width: 0, height: 128 }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        asset.getThumbnail(size, (err: BusinessError<void> | null, pixelMap: image.PixelMap | undefined) => {
          console.info(TAG, testName, 'getThumbnail successful');
          expect(pixelMap!.isEditable !== undefined).assertTrue();
          expect(pixelMap!.isStrideAlignment !== undefined).assertTrue();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0090
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0090
     * @tc.desc   getThumbnail(image) by { width: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0090', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0090';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let size: image.Size = { width: 128, height: 0 }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        asset.getThumbnail(size, (err: BusinessError<void> | null, pixelMap: image.PixelMap | undefined) => {
          console.info(TAG, testName, 'getThumbnail successful');
          expect(pixelMap!.isEditable !== undefined).assertTrue();
          expect(pixelMap!.isStrideAlignment !== undefined).assertTrue();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0100
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0100
     * @tc.desc   getThumbnail(video) by { width: 128, height: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0100';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let size: image.Size = { width: 128, height: 128 }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        asset.getThumbnail(size, (err: BusinessError<void> | null, pixelMap: image.PixelMap | undefined) => {
          console.info(TAG, testName, 'getThumbnail successful');
          expect(pixelMap!.isEditable !== undefined).assertTrue();
          expect(pixelMap!.isStrideAlignment !== undefined).assertTrue();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0110
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0110
     * @tc.desc   getThumbnail(video) by { width: 1, height: 1024 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0110', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0110';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let size: image.Size = { width: 1, height: 1024 }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        asset.getThumbnail(size, (err: BusinessError<void> | null, pixelMap: image.PixelMap | undefined) => {
          console.info(TAG, testName, 'getThumbnail successful');
          expect(pixelMap!.isEditable !== undefined).assertTrue();
          expect(pixelMap!.isStrideAlignment !== undefined).assertTrue();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0120
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0120
     * @tc.desc   getThumbnail(video) by { width: 1024, height: 1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0120', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0120';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let size: image.Size = { width: 1024, height: 1 }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        asset.getThumbnail(size, (err: BusinessError<void> | null, pixelMap: image.PixelMap | undefined) => {
          console.info(TAG, testName, 'getThumbnail successful');
          expect(pixelMap!.isEditable !== undefined).assertTrue();
          expect(pixelMap!.isStrideAlignment !== undefined).assertTrue();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0130
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0130
     * @tc.desc   getThumbnail(video) by { width: 1024, height: 1024 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0130', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0130';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let size: image.Size = { width: 1024, height: 1024 }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        asset.getThumbnail(size, (err: BusinessError<void> | null, pixelMap: image.PixelMap | undefined) => {
          console.info(TAG, testName, 'getThumbnail successful');
          expect(pixelMap!.isEditable !== undefined).assertTrue();
          expect(pixelMap!.isStrideAlignment !== undefined).assertTrue();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0140
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0140
     * @tc.desc   getThumbnail(video) by { width: 1, height: 1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0140', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0140';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let size: image.Size = { width: 1, height: 1 }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        asset.getThumbnail(size, (err: BusinessError<void> | null, pixelMap: image.PixelMap | undefined) => {
          console.info(TAG, testName, 'getThumbnail successful');
          expect(pixelMap!.isEditable !== undefined).assertTrue();
          expect(pixelMap!.isStrideAlignment !== undefined).assertTrue();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0150
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0150
     * @tc.desc   getThumbnail(video) by { height: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0150', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0150';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let size: image.Size = { width: 0, height: 128 }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        asset.getThumbnail(size, (err: BusinessError<void> | null, pixelMap: image.PixelMap | undefined) => {
          console.info(TAG, testName, 'getThumbnail successful');
          expect(pixelMap!.isEditable !== undefined).assertTrue();
          expect(pixelMap!.isStrideAlignment !== undefined).assertTrue();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0160
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0160
     * @tc.desc   getThumbnail(video) by { width: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0160', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0160';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let size: image.Size = { width: 128, height: 0 }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        asset.getThumbnail(size, (err: BusinessError<void> | null, pixelMap: image.PixelMap | undefined) => {
          console.info(TAG, testName, 'getThumbnail successful');
          expect(pixelMap!.isEditable !== undefined).assertTrue();
          expect(pixelMap!.isStrideAlignment !== undefined).assertTrue();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0170
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0170
     * @tc.desc   getThumbnail(video) by { width: -1, height: -1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0170', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0170';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let size: image.Size = { width: -1, height: -1 }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        asset.getThumbnail(size, (err: BusinessError<void> | null, pixelMap: image.PixelMap | undefined) => {
          expect(pixelMap!.isEditable !== undefined).assertTrue();
          expect(pixelMap!.isStrideAlignment !== undefined).assertTrue();
          console.info(TAG, testName, 'getThumbnail successful');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0180
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0180
     * @tc.desc   getThumbnail(image) by { width: -1, height: -1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0180', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0180';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let size: image.Size = { width: -1, height: -1 }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        asset.getThumbnail(size, (err: BusinessError<void> | null, pixelMap: image.PixelMap | undefined) => {
          console.info(TAG, testName, 'getThumbnail successful');
          expect(pixelMap!.isEditable !== undefined).assertTrue();
          expect(pixelMap!.isStrideAlignment !== undefined).assertTrue();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0190
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0190
     * @tc.desc   getThumbnail(image) by { width: 99999, height: 99999 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0190', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0190';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let size: image.Size = { width: 99999, height: 99999 }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        asset.getThumbnail(size, (err: BusinessError<void> | null, pixelMap: image.PixelMap | undefined) => {
          if (err) {
            console.error(TAG, `${testName} err: ${err.code}, ${err.message}`);
          } else {
            expect().assertFail();
          }
          done();
        })
      } catch (error) {
        console.error(TAG, `${testName} failed; error: ${error?.code}, ${error?.message}`);
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0200
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0200
     * @tc.desc   getThumbnail(video) by { width: 0, height: 0 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0200';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let size: image.Size = { width: 0, height: 0 }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        asset.getThumbnail(size, (err: BusinessError<void> | null, pixelMap: image.PixelMap | undefined) => {
          if (err) {
            console.error(TAG, `${testName} err: ${err.code}, ${err.message}`);
          } else {
            expect().assertFail();
          }
          done();
        })
      } catch (error) {
        console.error(TAG, `${testName} failed; error: ${error?.code}, ${error?.message}`);
        done();
      }
    })


    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0210
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0210
     * @tc.desc   getThumbnail(video) by { width: 99999, height: 99999 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0210', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0210';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let size: image.Size = { width: 99999, height: 99999 }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        asset.getThumbnail(size, (err: BusinessError<void> | null, pixelMap: image.PixelMap | undefined) => {
          if (err) {
            console.error(TAG, `${testName} err: ${err.code}, ${err.message}`);
          } else {
            expect().assertFail();
          }
          done();
        })
      } catch (error) {
        console.error(TAG, `${testName} failed; error: ${error?.code}, ${error?.message}`);
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0220
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0220
     * @tc.desc   getThumbnail(image) by no size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0220', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0220';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        const pixelMap = await asset.getThumbnail();
        console.info(TAG, `${testName} pixelMap: ${pixelMap}`);
        const info = await pixelMap.getImageInfo();
        const defaultSize: image.Size = { width: 256, height: 256 };
        expect(info.size.width).assertEqual(defaultSize.width);
        expect(info.size.height).assertEqual(defaultSize.height);
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0230
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0230
     * @tc.desc   getThumbnail(video) by no size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0230', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0230';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        const pixelMap = await asset.getThumbnail();
        console.info(TAG, `${testName} pixelMap: ${pixelMap}`);
        const info = await pixelMap.getImageInfo();
        const defaultSize: image.Size = { width: 256, height: 256 };
        expect(info.size.width).assertEqual(defaultSize.width);
        expect(info.size.height).assertEqual(defaultSize.height);
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0240
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0240
     * @tc.desc   getThumbnail(image) by { width: 128, height: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0240', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0240';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        const size: image.Size = { width: 128, height: 128 };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        const pixelMap = await asset.getThumbnail(size);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, `${testName} pixelMap: ${pixelMap}`);
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0250
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0250
     * @tc.desc   getThumbnail(image) by { width: 1, height: 1024 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0250', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0250';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        const size: image.Size = { width: 1, height: 1024 };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        const pixelMap = await asset.getThumbnail(size);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, `${testName} pixelMap: ${pixelMap}`);
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0260
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0260
     * @tc.desc   getThumbnail(image) by { width: 1024, height: 1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0260', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0260';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        const size: image.Size = { width: 1024, height: 1 };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        const pixelMap = await asset.getThumbnail(size);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, `${testName} pixelMap: ${pixelMap}`);
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0270
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0270
     * @tc.desc   getThumbnail(image) by { width: 1024, height: 1024 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0270', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0270';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        const size: image.Size = { width: 1024, height: 1024 };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        const pixelMap = await asset.getThumbnail(size);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, `${testName} pixelMap: ${pixelMap}`);
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0280
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0280
     * @tc.desc   getThumbnail(image) by { width: 1, height: 1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0280', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0280';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        const size: image.Size = { width: 1, height: 1 };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        const pixelMap = await asset.getThumbnail(size);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, `${testName} pixelMap: ${pixelMap}`);
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0290
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0290
     * @tc.desc   getThumbnail(image) by { height: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0290', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0290';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        const size: image.Size = { width: 0, height: 128 };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        const pixelMap = await asset.getThumbnail(size);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, `${testName} pixelMap: ${pixelMap}`);
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0300
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0300
     * @tc.desc   getThumbnail(image) by { width: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0300';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        const size: image.Size = { width: 128, height: 0 };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        const pixelMap = await asset.getThumbnail(size);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, `${testName} pixelMap: ${pixelMap}`);
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0310
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0310
     * @tc.desc   getThumbnail(video) by { width: 128, height: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0310', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0310';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        const size: image.Size = { width: 128, height: 128 };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        const pixelMap = await asset.getThumbnail(size);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, `${testName} pixelMap: ${pixelMap}`);
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0320
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0320
     * @tc.desc   getThumbnail(video) by { width: 1, height: 1024 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0320', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0320';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        const size: image.Size = { width: 1, height: 1024 };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        const pixelMap = await asset.getThumbnail(size);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, `${testName} pixelMap: ${pixelMap}`);
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0330
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0330
     * @tc.desc   getThumbnail(video) by { width: 1024, height: 1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0330', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0330';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        const size: image.Size = { width: 1024, height: 1 };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        const pixelMap = await asset.getThumbnail(size);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, `${testName} pixelMap: ${pixelMap}`);
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0340
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0340
     * @tc.desc   getThumbnail(video) by { width: 1024, height: 1024 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0340', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0340';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        const size: image.Size = { width: 1024, height: 1024 };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        const pixelMap = await asset.getThumbnail(size);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, `${testName} pixelMap: ${pixelMap}`);
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0350
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0350
     * @tc.desc   getThumbnail(video) by { width: 1, height: 1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0350', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0350';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        const size: image.Size = { width: 1, height: 1 };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        const pixelMap = await asset.getThumbnail(size);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, `${testName} pixelMap: ${pixelMap}`);
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0360
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0360
     * @tc.desc   getThumbnail(video) by { height: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0360', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0360';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        const size: image.Size = { width: 0, height: 128 };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        const pixelMap = await asset.getThumbnail(size);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, `${testName} pixelMap: ${pixelMap}`);
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0370
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0370
     * @tc.desc   getThumbnail(video) by { width: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0370', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0370';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        const size: image.Size = { width: 128, height: 0 };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        const pixelMap = await asset.getThumbnail(size);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, `${testName} pixelMap: ${pixelMap}`);
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0380
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0380
     * @tc.desc   getThumbnail(image) by { width: 0, height: 0 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0380', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0380';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        const size: image.Size = { width: 0, height: 0 };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        await asset.getThumbnail(size);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, `${testName} failed; error: ${error?.code}, ${error?.message}`);
        done();
      }
    })


    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0390
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0390
     * @tc.desc   getThumbnail(image) by { width: -1, height: -1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0390', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0390';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        const size: image.Size = { width: -1, height: -1 };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        const pixelMap = await asset.getThumbnail(size);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, `${testName} pixelMap: ${pixelMap}`);
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0400
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0400
     * @tc.desc   getThumbnail(image) by { width: 99999, height: 99999 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0400';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        const size: image.Size = { width: 99999, height: 99999 };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        await asset.getThumbnail(size);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, `${testName} failed; error: ${error?.code}, ${error?.message}`);
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0410
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0410
     * @tc.desc   getThumbnail(video) by { width: 0, height: 0 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0410', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0410';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        const size: image.Size = { width: 0, height: 0 };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        await asset.getThumbnail(size);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, `${testName} failed; error: ${error?.code}, ${error?.message}`);
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0420
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0420
     * @tc.desc   getThumbnail(video) by { width: -1, height: -1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0420', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0420';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        const size: image.Size = { width: -1, height: -1 };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        const pixelMap = await asset.getThumbnail(size);
        expect(pixelMap != undefined).assertTrue();
        console.info(TAG, `${testName} pixelMap: ${pixelMap}`);
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0430
     * @tc.number SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0430
     * @tc.desc   getThumbnail(video) by { width: 99999, height: 99999 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0430', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_PHOTO_GET_THUMBNAIL_STATIC_0430';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        const size: image.Size = { width: 99999, height: 99999 };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        await asset.getThumbnail(size);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, `${testName} failed; error: ${error?.code}, ${error?.message}`);
        done();
      }
    })

  })
}