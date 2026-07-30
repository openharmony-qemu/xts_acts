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
import { BusinessError } from '@ohos.base'
import { describe, it, expect, beforeAll, Level, afterAll, Hypium } from '../../../../hypium'
import { sleep, getPermission, fetchAllOption} from '../common'
import { Context } from '@kit.ArkUI'

let TAG: string = 'xts.PhotoAssetSuppTest'

export default function CommitModifySuppTest(): void {
  describe('CommitModifySuppTest', (): void => {
    let globalContext: Context = Hypium.get('Context')! as Context
    let helper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(globalContext)!;

    beforeAll(async (): Promise<void> => {
      console.info('beforeAll case');
      await getPermission();
      await sleep(10);
    });

    afterAll(async (): Promise<void> => {
      console.info('afterAll case');
    })

    let commitModifyTest =
      async (done: () => void, testName: string, member: string, values: string,
        callback: (res: number) => void): Promise<void> => {
        try {
          const fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
          let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
            await helper.getAssets(fetchOps);
          let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject()!;
          let photoAssetTitle: photoAccessHelper.MemberType = photoAsset.get(member);
          console.info(TAG + testName + 'photoAsset get photoAssetTitle = ' + photoAssetTitle);
          photoAsset.set(photoAccessHelper.PhotoKeys.TITLE, values);
          await photoAsset.commitModify();
          console.error(TAG + testName + ' success');
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG + testName + 'commitModify failed, error: ' + error.code);
          callback(error.code);
          done();
        }
      }

    let commitModifyPromiseTest =
      async (done: () => void, testName: string, member: string, values: string,
        callback: (res: number) => void): Promise<void> => {
        try {
          const fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
          let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
            await helper.getAssets(fetchOps);
          let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject()!;
          let photoAssetTitle: photoAccessHelper.MemberType = photoAsset.get(member);
          console.info(TAG + testName + 'photoAsset get photoAssetTitle = ' + photoAssetTitle);
          photoAsset.set(photoAccessHelper.PhotoKeys.TITLE, values);
          photoAsset.commitModify((err: BusinessError | null) => {
            if (err === null) {
              let newPhotoAssetTitle: photoAccessHelper.MemberType = photoAsset.get(member);
              console.info(TAG + testName + 'photoAsset get newPhotoAssetTitle = ' + newPhotoAssetTitle);
              expect().assertFail();
              done();
            } else {
              console.error(TAG + testName + 'commitModify failed, error: ' + err.code);
              callback(err.code);
              done();
            }
          });
        } catch (error) {
          console.error(testName + 'error: ' + error.code);
          expect().assertFail();
          done();
        }
      };

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_STATIC_0100
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_STATIC_0100
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_STATIC_0100';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'newTitle2.png',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_STATIC_0200
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_STATIC_0200
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_STATIC_0200';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'newTitle2.jpg',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_STATIC_0300
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_STATIC_0300
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_STATIC_0300';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'newTitle2.mp4',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_STATIC_0400
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_STATIC_0400
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_STATIC_0400';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'newTitle2.mov',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_STATIC_0500
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_STATIC_0500
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_STATIC_0500';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'newTitle2.gif',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_STATIC_0600
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_STATIC_0600
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_STATIC_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_STATIC_0600';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'newTitle2.bmp',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_STATIC_0700
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_STATIC_0700
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_STATIC_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_STATIC_0700';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'newTitle2.ico',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_0800
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_0800
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_0800';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'newTitle2.dng',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_0900
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_0900
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_0900';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'newTitle2.webp',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1000
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1000
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1000';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'newTitle2.svg',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1100
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1100
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1100';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'newTitle2.jpeg',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1200
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1200
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1200';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'newTitle2.123',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1300
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1300
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1300';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'newTitle2.abc',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1400
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1400
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1400';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, '.newTitle2',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1500
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1500
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1500';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, ':newTitle2',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1600
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1600
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1600';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'new\\Title2',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1700
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1700
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1700';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'new/Title2',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1800
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1800
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1800';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'new*Title2',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1900
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1900
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_1900';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'new?Title2',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2000
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2000
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2000';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'new"Title2.png',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2100
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2100
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2100';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'new`Title2.png',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2200
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2200
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2200';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "new'Title2",
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2300
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2300
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2300';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'new<Title2',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2400
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2400
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2400';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'new>Title2',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2500
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2500
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2500';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'new|Title2',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2600
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2600
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2600';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'new{Title2',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2700
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2700
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2700';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'new}Title2',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2800
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2800
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2800';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'new[Title2',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2900
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2900
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_2900';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'new]Title2',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_3000
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_3000
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_3000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_3000';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "",
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_3100
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_3100
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_3100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_3100';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "a".repeat(252),
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_3200
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_3200
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_3200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_STATIC_3200';
      await commitModifyTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "a/b/c/" + "x".repeat(250),
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0100
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0100
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0100';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'newTitle2.png',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0200
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0200
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0200';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'newTitle2.jpg',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0300
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0300
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0300';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'newTitle2.mp4',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0400
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0400
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0400';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'newTitle2.mov',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0500
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0500
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0500';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'newTitle2.gif',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0600
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0600
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0600';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'newTitle2.bmp',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0700
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0700
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0700';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'newTitle2.ico',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0800
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0800
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0800';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'newTitle2.dng',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0900
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0900
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_0900';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'newTitle2.webp',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1000
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1000
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1000';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'newTitle2.svg',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1100
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1100
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1100';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'newTitle2.jpeg',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1200
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1200
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1200';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'newTitle2.123',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1300
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1300
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1300';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'newTitle2.abc',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1400
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1400
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1400';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, '.newTitle2',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1500
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1500
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1500';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, ':newTitle2',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1600
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1600
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1600';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'new\\Title2',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1700
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1700
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1700';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'new/Title2',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1800
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1800
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1800';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'new*Title2',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1900
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1900
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_1900';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'new?Title2',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2000
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2000
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2000';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'new"Title2.png',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2100
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2100
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2100';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'new`Title2.png',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2200
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2200
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2200';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "new'Title2",
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2300
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2300
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2300';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'new<Title2',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2400
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2400
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2400';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'new>Title2',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2500
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2500
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2500';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'new|Title2',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2600
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2600
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2600';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'new{Title2',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2700
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2700
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2700';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'new}Title2',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2800
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2800
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2800';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'new[Title2',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2900
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2900
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_2900';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'new]Title2',
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_3000
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_3000
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_3000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_3000';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "",
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_3100
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_3100
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_3100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_3100';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "a".repeat(252),
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });

    /**
     * @tc.name   SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_3200
     * @tc.number SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_3200
     * @tc.desc   Test with commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_3200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_SENDABLE_PHOTO_ACCESS_COMMIT_MODIFY_PROMISE_STATIC_3200';
      await commitModifyPromiseTest(done, testName, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "a/b/c/" + "x".repeat(250),
        (errCode: number) => {
          expect(errCode).assertEqual(14000001)
        });
    });
  })
}