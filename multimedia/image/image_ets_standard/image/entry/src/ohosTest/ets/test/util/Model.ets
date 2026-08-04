import { mindSporeLite } from '@kit.MindSporeLiteKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

let g_msLiteModel: mindSporeLite.Model | undefined = undefined;
let g_modelBufferHash: number = 0;

function hashCode(data: Uint8Array | ArrayBuffer): number{
    let view = data instanceof Uint8Array ? data : new Uint8Array(data);
    let hash = 0;
    let len = Math.min(view.length, 1024);
    for(let i = 0; i < len; i++) {
        hash = ((hash << 5) - hash + view[i]) | 0;
    }
    return hash;
}

async function ensureModelLoaded(modelData: Uint8Array | ArrayBuffer): Promise<mindSporeLite.Model> {
    let currentHash = hashCode(modelData);
    if(g_msLiteModel !== undefined && g_modelBufferHash === currentHash){
        return g_msLiteModel;
    }

    g_msLiteModel = undefined;
    g_modelBufferHash = 0;

    let context: mindSporeLite.Context = {};
    context.target = ['cpu'];
    context.cpu = {};
    context.cpu.threadNum = 2;
    context.cpu.threadAffinityMode = 1;
    context.cpu.precisionMode = 'enforce_fp32';

    let buffer: ArrayBuffer = modelData instanceof Uint8Array ? 
        modelData.buffer.slice(modelData.byteOffset, modelData.byteOffset + modelData.byteLength) : modelData as ArrayBuffer;
    let model: mindSporeLite.Model = await mindSporeLite.loadModelFromBuffer(buffer, context);

    g_msLiteModel = model;
    g_modelBufferHash = currentHash;
    return model;
}

export function resetModel(): void {
    g_msLiteModel = undefined;
    g_modelBufferHash = 0;
}

export default async function modelPredict(modelData: Uint8Array | ArrayBuffer, inputsBuffer: ArrayBuffer[]): Promise<mindSporeLite.MSTensor[]>{
    let msLiteModel: mindSporeLite.Model = await ensureModelLoaded(modelData);

    let modelInputs: mindSporeLite.MSTensor[] = msLiteModel.getInputs();
    if(modelInputs == null || modelInputs.length === 0){
        throw new Error('model getInputs failed')
    }

    for (let i = 0; i < inputsBuffer.length; i++){
        let inputBuffer = inputsBuffer[i];
        if(inputBuffer != null){
            modelInputs[i].setData(inputBuffer as ArrayBuffer);
        }
    }

    let modelOutputs: mindSporeLite.MSTensor[] = await msLiteModel.predict(modelInputs);
    return modelOutputs;
}