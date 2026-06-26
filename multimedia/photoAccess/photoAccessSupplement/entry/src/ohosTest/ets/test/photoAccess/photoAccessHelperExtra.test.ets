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
import { describe, it, expect, beforeAll, Level, beforeEach, afterAll, afterEach } from '@ohos/hypium'
import { getPermission, driveFn, sleep, LOG_TAG, isEmpty, createUserAlbum } from '../common'
import common from '@ohos.app.ability.common'
import { JSON } from '@kit.ArkTS';
import { dataSharePredicates } from '@kit.ArkData';
import { sendablePhotoAccessHelper } from '@kit.MediaLibraryKit';


const TAG = LOG_TAG + 'photoExtraSupp';

export default function photoExtraSuppTest() {
  describe('photoExtraSuppTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
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
     * @tc.name   SUB_MEDIA_PHOTO_ACCESS_HELPER_CHANGE_TIME_TEST_0010
     * @tc.number SUB_MEDIA_PHOTO_ACCESS_HELPER_CHANGE_TIME_TEST_0010
     * @tc.desc   phAccessHelper.AbsAlbum-changeTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_CHANGE_TIME_TEST_0010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PHOTO_ACCESS_HELPER_CHANGE_TIME_TEST_0010';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await phAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        console.info(TAG,testName,' successfully ' + album.changeTime);
        expect(album.changeTime == 0).assertTrue();
        done();
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error},${error.code},${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTOKEYS_CHANGE_TIME_TEST_0010
     * @tc.number SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTOKEYS_CHANGE_TIME_TEST_0010
     * @tc.desc   phAccessHelper.photoKeys-enum-changeTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTOKEYS_CHANGE_TIME_TEST_0010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTOKEYS_CHANGE_TIME_TEST_0010';
      try {
        let res: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.CHANGE_TIME;
        expect(res == 'change_time').assertTrue();
        done();
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error},${error.code},${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_PHOTO_ACCESS_HELPER_PREFERRED_COMPATIBLE_MODE_TEST_0010
     * @tc.number SUB_MEDIA_PHOTO_ACCESS_HELPER_PREFERRED_COMPATIBLE_MODE_TEST_0010
     * @tc.desc   phAccessHelper.PreferredCompatibleMode-enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_PREFERRED_COMPATIBLE_MODE_TEST_0010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PHOTO_ACCESS_HELPER_PREFERRED_COMPATIBLE_MODE_TEST_0010';
      try {
        expect(photoAccessHelper.PreferredCompatibleMode.CURRENT).assertEqual(1);
        expect(photoAccessHelper.PreferredCompatibleMode.COMPATIBLE).assertEqual(2);
        done();
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error},${error.code},${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_PHOTO_ASSET_CHANGE_INFO_TEST_0010
     * @tc.number SUB_MEDIA_PHOTO_ASSET_CHANGE_INFO_TEST_0010
     * @tc.desc   phAccessHelper.photoAssetChangeInfo-property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTO_ASSET_CHANGE_INFO_TEST_0010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PHOTO_ASSET_CHANGE_INFO_TEST_0010';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let isCallbackCalled = false;
      let onCallback = (changeData: photoAccessHelper.PhotoAssetChangeInfos) => {
        console.info(TAG,testName,'onCallback success, changData: ' + JSON.stringify(changeData));
        if(!isEmpty(changeData.assetChangeDatas) && changeData.assetChangeDatas!.length > 0) {
          let data = changeData.assetChangeDatas![0];
          let isFav = data.assetBeforeChange?.isFavorite;
          expect(isEmpty(isFav)).assertFalse();
          isCallbackCalled = true;
        }
      }
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await phAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await album.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        phAccessHelper.on('photoChange',onCallback);
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset);
        let newTitle: string = 'newTitle';
        assetChangeRequest.setTitle(newTitle);
        await phAccessHelper.applyChanges(assetChangeRequest);
        const startTime = Date.now();
        const timeoutMs = 15000;
        while (!isCallbackCalled && (Date.now() - startTime) < timeoutMs) {
          await sleep(100)
        }
        expect(isCallbackCalled).assertTrue();
        phAccessHelper.off('photoChange');
        done();
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error},${error.code},${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_EXTRA_TEST_0010
     * @tc.number SUB_MEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_EXTRA_TEST_0010
     * @tc.desc   phAccessHelper.createAsset-no options-callback-第二个参数为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_EXTRA_TEST_0010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_EXTRA_TEST_0010';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        phAccessHelper.createAsset(photoType, null, () => {
          expect().assertFail();
          done();
        })
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error},${error.code},${error.message}`);
        expect(error.code).assertEqual('13900020');
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_EXTRA_TEST_0020
     * @tc.number SUB_MEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_EXTRA_TEST_0020
     * @tc.desc   phAccessHelper.createAsset-no options-callback-第二个参数为''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_EXTRA_TEST_0020', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_EXTRA_TEST_0020';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        phAccessHelper.createAsset(photoType, '', () => {
          expect().assertFail();
          done();
        })
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error},${error.code},${error.message}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_EXTRA_TEST_0030
     * @tc.number SUB_MEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_EXTRA_TEST_0030
     * @tc.desc   phAccessHelper.createAsset-no options-callback-第二个参数为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_EXTRA_TEST_0030', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_EXTRA_TEST_0030';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        phAccessHelper.createAsset(photoType, undefined, () => {
          expect().assertFail();
          done();
        })
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error},${error.code},${error.message}`);
        expect(error.code).assertEqual('13900020');
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_EXTRA_TEST_0040
     * @tc.number SUB_MEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_EXTRA_TEST_0040
     * @tc.desc   phAccessHelper.createAsset-promise-第二个参数为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_EXTRA_TEST_0040', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_EXTRA_TEST_0040';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        await phAccessHelper.createAsset(photoType, null, options);
        expect().assertFail();
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error},${error.code},${error.message}`);
        expect(error.code).assertEqual('13900020');
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_EXTRA_TEST_0050
     * @tc.number SUB_MEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_EXTRA_TEST_0050
     * @tc.desc   phAccessHelper.createAsset-promise-第二个参数为''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_EXTRA_TEST_0050', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_EXTRA_TEST_0050';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        await phAccessHelper.createAsset(photoType, '', options);
        expect().assertFail();
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error},${error.code},${error.message}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_EXTRA_TEST_0060
     * @tc.number SUB_MEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_EXTRA_TEST_0060
     * @tc.desc   phAccessHelper.createAsset-promise-第二个参数为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_EXTRA_TEST_0060', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PHOTO_ACCESS_HELPER_CREATE_ASSET_EXTRA_TEST_0060';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        await phAccessHelper.createAsset(photoType, undefined, options);
        expect().assertFail();
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error},${error.code},${error.message}`);
        expect(error.code).assertEqual('13900020');
        done();
      }
    })
    /**
     * @tc.number   SUB_MEDIA_CREATE_ASSET_REQUEST_0010
     * @tc.name     SUB_MEDIA_CREATE_ASSET_REQUEST_0010
     * @tc.desc     createAssetRequest-第4个参数属性subtype:未覆盖枚举:['BURST']；
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_MEDIA_CREATE_ASSET_REQUEST_0010", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_CREATE_ASSET_REQUEST_0010";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto',
          subtype:photoAccessHelper.PhotoSubtype.BURST
        }
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension, options);
        await phAccessHelper.applyChanges(assetChangeRequest);
        console.info(TAG, testName, 'apply createAssetRequest successfully', assetChangeRequest);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, ' Failed ', JSON.stringify(error), error.code,error.message);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.number   SUB_MEDIA_ADD_RESOURCE_TEST_0010
     * @tc.name     SUB_MEDIA_ADD_RESOURCE_TEST_0010
     * @tc.desc     addResource-fileUri-13900002
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_MEDIA_ADD_RESOURCE_TEST_0010", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_ADD_RESOURCE_TEST_0010";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
        let fileUri = testContext.filesDir + '/rubbish100.jpg';
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, fileUri);
        await phAccessHelper.applyChanges(assetChangeRequest);
        console.info(TAG, testName, 'apply createAssetRequest successfully', assetChangeRequest);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, ' Failed ', JSON.stringify(error), error.code,error.message);
        expect(error.code).assertEqual('13900002');
        done();
      }
    });
    /**
     * @tc.number   SUB_MEDIA_ADD_RESOURCE_TEST_0020
     * @tc.name     SUB_MEDIA_ADD_RESOURCE_TEST_0020
     * @tc.desc     addResource-fileUri-14000011
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_MEDIA_ADD_RESOURCE_TEST_0020", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_ADD_RESOURCE_TEST_0020";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, null );
        await phAccessHelper.applyChanges(assetChangeRequest);
        console.info(TAG, testName, 'apply createAssetRequest successfully', assetChangeRequest);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, ' Failed ', JSON.stringify(error), error.code,error.message);
        expect(error.code).assertEqual('14000011');
        done();
      }
    });
    /**
     * @tc.number   SUB_MEDIA_CLOSE_TEST_0010
     * @tc.name     SUB_MEDIA_CLOSE_TEST_0010
     * @tc.desc     close-14000011
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_MEDIA_CLOSE_TEST_0010", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_CLOSE_TEST_0010";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '0007.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        fetchResult.close();
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, ' Failed ', JSON.stringify(error), error.code,error.message);
        expect(error.code).assertEqual('14000011');
        done();
      }
    });

    /**
     * @tc.number   SUB_MEDIA_SENDABLE_CREATE_ASSET_TEST_0010
     * @tc.name     SUB_MEDIA_SENDABLE_CREATE_ASSET_TEST_0010
     * @tc.desc     sendable-createAsset-第二个参数null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_MEDIA_SENDABLE_CREATE_ASSET_TEST_0010", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_SENDABLE_CREATE_ASSET_TEST_0010";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let photoType: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        await phAccessHelper.createAsset(photoType, null as ESObject, options);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, ' Failed ', JSON.stringify(error), error.code,error.message);
        expect(error.code).assertEqual('13900020');
        done();
      }
    });
    /**
     * @tc.number   SUB_MEDIA_SENDABLE_CREATE_ASSET_TEST_0020
     * @tc.name     SUB_MEDIA_SENDABLE_CREATE_ASSET_TEST_0020
     * @tc.desc     sendable-createAsset-第二个参数undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_MEDIA_SENDABLE_CREATE_ASSET_TEST_0020", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_SENDABLE_CREATE_ASSET_TEST_0020";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let photoType: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        await phAccessHelper.createAsset(photoType, undefined as ESObject, options);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, ' Failed ', JSON.stringify(error), error.code,error.message);
        expect(error.code).assertEqual('13900020');
        done();
      }
    });
    /**
     * @tc.number   SUB_MEDIA_SENDABLE_CREATE_ASSET_TEST_0030
     * @tc.name     SUB_MEDIA_SENDABLE_CREATE_ASSET_TEST_0030
     * @tc.desc     sendable-createAsset-第二个参数''
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_MEDIA_SENDABLE_CREATE_ASSET_TEST_0030", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_SENDABLE_CREATE_ASSET_TEST_0030";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let photoType: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        await phAccessHelper.createAsset(photoType, '', options);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, ' Failed ', JSON.stringify(error), error.code,error.message);
        expect(error.code).assertEqual('14000001');
        done();
      }
    });
    /**
     * @tc.number   SUB_ON_PHOTO_CHANGE_ERR_TEST_001
     * @tc.name     SUB_ON_PHOTO_CHANGE_ERR_TEST_001
     * @tc.desc     onPhotoChange-23800151
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_ON_PHOTO_CHANGE_ERR_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_ON_PHOTO_CHANGE_ERR_TEST_001";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let onCallback1 = (changeData: photoAccessHelper.PhotoAssetChangeInfos) => {
          console.info('onCallback1 success, changData: ' + JSON.stringify(changeData));
        }
        phAccessHelper.on('photoChange', onCallback1);
        phAccessHelper.on('photoChange', onCallback1);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
    /**
     * @tc.number   SUB_OFF_PHOTO_CHANGE_ERR_TEST_001
     * @tc.name     SUB_OFF_PHOTO_CHANGE_ERR_TEST_001
     * @tc.desc     offPhotoChange-23800151
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_OFF_PHOTO_CHANGE_ERR_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_OFF_PHOTO_CHANGE_ERR_TEST_001";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let onCallback1 = (changeData: photoAccessHelper.PhotoAssetChangeInfos) => {
          console.info('onCallback1 success, changData: ' + JSON.stringify(changeData));
        }
        phAccessHelper.off('photoChange', onCallback1);
        phAccessHelper.off('photoChange', onCallback1);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
    /**
     * @tc.number   SUB_ON_PHOTO_ALBUM_CHANGE_ERR_TEST_001
     * @tc.name     SUB_ON_PHOTO_ALBUM_CHANGE_ERR_TEST_001
     * @tc.desc     onPhotoAlbumChange-23800151
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_ON_PHOTO_ALBUM_CHANGE_ERR_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_ON_PHOTO_ALBUM_CHANGE_ERR_TEST_001";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let onCallback1 = (changeData: photoAccessHelper.AlbumChangeInfos) => {
          console.info('onCallback1 success, changData: ' + JSON.stringify(changeData));
        }
        phAccessHelper.on('photoAlbumChange', onCallback1);
        phAccessHelper.on('photoAlbumChange', onCallback1);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
    /**
     * @tc.number   SUB_OFF_PHOTO_ALBUM_CHANGE_ERR_TEST_001
     * @tc.name     SUB_OFF_PHOTO_ALBUM_CHANGE_ERR_TEST_001
     * @tc.desc     offPhotoAlbumChange-23800151
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_OFF_PHOTO_ALBUM_CHANGE_ERR_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_OFF_PHOTO_ALBUM_CHANGE_ERR_TEST_001";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let onCallback1 = (changeData: photoAccessHelper.AlbumChangeInfos) => {
          console.info('onCallback1 success, changData: ' + JSON.stringify(changeData));
        }
        phAccessHelper.off('photoAlbumChange', onCallback1);
        phAccessHelper.off('photoAlbumChange', onCallback1);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
    /**
     * @tc.number   SUB_MEDIA_GET_LAST_OBJECT_TEST_0010
     * @tc.name     SUB_MEDIA_GET_LAST_OBJECT_TEST_0010
     * @tc.desc     getLastObject-14000011
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_MEDIA_GET_LAST_OBJECT_TEST_0010", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_MEDIA_GET_LAST_OBJECT_TEST_0010";
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '0007.mp4');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOption);
        let asset = await fetchResult.getLastObject();
        fetchResult.close();
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, ' Failed ', JSON.stringify(error), error.code,error.message);
        expect(error.code).assertEqual('14000011');
        done();
      }
    });

  })
}