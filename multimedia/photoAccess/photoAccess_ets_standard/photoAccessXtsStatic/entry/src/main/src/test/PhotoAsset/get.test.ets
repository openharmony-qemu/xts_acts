'use static'
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
import { describe, it, expect, beforeAll, Level, beforeEach, afterEach, afterAll, Hypium } from "../../../../hypium";
import { getPermission, LOG_TAG } from '../common';
import common from '@ohos.app.ability.common';
import { Context } from '@ohos.arkui.UIContext';
import dataSharePredicates from '@ohos.data.dataSharePredicates';

let testContext: Context = Hypium.get('Context') as Context;
const helper = photoAccessHelper.getPhotoAccessHelper(testContext);

export default function getTest(): void {
  describe('getTest', () => {
    const TAG = LOG_TAG + 'getTest';


    const fileNameList = ["getTest.jpg", "getTest.mp4"];


    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
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
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0010
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0010
     * @tc.desc   image get photoKeys.URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0010';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let uri: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.URI;
        let photoAssetUri: photoAccessHelper.MemberType = photoAsset.get(uri.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetUri = ', photoAssetUri);
        expect(photoAssetUri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0020
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0020
     * @tc.desc   image get photoKeys.PHOTO_TYPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0020', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0020';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let photoType: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.PHOTO_TYPE;
        let photoAssetPhotoType: photoAccessHelper.MemberType = photoAsset.get(photoType.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetPhotoType = ', photoAssetPhotoType);
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0030
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0030
     * @tc.desc   image get photoKeys.DISPLAY_NAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0030', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0030';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let displayName: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.DISPLAY_NAME;
        let photoAssetDisplayName: photoAccessHelper.MemberType = photoAsset.get(displayName.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetDisplayName = ', photoAssetDisplayName);
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0040
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0040
     * @tc.desc   image get photoKeys.DATE_ADDED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0040', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0040';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['date_added'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let dataAdded: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.DATE_ADDED;
        console.error(TAG,testName,'succ',dataAdded,JSON.stringify(dataAdded));
        let photoAssetDataAdded: photoAccessHelper.MemberType = photoAsset.get(dataAdded.toString());
        console.error(TAG,testName,'dataAdded',photoAssetDataAdded);
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0050
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0050
     * @tc.desc   image get photoKeys.DATE_MODIFIED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0050', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0050';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['date_modified'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let dataModified: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.DATE_MODIFIED;
        console.error(TAG,testName,'succ',dataModified,JSON.stringify(dataModified));
        let photoAssetDataModified: photoAccessHelper.MemberType = photoAsset.get(dataModified.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetDataModified = ', photoAssetDataModified);
        expect(photoAssetDataModified != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0060
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0060
     * @tc.desc   image get photoKeys.DURATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0060', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0060';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['duration'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let duration: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.DURATION;
        console.error(TAG,testName,'succ',duration,JSON.stringify(duration));
        let photoAssetDataDuration: photoAccessHelper.MemberType = photoAsset.get(duration.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetDataDuration = ', photoAssetDataDuration);
        expect(photoAssetDataDuration != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0070
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0070
     * @tc.desc   image get photoKeys.WIDTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0070', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0070';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['width'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let width: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.WIDTH;
        console.error(TAG,testName,'succ',width,JSON.stringify(width));
        let photoAssetWidth: photoAccessHelper.MemberType = photoAsset.get(width.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetWidth = ', photoAssetWidth);
        expect(photoAssetWidth != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0080
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0080
     * @tc.desc   image get photoKeys.HEIGHT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0080', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0080';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['height'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let height: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.HEIGHT;
        console.error(TAG,testName,'succ',height,JSON.stringify(height));
        let photoAssetHeight: photoAccessHelper.MemberType = photoAsset.get(height.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetWidth = ', photoAssetHeight);
        expect(photoAssetHeight != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0090
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0090
     * @tc.desc   image get photoKeys.DATE_TAKEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0090', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0090';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['date_taken'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let dateTaken: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.DATE_TAKEN;
        console.error(TAG,testName,'succ',dateTaken,JSON.stringify(dateTaken));
        let photoAssetDateTaken: photoAccessHelper.MemberType = photoAsset.get(dateTaken.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetDateTaken = ', photoAssetDateTaken);
        expect(photoAssetDateTaken != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0100
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0100
     * @tc.desc   image get photoKeys.ORIENTATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0100';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['orientation'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let orientation: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.ORIENTATION;
        console.error(TAG,testName,'succ',orientation,JSON.stringify(orientation));
        let photoAssetOrientation: photoAccessHelper.MemberType = photoAsset.get(orientation.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetOrientation = ', photoAssetOrientation);
        expect(photoAssetOrientation != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0120
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0120
     * @tc.desc   image get photoKeys.TITLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0120', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0120';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['title'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.TITLE;
        console.error(TAG,testName,'succ',title,JSON.stringify(title));
        let photoAssetTitle: photoAccessHelper.MemberType = photoAsset.get(title.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetTitle = ', photoAssetTitle);
        expect(photoAssetTitle != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0130
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0130
     * @tc.desc   image get photoKeys.POSITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0130', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0130';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['position'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let position: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.POSITION;
        console.error(TAG,testName,'succ',position,JSON.stringify(position));
        let photoAssetPosition: photoAccessHelper.MemberType = photoAsset.get(position.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetPosition = ', photoAssetPosition);
        expect(photoAssetPosition != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0140
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0140
     * @tc.desc   video get photoKeys.URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0140', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0140';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let uri: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.URI;
        let photoAssetUri: photoAccessHelper.MemberType = photoAsset.get(uri.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetUri = ', photoAssetUri);
        expect(photoAssetUri != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0150
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0150
     * @tc.desc   video get photoKeys.PHOTO_TYPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0150', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0150';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let photoType: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.PHOTO_TYPE;
        let photoAssetPhotoType: photoAccessHelper.MemberType = photoAsset.get(photoType.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetPhotoType = ', photoAssetPhotoType);
        expect(photoAssetPhotoType != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0160
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0160
     * @tc.desc   video get photoKeys.DISPLAY_NAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0160', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0160';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let displayName: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.DISPLAY_NAME;
        let photoAssetDisplayName: photoAccessHelper.MemberType = photoAsset.get(displayName.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetDisplayName = ', photoAssetDisplayName);
        expect(photoAssetDisplayName != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0170
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0170
     * @tc.desc   video get photoKeys.DATE_ADDED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0170', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0170';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['date_added'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let dataAdded: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.DATE_ADDED;
        console.error(TAG,testName,'succ',dataAdded,JSON.stringify(dataAdded));
        let photoAssetDataAdded: photoAccessHelper.MemberType = photoAsset.get(dataAdded.toString());
        expect(photoAssetDataAdded != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0180
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0180
     * @tc.desc   video get photoKeys.DATE_MODIFIED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0180', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0180';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['date_modified'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let dataModified: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.DATE_MODIFIED;
        console.error(TAG,testName,'succ',dataModified,JSON.stringify(dataModified));
        let photoAssetDataModified: photoAccessHelper.MemberType = photoAsset.get(dataModified.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetDataModified = ', photoAssetDataModified);
        expect(photoAssetDataModified != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0190
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0190
     * @tc.desc   video get photoKeys.DURATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0190', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0190';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['duration'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let duration: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.DURATION;
        console.error(TAG,testName,'succ',duration,JSON.stringify(duration));
        let photoAssetDataDuration: photoAccessHelper.MemberType = photoAsset.get(duration.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetDataDuration = ', photoAssetDataDuration);
        expect(photoAssetDataDuration != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0200
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0200
     * @tc.desc   video get photoKeys.WIDTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0200';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['width'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let width: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.WIDTH;
        console.error(TAG,testName,'succ',width,JSON.stringify(width));
        let photoAssetWidth: photoAccessHelper.MemberType = photoAsset.get(width.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetWidth = ', photoAssetWidth);
        expect(photoAssetWidth != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0210
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0210
     * @tc.desc   video get photoKeys.HEIGHT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0210', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0210';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['height'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let height: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.HEIGHT;
        console.error(TAG,testName,'succ',height,JSON.stringify(height));
        let photoAssetHeight: photoAccessHelper.MemberType = photoAsset.get(height.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetWidth = ', photoAssetHeight);
        expect(photoAssetHeight != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0220
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0220
     * @tc.desc   video get photoKeys.DATE_TAKEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0220', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0220';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['date_taken'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let dateTaken: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.DATE_TAKEN;
        console.error(TAG,testName,'succ',dateTaken,JSON.stringify(dateTaken));
        let photoAssetDateTaken: photoAccessHelper.MemberType = photoAsset.get(dateTaken.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetDateTaken = ', photoAssetDateTaken);
        expect(photoAssetDateTaken != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0230
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0230
     * @tc.desc   video get photoKeys.ORIENTATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0230', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0230';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['orientation'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let orientation: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.ORIENTATION;
        console.error(TAG,testName,'succ',orientation,JSON.stringify(orientation));
        let photoAssetOrientation: photoAccessHelper.MemberType = photoAsset.get(orientation.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetOrientation = ', photoAssetOrientation);
        expect(photoAssetOrientation != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0240
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0240
     * @tc.desc   video get photoKeys.TITLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0240', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0240';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['title'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.TITLE;
        console.error(TAG,testName,'succ',title,JSON.stringify(title));
        let photoAssetTitle: photoAccessHelper.MemberType = photoAsset.get(title.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetTitle = ', photoAssetTitle);
        expect(photoAssetTitle != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0250
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0250
     * @tc.desc   video get photoKeys.POSITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0250', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0250';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['position'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let position: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.POSITION;
        console.error(TAG,testName,'succ',position,JSON.stringify(position));
        let photoAssetPosition: photoAccessHelper.MemberType = photoAsset.get(position.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetPosition = ', photoAssetPosition);
        expect(photoAssetPosition != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0260
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0260
     * @tc.desc   image get photoKeys.DATE_ADDED_MS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0260', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0260';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['date_added_ms'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let dateAddedMs: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.DATE_ADDED_MS;
        console.log(TAG,`${testName} :: asset photoKeys.DATE_ADDED_MS is ${dateAddedMs}`);
        let photoAssetDateAddedMs: photoAccessHelper.MemberType = photoAsset.get(dateAddedMs.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetDateAddedMs = ', photoAssetDateAddedMs);
        expect(photoAssetDateAddedMs != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0270
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0270
     * @tc.desc   video get photoKeys.DATE_ADDED_MS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0270', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0270';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['date_added_ms'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let dateAddedMs: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.DATE_ADDED_MS;
        console.log(TAG,`${testName} :: asset photoKeys.DATE_ADDED_MS is ${dateAddedMs}`);
        let photoAssetDateAddedMs: photoAccessHelper.MemberType = photoAsset.get(dateAddedMs.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetDateAddedMs = ', photoAssetDateAddedMs);
        expect(photoAssetDateAddedMs != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0280
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0280
     * @tc.desc   image get photoKeys.DATE_MODIFIED_MS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0280', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0280';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['date_modified_ms'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let dateModifiedMs: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.DATE_MODIFIED_MS;
        console.log(TAG,`${testName} :: asset photoKeys.DATE_MODIFIED_MS is ${dateModifiedMs}`);
        let photoAssetDateModifiedMs: photoAccessHelper.MemberType = photoAsset.get(dateModifiedMs.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetDateModifiedMs = ', photoAssetDateModifiedMs);
        expect(photoAssetDateModifiedMs != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0290
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0290
     * @tc.desc   video get photoKeys.DATE_MODIFIED_MS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0290', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0290';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['date_modified_ms'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let dateModifiedMs: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.DATE_MODIFIED_MS;
        console.log(TAG,`${testName} :: asset photoKeys.DATE_MODIFIED_MS is ${dateModifiedMs}`);
        let photoAssetDateModifiedMs: photoAccessHelper.MemberType = photoAsset.get(dateModifiedMs.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetDateModifiedMs = ', photoAssetDateModifiedMs);
        expect(photoAssetDateModifiedMs != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0300
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0300
     * @tc.desc   image get photoKeys.DYNAMIC_RANGE_TYPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0300';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['dynamic_range_type'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let dynamicRangeType: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.DYNAMIC_RANGE_TYPE;
        console.log(TAG,`${testName} :: asset photoKeys.DYNAMIC_RANGE_TYPE is ${dynamicRangeType}`);
        let photoAssetDynamicRangeType: photoAccessHelper.MemberType = photoAsset.get(dynamicRangeType.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetDynamicRangeType = ', photoAssetDynamicRangeType);
        expect(photoAssetDynamicRangeType != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0310
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0310
     * @tc.desc   common image get photoKeys.COVER_POSITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0310', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0310';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['cover_position'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let coverPosition: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.COVER_POSITION;
        console.log(TAG,`${testName} :: asset photoKeys.COVER_POSITION is ${coverPosition}`);
        let photoAssetCoverPosition: photoAccessHelper.MemberType = photoAsset.get(coverPosition.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetCoverPosition = ', photoAssetCoverPosition);
        expect(photoAssetCoverPosition != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0320
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0320
     * @tc.desc   common video get photoKeys.COVER_POSITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0320', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0320';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['cover_position'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let coverPosition: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.COVER_POSITION;
        console.log(TAG,`${testName} :: asset photoKeys.COVER_POSITION is ${coverPosition}`);
        let photoAssetCoverPosition: photoAccessHelper.MemberType = photoAsset.get(coverPosition.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetCoverPosition = ', photoAssetCoverPosition);
        expect(photoAssetCoverPosition != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0330
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0330
     * @tc.desc   image get photoKeys.BURST_KEY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0330', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0330';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['burst_key'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let burstKey: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.BURST_KEY;
        console.log(TAG,`${testName} :: asset photoKeys.BURST_KEY is ${burstKey}`);
        let photoAssetBurstKey: photoAccessHelper.MemberType = photoAsset.get(burstKey.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetBurstKey = ', photoAssetBurstKey);
        expect(photoAssetBurstKey != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0340
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0340
     * @tc.desc   video get photoKeys.BURST_KEY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0340', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0340';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['burst_key'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let burstKey: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.BURST_KEY;
        console.log(TAG,`${testName} :: asset photoKeys.BURST_KEY is ${burstKey}`);
        let photoAssetBurstKey: photoAccessHelper.MemberType = photoAsset.get(burstKey.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetBurstKey = ', photoAssetBurstKey);
        expect(photoAssetBurstKey != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0350
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0350
     * @tc.desc   image get photoKeys.LCD_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0350', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0350';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['lcd_size'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let lcdSize: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.LCD_SIZE;
        console.log(TAG,`${testName} :: asset photoKeys.LCD_SIZE is ${lcdSize}`);
        let photoAssetLcdSize: photoAccessHelper.MemberType = photoAsset.get(lcdSize.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetLcdSize = ', photoAssetLcdSize);
        expect(photoAssetLcdSize != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0360
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0360
     * @tc.desc   video get photoKeys.LCD_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0360', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0360';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['lcd_size'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let lcdSize: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.LCD_SIZE;
        console.log(TAG,`${testName} :: asset photoKeys.LCD_SIZE is ${lcdSize}`);
        let photoAssetLcdSize: photoAccessHelper.MemberType = photoAsset.get(lcdSize.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetLcdSize = ', photoAssetLcdSize);
        expect(photoAssetLcdSize != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0370
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0370
     * @tc.desc   image get photoKeys.DATE_TAKEN_MS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0370', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0370';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['date_taken_ms'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let dateTakenMs: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.DATE_TAKEN_MS;
        console.log(TAG,`${testName} :: asset photoKeys.DATE_TAKEN_MS is ${dateTakenMs}`);
        let photoAssetDateTakenMs: photoAccessHelper.MemberType = photoAsset.get(dateTakenMs.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetDateTakenMs = ', photoAssetDateTakenMs);
        expect(photoAssetDateTakenMs != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0380
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0380
     * @tc.desc   video get photoKeys.DATE_TAKEN_MS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0380', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0380';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['date_taken_ms'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let dateTakenMs: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.DATE_TAKEN_MS;
        console.log(TAG,`${testName} :: asset photoKeys.DATE_TAKEN_MS is ${dateTakenMs}`);
        let photoAssetDateTakenMs: photoAccessHelper.MemberType = photoAsset.get(dateTakenMs.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetDateTakenMs = ', photoAssetDateTakenMs);
        expect(photoAssetDateTakenMs != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0390
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0390
     * @tc.desc   video get photoKeys  ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0390', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0390';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [''],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let photoAssetDateTakenMs: photoAccessHelper.MemberType = photoAsset.get('');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(13900020);
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0400
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0400
     * @tc.desc   image get photoKeys.MEDIA_SUFFIX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0400';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['media_suffix'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let mediaSuffix: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.MEDIA_SUFFIX;
        console.log(TAG,`${testName} :: asset photoKeys.MEDIA_SUFFIX is ${mediaSuffix}`);
        let photoAssetMediaSuffix: photoAccessHelper.MemberType = photoAsset.get(mediaSuffix.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetMediaSuffix = ', photoAssetMediaSuffix);
        expect(photoAssetMediaSuffix != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0410
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0410
     * @tc.desc   video get photoKeys.MEDIA_SUFFIX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0410', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0410';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['media_suffix'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let mediaSuffix: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.MEDIA_SUFFIX;
        console.log(TAG,`${testName} :: asset photoKeys.MEDIA_SUFFIX is ${mediaSuffix}`);
        let photoAssetMediaSuffix: photoAccessHelper.MemberType = photoAsset.get(mediaSuffix.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetMediaSuffix = ', photoAssetMediaSuffix);
        expect(photoAssetMediaSuffix != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0420
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0420
     * @tc.desc   image get photoKeys.OWNER_ALBUM_ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0420', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0420';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['owner_album_id'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let ownerAlbumId: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.OWNER_ALBUM_ID;
        console.log(TAG,`${testName} :: asset photoKeys.OWNER_ALBUM_ID is ${ownerAlbumId}`);
        let photoAssetOwnerAlbumId: photoAccessHelper.MemberType = photoAsset.get(ownerAlbumId.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetOwnerAlbumId = ', photoAssetOwnerAlbumId);
        expect(photoAssetOwnerAlbumId != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0430
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0430
     * @tc.desc   video get photoKeys.OWNER_ALBUM_ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0430', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0430';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['owner_album_id'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let ownerAlbumId: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.OWNER_ALBUM_ID;
        console.log(TAG,`${testName} :: asset photoKeys.OWNER_ALBUM_ID is ${ownerAlbumId}`);
        let photoAssetOwnerAlbumId: photoAccessHelper.MemberType = photoAsset.get(ownerAlbumId.toString());
        console.info(TAG,testName,'photoAsset Get photoAssetOwnerAlbumId = ', photoAssetOwnerAlbumId);
        expect(photoAssetOwnerAlbumId != undefined).assertTrue();
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0010
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0010
     * @tc.desc   IMAGE get photoKeys.clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0010';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = 'newTitle'+ new Date().getTime();
        let newAsset: photoAccessHelper.PhotoAsset = await photoAsset.clone(title);
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0020
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0020
     * @tc.desc   video get photoKeys.clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0020', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0020';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = 'newTitle'+ new Date().getTime();
        let newAsset: photoAccessHelper.PhotoAsset = await photoAsset.clone(title);
        expect(photoAsset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0030
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0030
     * @tc.desc   video get photoKeys.clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0030', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0030';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = "B".repeat(252);
        let newAsset: photoAccessHelper.PhotoAsset = await photoAsset.clone(title);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401)
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0040
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0040
     * @tc.desc   video get photoKeys.clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0040', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0040';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = "xyz.jpg";
        let newAsset: photoAccessHelper.PhotoAsset = await photoAsset.clone(title);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401)
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0050
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0050
     * @tc.desc   video get photoKeys.clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0050', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0050';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = "";
        let newAsset: photoAccessHelper.PhotoAsset = await photoAsset.clone(title);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401)
        done();
      }
    })
     /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0060
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0060
     * @tc.desc   video get photoKeys.clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0060', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0060';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = "[]";
        let newAsset: photoAccessHelper.PhotoAsset = await photoAsset.clone(title);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401)
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0070
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0070
     * @tc.desc   video get photoKeys.clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0070', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0070';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = "{}";
        let newAsset: photoAccessHelper.PhotoAsset = await photoAsset.clone(title);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG,testName,`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401)
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0080
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0080
     * @tc.desc   video get photoKeys.clone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0080', Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0080';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = "abc.mp4";
        let newAsset: photoAccessHelper.PhotoAsset = await photoAsset.clone(title);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG,testName,`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401)
        done();
      }
    })

  })
}