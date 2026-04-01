/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, Hypium } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Context from "application.Context"
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { BusinessError } from "@kit.BasicServicesKit";

let TAG: string = ' PhotoAccessHelperNoPermission: ';
export default function photoAccessHelperNoPermissionStaticTest() {
    describe("photoAccessHelperNoPermissionStaticTest", (): void => {

        /**
         * @tc.name   photoAccessHelper_getAssets_static_001
         * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_STATIC_0001
         * @tc.desc   photoAccessHelper-getAssets(promise) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("photoAccessHelper_getAssets_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
            const testName:string = 'photoAccessHelper_getAssets_static_001 ';
            console.info(TAG, testName + 'begin');
            try {
                let context: Context = Hypium.get("Context") as Context;
                let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
                let fetchOptions: photoAccessHelper.FetchOptions = {
                    fetchColumns: ['date_added', 'date_modified', 'size'],
                    predicates: predicates
                };
                console.info(TAG, testName + 'fetchOptions:' + fetchOptions);
                await helper!.getAssets(fetchOptions);
                expect().assertFail();

                 done();
            } catch (err) {
                console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                expect(err.code).assertEqual(201);
                done();
            }
        })

        /**
         * @tc.name   photoAccessHelper_getAssets_static_002
         * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ASSETS_STATIC_0002
         * @tc.desc   photoAccessHelper-getAssets(callback) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("photoAccessHelper_getAssets_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'photoAccessHelper_getAssets_static_002 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                    let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
                    let fetchOptions: photoAccessHelper.FetchOptions = {
                        fetchColumns: ['date_added', 'date_modified', 'size'],
                        predicates: predicates
                    };
                    console.info(TAG, testName + 'fetchOptions:' + fetchOptions);
                    helper!.getAssets(fetchOptions, (err: BusinessError<void> | null,
                        fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> | undefined) => {
                        console.info(TAG, testName + 'getAssets failed. fetchResult:' + fetchResult + ' code:' + err?.code);
                        expect(err?.code).assertEqual(201);
                        done();
                    });
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect(err.code).assertEqual(201);
                    done();
                }
            })

        /**
         * @tc.name   photoAccessHelper_getBurstAssets_static_001
         * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_BURST_ASSETS_STATIC_0001
         * @tc.desc   photoAccessHelper-getBurstAssets(promise) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("photoAccessHelper_getBurstAssets_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'photoAccessHelper_getBurstAssets_static_001 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                    let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
                    let fetchOptions: photoAccessHelper.FetchOptions = {
                        fetchColumns: ['date_added', 'date_modified', 'size'],
                        predicates: predicates
                    };
                    let burstKey = "e719d696-09fa-44f8-ec3f215aa62a";
                    await helper!.getBurstAssets(burstKey, fetchOptions);
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect(err.code).assertEqual(201);
                    done();
                }
            })

        /**
         * @tc.name   photoAccessHelper_createAsset_static_001
         * @tc.number SUB_PHOTO_ACCESS_HELPER_CREATE_ASSET_STATIC_0001
         * @tc.desc   photoAccessHelper-createAsset(promise) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("photoAccessHelper_createAsset_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'photoAccessHelper_createAsset_static_001 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                    const extension = 'jpg';
                    await helper!.createAsset(photoAccessHelper.PhotoType.IMAGE, extension);
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect(err.code).assertEqual(201);
                    done();
                }
            })

        /**
         * @tc.name   photoAccessHelper_createAsset_static_002
         * @tc.number SUB_PHOTO_ACCESS_HELPER_CREATE_ASSET_STATIC_0002
         * @tc.desc   photoAccessHelper-createAsset(callback) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("photoAccessHelper_createAsset_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'photoAccessHelper_createAsset_static_002 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                    const extension = 'jpg';
                    helper!.createAsset(photoAccessHelper.PhotoType.IMAGE, extension, (err: BusinessError<void> | null, uri: string | undefined): void => {
                        console.info(TAG, testName + 'getAssets failed. uri:' + uri + ' code:' + err?.code);
                        expect(err?.code).assertEqual(201);
                        done();
                    });
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect(err.code).assertEqual(201);
                    done();
                }
            })

        /**
         * @tc.name   photoAccessHelper_createAsset_static_003
         * @tc.number SUB_PHOTO_ACCESS_HELPER_CREATE_ASSET_STATIC_0003
         * @tc.desc   photoAccessHelper-createAsset(callback) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("photoAccessHelper_createAsset_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'photoAccessHelper_createAsset_static_003 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                    const extension = 'jpg';
                    let options: photoAccessHelper.CreateOptions = {
                        title: undefined
                    }
                    helper!.createAsset(photoAccessHelper.PhotoType.IMAGE, extension, options, (
                      err: BusinessError<void> | null, uri: string | undefined): void => {
                        console.info(TAG, testName + 'getAssets failed. uri:' + uri + ' code:' + err?.code);
                        expect(err?.code).assertEqual(201);
                        done();
                    });
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect(err.code).assertEqual(201);
                    done();
                }
            })

        /**
         * @tc.name   photoAccessHelper_createPhotoAsset_static_001
         * @tc.number SUB_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0001
         * @tc.desc   photoAccessHelper-createPhotoAsset(promise) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('photoAccessHelper_createPhotoAsset_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
            const testName:string = 'photoAccessHelper_createPhotoAsset_static_001 ';
            console.info(TAG, testName + 'begin');
            const type: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
            const extension = 'jpg';
            const title = 'createPhotoAsset' + new Date().getTime();
            try {
                let context: Context = Hypium.get("Context") as Context;
                let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                let uri = await helper!.createPhotoAsset(type, extension, title);
                console.info(TAG, testName + `createPhotoAsset success; uri: ${uri}`);
                expect().assertFail();
                done();
            } catch (err) {
                console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                expect(err.code).assertEqual(201);
                done();
            }
        })

        /**
         * @tc.name   photoAccessHelper_getAlbums_static_001
         * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_0001
         * @tc.desc   photoAccessHelper-getAlbums(promise) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("photoAccessHelper_getAlbums_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'photoAccessHelper_getAlbums_static_001 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                    await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect(err.code).assertEqual(201);
                    done();
                }
            })

        /**
         * @tc.name   photoAccessHelper_getAlbums_static_002
         * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_0002
         * @tc.desc   photoAccessHelper-getAlbums(callback) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("photoAccessHelper_getAlbums_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'photoAccessHelper_getAlbums_static_002 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                    helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC, (
                        err: BusinessError<void> | null, result: photoAccessHelper.FetchResult<photoAccessHelper.Album>): void => {
                        console.info(TAG, testName + 'getAssets failed. result:' + result + ' code:' + err?.code);
                        expect(err?.code).assertEqual(201);
                        done();
                    });
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect(err.code).assertEqual(201);
                    done();
                }
            })

        /**
         * @tc.name   photoAccessHelper_getAlbums_static_003
         * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_0003
         * @tc.desc   photoAccessHelper-getAlbums(callback) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("photoAccessHelper_getAlbums_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'photoAccessHelper_getAlbums_static_003 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                    let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
                    let fetchOptions: photoAccessHelper.FetchOptions = {
                        fetchColumns: ['date_added', 'date_modified', 'size'],
                        predicates: predicates
                    };
                    helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC,
                        fetchOptions, (err: BusinessError<void> | null, result: photoAccessHelper.FetchResult<photoAccessHelper.Album>): void => {
                            console.info(TAG, testName + 'getAssets failed. result:' + result + ' code:' + err?.code);
                            expect(err?.code).assertEqual(201);
                            done();
                        });
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect(err.code).assertEqual(201);
                    done();
                }
            })

        /**
         * @tc.name   photoAccessHelper_applyChanges_static_001
         * @tc.number SUB_PHOTO_ACCESS_HELPER_APPLY_CHANGES_STATIC_0001
         * @tc.desc   photoAccessHelper-applyChanges(promise) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("photoAccessHelper_applyChanges_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'photoAccessHelper_applyChanges_static_001 ';
                console.info(TAG, testName + 'begin');
                try {
                    let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
                    let context: Context = Hypium.get("Context") as Context;
                    let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                    let extension: string = 'jpg';
                    let options: photoAccessHelper.CreateOptions = {
                        title: 'photoAccessHelper_applyChanges_static_001',
                        subtype: photoAccessHelper.PhotoSubtype.MOVING_PHOTO
                    }
                    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest | null =
                        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(context, photoType, extension, options);
                    await helper!.applyChanges((assetChangeRequest as photoAccessHelper.MediaAssetChangeRequest));
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect(err.code).assertEqual(201);
                    done();
                }
            })

        /**
         * @tc.name   photoAccessHelper_onPhotoChange_static_001
         * @tc.number SUB_PHOTO_ACCESS_HELPER_ON_PHOTO_CHANGE_STATIC_0001
         * @tc.desc   photoAccessHelper-onPhotoChange(callback) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("photoAccessHelper_onPhotoChange_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'photoAccessHelper_onPhotoChange_static_001 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                    helper!.onPhotoChange((changeData: photoAccessHelper.PhotoAssetChangeInfos) => {
                        console.info(TAG, testName + ` changeData: ${JSON.stringify(changeData)}`);
                        expect().assertFail();
                    });
                    expect().assertFail();
                    done();
                } catch (err) {
                    hilog.info(0x0000, 'testTag', 'photoAccessHelper_onPhotoChange_static_001   failed' + err.name + err.message);
                    expect(err.code).assertEqual(201);
                    done();
                }
            })

        /**
         * @tc.name   photoAccessHelper_offPhotoChange_static_001
         * @tc.number SUB_PHOTO_ACCESS_HELPER_OFF_PHOTO_CHANGE_STATIC_0001
         * @tc.desc   photoAccessHelper-offPhotoChange(callback) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("photoAccessHelper_offPhotoChange_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'photoAccessHelper_offPhotoChange_static_001 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                    helper!.offPhotoChange((changeData: photoAccessHelper.PhotoAssetChangeInfos) => {
                        console.info(TAG, testName + ` changeData: ${JSON.stringify(changeData)}`);
                        expect().assertFail();
                    });
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect(err.code).assertEqual(201);
                    done();
                }
            })

        /**
         * @tc.name   photoAccessHelper_onPhotoAlbumChange_static_001
         * @tc.number SUB_PHOTO_ACCESS_HELPER_ON_PHOTO_ALBUM_CHANGE_STATIC_0001
         * @tc.desc   photoAccessHelper-onPhotoAlbumChange(callback) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("photoAccessHelper_onPhotoChange_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'photoAccessHelper_onPhotoChange_static_001 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                    helper!.onPhotoAlbumChange((changeData: photoAccessHelper.AlbumChangeInfos) => {
                        console.info(TAG, testName + ` changeData: ${JSON.stringify(changeData)}`);
                        expect().assertFail();
                    });
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect(err.code).assertEqual(201);
                    done();
                }
            })

        /**
         * @tc.name   photoAccessHelper_offPhotoAlbumChange_static_001
         * @tc.number SUB_PHOTO_ACCESS_HELPER_OFF_PHOTO_ALBUM_CHANGE_STATIC_0001
         * @tc.desc   photoAccessHelper-offPhotoAlbumChange(callback) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("photoAccessHelper_offPhotoAlbumChange_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'photoAccessHelper_offPhotoAlbumChange_static_001 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let helper: photoAccessHelper.PhotoAccessHelper|null = photoAccessHelper.getPhotoAccessHelper(context);
                    helper!.offPhotoAlbumChange((changeData: photoAccessHelper.AlbumChangeInfos) => {
                        console.info(TAG, testName + ` changeData: ${JSON.stringify(changeData)}`);
                        expect().assertFail();
                    });
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect(err.code).assertEqual(201);
                    done();
                }
            })

        /**
         * @tc.name   mediaAssetManager_cancelRequest_static_001
         * @tc.number SUB_MEDIA_ASSET_MANAGER_CANCEL_REQUEST_STATIC_0001
         * @tc.desc   mediaAssetManager-cancelRequest(promise) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("mediaAssetManager_cancelRequest_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'mediaAssetManager_cancelRequest_static_001 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let requestId: string = '123123';
                    await photoAccessHelper.MediaAssetManager.cancelRequest(context, requestId);
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect(err.code).assertEqual(201);
                    done();
                }
            })

        /**
         * @tc.name   mediaAssetChangeRequest_deleteAssets_static_001
         * @tc.number SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_STATIC_0001
         * @tc.desc   mediaAssetChangeRequest-deleteAssets(promise) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("mediaAssetChangeRequest_deleteAssets_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'mediaAssetChangeRequest_deleteAssets_static_001 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    const objList: Array<photoAccessHelper.PhotoAsset> = new Array<photoAccessHelper.PhotoAsset>();
                    await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(context, objList);
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect(err.code).assertEqual(201);
                    done();
                }
            })

        /**
         * @tc.name   mediaAssetChangeRequest_deleteAssetsToTrashWithUris_static_001
         * @tc.number SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_TO_TRASH_WITH_URIS_STATIC_0001
         * @tc.desc   mediaAssetChangeRequest-deleteAssetsToTrashWithUris(promise) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("mediaAssetChangeRequest_deleteAssetsToTrashWithUris_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'mediaAssetChangeRequest_deleteAssetsToTrashWithUris_static_001 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    const uriList: Array<string> = new Array<string>();
                    console.info(TAG, testName + `uriList: ${JSON.stringify(uriList)}`)
                    await photoAccessHelper.MediaAssetChangeRequest.deleteAssetsToTrashWithUris(context, uriList);
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect(err.code).assertEqual(201);
                    done();
                }
            })

        /**
         * @tc.name   mediaAssetChangeRequest_getWriteCacheHandler_static_001
         * @tc.number SUB_MEDIA_ASSET_CHANGE_REQUEST_GET_WRITE_CACHE_HANDLER_STATIC_0001
         * @tc.desc   mediaAssetChangeRequest-getWriteCacheHandler(promise) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("mediaAssetChangeRequest_getWriteCacheHandler_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'mediaAssetChangeRequest_getWriteCacheHandler_static_001 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest|null =
                        photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(context, photoAccessHelper.PhotoType.IMAGE, 'jpg');
                    await assetChangeRequest!.getWriteCacheHandler()
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect(err.code).assertEqual(201);
                    done();
                }
            })

        /**
         * @tc.name   movingPhoto_requestContent_static_001
         * @tc.number SUB_MOVING_PHOTO_REQUEST_CONTENT_STATIC_0001
         * @tc.desc   movingPhoto-requestContent(promise) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("movingPhoto_requestContent_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'movingPhoto_requestContent_static_001 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let imageFileUri: string =
                        "file://ohos.acts.multimedia.photoaccess.Static/data/storage/el2/base/haps/entry/photos/test_picture.jpg";
                    let videoFileUri: string =
                        "file://ohos.acts.multimedia.photoaccess.Static/data/storage/el2/base/haps/entry/photos/test_video.mp4";
                    let movingPhoto: photoAccessHelper.MovingPhoto =
                        await photoAccessHelper.MediaAssetManager.loadMovingPhoto(context, imageFileUri, videoFileUri);
                    await movingPhoto.requestContent(imageFileUri, videoFileUri)
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect(err.code).assertEqual(201);
                    done();
                }
            })

        /**
         * @tc.name   movingPhoto_requestContent_static_002
         * @tc.number SUB_MOVING_PHOTO_REQUEST_CONTENT_STATIC_0002
         * @tc.desc   movingPhoto-requestContent(promise) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("movingPhoto_requestContent_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'movingPhoto_requestContent_static_002 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let imageFileUri: string =
                        "file://ohos.acts.multimedia.photoaccess.Static/data/storage/el2/base/haps/entry/photos/test_picture.jpg";
                    let videoFileUri: string =
                        "file://ohos.acts.multimedia.photoaccess.Static/data/storage/el2/base/haps/entry/photos/test_video.mp4";
                    let movingPhoto: photoAccessHelper.MovingPhoto =
                        await photoAccessHelper.MediaAssetManager.loadMovingPhoto(context, imageFileUri, videoFileUri);
                    await movingPhoto.requestContent(photoAccessHelper.ResourceType.IMAGE_RESOURCE, imageFileUri)
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect(err.code).assertEqual(201);
                    done();
                }
            })

        /**
         * @tc.name   movingPhoto_requestContent_static_003
         * @tc.number SUB_MOVING_PHOTO_REQUEST_CONTENT_STATIC_0003
         * @tc.desc   movingPhoto-requestContent(promise) with no permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("movingPhoto_requestContent_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
                const testName:string = 'movingPhoto_requestContent_static_003 ';
                console.info(TAG, testName + 'begin');
                try {
                    let context: Context = Hypium.get("Context") as Context;
                    let imageFileUri: string =
                        "file://ohos.acts.multimedia.photoaccess.Static/data/storage/el2/base/haps/entry/photos/test_picture.jpg";
                    let videoFileUri: string =
                        "file://ohos.acts.multimedia.photoaccess.Static/data/storage/el2/base/haps/entry/photos/test_video.mp4";
                    let movingPhoto: photoAccessHelper.MovingPhoto =
                        await photoAccessHelper.MediaAssetManager.loadMovingPhoto(context, imageFileUri, videoFileUri);
                    await movingPhoto.requestContent(photoAccessHelper.ResourceType.IMAGE_RESOURCE, imageFileUri)
                    expect().assertFail();
                    done();
                } catch (err) {
                    console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
                    expect(err.code).assertEqual(201);
                    done();
                }
            })

    })
}