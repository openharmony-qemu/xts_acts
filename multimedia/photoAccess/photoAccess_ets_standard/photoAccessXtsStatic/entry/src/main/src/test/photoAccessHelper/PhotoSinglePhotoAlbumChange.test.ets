'use static';
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
import { createUserAlbum, getPermission, LOG_TAG, sleep } from '../common';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import { Context } from '@ohos.arkui.UIContext';
import { BusinessError } from '@kit.BasicServicesKit';
const INVALID_PARAMETER: int = 401;
const ERR_PARAMETER: int = 14000011;
const TAG = LOG_TAG + 'singlePhotoAlbumChange';

export default function singlePhotoAlbumChangeTest(): void {
  describe('singlePhotoAlbumChangeTest', () => {
    let testContext: Context = Hypium.get('Context') as Context;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      await getPermission();
      await createUserAlbum(testContext, TAG, 'PhotoSetTitleTestSupp');
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
     * @tc.number   SUB_MULTMEDIA_GET_FIRST_OBJECT_TEST_STATIC_0010
     * @tc.name     SUB_MULTMEDIA_GET_FIRST_OBJECT_TEST_STATIC_0010
     * @tc.desc     getFirstObject-IMAGE-14000011
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_MULTMEDIA_GET_FIRST_OBJECT_TEST_STATIC_0010", Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = "SUB_MULTMEDIA_GET_FIRST_OBJECT_TEST_STATIC_0010";
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '00007.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(error.code).assertEqual(ERR_PARAMETER);
        done();
      }
    });
    /**
     * @tc.number   SUB_MULTMEDIA_GET_FIRST_OBJECT_TEST_STATIC_0020
     * @tc.name     SUB_MULTMEDIA_GET_FIRST_OBJECT_TEST_STATIC_0020
     * @tc.desc     getFirstObject-VIDEO-14000011
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_MULTMEDIA_GET_FIRST_OBJECT_TEST_STATIC_0020", Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = "SUB_MULTMEDIA_GET_FIRST_OBJECT_TEST_STATIC_0020";
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '00007.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(error.code).assertEqual(ERR_PARAMETER);
        done();
      }
    });
    /**
     * @tc.number   SUB_PHOTO_SHOW_ASSET_CREATION_DIALOG_STATIC_0100
     * @tc.name     SUB_PHOTO_SHOW_ASSET_CREATION_DIALOG_STATIC_0100
     * @tc.desc     第一个参数为空数组
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_SHOW_ASSET_CREATION_DIALOG_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testNum = "SUB_PHOTO_SHOW_ASSET_CREATION_DIALOG_STATIC_0100";
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetsCreationDialog',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      try {
        console.info(TAG, testNum, 'Start');
        let result = await helper!.showAssetsCreationDialog([], photoCreationConfigs);
        console.info(TAG, testNum, 'Success showAssetsCreationDialog', JSON.stringify(result));
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testNum, 'Failed showAssetsCreationDialog', JSON.stringify(error), error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   SUB_PHOTO_SHOW_ASSET_CREATION_DIALOG_STATIC_0200
     * @tc.name     SUB_PHOTO_SHOW_ASSET_CREATION_DIALOG_STATIC_0200
     * @tc.desc     第二个参数为空数组
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_SHOW_ASSET_CREATION_DIALOG_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testNum = "SUB_PHOTO_SHOW_ASSET_CREATION_DIALOG_STATIC_0200";
      let srcFileUris: Array<string> = ['123456'];
      try {
        console.info(TAG, testNum, 'Start');
        let result = await helper!.showAssetsCreationDialog(srcFileUris, []);
        console.info(TAG, testNum, 'Success showAssetsCreationDialog', JSON.stringify(result));
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testNum, 'Failed showAssetsCreationDialog', JSON.stringify(error), error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   SUB_PHOTO_SHOW_ASSET_CREATION_DIALOG_STATIC_0300
     * @tc.name     SUB_PHOTO_SHOW_ASSET_CREATION_DIALOG_STATIC_0300
     * @tc.desc     extension-jpg-VIDEO
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_SHOW_ASSET_CREATION_DIALOG_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testNum = "SUB_PHOTO_SHOW_ASSET_CREATION_DIALOG_STATIC_0300";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetsCreationDialog',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.VIDEO,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      try {
        console.info(TAG, testNum, 'Start');
        let result = await helper!.showAssetsCreationDialog(srcFileUris, photoCreationConfigs);
        console.info(TAG, testNum, 'Success showAssetsCreationDialog', JSON.stringify(result));
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testNum, 'Failed showAssetsCreationDialog', JSON.stringify(error), error.code);
        expect(error.code).assertEqual(-1);
        done();
      }
    })
    /**
     * @tc.number   SUB_PHOTO_SHOW_ASSET_CREATION_DIALOG_STATIC_0400
     * @tc.name     SUB_PHOTO_SHOW_ASSET_CREATION_DIALOG_STATIC_0400
     * @tc.desc     extension-MP4-IMAGE
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_SHOW_ASSET_CREATION_DIALOG_STATIC_0400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testNum = "SUB_PHOTO_SHOW_ASSET_CREATION_DIALOG_STATIC_0400";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetsCreationDialog',
          fileNameExtension: 'mp4',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      try {
        console.info(TAG, testNum, 'Start');
        let result = await helper!.showAssetsCreationDialog(srcFileUris, photoCreationConfigs);
        console.info(TAG, testNum, 'Success showAssetsCreationDialog', JSON.stringify(result));
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testNum, 'Failed showAssetsCreationDialog', JSON.stringify(error), error.code);
        expect(error.code).assertEqual(-1);
        done();
      }
    })

    /**
     * @tc.number   SUB_PHOTO_CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_STATIC_0010
     * @tc.name     SUB_PHOTO_CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_STATIC_0010
     * @tc.desc     createAssetWithShortTermPermission-INVALID Extension
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_STATIC_0010", Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = "SUB_PHOTO_CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_STATIC_0010";
      let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
        title: '01',
        fileNameExtension: 'abc',
        photoType: photoAccessHelper.PhotoType.VIDEO,
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
      };
      try {
        let res = await helper!.createAssetWithShortTermPermission(photoCreationConfig);
        console.info(TAG, testName, 'successfully', res);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createAssetWithShortTermPermission', JSON.stringify(error), (error as Error).message);
        expect(error.code).assertEqual(-1);
        done();
      }
    });
    /**
     * @tc.number   SUB_PHOTO_CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_STATIC_0020
     * @tc.name     SUB_PHOTO_CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_STATIC_0020
     * @tc.desc     createAssetWithShortTermPermission-INVALID Extension-jpg-video
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_STATIC_0020", Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = "SUB_PHOTO_CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_STATIC_0020";
      let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
        title: '01',
        fileNameExtension: 'jpg',
        photoType: photoAccessHelper.PhotoType.VIDEO,
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
      };
      try {
        let res = await helper!.createAssetWithShortTermPermission(photoCreationConfig);
        console.info(TAG, testName, 'successfully', res);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createAssetWithShortTermPermission', JSON.stringify(error), (error as Error).message);
        expect(error.code).assertEqual(-1);
        done();
      }
    });
    /**
     * @tc.number   SUB_PHOTO_CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_STATIC_0030
     * @tc.name     SUB_PHOTO_CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_STATIC_0030
     * @tc.desc     createAssetWithShortTermPermission-INVALID Extension-mp4-image
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_STATIC_0030", Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = "SUB_PHOTO_CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_STATIC_0030";
      let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
        title: '01',
        fileNameExtension: 'mp4',
        photoType: photoAccessHelper.PhotoType.IMAGE,
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
      };
      try {
        let res = await helper!.createAssetWithShortTermPermission(photoCreationConfig);
        console.info(TAG, testName, 'successfully', res);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed createAssetWithShortTermPermission', JSON.stringify(error), (error as Error).message);
        expect(error.code).assertEqual(-1);
        done();
      }
    });
    /**
     * @tc.number   SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_STATIC_0010
     * @tc.name     SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_STATIC_0010
     * @tc.desc     requestPhotoUrisReadPermission-空数组覆盖
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_STATIC_0010", Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_STATIC_0010";
      try {
        let srcFileUris: Array<string> = [];
        let desFileUris: Array<string> | undefined = await helper!.requestPhotoUrisReadPermission(srcFileUris);
        console.info(TAG, testName, 'requestPhotoUrisReadPermission success, data is ', JSON.stringify(desFileUris));
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'requestPhotoUrisReadPermission failed', JSON.stringify(error), (error as Error).message,error.code);
        expect(error.code).assertEqual(-1);
        done();
      }
    });
    /**
     * @tc.number   SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_STATIC_0020
     * @tc.name     SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_STATIC_0020
     * @tc.desc     requestPhotoUrisReadPermission-空字符串数组覆盖
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_STATIC_0020", Level.LEVEL0, async (done: () => void) => {
      const testName = "SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_STATIC_0020";
      try {
        let srcFileUris: Array<string> = [''];
        let desFileUris: Array<string> | undefined = await helper!.requestPhotoUrisReadPermission(srcFileUris);
        console.info(TAG, testName, 'requestPhotoUrisReadPermission success, data is ', JSON.stringify(desFileUris));
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'requestPhotoUrisReadPermission failed', JSON.stringify(error), (error as Error).message,error.code);
        expect(error.code).assertEqual(-1);
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_COMMIT_MODIFY_CALLBACK_STATIC_0020
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_COMMIT_MODIFY_CALLBACK_STATIC_0020
     * @tc.desc   modify image displayName '一...' (83)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_COMMIT_MODIFY_CALLBACK_STATIC_0020', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_COMMIT_MODIFY_CALLBACK_STATIC_0020';
      let testContext: Context = Hypium.get('Context') as Context;
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let newTitle: string = '';
      for (let i = 0; i < 20; i++) {
        newTitle += '&';
      }
      try {
        const fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        const asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = photoAccessHelper.PhotoKeys.TITLE.toString();
        asset.set(title, newTitle);
        await asset.commitModify();
        expect(asset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.info(TAG, `commitModifyAbnormalCallback error, ${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_COMMIT_MODIFY_CALLBACK_STATIC_0030
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_COMMIT_MODIFY_CALLBACK_STATIC_0030
     * @tc.desc   modify image displayName 'aaaaaaa...' (251)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_COMMIT_MODIFY_CALLBACK_STATIC_0030', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_COMMIT_MODIFY_CALLBACK_STATIC_0030';
      let testContext: Context = Hypium.get('Context') as Context;
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let newTitle: string = '';
      for (let i = 0; i < 251; i++) {
        newTitle += 'a';
      }
      try {
        const fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        const asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = photoAccessHelper.PhotoKeys.TITLE.toString();
        asset.set(title, newTitle);
        await asset.commitModify();
        expect(asset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.info(TAG, `commitModifyAbnormalCallback error, ${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_COMMIT_MODIFY_ABNORMAL_CALLBACK_STATIC_0010
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_COMMIT_MODIFY_ABNORMAL_CALLBACK_STATIC_0010
     * @tc.desc   modify image title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_COMMIT_MODIFY_ABNORMAL_CALLBACK_STATIC_0010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_COMMIT_MODIFY_ABNORMAL_CALLBACK_STATIC_0010';
      const value: string = 'newTitle';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.jpg');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        const fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        const asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = photoAccessHelper.PhotoKeys.TITLE.toString();
        asset.set(title, value);
        await asset.commitModify();
        expect(asset.uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.info(TAG, `commitModifyAbnormalCallback error, ${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    });

  })
}