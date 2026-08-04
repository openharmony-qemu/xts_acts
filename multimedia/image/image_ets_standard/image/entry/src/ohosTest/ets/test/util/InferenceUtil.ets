import modelPredict from './Model';
import { image } from '@kit.ImageKit';
import { fileIo } from '@kit.CoreFileKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const MODEL_INPUT_SIZE = 480;
const NORMALIZE_MEAN: number[] = [0.485, 0.456, 0.406];
const NORMALIZE_STD: number[] = [0.229, 0.224, 0.225];
const DOMAIN: number = 0x0000;
const TAG: string = 'inferenceUtil';

let g_cachedModelBuffer: Uint8Array | undefined = undefined;
let g_cachedModelName: string = '';

export function clearModelBufferCache(): void {
    g_cachedModelBuffer = undefined;
    g_cachedModelName = '';
    hilog.info(DOMAIN, TAG, '%{public}s', 'MS_LITE_LOG: model buffer cache cleared');
}

export interface InferenceResult {
    flower: number;
    normal: number;
    predictedClass: string;
    confidence: number;
}

function releaseImageResources(imageSource: image.ImageSource | undefined, pixelMap: image.PixelMap | undefined, file: fileIo.File | undefined): void {
    try{
        if(pixelMap !== undefined){
            pixelMap.release();

        }
    }catch(e){
        hilog.info(DOMAIN, TAG, '%{public}s', `pixelMap release err: ${e}`);
    }
    try{
        if(imageSource !== undefined){
            imageSource.release();

        }
    }catch(e){
        hilog.info(DOMAIN, TAG, '%{public}s', `imageSource release err: ${e}`);
    }
    try{
        if(file !== undefined && file.fd > 0){
            fileIo.closeSync(file);
        }
    }catch(e){
        hilog.info(DOMAIN, TAG, '%{public}s', `file close err: ${e}`);
    }
}

export async function inferenceImage(imageUri: string, modelName: string, context: Context | undefined): Promise<InferenceResult> {
    let inferenceResult: InferenceResult = {
        flower: 0,
        normal: 0,
        predictedClass: '',
        confidence: 0
    };
    hilog.info(DOMAIN, TAG, '%{public}s', `MS_LITE_LOG: inferenceImage called with uri: ${imageUri}`);
    
    let resMgr = context?.resourceManager;
    if(resMgr === null || resMgr === undefined){
        hilog.error(DOMAIN, TAG, '%{public}s', `MS_LITE_ERR: get resMgr failed.`);
        return inferenceResult;
    }
    let file: fileIo.File | undefined;
    let imageSource: image.ImageSource | undefined;
    let pixelMap: image.PixelMap | undefined;

    try{
        let modelBuffer: Uint8Array;
        if(g_cachedModelBuffer !== undefined && g_cachedModelName === modelName){
            modelBuffer = g_cachedModelBuffer;
        }else{
            g_cachedModelBuffer = undefined;
            g_cachedModelName = '';
            modelBuffer = await resMgr.getRawFileContent(modelName);
            g_cachedModelBuffer = modelBuffer;
            g_cachedModelName = modelName;
        }

        file = fileIo.openSync(imageUri, fileIo.OpenMode.READ_ONLY);
        imageSource = image.createImageSource(file.fd);
        if(imageSource === undefined) {
            hilog.error(DOMAIN, TAG, '%{public}s', `MS_LITE_ERR: createImageSource failed.`);
            releaseImageResources(undefined, undefined, file);
            return inferenceResult;
        }
        let decodeOptions: image.DecodingOptions = {
            editable: true,
            desiredSize: { width: MODEL_INPUT_SIZE, height: MODEL_INPUT_SIZE },
        };
        try{
            pixelMap = await imageSource.createPixelMap(decodeOptions);
            let info: image.ImageInfo = await pixelMap.getImageInfo();
            hilog.info(DOMAIN, TAG, '%{public}s', `MS_LITE_LOG: decoded size: (${info.size.width},${info.size.height}), pixelFormat: ${info.pixelFormat}`);
            if(info.size.width === 0 || info.size.height === 0) {
            hilog.error(DOMAIN, TAG, '%{public}s', `MS_LITE_ERR: decoded failed`);
            return inferenceResult;
            }
        } catch (decodeErr) {
            hilog.error(DOMAIN, TAG, '%{public}s', `MS_LITE_ERR: createPixelMap failed: ${decodeErr}`);
            releaseImageResources(imageSource, undefined, file);
            return inferenceResult;
        }
        let pixelMapInfo: image.ImageInfo = await pixelMap.getImageInfo();
        let readBuffer = new ArrayBuffer(MODEL_INPUT_SIZE * MODEL_INPUT_SIZE * 4);
        await pixelMap.readPixelsToBuffer(readBuffer);
        hilog.info(DOMAIN, TAG, '%{public}s', `MS_LITE_LOG: readBuffer byteLength: ${readBuffer.byteLength}`);

        let imageArr = new Uint8Array(readBuffer);
        let float32View = new Float32Array(MODEL_INPUT_SIZE * MODEL_INPUT_SIZE * 3);
        let offset = 0;

        let isRGBA = (pixelMapInfo.pixelFormat !== 4);
        hilog.info(DOMAIN, TAG, '%{public}s', `MS_LITE_LOG: pixelFormat: ${pixelMapInfo.pixelFormat}, treating as ${isRGBA ? 'RGBA_8888' : 'BGRA_8888'}`);

        for (let i = 0; i < MODEL_INPUT_SIZE * MODEL_INPUT_SIZE; i++){
            let pixelOffset = i * 4;
            let r: number, g: number, b: number;
            if(isRGBA) {
                r = imageArr[pixelOffset + 0];
                g = imageArr[pixelOffset + 1];
                b = imageArr[pixelOffset + 2];
            } else {
                r = imageArr[pixelOffset + 2];
                g = imageArr[pixelOffset + 1];
                b = imageArr[pixelOffset + 0];
            }
            float32View[offset++] = (r / 255.0 - NORMALIZE_MEAN[0]) /NORMALIZE_STD[0];
            float32View[offset++] = (g / 255.0 - NORMALIZE_MEAN[1]) /NORMALIZE_STD[1];
            float32View[offset++] = (b / 255.0 - NORMALIZE_MEAN[2]) /NORMALIZE_STD[2];
        }
        releaseImageResources(imageSource, pixelMap, file);
        imageSource = undefined;
        pixelMap = undefined;
        file = undefined;
        
        let inputs: ArrayBuffer[] = [float32View.buffer];
        let outputs = await modelPredict(modelBuffer, inputs);
        let tensor = outputs[0];
        let arrBuf = tensor.getData();
        let resultArr = new Float32Array(arrBuf);

        let maxLogit = Math.max(resultArr[0], resultArr[1]);
        let exp0 = Math.exp(resultArr[0] - maxLogit);
        let exp1 = Math.exp(resultArr[1] - maxLogit);
        let expSum = exp0 + exp1;
        let flowerProb = exp0 / expSum;
        let normalProb = exp1 / expSum;
        let maxVal = flowerProb >= normalProb ? flowerProb : normalProb;
        let maxIdx = flowerProb >= normalProb ? 0 : 1;
        let predictedClass = maxIdx === 0 ? 'flower' : 'normal';
        let confidence = maxVal;
        inferenceResult = {
            flower: Number(flowerProb.toFixed(4)),
            normal: Number(normalProb.toFixed(4)),
            predictedClass: predictedClass,
            confidence: Number(confidence.toFixed(4))
        };
        return inferenceResult;
    } catch(err){
        hilog.error(DOMAIN, TAG, '%{public}s', `MS_LITE_ERR: inferenceImage failed: ${err}`);
        releaseImageResources(imageSource, pixelMap, file);
        return inferenceResult;
    }
}