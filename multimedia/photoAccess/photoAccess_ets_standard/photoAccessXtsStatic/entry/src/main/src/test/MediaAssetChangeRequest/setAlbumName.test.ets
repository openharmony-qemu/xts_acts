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

import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level, Hypium } from '../../../../hypium';
import { getPermission, LOG_TAG, createUserAlbum } from '../common';
import common from '@ohos.app.ability.common';
import { Context } from '@ohos.arkui.UIContext';

const TAG = LOG_TAG + 'setAlbumName';
let testContext: Context = Hypium.get('Context') as Context;
const helper = photoAccessHelper.getPhotoAccessHelper(testContext);


export default function MediaAlbumChangeRequestSetAlbumNameStatic(): void {
  describe('MediaAlbumChangeRequestSetAlbumNameTest', () => {

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
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
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0010
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0010
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0010';
      let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
      let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
      let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
      try {
        let newAlbumName: string = 'newAlbumName' + new Date().getTime();
        albumChangeRequest.setAlbumName(newAlbumName);
        await helper!.applyChanges(albumChangeRequest);
        expect(album.albumUri.toString().includes('file:')).assertTrue();
        console.info(TAG,testName,'success',newAlbumName)
        done()
      }catch (error){
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0020
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0020
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0020';
      let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
      let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
      let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
      try {
        let newAlbumName: string = '我是汉字'+ new Date().getTime();
        albumChangeRequest.setAlbumName(newAlbumName);
        await helper!.applyChanges(albumChangeRequest);
        expect(album.albumUri.toString().includes('file:')).assertTrue();
        console.info(TAG,testName,'success',newAlbumName)
        done()
      }catch (error){
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0030
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0030
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0030';
      let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
      let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
      let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
      try {
        let newAlbumName: string = 'ABC'+ new Date().getTime();
        albumChangeRequest.setAlbumName(newAlbumName);
        await helper!.applyChanges(albumChangeRequest);
        expect(album.albumUri.toString().includes('file:')).assertTrue();
        console.info(TAG,testName,'success',newAlbumName)
        done()
      }catch (error){
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0040
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0040
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0040';
      let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
      let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
      let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
      try {
        let newAlbumName: string = '123456'+ new Date().getTime();
        albumChangeRequest.setAlbumName(newAlbumName);
        await helper!.applyChanges(albumChangeRequest);
        expect(album.albumUri.toString().includes('file:')).assertTrue();
        console.info(TAG,testName,'success',newAlbumName)
        done()
      }catch (error){
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0050
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0050
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0050', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0050';
      let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
      let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
      let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
      try {
        let newAlbumName: string = '+-'+ new Date().getTime();
        albumChangeRequest.setAlbumName(newAlbumName);
        await helper!.applyChanges(albumChangeRequest);
        expect(album.albumUri.toString().includes('file:')).assertTrue();
        console.info(TAG,testName,'success',newAlbumName)
        done()
      }catch (error){
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0060
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0060
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0060', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0060';
      let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
      let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
      let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
      try {
        let newAlbumName: string = '_abc Abc 123'+ new Date().getTime();
        albumChangeRequest.setAlbumName(newAlbumName);
        await helper!.applyChanges(albumChangeRequest);
        expect(album.albumUri.toString().includes('file:')).assertTrue();
        console.info(TAG,testName,'success',newAlbumName)
        done()
      }catch (error){
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0070
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0070
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0070', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0070';
      let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
      let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
      let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
      try {
        let newAlbumName: string = '';
        albumChangeRequest.setAlbumName(newAlbumName);
        await helper!.applyChanges(albumChangeRequest);
        expect().assertFail();
        console.info(TAG,testName,'success',newAlbumName)
        done()
      }catch (error){
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0080
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0080
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0080', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0080';
      let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
      let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
      let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
      try {
        let newAlbumName: string = '1.1';
        albumChangeRequest.setAlbumName(newAlbumName);
        await helper!.applyChanges(albumChangeRequest);
        expect().assertFail();
        console.info(TAG,testName,'success',newAlbumName)
        done()
      }catch (error){
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0090
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0090
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0090', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0090';
      let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
      let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
      let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
      try {
        let newAlbumName: string = '1\\ 1';
        albumChangeRequest.setAlbumName(newAlbumName);
        await helper!.applyChanges(albumChangeRequest);
        expect().assertFail();
        console.info(TAG,testName,'success',newAlbumName)
        done()
      }catch (error){
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0100
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0100
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0100';
      let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
      let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
      let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
      try {
        let newAlbumName: string = '1/1';
        albumChangeRequest.setAlbumName(newAlbumName);
        await helper!.applyChanges(albumChangeRequest);
        expect().assertFail();
        console.info(TAG,testName,'success',newAlbumName)
        done()
      }catch (error){
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0110
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0110
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0110', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0110';
      let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
      let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
      let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
      try {
        let newAlbumName: string = '1:1';
        albumChangeRequest.setAlbumName(newAlbumName);
        await helper!.applyChanges(albumChangeRequest);
        expect().assertFail();
        console.info(TAG,testName,'success',newAlbumName)
        done()
      }catch (error){
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0120
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0120
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0120', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0120';
      let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
      let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
      let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
      try {
        let newAlbumName: string = '1*1';
        albumChangeRequest.setAlbumName(newAlbumName);
        await helper!.applyChanges(albumChangeRequest);
        expect().assertFail();
        console.info(TAG,testName,'success',newAlbumName)
        done()
      }catch (error){
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0130
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0130
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0130', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0130';
      let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
      let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
      let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
      try {
        let newAlbumName: string = '1?1';
        albumChangeRequest.setAlbumName(newAlbumName);
        await helper!.applyChanges(albumChangeRequest);
        expect().assertFail();
        console.info(TAG,testName,'success',newAlbumName)
        done()
      }catch (error){
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0140
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0140
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0140', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0140';
      let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
      let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
      let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
      try {
        let newAlbumName: string = '1"1';
        albumChangeRequest.setAlbumName(newAlbumName);
        await helper!.applyChanges(albumChangeRequest);
        expect().assertFail();
        console.info(TAG,testName,'success',newAlbumName)
        done()
      }catch (error){
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0150
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0150
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0150', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0150';
      let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
      let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
      let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
      try {
        let newAlbumName: string = "1'1";
        albumChangeRequest.setAlbumName(newAlbumName);
        await helper!.applyChanges(albumChangeRequest);
        expect().assertFail();
        console.info(TAG,testName,'success',newAlbumName)
        done()
      }catch (error){
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0160
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0160
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0160', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0160';
      let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
      let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
      let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
      try {
        let newAlbumName: string = "1`1";
        albumChangeRequest.setAlbumName(newAlbumName);
        await helper!.applyChanges(albumChangeRequest);
        expect().assertFail();
        console.info(TAG,testName,'success',newAlbumName)
        done()
      }catch (error){
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0170
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0170
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0170', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0170';
      let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
      let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
      let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
      try {
        let newAlbumName: string = "1<1";
        albumChangeRequest.setAlbumName(newAlbumName);
        await helper!.applyChanges(albumChangeRequest);
        expect().assertFail();
        console.info(TAG,testName,'success',newAlbumName)
        done()
      }catch (error){
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0180
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0180
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0180', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0180';
      let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
      let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
      let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
      try {
        let newAlbumName: string = "1>1";
        albumChangeRequest.setAlbumName(newAlbumName);
        await helper!.applyChanges(albumChangeRequest);
        expect().assertFail();
        console.info(TAG,testName,'success',newAlbumName)
        done()
      }catch (error){
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0190
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0190
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0190', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0190';
      let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
      let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
      let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
      try {
        let newAlbumName: string = "1>1";
        albumChangeRequest.setAlbumName(newAlbumName);
        await helper!.applyChanges(albumChangeRequest);
        expect().assertFail();
        console.info(TAG,testName,'success',newAlbumName)
        done()
      }catch (error){
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0200
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0200
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0200';
      let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
      let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
      let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
      try {
        let newAlbumName: string = "1|1";
        albumChangeRequest.setAlbumName(newAlbumName);
        await helper!.applyChanges(albumChangeRequest);
        expect().assertFail();
        console.info(TAG,testName,'success',newAlbumName)
        done()
      }catch (error){
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0210
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0210
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0210', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0210';
      let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
      let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
      let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
      try {
        let newAlbumName: string = "1{}1";
        albumChangeRequest.setAlbumName(newAlbumName);
        await helper!.applyChanges(albumChangeRequest);
        expect().assertFail();
        console.info(TAG,testName,'success',newAlbumName)
        done()
      }catch (error){
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0220
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0220
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0220', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0220';
      let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
      let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
      let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
      try {
        let newAlbumName: string = "1{1";
        albumChangeRequest.setAlbumName(newAlbumName);
        await helper!.applyChanges(albumChangeRequest);
        expect().assertFail();
        console.info(TAG,testName,'success',newAlbumName)
        done()
      }catch (error){
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0230
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0230
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0230', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_0230';
      let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
      let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
      let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
      try {
        let newAlbumName: string = "1[]1";
        albumChangeRequest.setAlbumName(newAlbumName);
        await helper!.applyChanges(albumChangeRequest);
        expect().assertFail();
        console.info(TAG,testName,'success',newAlbumName)
        done()
      }catch (error){
        console.error(`${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

  })
}