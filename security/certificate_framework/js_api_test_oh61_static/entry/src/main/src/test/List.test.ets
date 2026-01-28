/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import certFrameworkCertAllowDownloadInterCaTestUnit from './AllowDownloadIntermediateCaCert.test';
import certFrameworkCertReinforcementOfStringTestUnit from './CertframeworkReinforcement.test';
import certFrameworkCertIgnoreNetworkIssuesTestUnit from './CertIgnoreNetworkIssues.test';
import certFrameworkCertCheckOnlineCaTestUnit from './CertOnlineVerification.test';
import wifiMg from '@ohos.wifiManager';


export default function testsuite() {
  /* Networking is required and latest system time */
  if(!wifiMg.isWifiActive()) {
    console.info("=========>>>>>>> wifi_test/enable wifi:" + wifiMg.enableWifi());
    await sleep(5000);
  }
  let data: wifiMg.WifiLinkedInfo = await wifiMg.getLinkedInfo();
  console.info("=========>>>>>>> Internet WifiLinkedInfo : " + JSON.stringify(data));
  console.info("=========>>>>>>> Internet speed : " + JSON.stringify(data.linkSpeed));
  console.info("=========>>>>>>> Internet chLoad : " + JSON.stringify(data.chload));
  console.info("=========>>>>>>> Internet rssi : " + JSON.stringify(data.rssi));

  if (data.connState == wifiMg.ConnState.CONNECTED) {
    console.info("=========>>>>>>> WLAN connection established");
  } else {
    throw new Error("=========>>>>>>> WLAN Network Error");
  }
  if (data.chload >= 800 || data.rssi <= -80) {
    throw new Error("=========>>>>>>> WLAN Network Error (speed)");
  }
  certFrameworkCertCheckOnlineCaTestUnit();
  certFrameworkCertIgnoreNetworkIssuesTestUnit();
  certFrameworkCertAllowDownloadInterCaTestUnit();
  certFrameworkCertReinforcementOfStringTestUnit();
}