'use static';
import webSocket from '@ohos.net.webSocket';
import { BusinessError } from '@kit.BasicServicesKit';

function sleep (time:int):Promise<string>{
  return new Promise<string>((resolve)=>{
    setTimeout(()=>{
      resolve('ok')},time)
  });
}

let current_url: string = 'wss://websocket-echo.moyufangge.com';
let URLARRAY:Array<string> =
  ['wss://websocket-echo.moyufangge.com','wss://whale.tooly.top/ws','wss://echo.websocket.events','wss://ws.ifelse.io/','ws://echo.websocket.org'];
let caseName: string = 'Search URL ';
let ws : webSocket.WebSocket | null = null;
let websiteIndex = -1;
let isNetSuccess = 0;

let  testWsAbility:() => Promise<void> = async ()=>{
  try {
    if (!ws) {
      console.error('WebSocket instance is not initialized');
      return;
    }

    ws!.onOpen((value: Object) => {
      // console.info(`${caseName} : ${URLARRAY[websiteIndex]}   onopen err is ${JSON.stringify(err)} , and value is ${JSON.stringify(value)}`);
      const status: number = (value as webSocket.OpenResult).status;
      if(status == 101){
        isNetSuccess = 1;
        current_url = URLARRAY[websiteIndex]
      }
    });
    ws!.onOpenInfo((value: webSocket.WebSocketOpenInfo) => {
      // console.info(`${caseName} : ${URLARRAY[websiteIndex]}   onopeninfo err is ${JSON.stringify(err)} , and value is ${JSON.stringify(value)}`);
      const status: number = value.status;
      if(status == 101){
        isNetSuccess = 1;
        current_url = URLARRAY[websiteIndex]
      }
    });
    ws!.connect(URLARRAY[websiteIndex], (err: BusinessError | null, value: boolean | undefined) => {
      console.info(`${caseName} :connect start execute url is  ${URLARRAY[websiteIndex]}`)
      if (err) {
        console.info(`${caseName} : ${URLARRAY[websiteIndex]} test connect fail ${JSON.stringify(err)}`);
      } else {
        console.info(`${caseName} : ${URLARRAY[websiteIndex]} test connect success and value is ${value}`);
      }
    })
    await sleep(2000);
  }catch (err){
    console.error('network search failed,err in'+JSON.stringify(err));
  }
}

let  getWebsite:() => Promise<string> = async (): Promise<string> =>{
  try {
    while(isNetSuccess == 0 && websiteIndex < URLARRAY.length - 1){
      ws = webSocket.createWebSocket();
      websiteIndex+=1;
      await testWsAbility();
    }
    console.log(caseName+" return url is"+current_url)
    return current_url;
  }catch (err){
    console.error(caseName+' getWebsite failed,err in'+JSON.stringify(err));
    return current_url;
  }
}

export default getWebsite;
