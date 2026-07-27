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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import testNapi from 'libentry.so';
import { JSON } from '@kit.ArkTS';
import cameraObj from 'libentry.so'
import { photoAccessHelper } from "@kit.MediaLibraryKit";
import { common } from "@kit.AbilityKit";
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import fs, { ListFileOptions } from '@ohos.file.fs';
import fileuri from "@ohos.file.fileuri";
import { driveFn, getPermission } from '../PhotoCommon.test';

const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const TAG = 'MediaAssetManagerRequestXts';

export function createSandboxFileUri(context: common.UIAbilityContext,extension: string) {
  let pathDir: string = context.filesDir;
  let path = pathDir + '/test' + new Date().getTime() + '.' + extension;
  fs.openSync(path, fs.OpenMode.CREATE)
  return fileuri.getUriFromPath(path);
}
export function fetchOption(testNum: string, key: string, value: string | number): photoAccessHelper.FetchOptions {
  const predicates = new dataSharePredicates.DataSharePredicates();
  predicates.equalTo(key, value);
  const ops: photoAccessHelper.FetchOptions = {
    fetchColumns: [],
    predicates: predicates
  };
  console.info(`${testNum} queryOps: ${key} = ${value}`);
  return ops;
}
const ERROR_REQUEST_ID = "00000000-0000-0000-0000-000000000000";
const REQUEST_ID_LENGTH = 37

export default function OHMediaAssetManagerRequest() {
  describe('OHMediaAssetManagerRequest', () => {
    beforeAll(async () => {
      await getPermission();
      await driveFn();
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number  SUB_MEDIA_ASSET_MANAGER_REQUEST_SUPP_Image_0100
     * @tc.name    SUB_MEDIA_ASSET_MANAGER_REQUEST_SUPP_Image_0100
     * @tc.desc    OH_MediaAssetManager_RequestImageForPath-
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_MEDIA_ASSET_MANAGER_REQUEST_SUPP_Image_0100', Level.LEVEL1, async () => {
      console.info(TAG,'Start',);
      let testNum = 'SUB_MEDIA_ASSET_MANAGER_REQUEST_SUPP_0100'
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "01.jpg");
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        console.info(TAG,testNum,'srcUri:',srcUri)
        let destUri = createSandboxFileUri(testContext, 'jpg');
        let requestOptions:photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
        }
        let result = cameraObj.TestRequestImageForPath(CASE_INDEX_1,srcUri, requestOptions, destUri, (err: BusinessError, data: ESObject) =>{})
        console.info(TAG,'Success',JSON.stringify(result));
        expect(result).not().assertEqual("00000000-0000-0000-0000-000000000000");
      } catch (e) {
        console.error(TAG ,testNum, 'error', e);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MEDIA_ASSET_MANAGER_REQUEST_SUPP_VIDEO_0100
     * @tc.name    SUB_MEDIA_ASSET_MANAGER_REQUEST_SUPP_VIDEO_0100
     * @tc.desc    OH_MediaAssetManager_RequestVideoForPath-
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_MEDIA_ASSET_MANAGER_REQUEST_SUPP_VIDEO_0100', Level.LEVEL1, async () => {
      console.info(TAG,'Start',);
      let testNum = 'SUB_MEDIA_ASSET_MANAGER_REQUEST_SUPP_0100'
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "01.mp4");
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        console.info(TAG,testNum,'srcUri:',srcUri)
        let destUri = createSandboxFileUri(testContext, 'mp4');
        let requestOptions:photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
        }
        let result = cameraObj.TestRequestImageForPath(CASE_INDEX_2,srcUri, requestOptions, destUri, (err: BusinessError, data: ESObject) =>{})
        console.info(TAG,'Success',JSON.stringify(result));
        expect(result).not().assertEqual("00000000-0000-0000-0000-000000000000");
      } catch (e) {
        console.error(TAG ,testNum, 'error', e);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  test_fuse_open_file_readOnly_001
     * @tc.name    test_fuse_open_file_readOnly_001
     * @tc.desc    只读形式打开资产,支持
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('test_fuse_open_file_readOnly_001', Level.LEVEL1, async (done: Function) => {
      console.info(TAG,'Start',);
      let testNum = 'test_fuse_open_file_readOnly_001'
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "01.mp4");
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        console.log(`${testNum} :: srcUri is ${srcUri}`);
        let ret = testNapi.open(srcUri, 0);
        console.log(`${testNum} :: result is ${ret}`);
        expect(ret > 0).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: test is fail , error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number  test_fuse_open_file_readWrite_001
     * @tc.name    test_fuse_open_file_readWrite_001
     * @tc.desc    读写形式打开资产,支持
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('test_fuse_open_file_readWrite_001', Level.LEVEL1, async (done: Function) => {
      console.info(TAG,'Start',);
      let testNum = 'test_fuse_open_file_readWrite_001'
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "01.mp4");
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        console.log(`${testNum} :: srcUri is ${srcUri}`);
        let ret = testNapi.open(srcUri, 1);
        console.log(`${testNum} :: result is ${ret}`);
        expect(ret > 0).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: test is fail , error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number  test_fuse_open_file_writeOnly_001
     * @tc.name    test_fuse_open_file_writeOnly_001
     * @tc.desc    只写形式打开资产,支持
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('test_fuse_open_file_writeOnly_001', Level.LEVEL1, async (done: Function) => {
      console.info(TAG,'Start',);
      let testNum = 'test_fuse_open_file_writeOnly_001'
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "01.mp4");
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        console.log(`${testNum} :: srcUri is ${srcUri}`);
        let ret = testNapi.open(srcUri, 2);
        console.log(`${testNum} :: result is ${ret}`);
        expect(ret > 0).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: test is fail , error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number  test_fuse_open_file_append_001
     * @tc.name    test_fuse_open_file_append_001
     * @tc.desc    追加形式打开资产,不支持
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('test_fuse_open_file_append_001', Level.LEVEL1, async (done: Function) => {
      console.info(TAG,'Start',);
      let testNum = 'test_fuse_open_file_append_001'
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "01.mp4");
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        console.log(`${testNum} :: srcUri is ${srcUri}`);
        let ret = testNapi.open(srcUri, 3);
        console.log(`${testNum} :: result is ${ret}`);
        expect(ret == -1).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: test is fail , error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number  test_fuse_open_file_create_001
     * @tc.name    test_fuse_open_file_create_001
     * @tc.desc    creat形式打开资产,支持
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('test_fuse_open_file_create_001', Level.LEVEL1, async (done: Function) => {
      console.info(TAG,'Start',);
      let testNum = 'test_fuse_open_file_create_001'
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "01.mp4");
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        console.log(`${testNum} :: srcUri is ${srcUri}`);
        let ret = testNapi.open(srcUri, 4);
        console.log(`${testNum} :: result is ${ret}`);
        expect(ret > 0).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: test is fail , error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number  test_fuse_open_file_largefile_001
     * @tc.name    test_fuse_open_file_largefile_001
     * @tc.desc    largefile形式打开资产,支持
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('test_fuse_open_file_largefile_001', Level.LEVEL1, async (done: Function) => {
      console.info(TAG,'Start',);
      let testNum = 'test_fuse_open_file_largefile_001'
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "01.mp4");
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        console.log(`${testNum} :: srcUri is ${srcUri}`);
        let ret = testNapi.open(srcUri, 5);
        console.log(`${testNum} :: result is ${ret}`);
        expect(ret > 0).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: test is fail , error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number  test_fuse_open_file_trunc_001
     * @tc.name    test_fuse_open_file_trunc_001
     * @tc.desc    truncate形式打开资产,不支持
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('test_fuse_open_file_trunc_001', Level.LEVEL1, async (done: Function) => {
      console.info(TAG,'Start',);
      let testNum = 'test_fuse_open_file_trunc_001'
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "01.mp4");
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        console.log(`${testNum} :: srcUri is ${srcUri}`);
        let ret = testNapi.open(srcUri, 6);
        console.log(`${testNum} :: result is ${ret}`);
        expect(ret == -1).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: test is fail , error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number  test_fuse_open_file_excl_001
     * @tc.name    test_fuse_open_file_excl_001
     * @tc.desc    excel形式打开资产,支持
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('test_fuse_open_file_excl_001', Level.LEVEL1, async (done: Function) => {
      console.info(TAG,'Start',);
      let testNum = 'test_fuse_open_file_excl_001'
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "01.mp4");
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        console.log(`${testNum} :: srcUri is ${srcUri}`);
        let ret = testNapi.open(srcUri, 7);
        console.log(`${testNum} :: result is ${ret}`);
        expect(ret > 0).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: test is fail , error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number  test_fuse_create_dir_mkdirat_001
     * @tc.name    test_fuse_create_dir_mkdirat_001
     * @tc.desc    使用mkdirat创建目录,不支持
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('test_fuse_create_dir_mkdirat_001', Level.LEVEL1, async (done: Function) => {
      console.info(TAG,'Start',);
      let testNum = 'test_fuse_create_dir_mkdirat_001'
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "01.jpg");
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        console.log(`${testNum} :: srcUri is ${srcUri}`);
        let ret: number = testNapi.Test_Create_Dir(srcUri, 0);
        console.log(`${testNum} :: result is ${ret}`);
        expect(ret == -1).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: test is fail , error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number  test_fuse_create_dir_mkdir_001
     * @tc.name    test_fuse_create_dir_mkdir_001
     * @tc.desc    使用mkdir创建目录,不支持
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('test_fuse_create_dir_mkdir_001', Level.LEVEL1, async (done: Function) => {
      console.info(TAG,'Start',);
      let testNum = 'test_fuse_create_dir_mkdir_001'
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "01.jpg");
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        console.log(`${testNum} :: srcUri is ${srcUri}`);
        let ret: number = testNapi.Test_Create_Dir(srcUri, 1);
        console.log(`${testNum} :: result is ${ret}`);
        expect(ret == -1).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: test is fail , error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number  test_fuse_create_file_001
     * @tc.name    test_fuse_create_file_001
     * @tc.desc    在fuse目录下通过open创建新资产，不支持
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('test_fuse_create_file_001', Level.LEVEL1, async (done: Function) => {
      console.info(TAG,'Start',);
      let testNum = 'test_fuse_create_file_001'
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "01.jpg");
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        console.log(`${testNum} :: srcUri is ${srcUri}`);
        let ret: number = testNapi.Test_Create_File(srcUri, 0);
        console.log(`${testNum} :: result is ${ret}`);
        expect(ret == -1).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: test is fail , error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number  test_fuse_open_dir_001
     * @tc.name    test_fuse_open_dir_001
     * @tc.desc    使用open打开目录，不支持
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('test_fuse_open_dir_001', Level.LEVEL1, async (done: Function) => {
      console.info(TAG,'Start',);
      let testNum = 'test_fuse_open_dir_001'
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "01.jpg");
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        console.log(`${testNum} :: srcUri is ${srcUri}`);
        let ret: number = testNapi.Test_Open_Dir(srcUri);
        console.log(`${testNum} :: result is ${ret}`);
        expect(ret == -1).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: test is fail , error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number  test_fuse_access_001
     * @tc.name    test_fuse_access_001
     * @tc.desc    使用access检查文件读权限，支持
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('test_fuse_access_001', Level.LEVEL1, async (done: Function) => {
      console.info(TAG,'Start',);
      let testNum = 'test_fuse_access_001'
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "01.jpg");
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        console.log(`${testNum} :: srcUri is ${srcUri}`);
        let ret: number = testNapi.Test_Access(srcUri, 1);
        console.log(`${testNum} :: result is ${ret}`);
        expect(ret == 0).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: test is fail , error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number  test_fuse_access_002
     * @tc.name    test_fuse_access_002
     * @tc.desc    使用access检查文件写权限，支持
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('test_fuse_access_002', Level.LEVEL1, async (done: Function) => {
      console.info(TAG,'Start',);
      let testNum = 'test_fuse_access_002'
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "01.jpg");
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        console.log(`${testNum} :: srcUri is ${srcUri}`);
        let ret: number = testNapi.Test_Access(srcUri, 2);
        console.log(`${testNum} :: result is ${ret}`);
        expect(ret == 0).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: test is fail , error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number  test_fuse_access_003
     * @tc.name    test_fuse_access_003
     * @tc.desc    使用access检查文件可执行权限，不支持
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('test_fuse_access_003', Level.LEVEL1, async (done: Function) => {
      console.info(TAG,'Start',);
      let testNum = 'test_fuse_access_003'
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "01.jpg");
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        console.log(`${testNum} :: srcUri is ${srcUri}`);
        let ret: number = testNapi.Test_Access(srcUri, 3);
        console.log(`${testNum} :: result is ${ret}`);
        expect(ret == -1).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: test is fail , error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number  test_fuse_access_004
     * @tc.name    test_fuse_access_004
     * @tc.desc    使用access检查资产是否存在，支持
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('test_fuse_access_004', Level.LEVEL1, async (done: Function) => {
      console.info(TAG,'Start',);
      let testNum = 'test_fuse_access_004'
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "01.jpg");
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        console.log(`${testNum} :: srcUri is ${srcUri}`);
        let ret: number = testNapi.Test_Access(srcUri, 4);
        console.log(`${testNum} :: result is ${ret}`);
        expect(ret == 0).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: test is fail , error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number  test_fuse_chmod_001
     * @tc.name    test_fuse_chmod_001
     * @tc.desc    使用chmod修改文件权限，不支持
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('test_fuse_chmod_001', Level.LEVEL1, async (done: Function) => {
      console.info(TAG,'Start',);
      let testNum = 'test_fuse_chmod_001'
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "01.jpg");
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        console.log(`${testNum} :: srcUri is ${srcUri}`);
        let ret: number = testNapi.testChmod(srcUri);
        console.log(`${testNum} :: result is ${ret}`);
        expect(ret == -1).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: test is fail , error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number  test_fuse_chown_001
     * @tc.name    test_fuse_chown_001
     * @tc.desc    使用chown修改文件的权限，不支持
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('test_fuse_chown_001', Level.LEVEL1, async (done: Function) => {
      console.info(TAG,'Start',);
      let testNum = 'test_fuse_chown_001'
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "01.jpg");
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        console.log(`${testNum} :: srcUri is ${srcUri}`);
        let ret: number = testNapi.testChown(srcUri);
        console.log(`${testNum} :: result is ${ret}`);
        expect(ret == -1).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: test is fail , error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number  test_fuse_remove_file_unlink_001
     * @tc.name    test_fuse_remove_file_unlink_001
     * @tc.desc    使用unlink删除文件，不支持
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('test_fuse_remove_file_unlink_001', Level.LEVEL1, async (done: Function) => {
      console.info(TAG,'Start',);
      let testNum = 'test_fuse_remove_file_unlink_001'
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "01.jpg");
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        console.log(`${testNum} :: srcUri is ${srcUri}`);
        let ret: number = testNapi.testRemoveFile(srcUri, 0);
        console.log(`${testNum} :: result is ${ret}`);
        expect(ret == -1).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: test is fail , error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number  test_fuse_remove_file_remove_001
     * @tc.name    test_fuse_remove_file_remove_001
     * @tc.desc    使用remove删除文件，不支持
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('test_fuse_remove_file_remove_001', Level.LEVEL1, async (done: Function) => {
      console.info(TAG,'Start',);
      let testNum = 'test_fuse_remove_file_remove_001'
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "01.jpg");
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        console.log(`${testNum} :: srcUri is ${srcUri}`);
        let ret: number = testNapi.testRemoveFile(srcUri, 1);
        console.log(`${testNum} :: result is ${ret}`);
        expect(ret == -1).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: test is fail , error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number  test_fuse_remove_dir_remove_001
     * @tc.name    test_fuse_remove_dir_remove_001
     * @tc.desc    使用remove删除目录，不支持
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('test_fuse_remove_dir_remove_001', Level.LEVEL1, async (done: Function) => {
      console.info(TAG,'Start',);
      let testNum = 'test_fuse_remove_dir_remove_001'
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "01.jpg");
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        console.log(`${testNum} :: srcUri is ${srcUri}`);
        let ret: number = testNapi.testRemoveDir(srcUri, 0);
        console.log(`${testNum} :: result is ${ret}`);
        expect(ret == -1).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: test is fail , error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number  test_fuse_remove_dir_rmdir_001
     * @tc.name    test_fuse_remove_dir_rmdir_001
     * @tc.desc    使用rmdir删除目录，不支持
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('test_fuse_remove_dir_rmdir_001', Level.LEVEL1, async (done: Function) => {
      console.info(TAG,'Start',);
      let testNum = 'test_fuse_remove_dir_rmdir_001'
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "01.jpg");
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        console.log(`${testNum} :: srcUri is ${srcUri}`);
        let ret: number = testNapi.testRemoveDir(srcUri, 1);
        console.log(`${testNum} :: result is ${ret}`);
        expect(ret == -1).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: test is fail , error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number  test_fuse_dirname_001
     * @tc.name    test_fuse_dirname_001
     * @tc.desc    使用dirname获取目录名，不支持
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('test_fuse_dirname_001', Level.LEVEL1, async (done: Function) => {
      console.info(TAG,'Start',);
      let testNum = 'test_fuse_dirname_001'
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "01.jpg");
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        console.log(`${testNum} :: srcUri is ${srcUri}`);
        let ret: string = testNapi.testDirName(srcUri);
        console.log(`${testNum} :: result is ${ret}`);
        expect(ret != null).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: test is fail , error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number  test_fuse_rename_001
     * @tc.name    test_fuse_rename_001
     * @tc.desc    使用rename重命名文件，不支持
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('test_fuse_rename_001', Level.LEVEL1, async (done: Function) => {
      console.info(TAG,'Start',);
      let testNum = 'test_fuse_rename_001'
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "01.jpg");
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        console.log(`${testNum} :: srcUri is ${srcUri}`);
        let ret: number = testNapi.testRename(srcUri, "newName.jpg");
        console.log(`${testNum} :: result is ${ret}`);
        expect(ret == -1).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: test is fail , error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number  test_fuse_basename_001
     * @tc.name    test_fuse_basename_001
     * @tc.desc    使用basename获取文件名，支持
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('test_fuse_basename_001', Level.LEVEL1, async (done: Function) => {
      console.info(TAG,'Start',);
      let testNum = 'test_fuse_basename_001'
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "01.jpg");
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        console.log(`${testNum} :: srcUri is ${srcUri}`);
        let ret: string = testNapi.testBaseName(srcUri);
        console.log(`${testNum} :: result is ${ret}`);
        expect(ret != null).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: test is fail , error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    });
    
  });
}