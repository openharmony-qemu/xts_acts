import { worker } from '@kit.ArkTS';
import { collections } from '@kit.ArkTS';

const workerPort = worker.workerPort;

workerPort.onmessage = (e) => {
  let map: collections.Map<string, number> = e.data as collections.Map<string, number>;

  let count: number = 0;
  map.forEach((_value: number, _key: string) => {
    count++;
  });

  let value50: number | undefined = map.get('key_50');

  let result: string = JSON.stringify({
    count: count,
    value50: value50
  });
  workerPort.postMessage(result);
};
