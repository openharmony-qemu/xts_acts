import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { fileIo } from '@kit.CoreFileKit';
import { inferenceImage, inferenceResult, clearModelBufferCache } from './InferenceUtil';

const DOMAIN: number = 0x0000;
const TAG: string = 'inferenceTest';
const MODEL_NAME: string = 'cls_model.ms';
const IMAGE_DIR: string = 'image';

function getTimestamp(): string{
    
}

async function checkRawfileExists(context: Context, fileName: string): promise<boolean> {
    try{
        let resMgr = context.resourceManager;
        let fileList: string[] = await resMgr.getRawFileList('');
        let exists: boolean = fileList.includes(fileName);
        if(!exists){
            hilog.warn(DOMAIN, TAG, 'checkRawfileExists: ${fileName} not found in rawfile list, skip test');
        }
        return exists
    }catch(e){
        hilog.warn(DOMAIN, TAG, 'checkRawfileExists: failed to list rawfile, err: ${e}, skip test');
        return false;
    }
}

export default function inferenceTest() {
  describe('inferenceTest', () => {
    let testContext: common.UIAbilityContext;
    let filesDir = AppStorage.get('pathDir')

    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
    });

    afterAll(async () => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
        clearModelBufferCache();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CLASSIFY_FLOWER_DETECT_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CLASSIFY_FLOWER_DETECT_0100
     * @tc.desc   Inference flower image and verity flower detection result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CLASSIFY_FLOWER_DETECT_0100', Level.LEVEL0, async (done: Function) => {
      let rs = true;
      hilog.info(DOMAIN, TAG, "SUB_MULTIMEDIA_IMAGE_CLASSIFY_FLOWER_DETECT_0100 begin");
      if (!await checkRawfileExists(context, MODEL_NAME)) {
        expect(rs).assertTrue();
        done();
        return;
      }
        let filePath: string = filesDir + '/' + 'flower.jpg';
        let tsBefore: string = getTimestamp();
        let result: inferenceResult = await inferenceImage(filePath, MODEL_NAME, context);
        let tsAfter: string = getTimestamp();
        hilog.info(DOMAIN, TAG, `result: flower=${result.flower}, normal=${result.normal}, class=${result.predictedClass}, 
            confidence=${result.confidence},  run time=${tsAfter - tsBefore}`);
        expect(result.predictedClass).assertEqual('flower');
        expert(result.flower).assertLarger(result.normal);
        hilog.info(DOMAIN, TAG, "SUB_MULTIMEDIA_IMAGE_CLASSIFY_FLOWER_DETECT_0100 end");
        done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CLASSIFY_NORMAL_DETECT_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CLASSIFY_NORMAL_DETECT_0100
     * @tc.desc   Inference normal image and verity normal detection result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CLASSIFY_NORMAL_DETECT_0100', Level.LEVEL0, async (done: Function) => {
      let rs = true;
      hilog.info(DOMAIN, TAG, "SUB_MULTIMEDIA_IMAGE_CLASSIFY_NORMAL_DETECT_0100 begin");
      if (!await checkRawfileExists(context, MODEL_NAME)) {
        expect(rs).assertTrue();
        done();
        return;
      }
        let filePath: string = filesDir + '/' + 'normal1.jpg';
        let tsBefore: string = getTimestamp();
        let result: inferenceResult = await inferenceImage(filePath, MODEL_NAME, context);
        let tsAfter: string = getTimestamp();
        hilog.info(DOMAIN, TAG, `result: flower=${result.flower}, normal=${result.normal}, class=${result.predictedClass}, 
            confidence=${result.confidence},  run time=${tsAfter - tsBefore}`);
        expect(result.predictedClass).assertEqual('normal');
        expert(result.normal).assertLarger(result.flower);
        hilog.info(DOMAIN, TAG, "SUB_MULTIMEDIA_IMAGE_CLASSIFY_NORMAL_DETECT_0100 end");
        done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CLASSIFY_NORMAL_DETECT_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CLASSIFY_NORMAL_DETECT_0200
     * @tc.desc   Inference normal image and verity normal detection result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CLASSIFY_NORMAL_DETECT_0200', Level.LEVEL0, async (done: Function) => {
      let rs = true;
      hilog.info(DOMAIN, TAG, "SUB_MULTIMEDIA_IMAGE_CLASSIFY_NORMAL_DETECT_0200 begin");
      if (!await checkRawfileExists(context, MODEL_NAME)) {
        expect(rs).assertTrue();
        done();
        return;
      }
        let filePath: string = filesDir + '/' + 'normal2.jpg';
        let tsBefore: string = getTimestamp();
        let result: inferenceResult = await inferenceImage(filePath, MODEL_NAME, context);
        let tsAfter: string = getTimestamp();
        hilog.info(DOMAIN, TAG, `result: flower=${result.flower}, normal=${result.normal}, class=${result.predictedClass}, 
            confidence=${result.confidence},  run time=${tsAfter - tsBefore}`);
        expect(result.predictedClass).assertEqual('normal');
        expert(result.normal).assertLarger(result.flower);
        hilog.info(DOMAIN, TAG, "SUB_MULTIMEDIA_IMAGE_CLASSIFY_NORMAL_DETECT_0200 end");
        done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CLASSIFY_FLOWER_REPEAT_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CLASSIFY_FLOWER_REPEAT_0100
     * @tc.desc   Inference same image 10 and verity all results are consistent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CLASSIFY_FLOWER_REPEAT_0100', Level.LEVEL0, async (done: Function) => {
      let rs = true;
      hilog.info(DOMAIN, TAG, "SUB_MULTIMEDIA_IMAGE_CLASSIFY_FLOWER_REPEAT_0100 begin");
      if (!await checkRawfileExists(context, MODEL_NAME)) {
        expect(rs).assertTrue();
        done();
        return;
      }
        let filePath: string = filesDir + '/' + 'flower.jpg';

        let repeatCount: number = 10;
        let results: inferenceResult[] = [];
        for (let i = 0; i < repeatCount; i++){
            let tsBefore: string = getTimestamp();
            let result: inferenceResult = await inferenceImage(filePath, MODEL_NAME, context);
            let tsAfter: string = getTimestamp();
            results.push(result);
            hilog.info(DOMAIN, TAG, `[${i + 1}/${repeatCount}]result: flower=${result.flower}, normal=${result.normal}, 
                class=${result.predictedClass}, confidence=${result.confidence}, run time=${tsAfter - tsBefore}`);
        }

        let firstResult: inferenceResult = results[0];
        for (let i = 1; i < repeatCount; i++) {
            expect(results[i].flower).assertEqual(firstResult.flower);
            expect(results[i].normal).assertEqual(firstResult.normal);
            expect(results[i].predictedClass).assertEqual(firstResult.predictedClass);
            expect(results[i].confidence).assertEqual(firstResult.confidence);
        }
        hilog.info(DOMAIN, TAG, "SUB_MULTIMEDIA_IMAGE_CLASSIFY_FLOWER_REPEAT_0100 end");
        done();
    });

  });
}