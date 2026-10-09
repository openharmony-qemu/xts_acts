import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker, collections, ArrayList } from '@kit.ArkTS';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

workerPort.onmessage = (e: MessageEvents) => {
  const data:object = e.data;
  
  if (typeof data === 'string' && data === 'start') {
    const arrayList = new ArrayList<number>();
    arrayList.add(1);
    arrayList.add(2);
    arrayList.add(3);
    
    arrayList.add(4);
    arrayList.remove(1);
    
    workerPort.postMessage(arrayList);
  }
};

workerPort.onerror = (e: ErrorEvent) => {
  console.error('ContainerReturnWorker error:', e.message);
};