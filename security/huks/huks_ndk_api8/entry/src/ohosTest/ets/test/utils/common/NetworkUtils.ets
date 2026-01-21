import { wifiManager } from '@kit.ConnectivityKit'
import { Logger } from './Logger';

export async function CheckWifiInfo() {
  try {
    let wifiLinkedInfo: wifiManager.WifiLinkedInfo = await wifiManager.getLinkedInfo();
    Logger.info(`CheckWifiInfo success ${JSON.stringify(wifiLinkedInfo)}`);
    if (wifiLinkedInfo.connState != wifiManager.ConnState.CONNECTED) {
      throw new Error("WLAN not connected");
    }
    if (wifiLinkedInfo.chload >= 800 || wifiLinkedInfo.rssi <= 80) {
      throw new Error("WLAN connection error");
    }
    if (wifiLinkedInfo.chload >= 500) {
      throw new Error("WLAN connection is poor");
    }
  } catch (err) {
    Logger.error(`CheckWifiInfo catch error ${JSON.stringify(err)}`)
    throw err as Error;
  }
}