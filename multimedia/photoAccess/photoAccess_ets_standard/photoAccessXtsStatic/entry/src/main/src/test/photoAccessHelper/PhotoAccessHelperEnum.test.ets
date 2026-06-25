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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll, Level, beforeEach, afterEach, afterAll, Hypium } from '../../../../hypium'
import { createUserAlbum, fetchOption, getPermission, LOG_TAG, sleep } from '../common';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import { Context } from '@kit.ArkUI';


const TAG: string = LOG_TAG + 'PhotoAccessHelperEnumStatic';

export function isEmpty<T>(data: T | null | undefined): boolean {
  console.info(TAG, 'isEmpty test.');
  if (data == null || data == undefined) {
    console.info(TAG, 'data is null.');
    return true;
  }
  return false;
}

export default function PhotoAccessHelperEnumStatic(): void {
  describe('PhotoAccessHelperEnumStatic', (): void => {
    let testContext: Context = Hypium.get('Context')! as Context;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext)!;
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      await getPermission();
      await createUserAlbum(testContext, TAG, 'PhotoSetTitleTestSupp');
    });

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_REQUEST_PHOTO_URIS_READ_PERMISSION_STATIC_1900
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_REQUEST_PHOTO_URIS_READ_PERMISSION_STATIC_1900
     * @tc.desc   requestPhotoUrisReadPermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_REQUEST_PHOTO_URIS_READ_PERMISSION_STATIC_1900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_REQUEST_PHOTO_URIS_READ_PERMISSION_STATIC_1900';
      try {
        let testContext: Context = Hypium.get('Context')! as Context;
        const helper = photoAccessHelper.getPhotoAccessHelper(testContext)!;
        let fileUri = testContext.filesDir + '/test_mov_1.jpg';
        let srcFileUris: Array<string> = [fileUri];
        let desFileUris: Array<string> = await helper.requestPhotoUrisReadPermission(srcFileUris);
        expect(desFileUris !== undefined).assertTrue();
      } catch (error) {
        console.error(TAG, `getAssets catch failed2; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_REQUEST_PHOTO_URIS_READ_PERMISSION_STATIC_2000
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_REQUEST_PHOTO_URIS_READ_PERMISSION_STATIC_2000
     * @tc.desc   requestPhotoUrisReadPermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_REQUEST_PHOTO_URIS_READ_PERMISSION_STATIC_2000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_REQUEST_PHOTO_URIS_READ_PERMISSION_STATIC_2000';
      try {
        let testContext: Context = Hypium.get('Context')! as Context;
        const helper = photoAccessHelper.getPhotoAccessHelper(testContext)!;
        let srcFileUris: Array<string> = [];
        let desFileUris: Array<string> = await helper.requestPhotoUrisReadPermission(srcFileUris);
        expect(desFileUris !== undefined).assertTrue();
      } catch (error) {
        console.error(TAG, `getAssets catch failed2; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_REQUEST_PHOTO_URIS_READ_PERMISSION_STATIC_2100
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_REQUEST_PHOTO_URIS_READ_PERMISSION_STATIC_2100
     * @tc.desc   requestPhotoUrisReadPermissionEx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_REQUEST_PHOTO_URIS_READ_PERMISSION_STATIC_2100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_REQUEST_PHOTO_URIS_READ_PERMISSION_STATIC_2100';
      try {
        let testContext: Context = Hypium.get('Context')! as Context;
        const helper = photoAccessHelper.getPhotoAccessHelper(testContext)!;
        let fileUri = testContext.filesDir + '/test_mov_1.jpg';
        let srcFileUris: Array<string> = [fileUri];
        let requestReadPermissionResult: photoAccessHelper.RequestReadPermissionResult = await helper.requestPhotoUrisReadPermissionEx(srcFileUris);
        expect(requestReadPermissionResult !== undefined).assertTrue();
      } catch (error) {
        console.error(TAG, `getAssets catch failed2; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_REQUEST_PHOTO_URIS_READ_PERMISSION_STATIC_2200
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_REQUEST_PHOTO_URIS_READ_PERMISSION_STATIC_2200
     * @tc.desc   requestPhotoUrisReadPermissionEx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_REQUEST_PHOTO_URIS_READ_PERMISSION_STATIC_2200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_REQUEST_PHOTO_URIS_READ_PERMISSION_STATIC_2200';
      try {
        let testContext: Context = Hypium.get('Context')! as Context;
        const helper = photoAccessHelper.getPhotoAccessHelper(testContext)!;
        let srcFileUris: Array<string> = [];
        let requestReadPermissionResult: photoAccessHelper.RequestReadPermissionResult = await helper.requestPhotoUrisReadPermissionEx(srcFileUris);
        expect(requestReadPermissionResult !== undefined).assertTrue();
      } catch (error) {
        console.error(TAG, `getAssets catch failed2; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_2300
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_2300
     * @tc.desc   showAssetsCreationDialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_2300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_2300';
      try {
        let testContext: Context = Hypium.get('Context')! as Context;
        const helper = photoAccessHelper.getPhotoAccessHelper(testContext)!;
        let fileUri = testContext.filesDir + '/test_mov_1.jpg';
        let srcFileUris: Array<string> = [fileUri];
        let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
          {
            title: 'test2',
            fileNameExtension: 'jpg',
            photoType: photoAccessHelper.PhotoType.IMAGE,
            subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
          }
        ];
        let desFileUris: Array<string> = await helper.showAssetsCreationDialog(srcFileUris, photoCreationConfigs);
        expect(desFileUris !== undefined).assertTrue();
      } catch (error) {
        console.error(TAG, `getAssets catch failed2; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_2400
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_2400
     * @tc.desc   showAssetsCreationDialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_2400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_2400';
      try {
        let testContext: Context = Hypium.get('Context')! as Context;
        const helper = photoAccessHelper.getPhotoAccessHelper(testContext)!;
        let srcFileUris: Array<string> = [];
        let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
          {
            title: 'test2',
            fileNameExtension: 'jpg',
            photoType: photoAccessHelper.PhotoType.IMAGE,
            subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
          }
        ];
        let desFileUris: Array<string> = await helper.showAssetsCreationDialog(srcFileUris, photoCreationConfigs);
        expect(desFileUris !== undefined).assertTrue();
      } catch (error) {
        console.error(TAG, `getAssets catch failed2; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_2500
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_2500
     * @tc.desc   showAssetsCreationDialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_2500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_2500';
      try {
        let testContext: Context = Hypium.get('Context')! as Context;
        const helper = photoAccessHelper.getPhotoAccessHelper(testContext)!;
        let fileUri = testContext.filesDir + '/test_mov_1.jpg';
        let srcFileUris: Array<string> = [fileUri];
        let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [];
        let desFileUris: Array<string> = await helper.showAssetsCreationDialog(srcFileUris, photoCreationConfigs);
        expect(desFileUris !== undefined).assertTrue();
      } catch (error) {
        console.error(TAG, `getAssets catch failed2; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_2600
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_2600
     * @tc.desc   showAssetsCreationDialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_2600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_2600';
      try {
        let testContext: Context = Hypium.get('Context')! as Context;
        const helper = photoAccessHelper.getPhotoAccessHelper(testContext)!;
        let srcFileUris: Array<string> = [];
        let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [];
        let desFileUris: Array<string> = await helper.showAssetsCreationDialog(srcFileUris, photoCreationConfigs);
        expect(desFileUris !== undefined).assertTrue();
      } catch (error) {
        console.error(TAG, `getAssets catch failed2; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_2700
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_2700
     * @tc.desc   showAssetsCreationDialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_2700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_2700';
      try {
        let testContext: Context = Hypium.get('Context')! as Context;
        const helper = photoAccessHelper.getPhotoAccessHelper(testContext)!;
        let fileUri = testContext.filesDir + '/test_mov_1.jpg';
        let srcFileUris: Array<string> = [fileUri];
        let photoCreationConfigs: Array<photoAccessHelper.CreationSetting> = [
          {
            title: 'test2',
            fileNameExtension: 'jpg',
            photoType: photoAccessHelper.PhotoType.IMAGE
          }
        ];
        let desFileUris: Array<string> = await helper.showAssetsCreationDialogEx(srcFileUris, photoCreationConfigs);
        expect(desFileUris !== undefined).assertTrue();
      } catch (error) {
        console.error(TAG, `getAssets catch failed2; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_2800
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_2800
     * @tc.desc   showAssetsCreationDialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_2800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_2800';
      try {
        let testContext: Context = Hypium.get('Context')! as Context;
        const helper = photoAccessHelper.getPhotoAccessHelper(testContext)!;
        let srcFileUris: Array<string> = [];
        let photoCreationConfigs: Array<photoAccessHelper.CreationSetting> = [
          {
            title: 'test2',
            fileNameExtension: 'jpg',
            photoType: photoAccessHelper.PhotoType.IMAGE
          }
        ];
        let desFileUris: Array<string> = await helper.showAssetsCreationDialogEx(srcFileUris, photoCreationConfigs);
        expect(desFileUris !== undefined).assertTrue();
      } catch (error) {
        console.error(TAG, `getAssets catch failed2; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_2900
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_2900
     * @tc.desc   showAssetsCreationDialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_2900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_2900';
      try {
        let testContext: Context = Hypium.get('Context')! as Context;
        const helper = photoAccessHelper.getPhotoAccessHelper(testContext)!;
        let fileUri = testContext.filesDir + '/test_mov_1.jpg';
        let srcFileUris: Array<string> = [fileUri];
        let photoCreationConfigs: Array<photoAccessHelper.CreationSetting> = [];
        let desFileUris: Array<string> = await helper.showAssetsCreationDialogEx(srcFileUris, photoCreationConfigs);
        expect(desFileUris !== undefined).assertTrue();
      } catch (error) {
        console.error(TAG, `getAssets catch failed2; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_3000
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_3000
     * @tc.desc   showAssetsCreationDialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_3000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_3000';
      try {
        let testContext: Context = Hypium.get('Context')! as Context;
        const helper = photoAccessHelper.getPhotoAccessHelper(testContext)!;
        let srcFileUris: Array<string> = [];
        let photoCreationConfigs: Array<photoAccessHelper.CreationSetting> = [];
        let desFileUris: Array<string> = await helper.showAssetsCreationDialogEx(srcFileUris, photoCreationConfigs);
        expect(desFileUris !== undefined).assertTrue();
      } catch (error) {
        console.error(TAG, `getAssets catch failed2; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_3100
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_3100
     * @tc.desc   showSingleAssetCreationDialogEx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_3100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_3100';
      try {
        let testContext: Context = Hypium.get('Context')! as Context;
        const helper = photoAccessHelper.getPhotoAccessHelper(testContext)!;
        let srcFileUri:string = testContext.filesDir + '/test_mov_1.jpg';
        let photoCreationConfig: photoAccessHelper.CreationSetting = {
          title: 'test2',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE
        };
        let isImageFullyDisplayed: boolean = true;
        let desFileUri: string = await helper.showSingleAssetCreationDialogEx(srcFileUri, photoCreationConfig, isImageFullyDisplayed);
        expect(desFileUri !== undefined).assertTrue();
      } catch (error) {
        console.error(TAG, `getAssets catch failed2; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_3200
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_3200
     * @tc.desc   showSingleAssetCreationDialogEx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_3200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_3200';
      try {
        let testContext: Context = Hypium.get('Context')! as Context;
        const helper = photoAccessHelper.getPhotoAccessHelper(testContext)!;
        let srcFileUri:string = '';
        let photoCreationConfig: photoAccessHelper.CreationSetting = {
          title: 'test2',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE
        };
        let isImageFullyDisplayed: boolean = true;
        let desFileUri: string = await helper.showSingleAssetCreationDialogEx(srcFileUri, photoCreationConfig, isImageFullyDisplayed);
        expect(desFileUri !== undefined).assertTrue();
      } catch (error) {
        console.error(TAG, `getAssets catch failed2; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_3300
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_3300
     * @tc.desc   showSingleAssetCreationDialogEx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_3300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_3300';
      try {
        let testContext: Context = Hypium.get('Context')! as Context;
        const helper = photoAccessHelper.getPhotoAccessHelper(testContext)!;
        let srcFileUri:string = testContext.filesDir + '/test_mov_1.jpg';
        let photoCreationConfig: photoAccessHelper.CreationSetting = {
          title: 'test2',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE
        };
        let isImageFullyDisplayed: boolean = false;
        let desFileUri: string = await helper.showSingleAssetCreationDialogEx(srcFileUri, photoCreationConfig, isImageFullyDisplayed);
        expect(desFileUri !== undefined).assertTrue();
      } catch (error) {
        console.error(TAG, `getAssets catch failed2; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_3400
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_3400
     * @tc.desc   showSingleAssetCreationDialogEx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_3400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_STATIC_3400';
      try {
        let testContext: Context = Hypium.get('Context')! as Context;
        const helper = photoAccessHelper.getPhotoAccessHelper(testContext)!;
        let srcFileUri:string = testContext.filesDir + '/test_mov_1.jpg';
        let photoCreationConfig: photoAccessHelper.CreationSetting = {
          fileNameExtension: '',
          photoType: photoAccessHelper.PhotoType.IMAGE
        };
        let isImageFullyDisplayed: boolean = true;
        let desFileUri: string = await helper.showSingleAssetCreationDialogEx(srcFileUri, photoCreationConfig, isImageFullyDisplayed);
        expect(desFileUri !== undefined).assertTrue();
      } catch (error) {
        console.error(TAG, `getAssets catch failed2; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_ASSET_CHANGE_REQUEST_SET_FAVORITE_STATIC_3600
     * @tc.number SUB_MEDIA_ASSET_CHANGE_REQUEST_SET_FAVORITE_STATIC_3600
     * @tc.desc   setFavorite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_CHANGE_REQUEST_SET_FAVORITE_STATIC_3600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_MEDIA_ASSET_CHANGE_REQUEST_SET_FAVORITE_STATIC_3600';
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOptions);
      let asset: photoAccessHelper.PhotoAsset[] = await fetchResult.getAllObjects();
      try {
        let assetChangeRequest: photoAccessHelper.MediaAssetsChangeRequest = new photoAccessHelper.MediaAssetsChangeRequest(asset);
        assetChangeRequest.setFavorite(true);
        assetChangeRequest.setFavorite(false);
        expect(asset != undefined).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_ASSET_CHANGE_REQUEST_SET_FAVORITE_STATIC_3700
     * @tc.number SUB_MEDIA_ASSET_CHANGE_REQUEST_SET_FAVORITE_STATIC_3700
     * @tc.desc   setFavorite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_CHANGE_REQUEST_SET_FAVORITE_STATIC_3700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_MEDIA_ASSET_CHANGE_REQUEST_SET_FAVORITE_STATIC_3700';
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOptions);
      let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      try {
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(asset);
        assetChangeRequest.setFavorite(true);
        assetChangeRequest.setFavorite(false);
        expect(asset != undefined).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_ASSET_CHANGE_REQUEST_SET_FAVORITE_STATIC_3800
     * @tc.number SUB_MEDIA_ASSET_CHANGE_REQUEST_SET_FAVORITE_STATIC_3800
     * @tc.desc   isFavorite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_CHANGE_REQUEST_SET_FAVORITE_STATIC_3800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_MEDIA_ASSET_CHANGE_REQUEST_SET_FAVORITE_STATIC_3800';
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let isCallbackCalled = false;
      let onCallback = (changeData: photoAccessHelper.PhotoAssetChangeInfos) => {
        console.info(TAG,testNum,'onCallback success, changData: ' + JSON.stringify(changeData));
        if(!isEmpty(changeData.assetChangeDatas) && changeData.assetChangeDatas!.length > 0) {
          let data = changeData.assetChangeDatas![0];
          let isFav = data.assetBeforeChange?.isFavorite;
          expect(isFav).assertFalse();
          isCallbackCalled = true;
        }
      }
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await album.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        helper!.onPhotoChange(onCallback);
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset);
        let newTitle: string = 'newTitle';
        assetChangeRequest.setTitle(newTitle);
        await helper!.applyChanges(assetChangeRequest);
        const startTime = Date.now();
        const timeoutMs = 15000;
        while (!isCallbackCalled && (Date.now() - startTime) < timeoutMs) {
          await sleep(100)
        }
        expect(isCallbackCalled).assertTrue();
        helper!.offPhotoChange();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

  })
}