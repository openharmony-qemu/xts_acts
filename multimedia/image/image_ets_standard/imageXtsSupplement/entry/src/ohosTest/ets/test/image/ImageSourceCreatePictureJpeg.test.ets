import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from "@ohos/hypium";
import { common, ErrorCode } from "@kit.AbilityKit";
import { image } from "@kit.ImageKit";
let imageSourceObj: image.ImageSource | null = null;

const TAG = 'ImageSource.CreatePictureJpeg';
async function ImageCreatePicture( testName: string,   pathUri:string,callback: (imageSourceObj: image.ImageSource) => void,
) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let path = `file://${testContext.filesDir}/${pathUri}`;
  let imageSourceObj: image.ImageSource = image.createImageSource(path);
  console.info(TAG,testName,'createImageSource',imageSourceObj);
  callback(imageSourceObj);
  await imageSourceObj.release();
  expect().assertFail();
}

export default function ImageSourceCreatePictureJpeg() {
  describe('ImageSourceCreatePictureJpeg.test.ets', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      AppStorage.setOrCreate('testString', 'abc');
      AppStorage.setOrCreate('testArray', [-1, 0, 1]);

    });
    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });
    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });
    afterAll(async () => {
      AppStorage.delete('testString');
      AppStorage.delete('testArray');
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.number    MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_037
     * @tc.name      MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_037
     * @tc.desc      Testing CreateImageTest
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */

    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_037', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_037';
      try {
        await ImageCreatePicture(testName,'test.cr3',(imageResource) => {
          imageResource.createPicture(null);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.number    MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_038
     * @tc.name      MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_038
     * @tc.desc      Testing CreateImageTest
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */

    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_038', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_038';
      try {
        await ImageCreatePicture(testName,'test.cr3',(imageResource) => {
          imageResource.createPicture(undefined);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number    MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_039
     * @tc.name      MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_039
     * @tc.desc      Testing CreateImageTest
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */

    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_039', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_039';
      try {
        AppStorage.setOrCreate('key', '');
        let options: image.DecodingOptionsForPicture= AppStorage.get('key') as ESObject;
        await ImageCreatePicture(testName,'test.jpeg',(imageResource) => {
          imageResource.createPicture(options);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number    MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_040
     * @tc.name      MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_040
     * @tc.desc      Testing CreateImageTest
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */

    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_040', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_040';
      try {
        await ImageCreatePicture(testName,'test.jpeg',(imageResource) => {
          imageResource.createPicture(null);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.number    MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_041
     * @tc.name      MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_041
     * @tc.desc      Testing CreateImageTest
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */

    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_041', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_041';
      try {
        await ImageCreatePicture(testName,'test.jpeg',(imageResource) => {
          imageResource.createPicture(undefined);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number    MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_042
     * @tc.name      MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_042
     * @tc.desc      Testing CreateImageTest
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */

    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_042', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_042';
      try {
        AppStorage.setOrCreate('key', '');
        let options: image.DecodingOptionsForPicture= AppStorage.get('key') as ESObject;
        await ImageCreatePicture(testName,'test.cr3',(imageResource) => {
          imageResource.createPicture(options);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number    MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_043
     * @tc.name      MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_043
     * @tc.desc      Testing CreateImageTest
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */

    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_043', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_043';
      try {
        await ImageCreatePicture(testName,'mimeType_test.dng',(imageResource) => {
          imageResource.createPicture(null);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.number    MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_044
     * @tc.name      MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_044
     * @tc.desc      Testing CreateImageTest
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */

    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_044', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_044';
      try {
        await ImageCreatePicture(testName,'mimeType_test.dng',(imageResource) => {
          imageResource.createPicture(undefined);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number    MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_045
     * @tc.name      MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_045
     * @tc.desc      Testing CreateImageTest
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */

    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_045', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_045';
      try {
        AppStorage.setOrCreate('key', '');
        let options: image.DecodingOptionsForPicture= AppStorage.get('key') as ESObject;
        await ImageCreatePicture(testName,'mimeType_test.dng',(imageResource) => {
          imageResource.createPicture(options);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number    MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_046
     * @tc.name      MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_046
     * @tc.desc      Testing CreateImageTest
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */

    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_046', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_046';
      try {
        await ImageCreatePicture(testName,'pixel_ico_480x360.ico',(imageResource) => {
          imageResource.createPicture(null);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.number    MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_047
     * @tc.name      MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_047
     * @tc.desc      Testing CreateImageTest
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */

    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_047', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_047';
      try {
        await ImageCreatePicture(testName,'pixel_ico_480x360.ico',(imageResource) => {
          imageResource.createPicture(undefined);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number    MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_048
     * @tc.name      MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_048
     * @tc.desc      Testing CreateImageTest
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */

    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_048', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_048';
      try {
        AppStorage.setOrCreate('key', '');
        let options: image.DecodingOptionsForPicture= AppStorage.get('key') as ESObject;
        await ImageCreatePicture(testName,'pixel_ico_480x360.ico',(imageResource) => {
          imageResource.createPicture(options);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number    MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_049
     * @tc.name      MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_049
     * @tc.desc      Testing CreateImageTest
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */

    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_049', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_049';
      try {
        await ImageCreatePicture(testName,'mimeType_test.jfif',(imageResource) => {
          imageResource.createPicture(null);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.number    MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_050
     * @tc.name      MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_050
     * @tc.desc      Testing CreateImageTest
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */

    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_050', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_050';
      try {
        await ImageCreatePicture(testName,'mimeType_test.jfif',(imageResource) => {
          imageResource.createPicture(undefined);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number    MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_051
     * @tc.name      MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_051
     * @tc.desc      Testing CreateImageTest
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */

    it('MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_051', Level.LEVEL0, async (done: Function) => {
      const testName = 'MUTI_MEDIA_IMAGE_KIT_CREATE_PICTURE_051';
      try {
        AppStorage.setOrCreate('key', '');
        let options: image.DecodingOptionsForPicture= AppStorage.get('key') as ESObject;
        await ImageCreatePicture(testName,'mimeType_test.jfif',(imageResource) => {
          imageResource.createPicture(options);
        })
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })
  })
}