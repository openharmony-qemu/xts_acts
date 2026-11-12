import webSocket from '@ohos.net.webSocket';
import { BusinessError } from '@kit.BasicServicesKit';

const URLARRAY: string[] = [
  'wss://websocket-echo.moyufangge.com',
  'wss://whale.tooly.top/ws',
  'wss://echo.websocket.events',
  'wss://ws.ifelse.io/',
  'ws://echo.websocket.org'
];

const PROBE_TIMEOUT_MS: number = 5000;
const caseName: string = 'Search URL ';

interface OpenResultLike {
  status?: number;
  message?: string;
}

function probe(url: string, timeoutMs: number): Promise<boolean> {
  return new Promise<boolean>((resolve) => {
    const ws: webSocket.WebSocket = webSocket.createWebSocket();
    let settled: boolean = false;
    let opened: boolean = false;
    let timer: number = -1;

    const cleanup = (removeOpenInfo: boolean): void => {
      if (timer !== -1) {
        clearTimeout(timer);
        timer = -1;
      }
      ws.off('open');
      ws.off('error');
      ws.off('close');
      if (removeOpenInfo) {
        ws.off('openInfo');
      }
    };

    const finish = (ok: boolean): void => {
      if (settled) {
        return;
      }
      settled = true;
      cleanup(!ok);
      try {
        ws.close().then(() => {
          resolve(ok);
        }).catch((e: BusinessError) => {
          console.warn(`probe ${url} close failed: ${JSON.stringify(e)}`);
          resolve(ok);
        });
      } catch (e) {
        resolve(ok);
      }
    };

    ws.on('open', (err: BusinessError, value: Object) => {
      console.info(`${caseName} : ${url}   onopen err is ${JSON.stringify(err)} , and value is ${JSON.stringify(value)}`);
      if (settled) {
        return;
      }
      if (err) {
        finish(false);
        return;
      }
      const status: number | undefined = (value as OpenResultLike).status;
      if (status === 101 || status === undefined) {
        opened = true;
        finish(true);
      } else {
        console.warn(`${caseName} : ${url} unexpected status is ${status}`);
        finish(false);
      }
    });

    ws.on('openInfo', (err: BusinessError, value: Object) => {
      if (settled && !opened) {
        return;
      }
      console.info(`${caseName} : ${url}   onopeninfo err is ${JSON.stringify(err)} , and value is ${JSON.stringify(value)}`);
      ws.off('openInfo');
    });

    ws.on('error', (err: BusinessError) => {
      if (settled) {
        return;
      }
      console.info(`${caseName} : ${url} test connect fail ${JSON.stringify(err)}`);
      finish(false);
    });

    ws.on('close', (err: BusinessError, value: webSocket.CloseResult) => {
      if (settled) {
        return;
      }
      console.warn(`${caseName} : ${url} closed before open ${JSON.stringify(value)}`);
      finish(false);
    });

    timer = setTimeout(() => {
      console.warn(`${caseName} : ${url} timeout after ${timeoutMs}ms`);
      finish(false);
    }, timeoutMs);

    try {
      ws.connect(url, (err: BusinessError, value: boolean) => {
        console.info(`${caseName} :connect start execute url is  ${url}`);
        if (err) {
          console.info(`${caseName} : ${url} test connect fail ${JSON.stringify(err)}`);
          finish(false);
        } else {
          console.info(`${caseName} : ${url} test connect success and value is ${value}`);
        }
      });
    } catch (err) {
      console.error('network search failed,err in' + JSON.stringify(err));
      finish(false);
    }
  });
}
export default async function getWebsite(): Promise<string> {
  try {
    for (const url of URLARRAY) {
      if (await probe(url, PROBE_TIMEOUT_MS)) {
        console.log(caseName + " return url is" + url);
        return url;
      }
    }
    console.log(caseName + " return url is");
    return '';
  } catch (err) {
    console.error(caseName + ' getWebsite failed,err in' + JSON.stringify(err));
    return '';
  }
}