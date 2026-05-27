import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, Hypium, it, Level } from '../../../../../hypium';
import { BusinessError } from '@ohos.base';

const TAG = 'xtsStatic_imagePackerReleaseStaticTest';

export default function ImagePackerReleaseStaticSuppTest(): void {
  describe('ImagePackerReleaseStaticSuppTest', (): void => {
    let filesDir: string | undefined | null;
    let filePath: string = '';
    let fdNumber: int;

    const getFd = (fileName: string): int => {
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      filePath =  testContext.filesDir + "/" + fileName;
      console.info(TAG,"image filePath:" + filePath);
      const file = fs.openSync(filePath!);
      fdNumber = file.fd as int;
      return fdNumber;
    };

    const getFilePath = async (fileName: string): Promise<string> => {
      let filePath = filesDir + "/" + fileName;
      return filePath;
    }

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
 * @tc.number  SUB_MEDIA_IMAGE_PACKER_imagePacker_release_SUPP_static_0100
 * @tc.name    SUB_MEDIA_IMAGE_PACKER_imagePacker_release_SUPP_static_0100
 * @tc.desc    imagePackerObj.release调用
 * @tc.size    MEDIUM
 * @tc.type    Function
 * @tc.level   Level 0
 */
it('SUB_MEDIA_IMAGE_PACKER_imagePacker_release_SUPP_static_0100', Level.LEVEL0, async (done: () => void) => {
  const testName = 'SUB_MEDIA_IMAGE_PACKER_imagePacker_release_SUPP_static_0100';
  getFd('test_exif_v2.jpg');
  try {
    const imagePackerObj: image.ImagePacker = await image.createImagePacker();
    console.info(TAG, testName,'Succeeded in image.createImagePacker().',imagePackerObj);
    imagePackerObj.release((err: BusinessError|null)=>{
      if (err) {
        console.error(TAG, testName,`Failed to release image packaging.code ${err.code},message is ${err.message}`);
        expect().assertFail();
      } else {
        console.info(TAG, testName,'Succeeded in releasing image packaging.');
      }
    })
  } catch (error) {
    console.info(TAG, testName, 'failed in packing the imageSucceeded in packing the image',error.code);
    expect().assertFail();
  }
  done();
})

})
}