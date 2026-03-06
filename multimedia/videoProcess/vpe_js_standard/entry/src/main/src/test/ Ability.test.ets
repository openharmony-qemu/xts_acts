import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import videoProcessingEngine from "@ohos.multimedia.videoProcessingEngine";

import { image } from '@kit.ImageKit';

import { fileIo as fs } from '@kit.CoreFileKit';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function abilityTest() {

    describe("abilityTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        /*
         * @tc.number: SUB_Ability_Ability_Static_0100
         * @tc.name: SUB_Ability_Ability_Static_0100
         * @tc.desc:  Check start ability by bundl
         * @tc.level: LEVEL1
         * @tc.size: MEDIUMTEST
         * @tc.type: FUNCTION
        */
        it("SUB_Ability_Ability_Static_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', 'abilityTest001 start');
            let a:int = 1;
            let b:int = 1;

            let options: image.InitializationOptions = {
                editable: true,
                pixelFormat: image.PixelMapFormat.RGBA_8888,
                size: { height: 1000, width: 1000 },
                alphaType: image.AlphaType.PREMUL
            };
            let sourceImage: image.PixelMap = image.createPixelMapSync(options);
            let targetWidth = 2000;
            let targetHeight = 2000;
            let imageProcessor = videoProcessingEngine.create() as videoProcessingEngine.imageProcessor;

            let enhancedPixelMap: image.PixelMap = imageProcessor.enhanceDetailSync(sourceImage, targetWidth, targetHeight);

            videoProcessingEngine.initializeEnvironment();
            videoProcessingEngine.deinitializeEnvironment();

            expect(a).assertEqual(b);
            done()
            hilog.info(domain, tag, '%{public}s', 'abilityTest001 end');
        })

    })

}