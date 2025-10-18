import httpRequestProtocolTest from "./HttpProtocol.test";
import httpMultiFormDataListTest from "./HttpMultiFormDataList.test";
import HttpClientCertTest from "./HttpClientCert.test";
import EmptyTest from './Empty.test';
import connection from '@ohos.net.connection';
import HttpCertificatePinTest from './HttpCertificatePin.test';

let isDefaultNet: boolean = connection.hasDefaultNetSync();

export default function testsuite() {
    if(isDefaultNet){
        httpRequestProtocolTest();
        httpMultiFormDataListTest();
        HttpClientCertTest();
        HttpCertificatePinTest();
    }else{
        EmptyTest();
    }

}
