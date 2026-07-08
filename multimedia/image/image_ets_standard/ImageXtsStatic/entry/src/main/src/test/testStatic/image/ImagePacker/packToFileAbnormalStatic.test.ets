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

import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect,Hypium, it, Level} from '@ohos/hypium-binary/src/main/indexStatic';
import fs from '@ohos.file.fs';

const TAG =  'xtsStatic_packToFileAbnormalStatic';

let filesDir: string | undefined | null;
let filePath: string = '';
let fdNumber: int;
let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
const getFd = (fileName: string): int => {
  filePath =  testContext.filesDir + "/" + fileName;
  console.info(TAG,"image filePath:" + filePath);
  const file = fs.openSync(filePath!);
  fdNumber = file.fd as int;
  return fdNumber;
};
async function copyImageToSandbox(fileName: string, pathUri: string): Promise<void> {
  const rawFileContent = testContext.resourceManager.getRawFileContentSync(fileName);
  const path = 'file://' + testContext.filesDir + "/" + pathUri;
  const fd = await fs.open(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  await fs.write(fd.fd, rawFileContent.buffer);
  await fs.close(fd);
}

async function packToFileAbnormalPromiseAndCallbackTest(done: () => void, testName: string, pathUri: string,
  callback: (imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ,file: fs.File) => Promise<void>) {
  const path: string = 'file://' + testContext.filesDir + "/" + pathUri;
  const imageSourceApi: image.ImageSource = await image.createImageSource(path) as image.ImageSource;
  const imagePackerApi: image.ImagePacker = await image.createImagePacker();
  let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
  if(imagePackerApi!= null){
    callback(imagePackerApi,imageSourceApi!,file);
    console.info(TAG, testName, 'after callback');
  } else {
    console.error(TAG, testName,'imagePackerObj is null');
    expect().assertFail();
    done();
  }
}

async function sourceRelease(imageSourceApi: image.ImageSource, imagePackerApi: image.ImagePacker): Promise<void> {
  await imagePackerApi.release();
  await imageSourceApi!.release();
}


export default function imagePackerPackToFileAbnormalStaticSuppTest(): void {
  describe('imagePackerPackToFileAbnormalStaticSuppTest', (): void => {

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
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
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_abnormal_promise_Supp_Static_0100
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_abnormal_promise_Supp_Static_0100
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_abnormal_promise_Supp_Static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_abnormal_promise_Supp_Static_0100';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: -1 };
      await copyImageToSandbox(fileName, path);
      await packToFileAbnormalPromiseAndCallbackTest(done, testName, path, async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ,file: fs.File) => {
        try {
          console.info(TAG, testName, 'call back start.');
          await imagePackerApi.packToFile(imageSourceApi!, file.fd, packOpts)
          console.info(TAG, testName, 'Succeeded in packToFile picture successe.');
          expect().assertFalse();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect(error.code).assertEqual(62980115);
        }
        await sourceRelease(imageSourceApi!, imagePackerApi!);
        console.info(TAG, testName, 'done');
        done();
      })
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_abnormal_promise_Supp_Static_0200
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_abnormal_promise_Supp_Static_0200
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_abnormal_promise_Supp_Static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_abnormal_promise_Supp_Static_0200';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 101 };
      await copyImageToSandbox(fileName, path);
      await packToFileAbnormalPromiseAndCallbackTest(done, testName, path, async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ,file: fs.File) => {
        try {
          console.info(TAG, testName, 'call back start.');
          await imagePackerApi.packToFile(imageSourceApi!, file.fd, packOpts)
          console.info(TAG, testName, 'Succeeded in packToFile picture successe.');
          expect().assertFalse();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect(error.code).assertEqual(62980115);
        }
        await sourceRelease(imageSourceApi!, imagePackerApi!);
        console.info(TAG, testName, 'done');
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_abnormal_promise_Supp_Static_0300
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_abnormal_promise_Supp_Static_0300
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_abnormal_promise_Supp_Static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_abnormal_promise_Supp_Static_0300';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/svg", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFileAbnormalPromiseAndCallbackTest(done, testName, path, async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ,file: fs.File) => {
        try {
          console.info(TAG, testName, 'call back start.');
          await imagePackerApi.packToFile(imageSourceApi!, file.fd, packOpts)
          console.info(TAG, testName, 'Succeeded in packToFile picture successe.');
          expect().assertFalse();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect(error.code).assertEqual(62980115);
        }
        await sourceRelease(imageSourceApi!, imagePackerApi!);
        console.info(TAG, testName, 'done');
        done();
      })
    })


    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_abnormal_promise_Supp_Static_0500
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_abnormal_promise_Supp_Static_0500
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_abnormal_promise_Supp_Static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_abnormal_promise_Supp_Static_0500';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpg", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFileAbnormalPromiseAndCallbackTest(done, testName, path, async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ,file: fs.File) => {
        try {
          console.info(TAG, testName, 'call back start.');
          await imagePackerApi.packToFile(imageSourceApi!, file.fd, packOpts)
          console.info(TAG, testName, 'Succeeded in packToFile picture successe.');
          expect().assertFalse();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect(error.code).assertEqual(62980115);
        }
        await sourceRelease(imageSourceApi!, imagePackerApi!);
        console.info(TAG, testName, 'done');
        done();
      })
    })


    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_abnormal_promise_Supp_Static_0600
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_abnormal_promise_Supp_Static_0600
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_abnormal_promise_Supp_Static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_abnormal_promise_Supp_Static_0600';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: -1 };
      await copyImageToSandbox(fileName, path);
      await packToFileAbnormalPromiseAndCallbackTest(done, testName, path, async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ,file: fs.File) => {
        try {
          console.info(TAG, testName, 'call back start.');
          await imagePackerApi.packToFile(imageSourceApi!, file.fd, packOpts)
          console.info(TAG, testName, 'Succeeded in packToFile picture successe.');
          expect().assertFalse();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect(error.code).assertEqual(62980115);
        }
        await sourceRelease(imageSourceApi!, imagePackerApi!);
        console.info(TAG, testName, 'done');
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_abnormal_promise_Supp_Static_0700
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_abnormal_promise_Supp_Static_0700
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_abnormal_promise_Supp_Static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_abnormal_promise_Supp_Static_0700';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/jpeg", quality: 101 };
      await copyImageToSandbox(fileName, path);
      await packToFileAbnormalPromiseAndCallbackTest(done, testName, path, async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ,file: fs.File) => {
        try {
          console.info(TAG, testName, 'call back start.');
          await imagePackerApi.packToFile(imageSourceApi!, file.fd, packOpts)
          console.info(TAG, testName, 'Succeeded in packToFile picture successe.');
          expect().assertFalse();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect(error.code).assertEqual(62980115);
        }
        await sourceRelease(imageSourceApi!, imagePackerApi!);
        console.info(TAG, testName, 'done');
        done();
      })
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFile_abnormal_promise_Supp_Static_0800
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFile_abnormal_promise_Supp_Static_0800
     * @tc.desc   imagePacker_packToFile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFile_abnormal_promise_Supp_Static_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFile_abnormal_promise_Supp_Static_0800';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      let packOpts: image.PackingOption = { format: "image/svg", quality: 98 };
      await copyImageToSandbox(fileName, path);
      await packToFileAbnormalPromiseAndCallbackTest(done, testName, path, async(imagePackerApi:image.ImagePacker,imageSourceApi: image.ImageSource | undefined ,file: fs.File) => {
        try {
          console.info(TAG, testName, 'call back start.');
          await imagePackerApi.packToFile(imageSourceApi!, file.fd, packOpts)
          console.info(TAG, testName, 'Succeeded in packToFile picture successe.');
          expect().assertFalse();
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`);
          expect(error.code).assertEqual(62980115);
        }
        await sourceRelease(imageSourceApi!, imagePackerApi!);
        console.info(TAG, testName, 'done');
        done();
      })
    })
  })
}
