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

import { image } from '@kit.ImageKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect,Hypium, it, Level} from '@ohos/hypium-binary/src/main/indexStatic';
import { common } from '@kit.AbilityKit';
import fs from '@ohos.file.fs';


const TAG =   'xts_static_packToDataFromPixelmapSequenceStatic';

let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
let filesDir: string | undefined | null;
let filePath: string = '';
let fdNumber: int;
const getFd = (fileName: string): int => {
  filePath =  testContext.filesDir + "/" + fileName;
  console.info(TAG,"image filePath:" + filePath);
  const file = fs.openSync(filePath!);
  fdNumber = file.fd as int;
  return fdNumber;
};
async function packToDataFromPixelmapSequencePromiseTest(done: () => void, testName: string, path: string,
  ops: image.PackingOptionsForSequence, callback: (Packer:image.ImagePacker,pixelMapList:image.PixelMap[]) => Promise<void>) {
    let fd: int = getFd(path);
    const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd);
    let pixelMapList = await imageSourceApi!.createPixelMapList();
    let Packer = image.createImagePacker();
    console.info(TAG,testName,'Success image.createImagePacker ' +  JSON.stringify(Packer));
    await callback(Packer,pixelMapList);
    imageSourceApi!.release();
    done();
}


export default function imagePackerPackToDataFromPixelmapSequenceStaticSuppTest(): void {
  describe('imagePackerPackToDataFromPixelmapSequenceStaticSuppTest', (): void => {

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
     * @tc.number SUB_MEDIA_IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_SUPP_static_0100
     * @tc.name   SUB_MEDIA_IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_SUPP_static_0100
     * @tc.desc   delayTimeList非空数组覆盖，test_exif_v2.jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_SUPP_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_SUPP_static_0100';
      let fd: int = getFd('test_exif_v2.jpg');
      const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd);
      try {
        let pixelMapList = await imageSourceApi!.createPixelMapList();
        let ops: image.PackingOptionsForSequence = {
          frameCount: 3,
          delayTimeList: [10, 10, 10],
          disposalTypes: [3, 2, 3],
          loopCount: 0
        };
        let packer = image.createImagePacker();
        let buffer = await packer.packToDataFromPixelmapSequence(pixelMapList!, ops)
        console.info(TAG, testName, 'packToDataFromPixelmapSequence', buffer);
        expect(buffer.byteLength > 0).assertTrue();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        expect().assertFail();
      }finally {
        imageSourceApi!.release();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_SUPP_static_0200
     * @tc.number SUB_MEDIA_IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_SUPP_static_0200
     * @tc.desc   disposalTypes:非空数组覆盖，delayTimeList空数组覆盖，test_exif_v2.jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_SUPP_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_SUPP_static_0200';
      let fd: int = getFd('test_exif_v2.jpg');
      const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd);
      try {
        let pixelMapList = await imageSourceApi!.createPixelMapList();
        let ops: image.PackingOptionsForSequence = {
          frameCount: 3,
          delayTimeList: [],
          disposalTypes: [3, 2, 3],
          loopCount: 0
        };
        let packer = image.createImagePacker();
        let buffer = await packer.packToDataFromPixelmapSequence(pixelMapList!, ops)
        console.info(TAG, testName, 'packToDataFromPixelmapSequence success', buffer);
        expect(buffer!=undefined).assertTrue();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        expect().assertFail();
      }
      finally {
        imageSourceApi!.release();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_SUPP_static_0300
     * @tc.number SUB_MEDIA_IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_SUPP_static_0300
     * @tc.desc   disposalTypes:空数组覆盖,test_exif_v2.jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_SUPP_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_SUPP_static_0300';
        let fd: int = getFd('test_exif_v2.jpg');
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd);
      try {
        let pixelMapList = await imageSourceApi!.createPixelMapList();
        let ops: image.PackingOptionsForSequence = {
          frameCount: 3,
          delayTimeList: [10, 10, 10],
          disposalTypes: [],
          loopCount: 0
        };
        let packer = image.createImagePacker();
        let buffer = await packer.packToDataFromPixelmapSequence(pixelMapList!, ops)
        console.info(TAG, testName, 'packToDataFromPixelmapSequence', buffer);
        expect(buffer!=undefined).assertTrue();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        expect().assertFail();
      }
      finally {
        imageSourceApi!.release();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0100
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0100
     * @tc.desc   imagePacker_packToDataFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0100';
      let path = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [10, 10, 10],
        disposalTypes: [3, 2, 3],
        loopCount: 0
      };
      try {
        await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops,async (Packer:  image.ImagePacker,pixelMapList:image.PixelMap[]) => {
          let buffer = await Packer.packToDataFromPixelmapSequence(pixelMapList!, ops)
          console.info(TAG, testName, 'packToDataFromPixelmapSequence', buffer);
          expect(buffer.byteLength > 0).assertTrue();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error!.code}`, testName);
        expect().assertFail();
      } 
    })


    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0200
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0200
     * @tc.desc   imagePacker_packToDataFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0200';
      let path = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 99,
        delayTimeList: [100, 100, 100],
        disposalTypes: [3, 2, 3],
        loopCount: 65535
      };
      try {
        await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops,async (Packer:  image.ImagePacker,pixelMapList:image.PixelMap[]) => {
          let buffer = await Packer.packToDataFromPixelmapSequence(pixelMapList!, ops)
          console.info(TAG, testName, 'packToDataFromPixelmapSequence', buffer);
          expect(buffer.byteLength > 0).assertTrue();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error!.code}`, testName);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0300
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0300
     * @tc.desc   imagePacker_packToDataFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0300';
      let path = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 1,
        delayTimeList: [100, 100, 100],
        disposalTypes: [1, 2, 3],
        loopCount: 0
      };
      try {
        await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops,async (Packer:  image.ImagePacker,pixelMapList:image.PixelMap[]) => {
          let buffer = await Packer.packToDataFromPixelmapSequence(pixelMapList!, ops)
          console.info(TAG, testName, 'packToDataFromPixelmapSequence', buffer);
          expect(buffer.byteLength > 0).assertTrue();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error!.code}`, testName);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0400
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0400
     * @tc.desc   imagePacker_packToDataFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0400';
      let path = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
        disposalTypes: [3, 2, 1],
        loopCount: 0
      };
      try {
        await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops,async (Packer:  image.ImagePacker,pixelMapList:image.PixelMap[]) => {
          let buffer = await Packer.packToDataFromPixelmapSequence(pixelMapList!, ops)
          console.info(TAG, testName, 'packToDataFromPixelmapSequence', buffer);
          expect(buffer.byteLength > 0).assertTrue();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error!.code}`, testName);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0500
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0500
     * @tc.desc   imagePacker_packToDataFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0500';
      let path = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
        disposalTypes: [0, 0, 0],
        loopCount: 0
      };
      try {
        await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops,async (Packer:  image.ImagePacker,pixelMapList:image.PixelMap[]) => {
          let buffer = await Packer.packToDataFromPixelmapSequence(pixelMapList!, ops)
          console.info(TAG, testName, 'packToDataFromPixelmapSequence', buffer);
          expect(buffer.byteLength > 0).assertTrue();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error!.code}`, testName);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0600
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0600
     * @tc.desc   imagePacker_packToDataFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0600';
      let path = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
        disposalTypes: [1, 1, 1],
        loopCount: 0
      };
      try {
        await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops,async (Packer:  image.ImagePacker,pixelMapList:image.PixelMap[]) => {
          let buffer = await Packer.packToDataFromPixelmapSequence(pixelMapList!, ops)
          console.info(TAG, testName, 'packToDataFromPixelmapSequence', buffer);
          expect(buffer.byteLength > 0).assertTrue();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error!.code}`, testName);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0700
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0700
     * @tc.desc   imagePacker_packToDataFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0700';
      let path = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
        disposalTypes: [2, 2, 2],
        loopCount: 0
      };
      try {
        await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops,async (Packer:  image.ImagePacker,pixelMapList:image.PixelMap[]) => {
          let buffer = await Packer.packToDataFromPixelmapSequence(pixelMapList!, ops)
          console.info(TAG, testName, 'packToDataFromPixelmapSequence', buffer);
          expect(buffer.byteLength > 0).assertTrue();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error!.code}`, testName);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0800
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0800
     * @tc.desc   imagePacker_packToDataFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0800';
      let path = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
        disposalTypes: [3, 3, 3],
        loopCount: 0
      };
      try {
        await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops,async (Packer:  image.ImagePacker,pixelMapList:image.PixelMap[]) => {
          let buffer = await Packer.packToDataFromPixelmapSequence(pixelMapList!, ops)
          console.info(TAG, testName, 'packToDataFromPixelmapSequence', buffer);
          expect(buffer.byteLength > 0).assertTrue();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error!.code}`, testName);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0900
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0900
     * @tc.desc   imagePacker_packToDataFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_0900';
      let path = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
        loopCount: 0
      };
      try {
        await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops,async (Packer:  image.ImagePacker,pixelMapList:image.PixelMap[]) => {
          let buffer = await Packer.packToDataFromPixelmapSequence(pixelMapList!, ops)
          console.info(TAG, testName, 'packToDataFromPixelmapSequence', buffer);
          expect(buffer.byteLength > 0).assertTrue();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error!.code}`, testName);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1000
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1000
     * @tc.desc   imagePacker_packToDataFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1000';
      let path = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
        disposalTypes: [3, 3, 3]
      };
      try {
        await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops,async (Packer:  image.ImagePacker,pixelMapList:image.PixelMap[]) => {
          let buffer = await Packer.packToDataFromPixelmapSequence(pixelMapList!, ops)
          console.info(TAG, testName, 'packToDataFromPixelmapSequence', buffer);
          expect(buffer.byteLength > 0).assertTrue();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error!.code}`, testName);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1100
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1100
     * @tc.desc   imagePacker_packToDataFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1100';
      let path = 'test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      try {
        await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops,async (Packer:  image.ImagePacker,pixelMapList:image.PixelMap[]) => {
          let buffer = await Packer.packToDataFromPixelmapSequence(pixelMapList!, ops)
          console.info(TAG, testName, 'packToDataFromPixelmapSequence', buffer);
          expect(buffer.byteLength > 0).assertTrue();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error!.code}`, testName);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1200
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1200
     * @tc.desc   imagePacker_packToDataFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1200';
      let path = 'test.jpg';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      try {
        await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops,async (Packer:  image.ImagePacker,pixelMapList:image.PixelMap[]) => {
          let buffer = await Packer.packToDataFromPixelmapSequence(pixelMapList!, ops)
          console.info(TAG, testName, 'packToDataFromPixelmapSequence', buffer);
          expect(buffer.byteLength > 0).assertTrue();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error!.code}`, testName);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1300
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1300
     * @tc.desc   imagePacker_packToDataFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1300';
      let path = 'test.svg';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      try {
        await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops,async (Packer:  image.ImagePacker,pixelMapList:image.PixelMap[]) => {
          let buffer = await Packer.packToDataFromPixelmapSequence(pixelMapList!, ops)
          console.info(TAG, testName, 'packToDataFromPixelmapSequence', buffer);
          expect(buffer.byteLength > 0).assertTrue();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error!.code}`, testName);
        expect().assertFail();
      }
    })

    
    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1400
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1400
     * @tc.desc   imagePacker_packToDataFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1400';
      let path = 'test_exif_v2.png';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      try {
        await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops,async (Packer:  image.ImagePacker,pixelMapList:image.PixelMap[]) => {
          let buffer = await Packer.packToDataFromPixelmapSequence(pixelMapList!, ops)
          console.info(TAG, testName, 'packToDataFromPixelmapSequence', buffer);
          expect(buffer.byteLength > 0).assertTrue();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error!.code}`, testName);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1500
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1500
     * @tc.desc   imagePacker_packToDataFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1500';
      let path = 'test8.bmp';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      try {
        await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops,async (Packer:  image.ImagePacker,pixelMapList:image.PixelMap[]) => {
          let buffer = await Packer.packToDataFromPixelmapSequence(pixelMapList!, ops)
          console.info(TAG, testName, 'packToDataFromPixelmapSequence', buffer);
          expect(buffer.byteLength > 0).assertTrue();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error!.code}`, testName);
        expect().assertFail();
      }
    })
 
    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1600
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1600
     * @tc.desc   imagePacker_packToDataFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1600';
      let path = 'test_aisr.ico';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      try {
        await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops,async (Packer:  image.ImagePacker,pixelMapList:image.PixelMap[]) => {
          let buffer = await Packer.packToDataFromPixelmapSequence(pixelMapList!, ops)
          console.info(TAG, testName, 'packToDataFromPixelmapSequence', buffer);
          expect(buffer.byteLength > 0).assertTrue();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error!.code}`, testName);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1700
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1700
     * @tc.desc   imagePacker_packToDataFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_promise_SUPP_static_1700';
      let path = 'test_exif_v3.webp';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      try {
        await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops,async (Packer:  image.ImagePacker,pixelMapList:image.PixelMap[]) => {
          let buffer = await Packer.packToDataFromPixelmapSequence(pixelMapList!, ops)
          console.info(TAG, testName, 'packToDataFromPixelmapSequence', buffer);
          expect(buffer.byteLength > 0).assertTrue();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error!.code}`, testName);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_abnormal_promise_SUPP_static_0100
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_abnormal_promise_SUPP_static_0100
     * @tc.desc   imagePacker_packToDataFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_abnormal_promise_SUPP_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_abnormal_promise_SUPP_static_0100';
      let path = 'test.jpg';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [10000, 10000, 10000],
        disposalTypes: [4, 4, 4],
        loopCount: 0
      };   
      try {
        await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops,async (Packer:  image.ImagePacker,pixelMapList:image.PixelMap[]) => {
          let buffer = await Packer.packToDataFromPixelmapSequence(pixelMapList!, ops)
          console.info(TAG, testName, 'packToDataFromPixelmapSequence', buffer);
          expect().assertFail();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error!.code}`, testName);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_abnormal_promise_SUPP_static_0200
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_abnormal_promise_SUPP_static_0200
     * @tc.desc   imagePacker_packToDataFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_abnormal_promise_SUPP_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_abnormal_promise_SUPP_static_0200';
      let path = 'test.jpg';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [10000, 10000, 10000],
        disposalTypes: [3, 3, 3],
        loopCount: -1
      };
      try {
        await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops,async (Packer:  image.ImagePacker,pixelMapList:image.PixelMap[]) => {
          let buffer = await Packer.packToDataFromPixelmapSequence(pixelMapList!, ops)
          console.info(TAG, testName, 'packToDataFromPixelmapSequence', buffer);
          expect().assertFail();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error!.code}`, testName);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_abnormal_promise_SUPP_static_0300
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_abnormal_promise_SUPP_static_0300
     * @tc.desc   imagePacker_packToDataFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_abnormal_promise_SUPP_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_abnormal_promise_SUPP_static_0300';
      let path = 'test.jpg';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [10000, 10000, 10000],
        disposalTypes: [3, 3, 3],
        loopCount: 65536
      };
      try {
        await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops,async (Packer:  image.ImagePacker,pixelMapList:image.PixelMap[]) => {
          let buffer = await Packer.packToDataFromPixelmapSequence(pixelMapList!, ops)
          console.info(TAG, testName, 'packToDataFromPixelmapSequence', buffer);
          expect().assertFail();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error!.code}`, testName);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_abnormal_promise_SUPP_static_0400
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_abnormal_promise_SUPP_static_0400
     * @tc.desc   imagePacker_packToDataFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_abnormal_promise_SUPP_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToDataFromPixelmapSequence_abnormal_promise_SUPP_static_0400';
      let path = 'test.jpg';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [10000, 10000, 10000],
        disposalTypes: [3, 3, 3],
        loopCount: 99999
      };
      try {
        await packToDataFromPixelmapSequencePromiseTest(done, testName, path, ops,async (Packer:  image.ImagePacker,pixelMapList:image.PixelMap[]) => {
          let buffer = await Packer.packToDataFromPixelmapSequence(pixelMapList!, ops)
          console.info(TAG, testName, 'packToDataFromPixelmapSequence', buffer);
          expect().assertFail();
        })
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error!.code}`, testName);
        expect(error.code).assertEqual(401);
        done();
      }
    })
  })
}