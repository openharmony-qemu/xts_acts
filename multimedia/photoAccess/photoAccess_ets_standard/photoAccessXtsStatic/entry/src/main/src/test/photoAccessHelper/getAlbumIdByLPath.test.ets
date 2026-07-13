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
import { describe, it, expect, beforeAll, Level, Hypium } from '@ohos/hypium-binary/src/main/indexStatic'
import {
  sleep,
  getPermission,
} from '../common'
import { Context } from '@kit.ArkUI';

export default function getAlbumIdByLPathTest(): void {
  describe('getAlbumIdByLPathTest', () => {
    let testContext: Context = Hypium.get('Context') as Context;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await sleep(1000);
    });

    /**
     * @tc.number     SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GETALBUMBYLPATH_STATIC_0010
     * @tc.name       SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GETALBUMBYLPATH_STATIC_0010
     * @tc.desc       getAlbumIdByLpath get albumsId by '/DCIM/Camera'
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GETALBUMBYLPATH_STATIC_0010', Level.LEVEL2, async (done: () => void) => {
      const testNum = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GETALBUMBYLPATH_STATIC_0010';
      try {
        let albumId: number = await helper!.getAlbumIdByLpath('/DCIM/Camera');
        expect(typeof albumId === 'number').assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GETALBUMBYLPATH_STATIC_0020
     * @tc.name       SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GETALBUMBYLPATH_STATIC_0020
     * @tc.desc       getAlbumIdByLpath get albumsId by '/Pictures/Screenshots'
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GETALBUMBYLPATH_STATIC_0020', Level.LEVEL2, async (done: () => void) => {
      const testNum = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GETALBUMBYLPATH_STATIC_0020';
      try {
        let albumId: number = await helper!.getAlbumIdByLpath('/Pictures/Screenshots');
        expect(typeof albumId === 'number').assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GETALBUMBYLPATH_STATIC_0030
     * @tc.name       SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GETALBUMBYLPATH_STATIC_0030
     * @tc.desc       getAlbumIdByLpath get albumsId by '/Pictures/Screenrecords'
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GETALBUMBYLPATH_STATIC_0030', Level.LEVEL2, async (done: () => void) => {
      const testNum = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GETALBUMBYLPATH_STATIC_0030';
      try {
        let albumId: number = await helper!.getAlbumIdByLpath('/Pictures/Screenrecords');
        expect(typeof albumId === 'number').assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GETALBUMBYLPATH_STATIC_0040
     * @tc.name       SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GETALBUMBYLPATH_STATIC_0040
     * @tc.desc       getAlbumIdByLpath get albumsId by ''
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GETALBUMBYLPATH_STATIC_0040', Level.LEVEL2, async (done: () => void) => {
      const testNum = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GETALBUMBYLPATH_STATIC_0040';
      try {
        let albumId: number = await helper!.getAlbumIdByLpath('');
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });

    /**
     * @tc.number     SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GETALBUMBYLPATH_STATIC_0050
     * @tc.name       SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GETALBUMBYLPATH_STATIC_0050
     * @tc.desc       getAlbumIdByLpath get albumsId by 256 length string
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GETALBUMBYLPATH_STATIC_0050', Level.LEVEL2, async (done: () => void) => {
      const testNum = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_GETALBUMBYLPATH_STATIC_0050';
      try {
        let str = ''
        for (let index = 0; index < 256; index++) {
          str+='a'
        }
        let albumId: number = await helper!.getAlbumIdByLpath(str);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
  })
}

